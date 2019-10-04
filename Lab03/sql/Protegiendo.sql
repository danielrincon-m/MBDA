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
--Insertar una llave primaria repetida
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com'); --PK_miembro
--Insertar un valor que no apunte a algun valor de otra tabla requerida
INSERT INTO persona VALUES(10, 'Andres Garzon'); --FK_id_persona
--Violar una restricion de atributos
INSERT INTO miembro VALUES(1, 'CD', 1032487557, 'COLOMBIA', 'asd1@gmail.com'); --CHK_idt_miembro
INSERT INTO punto VALUES(0, 0, 'Punto1', 'R', 15.2, 20, 0); --CHK_tipo_punto

--Respetar llave foranea
INSERT INTO ciclista VALUES(100, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1); --FK_id_ciclista
INSERT INTO participa VALUES(100, 200); --FK_ciclistaId_participa
--Respetar llave primaria
INSERT INTO persona VALUES(0, 'Andres Garzon');
INSERT INTO persona VALUES(0, 'Andres Muñoz'); --PK_persona
--Respetar check
INSERT INTO miembro VALUES(1, 'CD', 17, 'COLOMBIA', 'asd1@gmail.com'); --CHK_idn_miembro