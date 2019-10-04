--Crear la base de datos sin restricciones (Tablas)
CREATE TABLE band (
    band_no NUMBER(11),
    band_name VARCHAR2(20),
    band_home NUMBER(11) NOT NULL,
    band_type VARCHAR(10),
    b_date DATE,
    band_contact NUMBER(11) NOT NULL
);
CREATE TABLE composer (
    comp_no NUMBER(11),
    comp_is NUMBER(11) NOT NULL,
    comp_type VARCHAR2(10)
);
CREATE TABLE composition (
    c_no NUMBER(11),
    comp_date DATE,
    c_title VARCHAR2(40) NOT NULL,
    c_in NUMBER(11)
);
CREATE TABLE concert (
    concert_no NUMBER(11),
    concert_venue VARCHAR2(20),
    concert_in NUMBER(11) NOT NULL,
    con_date DATE,
    concert_orgniser NUMBER(11)
);
CREATE TABLE has_composed (
    cmpr_no NUMBER(11),
    cmpn_no NUMBER(11)
);
CREATE TABLE musician (
    m_no NUMBER(11),
    m_name VARCHAR2(20),
    born DATE,
    died DATE,
    born_in NUMBER(11),
    living_in NUMBER(11)
);
CREATE TABLE performance (
    pfrmnc_no NUMBER(11),
    gave NUMBER(11),
    performed NUMBER(11),
    conducted_by NUMBER(11),
    performed_in NUMBER(11)
);
CREATE TABLE performer (
    perf_no NUMBER(11),
    perf_is NUMBER(11),
    instrument VARCHAR2(10) NOT NULL,
    perf_type VARCHAR2(10)
);
CREATE TABLE place (
    place_no NUMBER(11),
    place_town VARCHAR2(20),
    place_country VARCHAR2(20)
);
CREATE TABLE plays_in (
    player NUMBER(11),
    band_id NUMBER(11)
);
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------
--Adicionar las restricciones a la base de datos  (Atributos, Primarias, unicas, Foraneas)
--PRIMARY KEYS
ALTER TABLE place 
ADD CONSTRAINT PLACE_PK 
PRIMARY KEY(place_no);

ALTER TABLE musician 
ADD CONSTRAINT MUSICIAN_PK 
PRIMARY KEY(m_no);

ALTER TABLE performer 
ADD CONSTRAINT PERFORMER_PK 
PRIMARY KEY(perf_no);

ALTER TABLE composer 
ADD CONSTRAINT COMPOSER_PK 
PRIMARY KEY(comp_no);

ALTER TABLE band 
ADD CONSTRAINT BAND_PK 
PRIMARY KEY(band_no);

ALTER TABLE concert 
ADD CONSTRAINT CONCERT_PK 
PRIMARY KEY(concert_no);

ALTER TABLE composition 
ADD CONSTRAINT COMPOSITION_PK 
PRIMARY KEY(c_no);

ALTER TABLE plays_in 
ADD CONSTRAINT PLAYS_IN_PK 
PRIMARY KEY(player, band_id);

ALTER TABLE has_composed 
ADD CONSTRAINT HAS_COMPOSED_PK 
PRIMARY KEY(cmpr_no, cmpn_no);

ALTER TABLE performance 
ADD CONSTRAINT PERFORMANCE_PK 
PRIMARY KEY(pfrmnc_no);


--UNIQUE KEYS
ALTER TABLE band 
ADD CONSTRAINT BAND_BAND_NAME_UK 
UNIQUE(band_name);


