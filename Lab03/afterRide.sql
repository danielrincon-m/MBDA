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
    periodicidad NUMBER(10) NOT NULL
);

CREATE TABLE miembro(
    id NUMBER(5),
    idt VARCHAR(2) NOT NULL,
    idn NUMBER(15) NOT NULL,
    pais VARCHAR(15),
    correo VARCHAR(30) NOT NULL
);
CREATE TABLE persona(
    id NUMBER(5),
    nombres VARCHAR(50) NOT NULL
);
CREATE TABLE empresa(
    id NUMBER(5),
    razonSocial VARCHAR(30) NOT NULL,
    representante NUMBER(5) NOT NULL
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
    revision VARCHAR(60),
    dificultad VARCHAR(1) NOT NULL,
    fotos VARCHAR(50),
    comentario VARCHAR(20),
    esSobre NUMBER(5) NOT NULL,
    correspondeA NUMBER(5) NOT NULL,
    esPara VARCHAR(10) NOT NULL
);


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


--CICLO 1: PoblarOK (1)
INSERT INTO carrera VALUES('0', 'Carrera1', 'COLOMBIA', 1, 6);
INSERT INTO carrera VALUES('1', 'Carrera2', 'COLOMBIA', 2, 12);
INSERT INTO carrera VALUES('2', 'Carrera3', 'COLOMBIA', 3, 18);
INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);
INSERT INTO propiedadDe VALUES ('0', 0, 59.2);
INSERT INTO propiedadDe VALUES ('1', 1, 99.5);
INSERT INTO propiedadDe VALUES ('2', 2, 10);

INSERT INTO miembro VALUES(0, 'CC', 1032487556, 'COLOMBIA', 'asd@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(2, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com');
INSERT INTO persona VALUES(0, 'Andres Garzon');
INSERT INTO persona VALUES(1, 'Andres Muñoz');
INSERT INTO persona VALUES(2, 'Mariaza Garzon');
INSERT INTO empresa VALUES(3, 'Monsters Inc.', 0);
INSERT INTO empresa VALUES(4, 'aaa cia.', 1);
INSERT INTO empresa VALUES(5, 'Next corp.', 2);
INSERT INTO ciclista VALUES(0, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1);
INSERT INTO ciclista VALUES(1, TO_DATE('1991/09/28', 'yyyy/mm/dd'), 2);
INSERT INTO ciclista VALUES(2, TO_DATE('1985/05/10', 'yyyy/mm/dd'), 3);

