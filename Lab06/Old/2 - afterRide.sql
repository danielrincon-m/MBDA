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
--CICLO 1: PoblarNoOK
--Insertar un numero incorrecto de atributos
INSERT INTO miembro VALUES(1);
--Insertar un tipo de datos inválido
INSERT INTO empresa VALUES(5, NULL, NULL);
--Insertar un atributo NULL en un campo que no lo permite
INSERT INTO ciclista VALUES(0, TO_DATE('1990/09/27', 'yyyy/mm/dd'), NULL);
INSERT INTO version VALUES(0, 'TDF', NULL, '0');
INSERT INTO persona VALUES(0, NULL);
--Insertar una llave primaria repetida
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com'); --PK_miembro
--Insertar un valor que no apunte a algun valor de otra tabla requerida
INSERT INTO persona VALUES(10, 'Andres Garzon'); --FK_id_persona
--Violar una restricion de atributos
INSERT INTO miembro VALUES(1, 'CD', 1032487557, 'COLOMBIA', 'asd1@gmail.com'); --CHK_idt_miembro
INSERT INTO punto VALUES(0, 0, 'Punto1', 'R', 15.2, 20, 0); --CHK_tipo_punto
--El tipo de la seccion no concuerda con las opciones
INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '
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
        <Seccion Tipo="Ascenso">
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
--Falta un elemento de la seccion (VelocidadProm)
INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '
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
            <VelocidadMin>15</VelocidadMin>
            <VelocidadMax>54</VelocidadMax>
            <PulsacionesProm>88</PulsacionesProm>
            <PotenciaProm>30</PotenciaProm>
        </Seccion>
    </Secciones>
</TRevision>
', 'M', '', 1, 'seg2');

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

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 2, 'seg1');
INSERT INTO registro VALUES(1, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '', 'M', '', 1, 'seg2');
INSERT INTO registro VALUES(2, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '', 'M', '', 1, 'seg3');

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 150, 5, '', 'M', '', 2, 'seg1'); --El ciclista numero 2 no puede tener un nuevo registro en el segmento 'seg1'
INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 10, '', 'M', '', 3, 'seg1'); --El ciclista numero 3 no puede ocupar la misma posicion que el ciclista 2 en el mismo segmento

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

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

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 2, 'seg1');
INSERT INTO registro VALUES(1, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '', 'M', '', 1, 'seg2');
INSERT INTO registro VALUES(2, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '', 'M', '', 1, 'seg3');

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 1, 'seg1'); --No se puede registrar un ciclista que no haya competido en el segmento 'seg1'
UPDATE registro
SET tiempo = 90
WHERE numero = 1; -- No se puede actualizar el campo de tiempo

--XDisparadores-----------------------------------------------------------------------------------------------------------------

DROP TRIGGER TR_reg_date_number;
DROP TRIGGER TR_reg_participado;
DROP TRIGGER TR_reg_modificar;
DROP TRIGGER TR_reg_eliminar;
---------------------------------------------------------------------------------------------------------------------------







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

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(2, 0, 'Punto4', 'L', 30, 2, 1); -- La velocidad maxima es de 100 km/h

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

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

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(2, 0, 'Punto3', 'A', 15.2, 20, 1); --No se puede repetir el nombre del punto en una misma carrera
INSERT INTO punto VALUES(2, 0, 'Punto4', 'P', 15.2, 20, 1); --Solo puede existir un punto de partida
UPDATE punto
SET tipo = 'A'
WHERE id = 0; --No se puede modificar el tipo de un punto de partida
DELETE FROM punto WHERE id = 0; -- No se pueden eliminar puntos

--XDisparadores----------------------------------------------------------------------------------------------------------------
DROP TRIGGER TR_punto_orden_auto;
DROP TRIGGER TR_punto_nombre_rep;
DROP TRIGGER TR_punto_tipo_one;
DROP TRIGGER TR_punto_tipo_auto;
DROP TRIGGER TR_punto_tiempoLimite;
DROP TRIGGER TR_punto_modificarX;
DROP TRIGGER TR_punto_eliminar;
---------------------------------------------------------------------------------------------------------------------------







--Ciclo 1: CRUD: Registrar Version
--TAtributos----------------------------------------------------------------------------------------------------------------

--Tuplas----------------------------------------------------------------------------------------------------------------

--Un segmento no puede iniciar y finalizar en el mismo punto.
ALTER TABLE segmento
ADD CONSTRAINT CHK_segmento_startEnd
CHECK (
    iniciaEn != finalizaEn
);

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO segmento VALUES('seg1', 'C', 3, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 1, 2);

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO segmento VALUES('seg3', 'C', 2, 0, 0); -- No se puede iniciar y terminar un segmento en el mismo punto

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

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

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO participa VALUES(1, 2);
INSERT INTO participa VALUES(1, 1);
INSERT INTO participa VALUES(2, 2);
INSERT INTO participa VALUES(2, 3);
INSERT INTO participa VALUES(3, 3);
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

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO version VALUES(5, 'TDF5', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0'); -- La fecha no puede repetirse para la misma carrera
INSERT INTO participa VALUES(1, 4); -- Un ciclista no puede participar en dos versiones en la misma fecha
UPDATE segmento
SET nombre = 'HOLA',
    tipo = 'M'
WHERE nombre = 'seg2'; -- Se puede modificar el nombre y tipo de un segmento si son de una version futura
DELETE FROM version; -- No se puede eliminar una version
DELETE FROM segmento; -- No se puede eliminar un segmento

--XDisparadores---------------------------------------------------------------------------------------------------------------
DROP TRIGGER TR_version_nombre;
DROP TRIGGER TR_version_fecha;
DROP TRIGGER TR_participa_fecha;
DROP TRIGGER TR_segmento_modify;
DROP TRIGGER TR_version_modify;
DROP TRIGGER TR_version_del;
DROP TRIGGER TR_segmento_del;