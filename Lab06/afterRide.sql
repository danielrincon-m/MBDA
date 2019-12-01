---------------------------Extendiendo. Contenidos.------------------------------

--A.
SELECT * FROM MBDA.miembros;

--B.
INSERT INTO MBDA.miembros
VALUES ('CC', 1034596448, 'Colombia', 'daniel.rincon-m@mail.escuelaing.edu.co', NULL, 'Daniel Rincon', TO_DATE('1996-12-03', 'YYYY-MM-DD'), 1);
INSERT INTO MBDA.miembros
VALUES ('CC', 1038478463, 'Colombia', 'michael.perilla@mail.escuelaing.edu.co', NULL, 'Michael Perilla', TO_DATE('1998-08-03', 'YYYY-MM-DD'), 1);

--C.
DELETE FROM MBDA.miembros WHERE numero = 1034596448;
--Aparece un mensaje de error en donde dice que no se tienen privilegios suficientes.

--D.
GRANT
    UPDATE, DELETE ON MBDA.personas TO bd3104340;
--La deberia escribir un usuario que ya tenga los permisos en la tabla

--E.
CREATE SEQUENCE miembro_id_seq
    START WITH 1
    INCREMENT BY 1;
    
CREATE OR REPLACE TRIGGER miembro_id_tr
  BEFORE INSERT ON miembro
  FOR EACH ROW
BEGIN
  :NEW.id := miembro_id_seq.NEXTVAL;
END;
/

--DELETE FROM miembro;

INSERT INTO miembro (idn, idt, pais, correo) 
    SELECT numero, tipo, pais, correo
    FROM MBDA.miembros
    WHERE
        tipo IS NOT NULL
        AND numero IS NOT NULL
        AND numero IN (SELECT numero
                        FROM (
                                SELECT numero, COUNT(*)
                                FROM MBDA.miembros
                                GROUP BY numero
                                HAVING COUNT(*) = 1
                                )
                        );

INSERT INTO persona
    SELECT id, nombres
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        nombres IS NOT NULL;
        
INSERT INTO empresa
    SELECT id, razon, NULL
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        razon IS NOT NULL;

INSERT INTO ciclista
    SELECT id, TO_DATE(nacimiento, 'YYYY-MM-DD'), categoria
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        nacimiento IS NOT NULL
        AND categoria IS NOT NULL
        AND nacimiento LIKE('____-__-__');
        
        
---------------------------Modelo Físico. Componentes.------------------------------        

--CRUDE
CREATE OR REPLACE PACKAGE PC_REGISTROS IS
    PROCEDURE AD_REGISTRO (xtiempo IN NUMBER, xposicion IN NUMBER, xrevision IN XMLTYPE, xdificultad IN VARCHAR, xcomentario IN VARCHAR, xesSobre IN NUMBER, xesPara IN VARCHAR);
    PROCEDURE MO_REGISTRO (xnumero IN NUMBER, xrevision IN XMLTYPE, xcomentario IN VARCHAR);
    PROCEDURE EL_REGISTRO (xnumero IN NUMBER);
    PROCEDURE AD_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR);
    PROCEDURE MO_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR);
    PROCEDURE EL_FOTO (xnumeroRegistro IN NUMBER);

    FUNCTION CO_SEC_DESCENSO RETURN SYS_REFCURSOR;
    FUNCTION CO_CICLISTAS RETURN SYS_REFCURSOR;
END PC_REGISTROS;
/

CREATE OR REPLACE PACKAGE PC_CARRERAS IS
    PROCEDURE AD_CARRERA (xcodigo IN VARCHAR, xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR);
    PROCEDURE EL_CARRERA (xcodigo IN VARCHAR);
    PROCEDURE AD_PUNTO (xid IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER, xcarrera IN VARCHAR);
    PROCEDURE MO_PUNTO (xid IN NUMBER, xtipo IN VARCHAR, xtiempoLimite IN NUMBER);
    PROCEDURE AD_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER);
    PROCEDURE MO_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER);
    PROCEDURE EL_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER);

    FUNCTION CO_PUNTOS(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CO_PROPIEDADES(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_CARRERAS;
/


--CRUDI
CREATE OR REPLACE PACKAGE BODY PC_REGISTROS IS

    PROCEDURE AD_REGISTRO (xtiempo IN NUMBER, xposicion IN NUMBER, xrevision IN XMLTYPE, xdificultad IN VARCHAR, xcomentario IN VARCHAR, xesSobre IN NUMBER, xesPara IN VARCHAR) IS
    BEGIN
        INSERT INTO registro (tiempo, posicion, revision, dificultad, comentario, esSobre, esPara) VALUES (xtiempo, xposicion, xrevision, xdificultad, xcomentario, xesSobre, xesPara);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro');
    END;

    PROCEDURE MO_REGISTRO (xnumero IN NUMBER, xrevision IN XMLTYPE, xcomentario IN VARCHAR) IS
    BEGIN
        UPDATE registro
        SET revision = xrevision,
            comentario = xcomentario
        WHERE numero = xnumero;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20002, 'Error al modificar el registro');
    END;

    PROCEDURE EL_REGISTRO (xnumero IN NUMBER) IS
    BEGIN
        DELETE 
        FROM registro 
        WHERE numero = xnumero;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar el registro');
    END;

    PROCEDURE AD_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR) IS
    BEGIN
        INSERT INTO foto (numeroRegistro, foto) VALUES (xnumeroRegistro, xfoto);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20004, 'Error al adicionar la foto');
    END;

    PROCEDURE MO_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR) IS
    BEGIN
        UPDATE foto
        SET foto = xfoto
        WHERE numeroRegistro = xnumeroRegistro;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20005, 'Error al modificar la foto');
    END;

    PROCEDURE EL_FOTO (xnumeroRegistro IN NUMBER) IS
    BEGIN
        DELETE 
        FROM foto 
        WHERE numeroRegistro = xnumeroRegistro;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20006, 'Error al eliminar la foto');
    END;

    FUNCTION CO_SEC_DESCENSO RETURN SYS_REFCURSOR IS CO_DESC SYS_REFCURSOR;
    BEGIN
        OPEN CO_DESC FOR
            SELECT V.nombre, S.nombre, COUNT(R.numero)
            FROM segmento S

            JOIN registro R
            ON S.nombre = R.esPara

            JOIN version V
            ON S.contenidoEn = V.id

            WHERE EXTRACTVALUE(R.revision, '/TRevision/Secciones/Seccion/@Tipo') = 'Descenso'
            
            GROUP BY V.nombre, S.nombre;
        RETURN CO_DESC;
    END;

    FUNCTION CO_CICLISTAS RETURN SYS_REFCURSOR IS CO_CI SYS_REFCURSOR;
    BEGIN
        OPEN CO_CI FOR
            SELECT *
            FROM ciclista

            JOIN registro 
            ON id = esSobre;
        RETURN CO_CI;
    END;