--FOREIGN KEYS
ALTER TABLE musician ADD (
    CONSTRAINT MUSICIAN_BORN_IN_FK 
    FOREIGN KEY(born_in) REFERENCES place(place_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT MUSICIAN_LIVING_IN_FK 
    FOREIGN KEY(living_in) REFERENCES place(place_no) 
    ON DELETE CASCADE
);

ALTER TABLE performer 
ADD CONSTRAINT PERFORMER_PERF_IS_FK 
FOREIGN KEY(perf_is) REFERENCES musician(m_no) 
ON DELETE CASCADE;
    
ALTER TABLE composer 
ADD CONSTRAINT COMPOSER_COMP_IS_FK 
FOREIGN KEY(comp_is) REFERENCES musician(m_no) 
ON DELETE CASCADE;

ALTER TABLE band ADD (
    CONSTRAINT BAND_BAND_HOME_FK 
    FOREIGN KEY(band_home) REFERENCES place(place_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT BAND_BAND_CONTACT_FK 
    FOREIGN KEY(band_contact) REFERENCES musician(m_no) 
    ON DELETE CASCADE
);
ALTER TABLE concert ADD (
    CONSTRAINT CONCERT_CONCERT_IN_FK 
    FOREIGN KEY(concert_in) REFERENCES place(place_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT CONCERT_CONCERT_ORGNISER_FK 
    FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no) 
    ON DELETE CASCADE
);

ALTER TABLE composition 
ADD CONSTRAINT COMPOSITION_C_IN_FK 
FOREIGN KEY(c_in) REFERENCES place(place_no) 
ON DELETE CASCADE;

ALTER TABLE plays_in ADD (
    CONSTRAINT PLAYS_IN_PLAYER_FK 
    FOREIGN KEY(player) REFERENCES performer(perf_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT PLAYS_IN_BAND_ID_FK 
    FOREIGN KEY(band_id) REFERENCES band(band_no) 
    ON DELETE CASCADE
);
ALTER TABLE has_composed ADD (
    CONSTRAINT HAS_COMPOSED_CMPR_NO_FK 
    FOREIGN KEY(cmpr_no) REFERENCES composer(comp_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT HAS_COMPOSED_CMPN_NO_FK 
    FOREIGN KEY(cmpn_no) REFERENCES composition(c_no) 
    ON DELETE CASCADE
);
ALTER TABLE performance ADD (
    CONSTRAINT PERFORMANCE_GAVE_FK 
    FOREIGN KEY(gave) REFERENCES band(band_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT PERFORMANCE_PERFORMED_FK 
    FOREIGN KEY(performed) REFERENCES composition(c_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT PERFORMANCE_CONDUCTED_BY_FK 
    FOREIGN KEY(conducted_by) REFERENCES musician(m_no) 
    ON DELETE CASCADE,
    
    CONSTRAINT PERFORMANCE_PERFORMED_IN_FK 
    FOREIGN KEY(performed_in) REFERENCES concert(concert_no) 
    ON DELETE CASCADE
);
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------
--Poblar la base de datos con los datos iniciales (PoblandoOK)
--table place
INSERT INTO place (place_no,place_town,place_country) VALUES ('1','Manchester','England');
INSERT INTO place (place_no,place_town,place_country) VALUES ('2','Edinburgh','Scotland');
INSERT INTO place (place_no,place_town,place_country) VALUES ('3','Salzburg','Austria');
INSERT INTO place (place_no,place_town,place_country) VALUES ('4','New York','USA');
INSERT INTO place (place_no,place_town,place_country) VALUES ('5','Birmingham','England');
INSERT INTO place (place_no,place_town,place_country) VALUES ('6','Glasgow','Scotland');
INSERT INTO place (place_no,place_town,place_country) VALUES ('7','London','England');
INSERT INTO place (place_no,place_town,place_country) VALUES ('8','Chicago','USA');
INSERT INTO place (place_no,place_town,place_country) VALUES ('9','Amsterdam','Netherlands');

--table musician
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('1','Fred Bloggs','2/01/1948','','1','2');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('2','John Smith','3/03/1950','','3','4');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('3','Helen Smyth','8/08/1948','','4','5');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('4','Harriet Smithson','9/05/1909','20/09/1980','5','6');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('5','James First','10/06/1965','','7','7');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('6','Theo Mengel','12/08/1948','','7','1');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('7','Sue Little','21/02/1945','','8','9');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('8','Harry Forte','28/02/1951','','1','8');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('9','Phil Hot','30/06/1942','','2','7');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('10','Jeff Dawn','12/12/1945','','3','6');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('11','Rose Spring','25/05/1948','','4','5');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('12','Davis Heavan','3/10/1975','','5','4');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('13','Lovely Time','28/12/1948','','6','3');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('14','Alan Fluff','15/01/1935','15/05/1997','7','2');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('15','Tony Smythe','2/04/1932','','8','1');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('16','James Quick','8/08/1924','','9','2');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('17','Freda Miles','4/07/1920','','9','3');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('18','Elsie James','6/05/1947','','8','5');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('19','Andy Jones','8/10/1958','','7','6');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('20','Louise Simpson','10/01/1948','11/02/1998','6','6');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('21','James Steeple','10/01/1947','','5','6');
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('22','Steven Chaytors','','','','');

--table performer
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('1','2','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('2','4','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('3','6','banjo','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('4','8','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('5','12','guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('6','14','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('7','16','trumpet','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('8','18','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('9','20','bass','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('10','2','flute','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('11','20','cornet','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('12','6','violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('13','8','drums','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('14','10','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('15','12','cello','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('16','14','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('17','16','flute','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('18','18','guitar','not known');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('19','20','trombone','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('20','3','horn','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('21','5','violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('22','7','cello','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('23','2','bass','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('24','4','violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('25','6','drums','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('26','8','clarinet','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('27','10','bass','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('28','12','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('29','18','cello','classical');

--table composer
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('1','1','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('2','3','classical');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('3','5','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('4','7','classical');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('5','9','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('6','11','rock');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('7','13','classical');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('8','15','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('9','17','classical');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('10','19','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('11','10','rock');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('12','8','jazz');

--table band
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('1','ROP','5','classical','1/01/1930','11');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('2','AASO','6','classical','','10');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('3','The J Bs','8','jazz','','12');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('4','BBSO','9','classical','','21');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('5','The left Overs','2','jazz','','8');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('6','Somebody Loves this','1','jazz','','6');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('7','Oh well','4','classical','','3');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('8','Swinging strings','4','classical','','7');
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('9','The Rest','9','jazz','','16');

--table concert
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('1','Bridgewater Hall','1','6/01/1995','21');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('2','Bridgewater Hall','1','8/05/1996','3');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('3','Usher Hall','2','3/06/1995','3');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('4','Assembly Rooms','2','20/09/1997','21');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('5','Festspiel Haus','3','21/02/1995','8');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('6','Royal Albert Hall','7','12/04/1993','8');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('7','Concertgebouw','9','14/05/1993','8');
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('8','Metropolitan','4','15/06/1997','21');

--table composition
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('1','17/06/1975','Opus 1','1');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('2','21/07/1976','Here Goes','2');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('3','14/12/1981','Valiant Knight','3');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('4','12/01/1982','Little Piece','4');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('5','13/03/1985','Simple Song','5');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('6','14/04/1986','Little Swing Song','6');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('7','13/05/1987','Fast Journey','7');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('8','14/02/1976','Simple Love Song','8');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('9','21/01/1982','Complex Rythms','9');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('10','23/02/1985','Drumming Rythms','9');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('11','18/03/1978','Fast Drumming','8');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('12','13/08/1984','Slow Song','7');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('13','14/09/1968','Blue Roses','6');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('14','15/11/1983','Velvet Rain','5');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('15','16/05/1982','Cold Wind','4');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('16','18/06/1983','After the Wind Blows','3');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('17','','A Simple Piece','2');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('18','12/01/1985','Long Rythms','1');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('19','12/02/1988','Eastern Wind','1');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('20','','Slow Symphony Blowing','2');
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('21','12/07/1990','A Last Song','6');

--table plays_in
INSERT INTO plays_in (player,band_id) VALUES ('1','1');
INSERT INTO plays_in (player,band_id) VALUES ('1','7');
INSERT INTO plays_in (player,band_id) VALUES ('3','1');
INSERT INTO plays_in (player,band_id) VALUES ('4','1');
INSERT INTO plays_in (player,band_id) VALUES ('4','7');
INSERT INTO plays_in (player,band_id) VALUES ('5','1');
INSERT INTO plays_in (player,band_id) VALUES ('6','1');
INSERT INTO plays_in (player,band_id) VALUES ('6','7');
INSERT INTO plays_in (player,band_id) VALUES ('7','1');
INSERT INTO plays_in (player,band_id) VALUES ('8','1');
INSERT INTO plays_in (player,band_id) VALUES ('8','7');
INSERT INTO plays_in (player,band_id) VALUES ('10','2');
INSERT INTO plays_in (player,band_id) VALUES ('12','2');
INSERT INTO plays_in (player,band_id) VALUES ('13','2');
INSERT INTO plays_in (player,band_id) VALUES ('14','2');
INSERT INTO plays_in (player,band_id) VALUES ('14','8');
INSERT INTO plays_in (player,band_id) VALUES ('15','2');
INSERT INTO plays_in (player,band_id) VALUES ('15','8');
INSERT INTO plays_in (player,band_id) VALUES ('17','2');
INSERT INTO plays_in (player,band_id) VALUES ('18','2');
INSERT INTO plays_in (player,band_id) VALUES ('19','3');
INSERT INTO plays_in (player,band_id) VALUES ('20','3');
INSERT INTO plays_in (player,band_id) VALUES ('21','4');
INSERT INTO plays_in (player,band_id) VALUES ('22','4');
INSERT INTO plays_in (player,band_id) VALUES ('23','4');
INSERT INTO plays_in (player,band_id) VALUES ('25','5');
INSERT INTO plays_in (player,band_id) VALUES ('26','6');
INSERT INTO plays_in (player,band_id) VALUES ('27','6');
INSERT INTO plays_in (player,band_id) VALUES ('28','7');
INSERT INTO plays_in (player,band_id) VALUES ('28','8');
INSERT INTO plays_in (player,band_id) VALUES ('29','7');

--table has_composed
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('1','1');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('1','8');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('2','11');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('3','2');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('3','13');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('3','14');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('3','18');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('4','12');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('4','20');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('5','3');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('5','13');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('5','14');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('6','15');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('6','21');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('7','4');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('7','9');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('8','16');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('9','5');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('9','10');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('10','17');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('11','6');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('12','7');
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('12','19');

--table performance
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('1','1','1','21','1');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('2','1','3','21','1');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('3','1','5','21','1');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('4','1','2','1','2');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('5','2','4','21','2');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('6','2','6','21','2');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('7','4','19','9','3');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('8','4','20','10','3');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('9','5','12','10','4');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('10','5','13','11','4');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('11','3','5','13','5');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('12','3','6','13','5');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('13','3','7','13','5');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('14','6','20','14','6');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('15','8','12','15','7');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('16','9','16','21','8');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('17','9','17','21','8');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('18','9','18','21','8');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('19','9','19','21','8');
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('20','4','12','10','3');
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Despoblar la base de datos (XPoblar)
DELETE FROM performance;
DELETE FROM has_composed;
DELETE FROM plays_in;
DELETE FROM composition;
DELETE FROM concert;
DELETE FROM band;
DELETE FROM composer;
DELETE FROM performer;
DELETE FROM musician;
DELETE FROM place;
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Eliminar toda la información de la base de datos (XTablas)
DROP TABLE performance PURGE;
DROP TABLE has_composed PURGE;
DROP TABLE plays_in PURGE;
DROP TABLE composition PURGE;
DROP TABLE concert PURGE;
DROP TABLE band PURGE;
DROP TABLE composer PURGE;
DROP TABLE performer PURGE;
DROP TABLE musician PURGE;
DROP TABLE place PURGE;
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------
/*
--Probar las restricciones con los casos definidos en NoOK (PoblandoNoOK)

--table place
INSERT INTO place (place_no,place_town,place_country) VALUES ('','Manchester','England');
--table musician
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('1','Fred Bloggs','2/01/1948','','100','200');
--table performer
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('100','200','violin','classical');
--table composer
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('1','1500','jazz');
--table band
INSERT INTO band (band_no,band_name,band_home,band_type,b_date,band_contact) VALUES ('1','ROP','500','classical','1/01/1930','11');
--table concert
INSERT INTO concert (concert_no,concert_venue,concert_in,con_date,concert_orgniser) VALUES ('','Bridgewater Hall','1','6/01/1995','21');
--table composition
INSERT INTO composition (c_no,comp_date,c_title,c_in) VALUES ('1','17/06/1975','Opus 1','150');
--table plays_in
INSERT INTO plays_in (player,band_id) VALUES ('1','1200');
--table has_composed
INSERT INTO has_composed (cmpr_no,cmpn_no) VALUES ('1250','1');
--table performance
INSERT INTO performance (pfrmnc_no,gave,performed,conducted_by,performed_in) VALUES ('1','1500','1','21','1');



--Probar cada una de las consultas (Consultas) 

--Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997.
SELECT m_name
FROM musician, concert
WHERE concert_venue = 'Assembly Rooms' AND 
               concert_orgniser = m_no;
--Find all the performers who played guitar or violin and were born in England.
SELECT DISTINCT m_name
FROM place, performer, musician
WHERE m_no = perf_is AND 
               born_in = place_no AND 
               place_country = 'England'AND 
               (instrument = 'guitar' OR instrument = 'violin');
--List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts.
SELECT m_name, place_town, con_date
FROM concert, place, musician
WHERE concert_in = place_no AND 
               place_country = 'USA' AND 
               concert_orgniser = m_no;
--How many concerts have featured at least one composition by Andy Jones? List concert date, venue and the composition's title.
SELECT con_date, concert_venue, c_title
FROM performance, composition, has_composed, composer, musician, concert
WHERE m_name = 'Andy Jones' AND 
      m_no = comp_is AND 
      comp_no = cmpr_no AND 
      cmpn_no = c_no AND 
      c_no = performed AND 
      performed_in = concert_no;
--list the different instruments played by the musicians and avg number of musicians who play the instrument.
SELECT con_date, concert_venue, c_title
FROM performance,composition, has_composed, composer, musician, concert
WHERE 
    m_name = 'Andy Jones' AND 
    m_no = comp_is AND 
    comp_no = cmpr_no AND 
    cmpn_no = c_no AND 
    c_no = performed AND 
    performed_in = concert_no;
--List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays.
SELECT m_name
FROM musician, performer
WHERE perf_is = m_no AND 
      died IS NULL AND 
      instrument IN (SELECT instrument 
                     FROM musician, performer 
                     WHERE perf_is = m_no AND 
                     m_name = 'Theo Mengel');
--List the name and the number of players for the band whose number of players is greater than the average number of players in each band.
SELECT band_name, COUNT(band_id) AS n_players
FROM band, plays_in
WHERE band_no = band_id
GROUP BY band_name
HAVING COUNT(band_id) > (SELECT AVG(n)
                         FROM (SELECT COUNT(band_id) as n
                         FROM plays_in
                         GROUP BY band_id));
--List the names of musicians who both conduct and compose and live in Britain.
SELECT m_name
FROM musician
WHERE m_no IN (SELECT m_no
               FROM concert, musician, place
               WHERE place_country = 'England' AND 
                     concert_in = place_no AND
                     m_no = concert_orgniser)
     AND m_no IN (SELECT m_no
                  FROM musician, composer, has_composed, composition, place
                  WHERE place_country = 'England' AND 
                        place_no = c_in AND
                        c_no = cmpn_no AND 
                        cmpr_no = comp_no AND 
                        comp_is = m_no)
     AND m_no IN (SELECT m_no
                  FROM musician, place
                  WHERE place_country = 'England' AND 
                        place_no = living_in);
--Show the least commonly played instrument and the number of musicians who play it.
SELECT inst, interpreters
FROM (SELECT instrument AS inst, COUNT(instrument) AS interpreters
      FROM performer
      GROUP BY instrument
      HAVING COUNT(instrument) = (SELECT MIN(c)
                                  FROM (SELECT COUNT(instrument) AS c
                                  FROM performer
                                  GROUP BY instrument) tcount)) minInst;
--List the bands that have played music composed by Sue Little; Give the titles of the composition in each case.
SELECT band_name, c_title
FROM band, performance, composition, has_composed, composer, musician
WHERE m_name = 'Sue Little' AND m_no = comp_is AND 
               comp_no = cmpr_no AND cmpn_no = c_no AND 
                c_no = performed AND gave = band_no;
--List the name and town of birth of any performer born in the same city as James First. 
SELECT DISTINCT m_name, place_town
FROM performer, musician, place
WHERE perf_is = m_no AND
               born_in = place_no AND
               place_town = (SELECT place_town
                             FROM musician, place
                             WHERE place_no = born_in AND 
                                   m_name = 'James First');
--Give the band name, conductor and contact of the bands performing at the most recent concert in the Royal Albert Hall.
SELECT band_name, conductor, contact
FROM (SELECT concert_no, band_name, con_date
              FROM concert, performance, band
              WHERE concert_venue = 'Royal Albert Hall' AND
                             concert_no = performed_in AND
                             gave = band_no) a 
JOIN
            (SELECT concert_no, m_name AS conductor, con_date
             FROM musician, concert
             WHERE concert_venue = 'Royal Albert Hall' AND
                           concert_orgniser = m_no) b 
ON (a.concert_no = b.concert_no AND 
        a.con_date = b.con_date AND
        b.con_date = (SELECT MAX(con_date) 
                                  FROM concert
                                  WHERE concert_venue = 'Royal Albert Hall')) 
JOIN
             (SELECT concert_no, m_name AS contact, con_date
              FROM musician, band, concert, performance
              WHERE concert_venue = 'Royal Albert Hall' AND
                             concert_no = performed_in AND
                             gave = band_no AND
                             band_contact = m_no) c 
ON (b.concert_no = c.concert_no AND 
        b.con_date = c.con_date AND
        c.con_date = (SELECT MAX(con_date) 
                                  FROM concert
                                  WHERE concert_venue = 'Royal Albert Hall'));
--Jeff Dawn plays in a band with someone who plays in a band with Sue Little. Who is it and what are the bands?
SELECT name, band_1, band_2
FROM (SELECT m_name AS name, band_name AS band_1
      FROM musician, performer, plays_in, band
      WHERE m_no = perf_is AND
            perf_no = player AND
            band_id = band_no AND
            band_id IN (SELECT band_id
                        FROM musician, performer, plays_in
                        WHERE m_name = 'Jeff Dawn' AND
                              m_no = perf_is AND
                              perf_no = player)) a
JOIN
           (SELECT m_name, band_name AS band_2
            FROM musician, performer, plays_in, band
            WHERE m_no = perf_is AND
                  perf_no = player AND
                  band_id = band_no AND
                  band_id IN (SELECT band_id
                              FROM musician, performer, plays_in
                              WHERE m_name = 'Sue Little' AND
                                    m_no = perf_is AND
                                    perf_no = player)) b
ON (a.name = b.m_name);
*/