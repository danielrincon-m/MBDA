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