END PC_REGISTROS;
/

CREATE OR REPLACE PACKAGE BODY PC_CARRERAS IS
    PROCEDURE AD_CARRERA (xcodigo IN VARCHAR, xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR)IS
    BEGIN
        INSERT INTO carrera (codigo, nombre, pais, categoria, periodicidad) VALUES (xcodigo, xnombre, xpais, xcategoria, xperiodicidad);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20007, 'Error al insertar la carrera');
    END;

    PROCEDURE EL_CARRERA (xcodigo IN VARCHAR) IS
    BEGIN
        DELETE
        FROM carrera
        WHERE codigo = xcodigo;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20008, 'Error al eliminar la carrera');
    END;

    PROCEDURE AD_PUNTO (xid IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER, xcarrera IN VARCHAR) IS
    BEGIN
        INSERT INTO punto (id, nombre, tipo, distancia, tiempoLimite, carrera) VALUES (xid, xnombre, xtipo, xdistancia, xtiempoLimite, xcarrera);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20009, 'Error al insertar el punto');
    END;

    PROCEDURE MO_PUNTO (xid IN NUMBER, xtipo IN VARCHAR, xtiempoLimite IN NUMBER) IS
    BEGIN
        UPDATE punto
        SET tipo = xtipo,
            tiempoLimite = xtiempoLimite
        WHERE id = xid;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20010, 'Error al modificar el punto');
    END;

    PROCEDURE AD_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER) IS
    BEGIN
        INSERT INTO propiedadDe (carreraId, miembroId, porcentaje) VALUES (xcarreraId, xmiembroId, xporcentaje);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20011, 'Error al insertar la propiedad');
    END;

    PROCEDURE MO_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER) IS
    BEGIN
        UPDATE propiedadDe
        SET porcentaje = xporcentaje
        WHERE carreraId = xcarreraId
            AND miembroId = xmiembroId;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20012, 'Error al modificar la propiedad');
    END;

    PROCEDURE EL_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER) IS
    BEGIN
        DELETE FROM propiedadDe
        WHERE carreraId = xcarreraId
            AND miembroId = xmiembroId;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20013, 'Error al eliminar la propiedad');
    END;

    FUNCTION CO_PUNTOS(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR IS CO_PU SYS_REFCURSOR;
    BEGIN
        OPEN CO_PU FOR
            SELECT P.nombre, P.tipo, P.distancia, P.tiempoLimite
            FROM punto P

            JOIN carrera C
            ON P.carrera = C.codigo

            WHERE C.codigo = xcarreraId

            ORDER BY distancia DESC;
        RETURN CO_PU;
    END;

    FUNCTION CO_PROPIEDADES(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR IS CO_PROP SYS_REFCURSOR;
    BEGIN
        OPEN CO_PROP FOR
            SELECT M.idt, M.idn, C.codigo, C.nombre, P.porcentaje
            FROM miembro M

            JOIN propiedadDe P
            ON M.id = P.miembroId

            JOIN carrera C
            ON P.carreraId = C.codigo

            WHERE C.codigo = xcarreraId

            ORDER BY C.codigo ASC;
        RETURN CO_PROP;
    END;

END PC_CARRERAS;
/

--XCRUD
DROP PACKAGE PC_CARRERAS;
DROP PACKAGE PC_REGISTROS;


--CRUDOK

BEGIN
    PC_CARRERAS.AD_CARRERA('C01', 'Carrera1', 'COLOMBIA', '1', 'M');
END;
/
BEGIN
    PC_CARRERAS.AD_PUNTO(1, 'Salida', 'P', 122, 150, 'C01');
END;
/
BEGIN
    PC_CARRERAS.MO_PUNTO(1, 'P', 180);
END;
/
DECLARE
    l_cursor SYS_REFCURSOR;
    idt miembro.idt%TYPE;
    idn miembro.idn%TYPE;
    codigo carrera.codigo%TYPE;
    nombre carrera.nombre%TYPE;
    porcentaje propiedadDe.porcentaje%TYPE;
BEGIN
    SELECT PC_CARRERAS.CO_PROPIEDADES('C01') INTO l_cursor FROM DUAL;
    
    LOOP
        FETCH l_cursor
        INTO idt, idn, codigo, nombre, porcentaje;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(idt || ' | ' || idn || ' | ' || codigo || ' | ' || nombre || ' | ' || porcentaje);
    END LOOP;
END;
/
DECLARE
    a SYS_REFCURSOR;
BEGIN
    SELECT PC_REGISTROS.CO_CICLISTAS INTO a FROM DUAL;
END;
/


--CRUDNoOK

BEGIN
    PC_CARRERAS.AD_PUNTO(1, 'Salida', 'P', 122, 150, 'C83');
END;
/
-- La carrera C83 no existe

BEGIN 
    PC_REGISTROS.AD_FOTO(289, 'ASDASDASDASD');
END;
/
-- El registro 289 no existe

DECLARE
    a SYS_REFCURSOR;
BEGIN
    SELECT PC_CARRERAS.CO_PUNTOS() INTO a FROM DUAL;
END;
/
--Hace falta el argumento de la funcion



-----------------------------------------Modelo físico. Seguridad. ------------------------------------------

--ActoresE

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS
    FUNCTION CO_CICLISTAS RETURN SYS_REFCURSOR;
END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE PA_PARTICIPANTE IS
    PROCEDURE AD_REGISTRO (xtiempo IN NUMBER, xposicion IN NUMBER, xrevision IN XMLTYPE, xdificultad IN VARCHAR, xcomentario IN VARCHAR, xesSobre IN NUMBER, xesPara IN VARCHAR);
    PROCEDURE MO_REGISTRO (xnumero IN NUMBER, xrevision IN XMLTYPE, xcomentario IN VARCHAR);
    PROCEDURE EL_REGISTRO (xnumero IN NUMBER);
    PROCEDURE AD_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR);
    PROCEDURE MO_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR);
    PROCEDURE EL_FOTO (xnumeroRegistro IN NUMBER);

    PROCEDURE AD_CARRERA (xcodigo IN VARCHAR, xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR);
    PROCEDURE EL_CARRERA (xcodigo IN VARCHAR);
    PROCEDURE AD_PUNTO (xid IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER, xcarrera IN VARCHAR);
    PROCEDURE MO_PUNTO (xid IN NUMBER, xtipo IN VARCHAR, xtiempoLimite IN NUMBER);
    PROCEDURE AD_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER);
    PROCEDURE MO_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER);
    PROCEDURE EL_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER);

    FUNCTION CO_SEC_DESCENSO RETURN SYS_REFCURSOR;

    FUNCTION CO_PUNTOS(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR;
    FUNCTION CO_PROPIEDADES(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR;
END PA_PARTICIPANTE;
/


--ActoresI

CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS

    FUNCTION CO_CICLISTAS RETURN SYS_REFCURSOR IS CO_CICL SYS_REFCURSOR;
    BEGIN
        CO_CICL := PC_REGISTROS.CO_CICLISTAS;
        RETURN CO_CICL;
    END;

END PA_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE BODY PA_PARTICIPANTE IS
    
    PROCEDURE AD_REGISTRO (xtiempo IN NUMBER, xposicion IN NUMBER, xrevision IN XMLTYPE, xdificultad IN VARCHAR, xcomentario IN VARCHAR, xesSobre IN NUMBER, xesPara IN VARCHAR) IS
    BEGIN
        PC_REGISTROS.AD_REGISTRO(xtiempo, xposicion, xrevision, xdificultad, xcomentario, xesSobre, xesPara);
    END;

    PROCEDURE MO_REGISTRO (xnumero IN NUMBER, xrevision IN XMLTYPE, xcomentario IN VARCHAR) IS
    BEGIN
        PC_REGISTROS.MO_REGISTRO(xnumero, xrevision, xcomentario);
    END;

    PROCEDURE EL_REGISTRO (xnumero IN NUMBER) IS
    BEGIN
        PC_REGISTROS.EL_REGISTRO(xnumero);
    END;
    
    PROCEDURE AD_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR) IS
    BEGIN   
        PC_REGISTROS.AD_FOTO(xnumeroRegistro, xfoto);
    END;
    
    PROCEDURE MO_FOTO (xnumeroRegistro IN NUMBER, xfoto IN VARCHAR) IS
    BEGIN
        PC_REGISTROS.MO_FOTO(xnumeroRegistro, xfoto);
    END;
    
    PROCEDURE EL_FOTO (xnumeroRegistro IN NUMBER) IS
    BEGIN
        PC_REGISTROS.EL_FOTO(xnumeroRegistro);
    END;
    

    PROCEDURE AD_CARRERA (xcodigo IN VARCHAR, xnombre IN VARCHAR, xpais IN VARCHAR, xcategoria IN NUMBER, xperiodicidad IN VARCHAR) IS
    BEGIN
        PC_CARRERAS.AD_CARRERA(xcodigo, xnombre, xpais, xcategoria, xperiodicidad);
    END;

    PROCEDURE EL_CARRERA (xcodigo IN VARCHAR) IS
    BEGIN
        PC_CARRERAS.EL_CARRERA(xcodigo);
    END;
    
    PROCEDURE AD_PUNTO (xid IN NUMBER, xnombre IN VARCHAR, xtipo IN VARCHAR, xdistancia IN NUMBER, xtiempoLimite IN NUMBER, xcarrera IN VARCHAR) IS
    BEGIN
        PC_CARRERAS.AD_PUNTO(xid, xnombre, xtipo, xdistancia, xtiempoLimite, xcarrera);
    END;
    
    PROCEDURE MO_PUNTO (xid IN NUMBER, xtipo IN VARCHAR, xtiempoLimite IN NUMBER) IS
    BEGIN
        PC_CARRERAS.MO_PUNTO(xid, xtipo, xtiempoLimite);
    END;
    
    PROCEDURE AD_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER) IS
    BEGIN
        PC_CARRERAS.AD_PROPIEDAD(xcarreraId, xmiembroId, xporcentaje);
    END;
    
    PROCEDURE MO_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER, xporcentaje IN NUMBER) IS
    BEGIN
        PC_CARRERAS.MO_PROPIEDAD(xcarreraId, xmiembroId, xporcentaje);
    END;
    
    PROCEDURE EL_PROPIEDAD (xcarreraId IN VARCHAR, xmiembroId IN NUMBER) IS
    BEGIN
        PC_CARRERAS.EL_PROPIEDAD(xcarreraId, xmiembroId);
    END;
    

    FUNCTION CO_SEC_DESCENSO RETURN SYS_REFCURSOR IS CO_SECD SYS_REFCURSOR;
    BEGIN
        CO_SECD := PC_REGISTROS.CO_SEC_DESCENSO;
        RETURN CO_SECD;
    END;


    FUNCTION CO_PUNTOS(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR IS CO_P SYS_REFCURSOR;
    BEGIN
        CO_P := PC_CARRERAS.CO_PUNTOS(xcarreraId);
        RETURN CO_P;
    END;

    FUNCTION CO_PROPIEDADES(xcarreraId IN VARCHAR) RETURN SYS_REFCURSOR IS CO_PROP SYS_REFCURSOR;
    BEGIN
        CO_PROP := PC_CARRERAS.CO_PROPIEDADES(xcarreraId);
        RETURN CO_PROP;
    END;

END PA_PARTICIPANTE;
/


-- PUNTO B

GRANT EXECUTE ON PA_ADMINISTRADOR TO bd3104340;


-- Seguridad

CREATE ROLE participantes;

GRANT EXECUTE ON PA_PARTICIPANTE TO participantes;

GRANT participantes TO bd3104340;
GRANT participantes TO bd3104340;


-- XSeguridad

DROP ROLE participantes;


--SeguridadOK

BEGIN
    PA_PARTICIPANTE.AD_CARRERA('C02', 'Carrera1', 'COLOMBIA', '1', 'M');
END;
/
BEGIN
    PA_PARTICIPANTE.AD_PUNTO(2, 'Salida', 'P', 122, 150, 'C02');
END;
/
BEGIN
    PA_PARTICIPANTE.MO_PUNTO(2, 'P', 180);
END;
/
DECLARE
    l_cursor SYS_REFCURSOR;
    idt miembro.idt%TYPE;
    idn miembro.idn%TYPE;
    codigo carrera.codigo%TYPE;
    nombre carrera.nombre%TYPE;
    porcentaje propiedadDe.porcentaje%TYPE;
BEGIN
    SELECT PA_PARTICIPANTE.CO_PROPIEDADES('C01') INTO l_cursor FROM DUAL;
    
    LOOP
        FETCH l_cursor
        INTO idt, idn, codigo, nombre, porcentaje;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(idt || ' | ' || idn || ' | ' || codigo || ' | ' || nombre || ' | ' || porcentaje);
    END LOOP;
END;
/
DECLARE
    a SYS_REFCURSOR;
BEGIN
    SELECT PA_ADMINISTRADOR.CO_CICLISTAS INTO a FROM DUAL;
END;
/


--CRUDNoOK

BEGIN
    PA_PARTICIPANTE.AD_PUNTO(1, 'Salida', 'P', 122, 150, 'C83');
END;
/
-- La carrera C83 no existe

BEGIN 
    PA_PARTICIPANTE.AD_FOTO(289, 'ASDASDASDASD');
END;
/
-- El registro 289 no existe

DECLARE
    a SYS_REFCURSOR;
BEGIN
    SELECT PA_PARTICIPANTE.CO_PUNTOS() INTO a FROM DUAL;
END;
/
--Hace falta el argumento de la funcion




-------------------------------------------------------------AFTERRIDE----------------------------------------------------
--CICLO 1: Tablas
CREATE TABLE propiedadDe(
    carreraId VARCHAR(20),
    miembroId NUMBER(5),
    porcentaje NUMBER(5, 2) NOT NULL
);
CREATE TABLE punto(
    id NUMBER(5),
    orden NUMBER(2) NOT NULL,
    nombre VARCHAR(10),
    tipo VARCHAR(1) NOT NULL,
    distancia NUMBER(8, 2) NOT NULL,
    tiempoLimite NUMBER(9),
    carrera VARCHAR(20) NOT NULL
);
CREATE TABLE carrera(
    codigo VARCHAR(20),
    nombre VARCHAR(30),
    pais VARCHAR(15) NOT NULL,
    categoria NUMBER(1) NOT NULL,
    periodicidad VARCHAR(10) NOT NULL
);

CREATE TABLE miembro(
    id NUMBER(5),
    idt VARCHAR(2) NOT NULL,
    idn NUMBER(15) NOT NULL,
    pais VARCHAR(50),
    correo VARCHAR(50) NOT NULL
);
CREATE TABLE persona(
    id NUMBER(5),
    nombres VARCHAR(50) NOT NULL
);
CREATE TABLE empresa(
    id NUMBER(5),
    razonSocial VARCHAR(50) NOT NULL,
    representante NUMBER(5)
);
CREATE TABLE ciclista(
    id NUMBER(5),
    nacimiento DATE,
    categoria NUMBER(1) NOT NULL
);

CREATE TABLE version(
    id NUMBER(5),
    nombre VARCHAR(5),
    fecha DATE NOT NULL,
    carrera VARCHAR(20) NOT NULL
);
CREATE TABLE segmento(
    nombre VARCHAR(10),
    tipo VARCHAR(1) NOT NULL,
    contenidoEn NUMBER(5) NOT NULL,
    iniciaEn NUMBER(5) NOT NULL,
    finalizaEn NUMBER(5) NOT NULL
);
CREATE TABLE esOrganizador(
    empresaId NUMBER(5),
    versionId NUMBER(5)
);
CREATE TABLE participa(
    ciclistaId NUMBER(5),
    versionId NUMBER(5)
);

CREATE TABLE registro(
    numero NUMBER(5),
    fecha TIMESTAMP NOT NULL,
    tiempo NUMBER(9) NOT NULL,
    posicion NUMBER(5) NOT NULL,
    revision XMLTYPE,
    dificultad VARCHAR(1) NOT NULL,
    comentario VARCHAR(20),
    esSobre NUMBER(5) NOT NULL,
    esPara VARCHAR(10) NOT NULL
);
CREATE TABLE foto(
    numeroRegistro NUMBER(5),
    foto VARCHAR(50)
);

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: Atributos
ALTER TABLE punto 
ADD CONSTRAINT CHK_tipo_punto 
CHECK (
    tipo IN ('P','L','H','A','M','V','C') 
);

ALTER TABLE punto 
ADD CONSTRAINT CHK_tiempoLimite_punto 
CHECK (
    tiempoLimite > 0 
);

ALTER TABLE carrera 
ADD CONSTRAINT CHK_codigo_carrera 
CHECK ( 
    REGEXP_LIKE(codigo,'^([A-Z0-9]*)$')
);

ALTER TABLE carrera 
ADD CONSTRAINT CHK_pais_carrera 
CHECK ( 
    REGEXP_LIKE(pais,'^([A-Z]*)$' )
);

ALTER TABLE carrera 
ADD CONSTRAINT CHK_categoria_carrera 
CHECK (
    categoria BETWEEN 1 AND 5  
);

ALTER TABLE carrera 
ADD CONSTRAINT CHK_periodicidad_carrera 
CHECK (
    periodicidad IN ('A','M','S','T') 
);

ALTER TABLE propiedadDe 
ADD CONSTRAINT CHK_porcentaje_propiedadDe 
CHECK (
    porcentaje BETWEEN 0 AND 100
);

ALTER TABLE miembro 
ADD CONSTRAINT CHK_id_miembro 
CHECK (
    id BETWEEN 1 AND 999999 
);

ALTER TABLE miembro 
ADD CONSTRAINT CHK_idt_miembro 
CHECK (
    idt IN('CC','CE','NIT','NT','cc') 
);

ALTER TABLE miembro 
ADD CONSTRAINT CHK_idn_miembro 
CHECK (
    idn >= 11111 
);

ALTER TABLE miembro 
ADD CONSTRAINT CHK_pais_miembro 
CHECK ( 
    REGEXP_LIKE(pais,'^([A-Z a-z]*)$' )
);

ALTER TABLE miembro
ADD CONSTRAINT CHK_correo_miembro 
CHECK (
    correo LIKE '%@%' AND correo NOT LIKE '%@%@%' 
);

ALTER TABLE empresa 
ADD CONSTRAINT CHK_id_empresa 
CHECK (
    id BETWEEN 1 AND 999999 
);

ALTER TABLE persona 
ADD CONSTRAINT CHK_id_persona 
CHECK (
    id BETWEEN 1 AND 999999 
);

ALTER TABLE ciclista 
ADD CONSTRAINT CHK_categoria_ciclista 
CHECK (
    categoria BETWEEN 1 AND 5 
);

ALTER TABLE ciclista 
ADD CONSTRAINT CHK_id_ciclista 
CHECK (
    id BETWEEN 1 AND 999999 
);

ALTER TABLE version 
ADD CONSTRAINT CHK_carrera_version 
CHECK (
    REGEXP_LIKE(carrera,'^([A-Z0-9]*)$')
);

ALTER TABLE version 
ADD CONSTRAINT CHK_id_version 
CHECK (
    id BETWEEN 1 AND 99999 
);

ALTER TABLE segmento 
ADD CONSTRAINT CHK_tipo_segmento 
CHECK (
    tipo IN ('C','M','L') 
);

ALTER TABLE registro 
ADD CONSTRAINT CHK_numero_registro 
CHECK (
    numero BETWEEN 1 AND 99999
);

ALTER TABLE registro 
ADD CONSTRAINT CHK_tiempo_registro 
CHECK (
    tiempo > 0 
);

ALTER TABLE registro 
ADD CONSTRAINT CHK_dificultad_registro 
CHECK (
dificultad IN ('A','M','B') 
);

ALTER TABLE foto
ADD CONSTRAINT CHK_foto_numeroRegistro
CHECK (
    numeroRegistro BETWEEN 1 AND 99999
);

ALTER TABLE foto 
ADD CONSTRAINT CHK_foto_foto
CHECK (
    foto LIKE 'www.%.gif' OR foto LIKE 'www.%.pdf' 
);

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: Primarias
ALTER TABLE punto 
ADD CONSTRAINT PK_punto 
PRIMARY KEY (id);

ALTER TABLE carrera 
ADD CONSTRAINT PK_carrera 
PRIMARY KEY (codigo);

ALTER TABLE propiedadDe 
ADD CONSTRAINT PK_propiedadDe 
PRIMARY KEY (carreraId, miembroId);

ALTER TABLE miembro
ADD CONSTRAINT PK_miembro 
PRIMARY KEY (id);

ALTER TABLE persona 
ADD CONSTRAINT PK_persona 
PRIMARY KEY (id);

ALTER TABLE empresa 
ADD CONSTRAINT PK_empresa 
PRIMARY KEY (id);

ALTER TABLE ciclista 
ADD CONSTRAINT PK_ciclista 
PRIMARY KEY (id);

ALTER TABLE segmento 
ADD CONSTRAINT PK_segmento 
PRIMARY KEY (nombre);

ALTER TABLE version 
ADD CONSTRAINT PK_version 
PRIMARY KEY (id);

ALTER TABLE esOrganizador 
ADD CONSTRAINT PK_esOrganizador 
PRIMARY KEY (empresaId, versionId);

ALTER TABLE participa 
ADD CONSTRAINT PK_participa 
PRIMARY KEY (ciclistaId, versionId);

ALTER TABLE registro 
ADD CONSTRAINT PK_registro 
PRIMARY KEY (numero);

ALTER TABLE foto
ADD CONSTRAINT PK_foto
PRIMARY KEY (numeroRegistro, foto);

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: Unicas
ALTER TABLE registro 
ADD CONSTRAINT UK_comentario_registro 
UNIQUE (comentario);

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: Foraneas
ALTER TABLE punto 
ADD CONSTRAINT FK_carrera_punto 
FOREIGN KEY (carrera) REFERENCES carrera(codigo) 
ON DELETE CASCADE;

ALTER TABLE propiedadDe 
ADD CONSTRAINT FK_carreraId_propiedadDe 
FOREIGN KEY (carreraId) REFERENCES carrera(codigo)
ON DELETE CASCADE;

ALTER TABLE propiedadDe 
ADD CONSTRAINT FK_miembroId_propiedadDe 
FOREIGN KEY (miembroId) REFERENCES miembro(id) 
ON DELETE CASCADE;

ALTER TABLE persona 
ADD CONSTRAINT FK_id_persona 
FOREIGN KEY (id) REFERENCES miembro(id) 
ON DELETE CASCADE;

ALTER TABLE empresa 
ADD CONSTRAINT FK_id_empresa 
FOREIGN KEY (id) REFERENCES miembro(id) 
ON DELETE CASCADE;

ALTER TABLE empresa 
ADD CONSTRAINT FK_representante_empresa 
FOREIGN KEY (representante) REFERENCES persona(id) 
ON DELETE CASCADE;

ALTER TABLE ciclista 
ADD CONSTRAINT FK_id_ciclista 
FOREIGN KEY (id) REFERENCES persona(id) 
ON DELETE CASCADE;

ALTER TABLE segmento 
ADD CONSTRAINT FK_iniciaEn_segmento 
FOREIGN KEY (iniciaEn) REFERENCES punto(id) 
ON DELETE CASCADE;

ALTER TABLE segmento 
ADD CONSTRAINT FK_finalizaEn_segmento 
FOREIGN KEY (finalizaEn) REFERENCES punto(id) 
ON DELETE CASCADE;

ALTER TABLE segmento 
ADD CONSTRAINT FK_contenidoEn_segmento 
FOREIGN KEY (contenidoEn) REFERENCES version(id) 
ON DELETE CASCADE;

ALTER TABLE version 
ADD CONSTRAINT FK_carrera_version 
FOREIGN KEY (carrera) REFERENCES carrera(codigo)
ON DELETE CASCADE;

ALTER TABLE esOrganizador 
ADD CONSTRAINT FK_empresaId_esOrganizador 
FOREIGN KEY (empresaId) REFERENCES empresa(id) 
ON DELETE CASCADE;

ALTER TABLE esOrganizador 
ADD CONSTRAINT FK_versionId_esOrganizador 
FOREIGN KEY (versionId) REFERENCES version(id) 
ON DELETE CASCADE;

ALTER TABLE participa 
ADD CONSTRAINT FK_ciclistaId_participa 
FOREIGN KEY (ciclistaId) REFERENCES ciclista(id) 
ON DELETE CASCADE;

ALTER TABLE participa
ADD CONSTRAINT FK_versionId_participa
FOREIGN KEY (versionId) REFERENCES version(id) 
ON DELETE CASCADE;


ALTER TABLE registro
ADD CONSTRAINT FK_esSobre_registro
FOREIGN KEY (esSobre) REFERENCES ciclista(id)
ON DELETE CASCADE;

ALTER TABLE registro 
ADD CONSTRAINT FK_esPara_registro 
FOREIGN KEY (esPara) REFERENCES segmento(nombre)
ON DELETE CASCADE;

ALTER TABLE foto
ADD CONSTRAINT FK_foto_numRegistro
FOREIGN KEY (numeroRegistro) REFERENCES registro(numero);


--Ciclo 1: CRUD: Registrar Resultado
--TAtributos----------------------------------------------------------------------------------------------------------------

--Tuplas----------------------------------------------------------------------------------------------------------------

--Un cilista solo puede tener un �nico registro en un segmento
ALTER TABLE registro
ADD CONSTRAINT UK_reg_esSobre_esPara
UNIQUE (esSobre, esPara);
-- No pueden quedar dos ciclistas con la misma posicion en el mismo segmento
ALTER TABLE registro
ADD CONSTRAINT UK_reg_posicion_esPara
UNIQUE (posicion, esPara);

--Disparadores----------------------------------------------------------------------------------------------------------------

--El numero y la fecha se asignan autom�ticamente
CREATE OR REPLACE TRIGGER TR_reg_date_number
BEFORE 
INSERT
ON registro
FOR EACH ROW
DECLARE
    n registro.numero%TYPE;
BEGIN
    SELECT 
        MAX(numero)
        INTO n
    FROM registro;
    IF n IS NULL THEN
        :NEW.numero := 1;
    ELSE
        :NEW.numero := n + 1;
    END IF;
    :NEW.fecha := CURRENT_DATE;
END;
/
--Solo se pueden registrar resultados de ciclistas que hayan participado en la version de la carrera a la que pertenece el segmento.
CREATE OR REPLACE TRIGGER TR_reg_participado
BEFORE
INSERT
ON registro
FOR EACH ROW
DECLARE
    i BOOLEAN;
    cid participa.ciclistaId%TYPE;
    vid participa.versionId%TYPE;
BEGIN
    SELECT 
        ciclistaId
    INTO
        cid
    FROM participa p
    
    JOIN version v
    ON p.versionId = v.id
    
    JOIN segmento s
    ON v.id = s.contenidoEn
    
    WHERE s.nombre = :NEW.esPara
        AND p.ciclistaId = :NEW.esSobre;
    
    SELECT 
        versionId
    INTO
        vid
    FROM participa p
    
    JOIN version v
    ON p.versionId = v.id
    
    JOIN segmento s
    ON v.id = s.contenidoEn
    
    WHERE s.nombre = :NEW.esPara
        AND p.ciclistaId = :NEW.esSobre;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'El ciclista no particip� en la versi�n de la carrera a la cual pertenece el segmento');
