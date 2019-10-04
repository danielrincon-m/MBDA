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