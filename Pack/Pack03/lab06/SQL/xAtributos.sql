ALTER TABLE Opinion DROP CONSTRAINT CK_OPINION_TCONSECUTIVO;
ALTER TABLE Perfil DROP CONSTRAINT CK_PERFIL_TCorreo;
ALTER TABLE Opinion DROP CONSTRAINT CK_OPINION_TDETALLE;
ALTER TABLE Temporal DROP CONSTRAINT CK_TEMPORAL_TDURACION;
ALTER TABLE Temporal DROP CONSTRAINT CK_TEMPORAL_TIDIOMA;
ALTER TABLE Trata DROP CONSTRAINT CK_TRATA_TNIVEL;
ALTER TABLE Opinion DROP CONSTRAINT CK_OPINION_TOPINION;
ALTER TABLE Etiqueta DROP CONSTRAINT CK_ETIQUETA_TPALABRA;
ALTER TABLE Palabra DROP CONSTRAINT CK_PALABRA_TPALABRA;
ALTER TABLE Adjetivo DROP CONSTRAINT CK_ADJETIVO_TPALABRA;
ALTER TABLE Trata DROP CONSTRAINT CK_TRATA_TPORCENTAJE;
ALTER TABLE Asignatura DROP CONSTRAINT CK_ASIGNATURA_TSIGLA;
ALTER TABLE Temporal DROP CONSTRAINT CK_TEMPORAL_TTIPO;
ALTER TABLE Temporal DROP CONSTRAINT CK_TEMPORAL_TURL;