END;
/
--Los datos a modificar son la revisi�n, las fotos y el comentario
CREATE OR REPLACE TRIGGER TR_reg_modificar
BEFORE 
UPDATE
OF numero, fecha, tiempo, posicion, dificultad, esSobre, esPara
ON registro
FOR EACH ROW
BEGIN
    IF :NEW.numero <> :OLD.numero
        OR :NEW.fecha <> :OLD.fecha
        OR :NEW.tiempo <> :OLD.tiempo
        OR :NEW.posicion <> :OLD.posicion
        OR :NEW.dificultad <> :OLD.dificultad
        OR :NEW.esSobre <> :OLD.esSobre
        OR :NEW.esPara <> :OLD.esPara
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER TR_foto_modificar
BEFORE 
UPDATE
OF numeroRegistro
ON foto
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
END;
/
--S�lo es posible eliminar un registro si no ha pasado mas de un dia desde que se creo.
CREATE OR REPLACE TRIGGER TR_reg_eliminar
BEFORE DELETE
ON registro
FOR EACH ROW
BEGIN
    IF SYSDATE - :OLD.fecha > 1 THEN
        RAISE_APPLICATION_ERROR(-20003, 'No se puede eliminar un registro de m�s de un d�a.');
    END IF;
END;
/



--Ciclo 1: CRUD: Mantener Carrera
--TAtributos----------------------------------------------------------------------------------------------------------------

