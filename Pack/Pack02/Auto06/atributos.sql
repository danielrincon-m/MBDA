/*Adicionando restricciones declarativas.*/
ALTER TABLE musician ADD CONSTRAINT CK_musician_born_died CHECK (died > born);
ALTER TABLE composer ADD CONSTRAINT CK_composer_comp_type CHECK (comp_type IN ('jazz', 'classical', 'rock', 'blues','not known'));
/*la base de datos ya tiene datos que dañan la integridad para perf_is*/
/*ALTER TABLE performer ADD CONSTRAINT UK_perf_is UNIQUE(perf_is);*/