INSERT INTO participa VALUES(0, 0);
INSERT INTO participa VALUES(1, 1);
INSERT INTO participa VALUES(2, 0);
INSERT INTO esOrganizador VALUES(3, 0);
INSERT INTO esOrganizador VALUES(4, 1);
INSERT INTO esOrganizador VALUES(5, 0);
INSERT INTO version VALUES(0, 'TDF', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(1, 'TDF2', TO_DATE('2019/10/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(2, 'TDF3', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '0');
INSERT INTO segmento VALUES('seg1', 'C', 0, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 0, 0);

INSERT INTO registro VALUES(0, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 50, 10, '', 'M', '', '', 0, 0, 'seg1');
INSERT INTO registro VALUES(1, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 100, 1, '', 'M', '', '', 0, 0, 'seg2');
INSERT INTO registro VALUES(2, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 200, 5, '', 'M', '', '', 0, 0, 'seg3');


--CICLO 1: PoblarNoOK (2 y 3)
--PUNTO 2
--Insertar un numero incorrecto de atributos
INSERT INTO miembro VALUES(1);
--Insertar un tipo de datos inválido
INSERT INTO empresa VALUES(5, NULL, NULL);
--Insertar un atributo NULL en un campo que no lo permite
INSERT INTO ciclista VALUES(0, TO_DATE('1990/09/27', 'yyyy/mm/dd'), NULL);
INSERT INTO version VALUES(0, 'TDF', NULL, '0');
INSERT INTO persona VALUES(0, NULL);

--PUNTO 3
--Insertar una llave primaria repetida
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com'); --La llave primaria ya existe
--Insertar un valor que no apunte a algun valor de otra tabla requerida
INSERT INTO persona VALUES(10, 'Andres Garzon'); --No existe el miembro 10
--Violar una restricion de atributos
INSERT INTO miembro VALUES(1, 'CD', 1032487557, 'COLOMBIA', 'asd1@gmail.com'); --No existe el tipo de documento CD
INSERT INTO punto VALUES(0, 0, 'Punto1', 'R', 15.2, 20, 0); --tipo no deberia tomar el valor 'R'


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


--CICLO 1: Atributos
ALTER TABLE punto ADD CONSTRAINT CHK_tipo_punto CHECK (tipo IN ('P','L','H','A','M','V','C') );
ALTER TABLE punto ADD CONSTRAINT CHK_tiempoLimite_punto CHECK (tiempoLimite > 0 );
ALTER TABLE carrera ADD CONSTRAINT CHK_codigo_carrera CHECK ( REGEXP_LIKE(codigo,'^([A-Z0-9]*)$'));
ALTER TABLE carrera ADD CONSTRAINT CHK_pais_carrera CHECK ( REGEXP_LIKE(pais,'^([A-Z]*)$' ));
ALTER TABLE carrera ADD CONSTRAINT CHK_categoria_carrera CHECK (categoria BETWEEN 1 AND 5  );
ALTER TABLE carrera ADD CONSTRAINT CHK_periodicidad_carrera CHECK (periodicidad IN ('A','M','S','T') );
ALTER TABLE propiedadDe ADD CONSTRAINT CHK_porcentaje_propiedadDe CHECK (porcentaje BETWEEN 0 AND 100);

ALTER TABLE miembro ADD CONSTRAINT CHK_id_miembro CHECK (id BETWEEN 1 AND 99999 );
ALTER TABLE miembro ADD CONSTRAINT CHK_idt_miembro CHECK (idt IN('CC','CE','NIT') );
ALTER TABLE miembro ADD CONSTRAINT CHK_idn_miembro CHECK (idn >= 1111111111 );
ALTER TABLE miembro ADD CONSTRAINT CHK_pais_miembro CHECK ( REGEXP_LIKE(pais,'^([A-Z]*)$' ));
ALTER TABLE miembro ADD CONSTRAINT CHK_correo_miembro CHECK (correo LIKE '%@%' AND correo NOT LIKE '%@%@%' );
ALTER TABLE empresa ADD CONSTRAINT CHK_id_empresa CHECK (id BETWEEN 1 AND 99999 );
ALTER TABLE persona ADD CONSTRAINT CHK_id_persona CHECK (id BETWEEN 1 AND 99999 );
ALTER TABLE ciclista ADD CONSTRAINT CHK_categoria_ciclista CHECK (categoria BETWEEN 1 AND 5 );
ALTER TABLE ciclista ADD CONSTRAINT CHK_id_ciclista CHECK (id BETWEEN 1 AND 99999 );

ALTER TABLE version ADD CONSTRAINT CHK_carrera_version CHECK ( REGEXP_LIKE(carrera,'^([A-Z0-9]*)$'));
ALTER TABLE version ADD CONSTRAINT CHK_id_version CHECK (id BETWEEN 1 AND 99999 );
ALTER TABLE segmento ADD CONSTRAINT CHK_tipo_segmento CHECK (tipo IN ('C','M','L') );

ALTER TABLE registro ADD CONSTRAINT CHK_numero_registro CHECK (numero BETWEEN 1 AND 99999);
ALTER TABLE registro ADD CONSTRAINT CHK_tiempo_registro CHECK (tiempo > 0 );
ALTER TABLE registro ADD CONSTRAINT CHK_dificultad_registro CHECK (dificultad IN ('A','M','B') );
ALTER TABLE registro ADD CONSTRAINT CHK_fotos_registro CHECK (fotos LIKE 'www.%.gif' OR fotos LIKE 'www.%.pdf' );


--CICLO 1: Primarias
ALTER TABLE punto ADD CONSTRAINT PK_punto PRIMARY KEY (id);
ALTER TABLE carrera ADD CONSTRAINT PK_carrera PRIMARY KEY (codigo);
ALTER TABLE propiedadDe ADD CONSTRAINT PK_propiedadDe PRIMARY KEY (carreraId, miembroId);

ALTER TABLE miembro ADD CONSTRAINT PK_miembro PRIMARY KEY (id);
ALTER TABLE persona ADD CONSTRAINT PK_persona PRIMARY KEY (id);
ALTER TABLE empresa ADD CONSTRAINT PK_empresa PRIMARY KEY (id);
ALTER TABLE ciclista ADD CONSTRAINT PK_ciclista PRIMARY KEY (id);

ALTER TABLE segmento ADD CONSTRAINT PK_segmento PRIMARY KEY (nombre);
ALTER TABLE version ADD CONSTRAINT PK_version PRIMARY KEY (id);
ALTER TABLE esOrganizador ADD CONSTRAINT PK_esOrganizador PRIMARY KEY (empresaId, versionId);
ALTER TABLE participa ADD CONSTRAINT PK_participa PRIMARY KEY (ciclistaId, versionId);

ALTER TABLE registro ADD CONSTRAINT PK_registro PRIMARY KEY (numero);


--CICLO 1: Unicas
ALTER TABLE registro ADD CONSTRAINT UK_comentario_registro UNIQUE (comentario);


--CICLO 1: Foraneas
ALTER TABLE punto ADD CONSTRAINT FK_carrera_punto FOREIGN KEY (carrera) REFERENCES carrera(codigo) ON DELETE CASCADE;
ALTER TABLE propiedadDe ADD CONSTRAINT FK_carreraId_propiedadDe FOREIGN KEY (carreraId) REFERENCES carrera(codigo) ON DELETE CASCADE;
ALTER TABLE propiedadDe ADD CONSTRAINT FK_miembroId_propiedadDe FOREIGN KEY (miembroId) REFERENCES miembro(id) ON DELETE CASCADE;

ALTER TABLE persona ADD CONSTRAINT FK_id_persona FOREIGN KEY (id) REFERENCES miembro(id) ON DELETE CASCADE;
ALTER TABLE empresa ADD CONSTRAINT FK_id_empresa FOREIGN KEY (id) REFERENCES miembro(id) ON DELETE CASCADE;
ALTER TABLE empresa ADD CONSTRAINT FK_representante_empresa FOREIGN KEY (representante) REFERENCES persona(id) ON DELETE CASCADE;
ALTER TABLE ciclista ADD CONSTRAINT FK_id_ciclista FOREIGN KEY (id) REFERENCES persona(id) ON DELETE CASCADE;

ALTER TABLE segmento ADD CONSTRAINT FK_iniciaEn_segmento FOREIGN KEY (iniciaEn) REFERENCES punto(id) ON DELETE CASCADE;
ALTER TABLE segmento ADD CONSTRAINT FK_finalizaEn_segmento FOREIGN KEY (finalizaEn) REFERENCES punto(id) ON DELETE CASCADE;
ALTER TABLE segmento ADD CONSTRAINT FK_contenidoEn_segmento FOREIGN KEY (contenidoEn) REFERENCES version(id) ON DELETE CASCADE;
ALTER TABLE version ADD CONSTRAINT FK_carrera_version FOREIGN KEY (carrera) REFERENCES carrera(codigo) ON DELETE CASCADE;
ALTER TABLE esOrganizador ADD CONSTRAINT FK_empresaId_esOrganizador FOREIGN KEY (empresaId) REFERENCES empresa(id) ON DELETE CASCADE;
ALTER TABLE esOrganizador ADD CONSTRAINT FK_versionId_esOrganizador FOREIGN KEY (versionId) REFERENCES version(id) ON DELETE CASCADE;
ALTER TABLE participa ADD CONSTRAINT FK_ciclistaId_participa FOREIGN KEY (ciclistaId) REFERENCES ciclista(id) ON DELETE CASCADE;
ALTER TABLE participa ADD CONSTRAINT FK_versionId_participa FOREIGN KEY (versionId) REFERENCES version(id) ON DELETE CASCADE;

ALTER TABLE registro ADD CONSTRAINT FK_esSobre_registro FOREIGN KEY (esSobre) REFERENCES ciclista(id) ON DELETE CASCADE;
ALTER TABLE registro ADD CONSTRAINT FK_correspondeA_registro FOREIGN KEY (correspondeA) REFERENCES version(id) ON DELETE CASCADE;
ALTER TABLE registro ADD CONSTRAINT FK_esPara_registro FOREIGN KEY (esPara) REFERENCES segmento(nombre) ON DELETE CASCADE;


--CICLO 1: PoblarNoOK (2)
--PUNTO 2
--Insertar una llave primaria repetida
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com'); --PK_miembro
--Insertar un valor que no apunte a algun valor de otra tabla requerida
INSERT INTO persona VALUES(10, 'Andres Garzon'); --FK_id_persona
--Violar una restricion de atributos
INSERT INTO miembro VALUES(1, 'CD', 1032487557, 'COLOMBIA', 'asd1@gmail.com'); --CHK_idt_miembro
INSERT INTO punto VALUES(0, 0, 'Punto1', 'R', 15.2, 20, 0); --CHK_tipo_punto

--PUNTO 3
--Respetar llave foranea
INSERT INTO ciclista VALUES(100, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1); --FK_id_ciclista
INSERT INTO participa VALUES(100, 200); --FK_ciclistaId_participa
--Respetar llave primaria
INSERT INTO persona VALUES(0, 'Andres Garzon');
INSERT INTO persona VALUES(0, 'Andres Muñoz'); --PK_persona
--Respetar check
INSERT INTO miembro VALUES(1, 'CD', 17, 'COLOMBIA', 'asd1@gmail.com'); --CHK_idn_miembro


--CICLO 1: Consultar segmentos de montaña con secciones de descenso
SELECT v.nombre, s.nombre
FROM version v JOIN segmento s ON(v.id = s.contenidoEn);

--CICLO 1: Consultar los puntos de una carrera
SELECT nombre, tipo, distancia, tiempoLimite
FROM punto
ORDER BY distancia DESC;

--CICLO 1: Consultar los participantes en una carrera
SELECT p.id, p.nombres
FROM persona p JOIN ciclista c ON c.id = p.id
               JOIN participa ON c.id = ciclistaId
               JOIN version v on versionId = v.id
WHERE v.nombre = '--Dato de consulta--';

--CICLO 1: Consultar las empresas organizadoras de una carrera
SELECT e.razonSocial
FROM empresa e JOIN esOrganizador ON e.id = empresaId
               JOIN version v ON versionId = v.id
WHERE v.nombre = '--Dato de consulta--';


--RETROSPECTIVA
--1. 12 horas, 6 por persona
--2. 90% hecho, no calculamos bien el tiempo de realización
--3. Trabajar bajo presión, haciendo el trabajo de una manera correcta
--4. La parte de CHECKS, se solucionó por medio de investigación
--5. Paralelizamos el trabajo para tener resultados mas eficientes y rápidos, nos comprometemos a hacer el laboratorio con mas tiempo