--La distancia simpre debe ser mayor a 1 km
ALTER TABLE punto
ADD CONSTRAINT CHK_punto_distancia
CHECK (
    distancia > 1
);

--Tuplas----------------------------------------------------------------------------------------------------------------

--La velocidad m�xima en cicla es de 100 km/hora.
ALTER TABLE punto
ADD CONSTRAINT CHK_punto_velocidad
CHECK (
    distancia / (tiempoLimite / 60) <= 100
);

--Disparadores----------------------------------------------------------------------------------------------------------------

--El ordern (por carrera) se debe generar autom�ticamente
CREATE OR REPLACE TRIGGER TR_punto_orden_auto
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    newNumber punto.orden%TYPE;
BEGIN
    SELECT 
        MAX(orden)
    INTO newNumber
    FROM punto
    WHERE carrera = :NEW.carrera;
    IF newNumber IS NULL THEN
        newNumber := 1;
    ELSE
        newNumber := newNumber + 1;
    END IF;
    :NEW.orden := newNumber;
END;
/
--El nombre del punto no se debe repetir dentro de una carrera
CREATE OR REPLACE TRIGGER TR_punto_nombre_rep
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    getNombre NUMBER;
BEGIN
    SELECT COUNT(nombre)
    INTO getNombre
    FROM punto
    WHERE nombre = :NEW.nombre
        AND carrera = :NEW.carrera;
    IF getNombre >= 1 THEN
        RAISE_APPLICATION_ERROR(-20004, 'No se puede repetir nombre de punto dentro de la misma carrera');
    END IF;
