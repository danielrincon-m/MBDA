/*uk*/
ALTER TABLE ASOCIACIONES ADD CONSTRAINT
 UK_ASOCIACIONES_NOMBRE UNIQUE(nombre);


ALTER TABLE EVENTOS ADD CONSTRAINT
 UK_EVENTOS_NOMBRE UNIQUE(nombre);


ALTER TABLE INSCRIPCIONES ADD CONSTRAINT
 UK_INSCRIPCIONES_equipo_evento UNIQUE(equipo,evento);
  