--El nombre debe tener minimo dos palabras: primer nombre y primer apellido
ALTER TABLE musician 
ADD CONSTRAINT CHK_musician_m_name 
CHECK (m_name LIKE '% %');


--El tipo de musica puede tomar los siguientes valores: jazz, classical, rock, blues o not known
ALTER TABLE performer
ADD CONSTRAINT CHK_performer_perf_type
CHECK (perf_type IN ('jazz', 'classical', 'rock', 'blues', 'not known'));

ALTER TABLE composer
ADD CONSTRAINT CHK_composer_comp_type
CHECK (comp_type IN ('jazz', 'classical', 'rock', 'blues', 'not known'));