END;
/
--Solo debe existir un punto de partida y un punto de llegada.
CREATE OR REPLACE TRIGGER TR_punto_tipo_one
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    getTipo NUMBER;
BEGIN
    IF :NEW.tipo = 'P' OR :NEW.tipo = 'L' THEN
        SELECT COUNT(tipo)
        INTO getTipo
        FROM punto
        WHERE tipo = :NEW.tipo
            AND carrera = :NEW.carrera;
        IF getTipo >= 1 THEN
            RAISE_APPLICATION_ERROR(-20005, 'No pueden haber dos puntos de partida o de llegada en la misma carrera');
        END IF;
    END IF;
END;
/
--Si no se dice el tipo del punto se asume que es meta volante a no ser que sea el primer punto que es el de partida.
CREATE OR REPLACE TRIGGER TR_punto_tipo_auto
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    existe BOOLEAN;
BEGIN
    IF :NEW.tipo IS NULL THEN
        existe := FALSE;
        FOR fila IN (
            SELECT *
            FROM punto
            WHERE carrera = :NEW.carrera
        )
        LOOP
            existe := TRUE;
        END LOOP;
        IF existe = TRUE THEN
            :NEW.tipo := 'V';
        ELSE
            :NEW.tipo := 'P';
        END IF;
    END IF;
