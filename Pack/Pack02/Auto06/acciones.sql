/*Adicionando acciones de referencia*/
/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
ALTER TABLE band DROP CONSTRAINT FK_band_musician; 
ALTER TABLE band ADD CONSTRAINT FK_band_musician  
FOREIGN KEY(band_contact) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performer DROP CONSTRAINT FK_performer_musician;
ALTER TABLE performer ADD CONSTRAINT FK_performer_musician  
FOREIGN KEY(perf_is) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performances DROP CONSTRAINT FK_performances_musician;
ALTER TABLE performances ADD CONSTRAINT FK_performances_musician  
FOREIGN KEY(conducted_by) REFERENCES musician(m_no) ON DELETE CASCADE;