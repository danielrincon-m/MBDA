--Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos
ALTER TABLE has_composed
DROP CONSTRAINT HAS_COMPOSED_CMPR_NO_FK;

ALTER TABLE has_composed
ADD CONSTRAINT FK_has_composed_cmpr_no
FOREIGN KEY (cmpr_no) REFERENCES musician(m_no);

ALTER TABLE concert
DROP CONSTRAINT CONCERT_CONCERT_ORGNISER_FK;

ALTER TABLE concert
ADD CONSTRAINT FK_concert_concert_orgniser
FOREIGN KEY (concert_orgniser) REFERENCES musician(m_no);