END;
/
--Si no se conoce la duraci�n m�xima se asume una velocidad de 60 km/hora
CREATE OR REPLACE TRIGGER TR_punto_tiempoLimite
BEFORE INSERT
ON punto
FOR EACH ROW
BEGIN
    IF :NEW.tiempoLimite IS NULL THEN
        :NEW.tiempoLimite := :NEW.distancia;
    END IF;
END;
/
--Los unicos datos que se pueden modificar son el tipo y la duracion, No se puede modificar el tipo de partida
CREATE OR REPLACE TRIGGER TR_punto_modificarX
BEFORE UPDATE
ON punto
FOR EACH ROW
BEGIN
    IF :NEW.id <> :OLD.id
        OR :NEW.orden <> :OLD.orden
        OR :NEW.nombre <> :OLD.nombre
        OR :NEW.distancia <> :OLD.distancia
        OR :NEW.carrera <> :OLD.carrera 
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
    IF :OLD.tipo = 'P' AND :OLD.tipo <> :NEW.tipo THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se puede reemplazar un punto de partida');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER TR_punto_eliminar
BEFORE DELETE
ON punto
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/



--Ciclo 1: CRUD: Registrar Version
--TAtributos----------------------------------------------------------------------------------------------------------------

--Tuplas----------------------------------------------------------------------------------------------------------------

