--El dato mínimo para adicionar un musico es su nombre
ALTER TABLE musician MODIFY (m_name NOT NULL);

--La fecha de nacimiento debe ser menor de la fecha de muerte
ALTER TABLE musician
ADD CONSTRAINT CHK_musician_dates
CHECK (born IS NULL OR died IS NULL OR born < died);