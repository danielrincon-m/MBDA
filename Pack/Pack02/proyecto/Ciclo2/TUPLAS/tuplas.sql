/*Tuplas*/
ALTER TABLE EVENTOS ADD CONSTRAINT CK_eventos_cantidadE_cantidadM
	CHECK (CANTIDAD_EQUIPOS >= CAPACIDAD_MAXIMA);