--Un segmento no puede iniciar y finalizar en el mismo punto.
ALTER TABLE segmento
ADD CONSTRAINT CHK_segmento_startEnd
CHECK (
    iniciaEn != finalizaEn
);

--Disparadores----------------------------------------------------------------------------------------------------------------

--Si no se especifica un nombre de la version ser� de tipo: nombreCarrera_id
CREATE OR REPLACE TRIGGER TR_version_nombre
BEFORE INSERT
ON version
FOR EACH ROW
DECLARE
    nombreC carrera.nombre%TYPE;
BEGIN
    IF :NEW.nombre IS NULL THEN
        SELECT
            nombre
        INTO nombreC
        FROM carrera
        WHERE codigo = :NEW.carrera;
        :NEW.nombre := CONCAT(nombreC, '_');
        :NEW.nombre := CONCAT(:NEW.nombre, :NEW.id);
    END IF;
END;
/
--La fecha no puede repetirse para la misma carrera
CREATE OR REPLACE TRIGGER TR_version_fecha
BEFORE INSERT
ON version
FOR EACH ROW
BEGIN
    FOR fila IN (
        SELECT *
        FROM version
        WHERE carrera = :NEW.carrera
        )
    LOOP
        IF fila.fecha = :NEW.fecha THEN
            RAISE_APPLICATION_ERROR(-20008, 'No pueden haber dos versiones con la misma fecha para la misma carrera');
        END IF;
    END LOOP;
END;
/
--Un ciclista no puede participar en dos versiones en la misma fecha
CREATE OR REPLACE TRIGGER TR_participa_fecha
BEFORE INSERT
ON participa
FOR EACH ROW
DECLARE
    newDate version.fecha%TYPE;
BEGIN
    SELECT fecha
    INTO newDate
    FROM version
    WHERE id = :NEW.versionId;
    
    FOR fila IN (
        SELECT *
        FROM participa
        
        JOIN version
        ON versionId = id
        
        WHERE ciclistaId = :NEW.ciclistaId
        )
    LOOP
        IF fila.fecha = newDate THEN
            RAISE_APPLICATION_ERROR(-20009, 'Un ciclista no puede participar en dos versiones en la misma fecha');
        END IF;
    END LOOP;
END;
/
--Se puede modificar el nombre y tipo de un segmento si son de una version futura
CREATE OR REPLACE TRIGGER TR_segmento_modify
BEFORE UPDATE
ON segmento
FOR EACH ROW
DECLARE
    versionFecha version.fecha%TYPE;
BEGIN
    IF :OLD.contenidoEn <> :NEW.contenidoEn
        OR :OLD.iniciaEn <> :NEW.iniciaEn
        OR :OLD.finalizaEn <> :NEW.finalizaEn
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
    SELECT fecha
    INTO versionFecha
    FROM version
    WHERE id = :OLD.contenidoEn;
    IF versionFecha < CURRENT_DATE THEN
        RAISE_APPLICATION_ERROR(-20010, 'No se puede actualizar un evento pasado');
    END IF;
END;
/
-- Solo se puede modificar el nombre de una version
CREATE OR REPLACE TRIGGER TR_version_modify
BEFORE UPDATE
ON version
FOR EACH ROW
BEGIN
    IF :OLD.id <> :NEW.id
        OR :OLD.fecha <> :NEW.fecha
        OR :OLD.carrera <> :NEW.carrera
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
END;
/
-- No se puede eliminar una version. -- TR_version_del
CREATE OR REPLACE TRIGGER TR_version_del
BEFORE DELETE
ON version
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/
-- No se puede eliminar un segmento. -- TR_segmento_del
CREATE OR REPLACE TRIGGER TR_segmento_del
BEFORE DELETE
ON segmento
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/

--XDisparadores---------------------------------------------------------------------------------------------------------------
DROP TRIGGER TR_reg_date_number;
DROP TRIGGER TR_reg_participado;
DROP TRIGGER TR_reg_modificar;
DROP TRIGGER TR_reg_eliminar;
DROP TRIGGER TR_punto_orden_auto;
DROP TRIGGER TR_punto_nombre_rep;
DROP TRIGGER TR_punto_tipo_one;
DROP TRIGGER TR_punto_tipo_auto;
DROP TRIGGER TR_punto_tiempoLimite;
DROP TRIGGER TR_punto_modificarX;
DROP TRIGGER TR_punto_eliminar;
DROP TRIGGER TR_version_nombre;
DROP TRIGGER TR_version_fecha;
DROP TRIGGER TR_participa_fecha;
DROP TRIGGER TR_segmento_modify;
DROP TRIGGER TR_version_modify;
DROP TRIGGER TR_version_del;
DROP TRIGGER TR_segmento_del;
        

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: PoblarOK
INSERT INTO carrera VALUES('0', 'Carrera1', 'COLOMBIA', 1, 'A');
INSERT INTO carrera VALUES('1', 'Carrera2', 'COLOMBIA', 2, 'M');
INSERT INTO carrera VALUES('2', 'Carrera3', 'COLOMBIA', 3, 'S');
INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);

