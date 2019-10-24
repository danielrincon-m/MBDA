--La fecha de inicio de una promoción debe ser antes de la fecha de finalización
ALTER TABLE promocion 
ADD CONSTRAINT CHK_promocion_fechas
CHECK (
	fechaInicio < fechaFinal
);