INSERT INTO miembro VALUES(1, 'CC', 1132487556, 'COLOMBIA', 'asd@gmail.com');
INSERT INTO miembro VALUES(2, 'CC', 1132487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(3, 'CC', 1132487558, 'COLOMBIA', 'asd2@gmail.com');
INSERT INTO miembro VALUES(4, 'CC', 1132487558, 'COLOMBIA', 'asd2@gmail.com');
INSERT INTO persona VALUES(1, 'Andres Mu�oz');
INSERT INTO persona VALUES(2, 'Mariaza Garzon');
INSERT INTO persona VALUES(3, 'Mariaza Garzon');
INSERT INTO persona VALUES(4, 'Mariaza Garzon');
INSERT INTO empresa VALUES(1, 'Monsters Inc.', 1);
INSERT INTO empresa VALUES(2, 'aaa cia.', 1);
INSERT INTO empresa VALUES(3, 'Next corp.', 2);
INSERT INTO ciclista VALUES(4, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1);
INSERT INTO ciclista VALUES(3, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1);
INSERT INTO ciclista VALUES(1, TO_DATE('1991/09/28', 'yyyy/mm/dd'), 2);
INSERT INTO ciclista VALUES(2, TO_DATE('1985/05/10', 'yyyy/mm/dd'), 3);
INSERT INTO propiedadDe VALUES ('0', 1, 59.2);
INSERT INTO propiedadDe VALUES ('1', 2, 99.5);
INSERT INTO propiedadDe VALUES ('2', 3, 10);

INSERT INTO esOrganizador VALUES(3, 1);
INSERT INTO esOrganizador VALUES(2, 1);
INSERT INTO esOrganizador VALUES(3, 2);
INSERT INTO version VALUES(3, 'TDF', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(1, 'TDF2', TO_DATE('2019/10/27', 'yyyy/mm/dd'), '1');
INSERT INTO version VALUES(2, 'TDF3', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '2');
INSERT INTO version VALUES(4, 'TDF4', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '1');
INSERT INTO segmento VALUES('seg1', 'C', 3, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 1, 2);
INSERT INTO participa VALUES(1, 2);
INSERT INTO participa VALUES(1, 1);
INSERT INTO participa VALUES(2, 2);
INSERT INTO participa VALUES(2, 3);
INSERT INTO participa VALUES(3, 3);

INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '
<!DOCTYPE TRevision [
<!ELEMENT TRevision (Secciones)>
<!ELEMENT Secciones (Seccion)+>
<!ELEMENT Seccion (KmInicial, KmFinal, VelocidadProm, VelocidadMin, VelocidadMax, PulsacionesProm, PotenciaProm)>
<!ELEMENT KmInicial (#PCDATA)>
<!ELEMENT KmFinal (#PCDATA)>
<!ELEMENT VelocidadProm (#PCDATA)>
<!ELEMENT VelocidadMin (#PCDATA)>
<!ELEMENT VelocidadMax (#PCDATA)>
<!ELEMENT PulsacionesProm (#PCDATA)>
<!ELEMENT PotenciaProm (#PCDATA)>

<!ATTLIST Seccion Tipo (Dura|Facil|Descenso) "Dura">
]>
<TRevision>
    <Secciones>
        <Seccion Tipo="Dura">
            <KmInicial>25</KmInicial>
            <KmFinal>40</KmFinal>
            <VelocidadProm>28</VelocidadProm>
            <VelocidadMin>5</VelocidadMin>
            <VelocidadMax>40</VelocidadMax>
            <PulsacionesProm>97</PulsacionesProm>
            <PotenciaProm>45</PotenciaProm>
        </Seccion>
    </Secciones>
</TRevision>
', 'M', '', 2, 'seg1');
INSERT INTO registro VALUES(1, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '
<!DOCTYPE TRevision [
<!ELEMENT TRevision (Secciones)>
<!ELEMENT Secciones (Seccion)+>
<!ELEMENT Seccion (KmInicial, KmFinal, VelocidadProm, VelocidadMin, VelocidadMax, PulsacionesProm, PotenciaProm)>
<!ELEMENT KmInicial (#PCDATA)>
<!ELEMENT KmFinal (#PCDATA)>
<!ELEMENT VelocidadProm (#PCDATA)>
<!ELEMENT VelocidadMin (#PCDATA)>
<!ELEMENT VelocidadMax (#PCDATA)>
<!ELEMENT PulsacionesProm (#PCDATA)>
<!ELEMENT PotenciaProm (#PCDATA)>

<!ATTLIST Seccion Tipo (Dura|Facil|Descenso) "Dura">
]>
<TRevision>
    <Secciones>
        <Seccion Tipo="Facil">
            <KmInicial>1</KmInicial>
            <KmFinal>140</KmFinal>
            <VelocidadProm>37</VelocidadProm>
            <VelocidadMin>15</VelocidadMin>
            <VelocidadMax>54</VelocidadMax>
            <PulsacionesProm>88</PulsacionesProm>
            <PotenciaProm>30</PotenciaProm>
        </Seccion>
    </Secciones>
</TRevision>
', 'M', '', 1, 'seg2');
INSERT INTO registro VALUES(2, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '
<!DOCTYPE TRevision [
<!ELEMENT TRevision (Secciones)>
<!ELEMENT Secciones (Seccion)+>
<!ELEMENT Seccion (KmInicial, KmFinal, VelocidadProm, VelocidadMin, VelocidadMax, PulsacionesProm, PotenciaProm)>
<!ELEMENT KmInicial (#PCDATA)>
<!ELEMENT KmFinal (#PCDATA)>
<!ELEMENT VelocidadProm (#PCDATA)>
<!ELEMENT VelocidadMin (#PCDATA)>
<!ELEMENT VelocidadMax (#PCDATA)>
<!ELEMENT PulsacionesProm (#PCDATA)>
<!ELEMENT PotenciaProm (#PCDATA)>

<!ATTLIST Seccion Tipo (Dura|Facil|Descenso) "Dura">
]>
<TRevision>
    <Secciones>
        <Seccion Tipo="Descenso">
            <KmInicial>143</KmInicial>
            <KmFinal>145</KmFinal>
            <VelocidadProm>48</VelocidadProm>
            <VelocidadMin>27</VelocidadMin>
            <VelocidadMax>80</VelocidadMax>
            <PulsacionesProm>73</PulsacionesProm>
            <PotenciaProm>21</PotenciaProm>
        </Seccion>
    </Secciones>
</TRevision>
', 'M', '', 1, 'seg3');

---------------------------------------------------------------------------------------------------------------------------
--CICLO 1: XTablas
DROP TABLE propiedadDe;
DROP TABLE punto;
DROP TABLE carrera;

DROP TABLE miembro;
DROP TABLE persona;
DROP TABLE empresa;
DROP TABLE ciclista;

DROP TABLE version;
DROP TABLE segmento;
DROP TABLE esOrganizador;
DROP TABLE participa;

DROP TABLE registro;

---------------------------------------------------------------------------------------------------------------------------
--Ciclo 1: XPoblar
DELETE FROM propiedadDe;
DELETE FROM punto;
DELETE FROM carrera;

DELETE FROM miembro;
DELETE FROM persona;
DELETE FROM empresa;
DELETE FROM ciclista;

DELETE FROM version;
DELETE FROM segmento;
DELETE FROM esOrganizador;
DELETE FROM participa;

DELETE FROM registro;

---------------------------------------------------------------------------------------------------------------------------
