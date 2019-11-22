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
    living_in NUMBER(11),
	detail XMLTYPE
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
INSERT INTO musician VALUES ('1','Fred Bloggs',TO_DATE('02/01/1948', 'DD/MM/YYYY'),'','1','2',
'<Detalle>
	<Pagina url="https://storify.com" />
	<OtrosNombres>
		<Nombre nombre="ngodfree0" razon="Bamity"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Torphy-Torp" />
	</Sellos>
	<Discos>
		<Disco nombre="Ragwort" anho="2005"/>
	</Discos>
	<Premios>
		<Premio nombre="disintermediate" anho="1990"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Institute of Technology and Management" anhoInicio="1992" anhoFin="2002" titulo="Analyst Programmer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Nanny Godfree" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('2','John Smith',TO_DATE('03/03/1950', 'DD/MM/YYYY'),'','3','4',
'<Detalle>
	<Pagina url="http://shinystat.com" />
	<OtrosNombres>
		<Nombre nombre="gschuler1" razon="Bitchip"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="King-Mosciski" />
	</Sellos>
	<Discos>
		<Disco nombre="Purple Sweetroot" anho="2006"/>
	</Discos>
	<Premios>
		<Premio nombre="4th generation" anho="2010"/>
	</Premios>
	<Universidades>
		<Universidad nombre="China Medical University Shenyang" anhoInicio="1990" anhoFin="2004" titulo="Senior Cost Accountant"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Gib Schuler" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('3','Helen Smyth',TO_DATE('08/08/1948', 'DD/MM/YYYY'),'','4','5',
'<Detalle>
	<Pagina url="https://vimeo.com" />
	<OtrosNombres>
		<Nombre nombre="vkeasy2" razon="Ventosanzap"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Williamson, Willms and Wyman" />
	</Sellos>
	<Discos>
		<Disco nombre="White Panicle Aster" anho="1993"/>
	</Discos>
	<Premios>
		<Premio nombre="User-centric" anho="1997"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Insituto Universitario - Centro Latinoamericano de Economia Humana - IU Claeh" anhoInicio="1995" anhoFin="1998" titulo="Recruiting Manager"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Vern Keasy" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('4','Harriet Smithson',TO_DATE('09/05/1909', 'DD/MM/YYYY'),TO_DATE('20/09/1980', 'DD/MM/YYYY'),'5','6',
'<Detalle>
	<Pagina url="https://cloudflare.com" />
	<OtrosNombres>
		<Nombre nombre="jwoodyatt3" razon="Vagram"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Gerlach LLC" />
	</Sellos>
	<Discos>
		<Disco nombre="Navel Lichen" anho="1992"/>
	</Discos>
	<Premios>
		<Premio nombre="Mandatory" anho="1997"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Singidunum University" anhoInicio="1994" anhoFin="2000" titulo="Nurse"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Julieta Woodyatt" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('5','James First',TO_DATE('10/06/1965', 'DD/MM/YYYY'),'','7','7',
'<Detalle>
	<Pagina url="https://prweb.com" />
	<OtrosNombres>
		<Nombre nombre="rdate4" razon="Toughjoyfax"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Predovic Group" />
	</Sellos>
	<Discos>
		<Disco nombre="Marie Galante Cotton" anho="1958"/>
	</Discos>
	<Premios>
		<Premio nombre="Graphic Interface" anho="1992"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Universidad Central" anhoInicio="1994" anhoFin="2001" titulo="Systems Administrator IV"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Ronni Date" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('6','Theo Mengel',TO_DATE('12/08/1948', 'DD/MM/YYYY'),'','7','1',
'<Detalle>
	<Pagina url="http://over-blog.com" />
	<OtrosNombres>
		<Nombre nombre="agodthaab5" razon="Bytecard"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Conroy-Wiza" />
	</Sellos>
	<Discos>
		<Disco nombre="Beet" anho="2013"/>
	</Discos>
	<Premios>
		<Premio nombre="orchestration" anho="2000"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Aimst University" anhoInicio="1990" anhoFin="2002" titulo="Human Resources Assistant I"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Aluin Godthaab" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('7','Sue Little',TO_DATE('21/02/1945', 'DD/MM/YYYY'),'','8','9',
'<Detalle>
	<Pagina url="https://linkedin.com" />
	<OtrosNombres>
		<Nombre nombre="kemslie6" razon="Gembucket"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Boyle and Sons" />
	</Sellos>
	<Discos>
		<Disco nombre="Puerto Rico Prairie Clover" anho="2004"/>
	</Discos>
	<Premios>
		<Premio nombre="Re-engineered" anho="1999"/>
	</Premios>
	<Universidades>
		<Universidad nombre="UniversitÃ© de Versailles Saint-Quentin-en-Yvelines" anhoInicio="1994" anhoFin="2000" titulo="Web Designer II"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Kizzee Emslie" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('8','Harry Forte',TO_DATE('28/02/1951', 'DD/MM/YYYY'),'','1','8',
'<Detalle>
	<Pagina url="https://i2i.jp" />
	<OtrosNombres>
		<Nombre nombre="sswate7" razon="Fix San"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Goldner, Cronin and Altenwerth" />
	</Sellos>
	<Discos>
		<Disco nombre="Climbing Dayflower" anho="2005"/>
	</Discos>
	<Premios>
		<Premio nombre="User-friendly" anho="1995"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Kalmyk State University" anhoInicio="1990" anhoFin="2000" titulo="Office Assistant II"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Skipp Swate" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('9','Phil Hot',TO_DATE('30/06/1942', 'DD/MM/YYYY'),'','2','7',
'<Detalle>
	<Pagina url="http://yellowpages.com" />
	<OtrosNombres>
		<Nombre nombre="pschriren8" razon="Tempsoft"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Daniel-Spencer" />
	</Sellos>
	<Discos>
		<Disco nombre="Chalk Dudleya" anho="2009"/>
	</Discos>
	<Premios>
		<Premio nombre="Robust" anho="2006"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Ferdowsi University of Mashhad" anhoInicio="1990" anhoFin="2002" titulo="Junior Executive"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Pattie Schriren" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('10','Jeff Dawn',TO_DATE('12/12/1945', 'DD/MM/YYYY'),'','3','6',
'<Detalle>
	<Pagina url="http://hao123.com" />
	<OtrosNombres>
		<Nombre nombre="wmackellar9" razon="Bitwolf"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Rowe, Conroy and Langosh" />
	</Sellos>
	<Discos>
		<Disco nombre="Parrys Wild Petunia" anho="1985"/>
	</Discos>
	<Premios>
		<Premio nombre="non-volatile" anho="1994"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Karaganda State Buketov University" anhoInicio="1991" anhoFin="2002" titulo="Civil Engineer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Wendi MacKellar" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('11','Rose Spring',TO_DATE('25/05/1948', 'DD/MM/YYYY'),'','4','5',
'<Detalle>
	<Pagina url="http://seattletimes.com" />
	<OtrosNombres>
		<Nombre nombre="adomsallaa" razon="Duobam"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Crooks-Bartell" />
	</Sellos>
	<Discos>
		<Disco nombre="Vateria" anho="1996"/>
	</Discos>
	<Premios>
		<Premio nombre="motivating" anho="1992"/>
	</Premios>
	<Universidades>
		<Universidad nombre="United States Naval Academy" anhoInicio="1992" anhoFin="2001" titulo="Administrative Officer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Annamarie Domsalla" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('12','Davis Heavan',TO_DATE('03/10/1975', 'DD/MM/YYYY'),'','5','4',
'<Detalle>
	<Pagina url="https://gnu.org" />
	<OtrosNombres>
		<Nombre nombre="cmcgeffenb" razon="Daltfresh"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="McKenzie, Kutch and Stanton" />
	</Sellos>
	<Discos>
		<Disco nombre="Bigleaf Lupine" anho="2002"/>
	</Discos>
	<Premios>
		<Premio nombre="executive" anho="2012"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Kigali Health Institute" anhoInicio="1994" anhoFin="2000" titulo="Pharmacist"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Corty McGeffen" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('13','Lovely Time',TO_DATE('28/12/1948', 'DD/MM/YYYY'),'','6','3',
'<Detalle>
	<Pagina url="http://cnbc.com" />
	<OtrosNombres>
		<Nombre nombre="tfeatherstonhalghc" razon="Hatity"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Reichert-Kunze" />
	</Sellos>
	<Discos>
		<Disco nombre="Pseudocrossidium Moss" anho="1994"/>
	</Discos>
	<Premios>
		<Premio nombre="frame" anho="1995"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Griffith College" anhoInicio="1995" anhoFin="1998" titulo="Dental Hygienist"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Teddy Featherstonhalgh" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('14','Alan Fluff',TO_DATE('15/01/1935', 'DD/MM/YYYY'),TO_DATE('15/05/1997', 'DD/MM/YYYY'),'7','2',
'<Detalle>
	<Pagina url="https://telegraph.co.uk" />
	<OtrosNombres>
		<Nombre nombre="flenchenkod" razon="Namfix"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Russel-Kuvalis" />
	</Sellos>
	<Discos>
		<Disco nombre="Prairie Dogshade" anho="2004"/>
	</Discos>
	<Premios>
		<Premio nombre="approach" anho="2004"/>
	</Premios>
	<Universidades>
		<Universidad nombre="West Coast University" anhoInicio="1994" anhoFin="2002" titulo="Technical Writer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Fedora Lenchenko" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('15','Tony Smythe',TO_DATE('02/04/1932', 'DD/MM/YYYY'),'','8','1',
'<Detalle>
	<Pagina url="https://histats.com" />
	<OtrosNombres>
		<Nombre nombre="flissendene" razon="Bamity"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Stroman LLC" />
	</Sellos>
	<Discos>
		<Disco nombre="Oakleaf Fleabane" anho="2007"/>
	</Discos>
	<Premios>
		<Premio nombre="implementation" anho="2012"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Universidad Militar Nueva Granada" anhoInicio="1991" anhoFin="1999" titulo="Structural Analysis Engineer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Faina Lissenden" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('16','James Quick',TO_DATE('08/08/1924', 'DD/MM/YYYY'),'','9','2',
'<Detalle>
	<Pagina url="https://vistaprint.com" />
	<OtrosNombres>
		<Nombre nombre="dsustono" razon="Lotlux"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Bechtelar, OReilly and Mosciski" />
	</Sellos>
	<Discos>
		<Disco nombre="Hairy Four Oclock" anho="2006"/>
	</Discos>
	<Premios>
		<Premio nombre="Upgradable" anho="1996"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Water Resources University" anhoInicio="1990" anhoFin="1998" titulo="Clinical Specialist"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Dorian Suston" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('17','Freda Miles',TO_DATE('04/07/1920', 'DD/MM/YYYY'),'','9','3',
'<Detalle>
	<Pagina url="http://mapquest.com" />
	<OtrosNombres>
		<Nombre nombre="gstainn" razon="Y-find"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Bashirian LLC" />
	</Sellos>
	<Discos>
		<Disco nombre="Johanns Locoweed" anho="1993"/>
	</Discos>
	<Premios>
		<Premio nombre="Polarised" anho="2002"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Shenyang Pharmaceutical University" anhoInicio="1992" anhoFin="1998" titulo="Administrative Officer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Gwyneth Stain" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('18','Elsie James',TO_DATE('06/05/1947', 'DD/MM/YYYY'),'','8','5',
'<Detalle>
	<Pagina url="https://aol.com" />
	<OtrosNombres>
		<Nombre nombre="jortellm" razon="Lotstring"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Kling-Volkman" />
	</Sellos>
	<Discos>
		<Disco nombre="James Beardtongue" anho="1996"/>
	</Discos>
	<Premios>
		<Premio nombre="motivating" anho="1994"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Louisiana State University at Eunice" anhoInicio="1990" anhoFin="2003" titulo="Junior Executive"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Janos Ortell" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('19','Andy Jones',TO_DATE('08/10/1958', 'DD/MM/YYYY'),'','7','6',
'<Detalle>
	<Pagina url="https://1688.com" />
	<OtrosNombres>
		<Nombre nombre="jtomlettl" razon="Mat Lam Tam"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Schuppe-Hackett" />
	</Sellos>
	<Discos>
		<Disco nombre="Anthracothecium Lichen" anho="2011"/>
	</Discos>
	<Premios>
		<Premio nombre="Robust" anho="2002"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Universidade Santa CecÃ­lia dos Bandeirantes" anhoInicio="1990" anhoFin="2005" titulo="Sales Representative"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Jerrie Tomlett" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('20','Louise Simpson',TO_DATE('10/01/1948', 'DD/MM/YYYY'),TO_DATE('11/02/1998', 'DD/MM/YYYY'),'6','6',
'<Detalle>
	<Pagina url="http://wikispaces.com" />
	<OtrosNombres>
		<Nombre nombre="ssperringk" razon="Stim"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Hackett Inc" />
	</Sellos>
	<Discos>
		<Disco nombre="Calymperes Moss" anho="2000"/>
	</Discos>
	<Premios>
		<Premio nombre="fault-tolerant" anho="2000"/>
	</Premios>
	<Universidades>
		<Universidad nombre="East-West University" anhoInicio="1990" anhoFin="1999" titulo="Internal Auditor"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Sigismondo Sperring" sexo="Masculino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('21','James Steeple',TO_DATE('10/01/1947', 'DD/MM/YYYY'),'','5','6',
'<Detalle>
	<Pagina url="http://census.gov" />
	<OtrosNombres>
		<Nombre nombre="sheadrickj" razon="Prodder"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Collins-Doyle" />
	</Sellos>
	<Discos>
		<Disco nombre="Hairy Schiedea" anho="1989"/>
	</Discos>
	<Premios>
		<Premio nombre="Focused" anho="2005"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Surgut State University" anhoInicio="1992" anhoFin="1999" titulo="Chemical Engineer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Sophi Headrick" sexo="Femenino"/>
	</Hijos>
</Detalle>');
INSERT INTO musician VALUES ('22','Steven Chaytors','','','','',
'<Detalle>
	<Pagina url="http://com.com" />
	<OtrosNombres>
		<Nombre nombre="eferyi" razon="Sonsing"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Jakubowski Inc" />
	</Sellos>
	<Discos>
		<Disco nombre="Tetracarpidium" anho="2004"/>
	</Discos>
	<Premios>
		<Premio nombre="Up-sized" anho="1994"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Naval Postgraduate School" anhoInicio="1994" anhoFin="2005" titulo="Analyst Programmer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Elinor Fery" sexo="Femenino"/>
	</Hijos>
</Detalle>');

--table performer
INSERT INTO performer VALUES ('1','2','violin','classical');
INSERT INTO performer VALUES ('2','4','viola','classical');
INSERT INTO performer VALUES ('3','6','banjo','jazz');
INSERT INTO performer VALUES ('4','8','violin','classical');
INSERT INTO performer VALUES ('5','12','guitar','jazz');
INSERT INTO performer VALUES ('6','14','violin','classical');
INSERT INTO performer VALUES ('7','16','trumpet','jazz');
INSERT INTO performer VALUES ('8','18','viola','classical');
INSERT INTO performer VALUES ('9','20','bass','jazz');
INSERT INTO performer VALUES ('10','2','flute','jazz');
INSERT INTO performer VALUES ('11','20','cornet','jazz');
INSERT INTO performer VALUES ('12','6','violin','jazz');
INSERT INTO performer VALUES ('13','8','drums','jazz');
INSERT INTO performer VALUES ('14','10','violin','classical');
INSERT INTO performer VALUES ('15','12','cello','classical');
INSERT INTO performer VALUES ('16','14','viola','classical');
INSERT INTO performer VALUES ('17','16','flute','jazz');
INSERT INTO performer VALUES ('18','18','guitar','not known');
INSERT INTO performer VALUES ('19','20','trombone','jazz');
INSERT INTO performer VALUES ('20','3','horn','jazz');
INSERT INTO performer VALUES ('21','5','violin','jazz');
INSERT INTO performer VALUES ('22','7','cello','classical');
INSERT INTO performer VALUES ('23','2','bass','jazz');
INSERT INTO performer VALUES ('24','4','violin','jazz');
INSERT INTO performer VALUES ('25','6','drums','classical');
INSERT INTO performer VALUES ('26','8','clarinet','jazz');
INSERT INTO performer VALUES ('27','10','bass','jazz');
INSERT INTO performer VALUES ('28','12','viola','classical');
INSERT INTO performer VALUES ('29','18','cello','classical');

--table composer
INSERT INTO composer VALUES ('1','1','jazz');
INSERT INTO composer VALUES ('2','3','classical');
INSERT INTO composer VALUES ('3','5','jazz');
INSERT INTO composer VALUES ('4','7','classical');
INSERT INTO composer VALUES ('5','9','jazz');
INSERT INTO composer VALUES ('6','11','rock');
INSERT INTO composer VALUES ('7','13','classical');
INSERT INTO composer VALUES ('8','15','jazz');
INSERT INTO composer VALUES ('9','17','classical');
INSERT INTO composer VALUES ('10','19','jazz');
INSERT INTO composer VALUES ('11','10','rock');
INSERT INTO composer VALUES ('12','8','jazz');

--table band
INSERT INTO band VALUES ('1','ROP','5','classical',TO_DATE('01/01/1930', 'DD/MM/YYYY'),'11');
INSERT INTO band VALUES ('2','AASO','6','classical','','10');
INSERT INTO band VALUES ('3','The J Bs','8','jazz','','12');
INSERT INTO band VALUES ('4','BBSO','9','classical','','21');
INSERT INTO band VALUES ('5','The left Overs','2','jazz','','8');
INSERT INTO band VALUES ('6','Somebody Loves this','1','jazz','','6');
INSERT INTO band VALUES ('7','Oh well','4','classical','','3');
INSERT INTO band VALUES ('8','Swinging strings','4','classical','','7');
INSERT INTO band VALUES ('9','The Rest','9','jazz','','16');

--table concert
INSERT INTO concert VALUES ('1','Bridgewater Hall','1',TO_DATE('06/01/1995', 'DD/MM/YYYY'),'21');
INSERT INTO concert VALUES ('2','Bridgewater Hall','1',TO_DATE('08/05/1996', 'DD/MM/YYYY'),'3');
INSERT INTO concert VALUES ('3','Usher Hall','2',TO_DATE('03/06/1995', 'DD/MM/YYYY'),'3');
INSERT INTO concert VALUES ('4','Assembly Rooms','2',TO_DATE('20/09/1997', 'DD/MM/YYYY'),'21');
INSERT INTO concert VALUES ('5','Festspiel Haus','3',TO_DATE('21/02/1995', 'DD/MM/YYYY'),'8');
INSERT INTO concert VALUES ('6','Royal Albert Hall','7',TO_DATE('12/04/1993', 'DD/MM/YYYY'),'8');
INSERT INTO concert VALUES ('7','Concertgebouw','9',TO_DATE('14/05/1993', 'DD/MM/YYYY'),'8');
INSERT INTO concert VALUES ('8','Metropolitan','4',TO_DATE('15/06/1997', 'DD/MM/YYYY'),'21');

--table composition
INSERT INTO composition VALUES ('1',TO_DATE('17/06/1975', 'DD/MM/YYYY'),'Opus 1','1');
INSERT INTO composition VALUES ('2',TO_DATE('21/07/1976', 'DD/MM/YYYY'),'Here Goes','2');
INSERT INTO composition VALUES ('3',TO_DATE('14/12/1981', 'DD/MM/YYYY'),'Valiant Knight','3');
INSERT INTO composition VALUES ('4',TO_DATE('12/01/1982', 'DD/MM/YYYY'),'Little Piece','4');
INSERT INTO composition VALUES ('5',TO_DATE('13/03/1985', 'DD/MM/YYYY'),'Simple Song','5');
INSERT INTO composition VALUES ('6',TO_DATE('14/04/1986', 'DD/MM/YYYY'),'Little Swing Song','6');
INSERT INTO composition VALUES ('7',TO_DATE('13/05/1987', 'DD/MM/YYYY'),'Fast Journey','7');
INSERT INTO composition VALUES ('8',TO_DATE('14/02/1976', 'DD/MM/YYYY'),'Simple Love Song','8');
INSERT INTO composition VALUES ('9',TO_DATE('21/01/1982', 'DD/MM/YYYY'),'Complex Rythms','9');
INSERT INTO composition VALUES ('10',TO_DATE('23/02/1985', 'DD/MM/YYYY'),'Drumming Rythms','9');
INSERT INTO composition VALUES ('11',TO_DATE('18/03/1978', 'DD/MM/YYYY'),'Fast Drumming','8');
INSERT INTO composition VALUES ('12',TO_DATE('13/08/1984', 'DD/MM/YYYY'),'Slow Song','7');
INSERT INTO composition VALUES ('13',TO_DATE('14/09/1968', 'DD/MM/YYYY'),'Blue Roses','6');
INSERT INTO composition VALUES ('14',TO_DATE('15/11/1983', 'DD/MM/YYYY'),'Velvet Rain','5');
INSERT INTO composition VALUES ('15',TO_DATE('16/05/1982', 'DD/MM/YYYY'),'Cold Wind','4');
INSERT INTO composition VALUES ('16',TO_DATE('18/06/1983', 'DD/MM/YYYY'),'After the Wind Blows','3');
INSERT INTO composition VALUES ('17','','A Simple Piece','2');
INSERT INTO composition VALUES ('18',TO_DATE('12/01/1985', 'DD/MM/YYYY'),'Long Rythms','1');
INSERT INTO composition VALUES ('19',TO_DATE('12/02/1988', 'DD/MM/YYYY'),'Eastern Wind','1');
INSERT INTO composition VALUES ('20','','Slow Symphony Blowing','2');
INSERT INTO composition VALUES ('21',TO_DATE('12/07/1990', 'DD/MM/YYYY'),'A Last Song','6');

--table plays_in
INSERT INTO plays_in VALUES ('1','1');
INSERT INTO plays_in VALUES ('1','7');
INSERT INTO plays_in VALUES ('3','1');
INSERT INTO plays_in VALUES ('4','1');
INSERT INTO plays_in VALUES ('4','7');
INSERT INTO plays_in VALUES ('5','1');
INSERT INTO plays_in VALUES ('6','1');
INSERT INTO plays_in VALUES ('6','7');
INSERT INTO plays_in VALUES ('7','1');
INSERT INTO plays_in VALUES ('8','1');
INSERT INTO plays_in VALUES ('8','7');
INSERT INTO plays_in VALUES ('10','2');
INSERT INTO plays_in VALUES ('12','2');
INSERT INTO plays_in VALUES ('13','2');
INSERT INTO plays_in VALUES ('14','2');
INSERT INTO plays_in VALUES ('14','8');
INSERT INTO plays_in VALUES ('15','2');
INSERT INTO plays_in VALUES ('15','8');
INSERT INTO plays_in VALUES ('17','2');
INSERT INTO plays_in VALUES ('18','2');
INSERT INTO plays_in VALUES ('19','3');
INSERT INTO plays_in VALUES ('20','3');
INSERT INTO plays_in VALUES ('21','4');
INSERT INTO plays_in VALUES ('22','4');
INSERT INTO plays_in VALUES ('23','4');
INSERT INTO plays_in VALUES ('25','5');
INSERT INTO plays_in VALUES ('26','6');
INSERT INTO plays_in VALUES ('27','6');
INSERT INTO plays_in VALUES ('28','7');
INSERT INTO plays_in VALUES ('28','8');
INSERT INTO plays_in VALUES ('29','7');

--table has_composed
INSERT INTO has_composed VALUES ('1','1');
INSERT INTO has_composed VALUES ('1','8');
INSERT INTO has_composed VALUES ('2','11');
INSERT INTO has_composed VALUES ('3','2');
INSERT INTO has_composed VALUES ('3','13');
INSERT INTO has_composed VALUES ('3','14');
INSERT INTO has_composed VALUES ('3','18');
INSERT INTO has_composed VALUES ('4','12');
INSERT INTO has_composed VALUES ('4','20');
INSERT INTO has_composed VALUES ('5','3');
INSERT INTO has_composed VALUES ('5','13');
INSERT INTO has_composed VALUES ('5','14');
INSERT INTO has_composed VALUES ('6','15');
INSERT INTO has_composed VALUES ('6','21');
INSERT INTO has_composed VALUES ('7','4');
INSERT INTO has_composed VALUES ('7','9');
INSERT INTO has_composed VALUES ('8','16');
INSERT INTO has_composed VALUES ('9','5');
INSERT INTO has_composed VALUES ('9','10');
INSERT INTO has_composed VALUES ('10','17');
INSERT INTO has_composed VALUES ('11','6');
INSERT INTO has_composed VALUES ('12','7');
INSERT INTO has_composed VALUES ('12','19');

--table performance
INSERT INTO performance VALUES ('1','1','1','21','1');
INSERT INTO performance VALUES ('2','1','3','21','1');
INSERT INTO performance VALUES ('3','1','5','21','1');
INSERT INTO performance VALUES ('4','1','2','1','2');
INSERT INTO performance VALUES ('5','2','4','21','2');
INSERT INTO performance VALUES ('6','2','6','21','2');
INSERT INTO performance VALUES ('7','4','19','9','3');
INSERT INTO performance VALUES ('8','4','20','10','3');
INSERT INTO performance VALUES ('9','5','12','10','4');
INSERT INTO performance VALUES ('10','5','13','11','4');
INSERT INTO performance VALUES ('11','3','5','13','5');
INSERT INTO performance VALUES ('12','3','6','13','5');
INSERT INTO performance VALUES ('13','3','7','13','5');
INSERT INTO performance VALUES ('14','6','20','14','6');
INSERT INTO performance VALUES ('15','8','12','15','7');
INSERT INTO performance VALUES ('16','9','16','21','8');
INSERT INTO performance VALUES ('17','9','17','21','8');
INSERT INTO performance VALUES ('18','9','18','21','8');
INSERT INTO performance VALUES ('19','9','19','21','8');
INSERT INTO performance VALUES ('20','4','12','10','3');
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Disparadores
--El n�mero se genera autom�ticamente de forma consecutiva
CREATE SEQUENCE musician_m_no_sequence
    MINVALUE 0
    START WITH 0
    INCREMENT BY 1;
/
    
CREATE OR REPLACE TRIGGER Ad_musician_m_no_sequence
    BEFORE INSERT ON musician
    FOR EACH ROW
BEGIN
    :NEW.m_no := musician_m_no_sequence.NEXTVAL;
END;
/

--La ciudad en la que vive por omisi�n es la ciudad de nacimiento
CREATE OR REPLACE TRIGGER Ad_musician_living_city
    BEFORE INSERT ON musician
    FOR EACH ROW
BEGIN
    IF :NEW.living_in IS NULL THEN
        :NEW.living_in := :NEW.born_in;    
    END IF;
END;
/

--Los compositores solo pueden componer un tipo de musica
CREATE OR REPLACE TRIGGER Ad_composer_comp_type
    BEFORE INSERT ON composer
    FOR EACH ROW
BEGIN
    FOR v_comp_type IN (SELECT *  FROM composer WHERE comp_is = :NEW.comp_is)
    LOOP
        IF :NEW.comp_type != v_comp_type.comp_type THEN
            RAISE_APPLICATION_ERROR(-20343, 'Un compositor no puede componer varios tipos de musica.');
        END IF;
    END LOOP;
END;
/

--Los interpretes pueden tocar m�ximo tres instrumentos
CREATE OR REPLACE TRIGGER Ad_performer_inst
    BEFORE INSERT ON performer
    FOR EACH ROW
DECLARE
    instr_count NUMBER;
    instr_exists NUMBER;
BEGIN
    SELECT COUNT(DISTINCT instrument)
        INTO instr_count
        FROM performer
        WHERE perf_is = :NEW.perf_is;
        
    SELECT COUNT(instrument)
        INTO instr_exists
        FROM performer
        WHERE instrument = :NEW.instrument
            AND perf_is = :NEW.perf_is;
        
    IF instr_count = 3 AND instr_exists = 0
    THEN
        RAISE_APPLICATION_ERROR(-20344, 'Los interpretes pueden tocar maximo 3 instrumentos.');
    END IF;
END;
/

--Si no se indica el tipo de m�sica de un compositor, se supone que el tipo de m�sica que sabe interpretar (si solamente es uno)
CREATE OR REPLACE TRIGGER Ad_composer_type
    BEFORE INSERT ON composer
    FOR EACH ROW
DECLARE
    n_perf_type NUMBER;
    music_type performer.perf_type%TYPE;
BEGIN
    IF :NEW.comp_type IS NULL THEN
        SELECT COUNT(DISTINCT perf_type)
            INTO n_perf_type
            FROM performer
            WHERE perf_is = :NEW.comp_is;
            
        if n_perf_type = 1 THEN
            SELECT DISTINCT perf_type
                INTO music_type
                FROM performer
                WHERE perf_is = :NEW.comp_is;
            :NEW.comp_type := music_type;
        END IF;
    END IF;
END;
/

--No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el m�sico y la fecha de muerte.
CREATE OR REPLACE TRIGGER Mo_musician
    BEFORE UPDATE ON musician
    FOR EACH ROW
BEGIN
    IF :OLD.m_no != :NEW.m_no THEN
        RAISE_APPLICATION_ERROR(-20345, 'No se puede modificar un campo con valor.');
    END IF;
    IF :OLD.m_name IS NOT NULL AND :OLD.m_name != :NEW.m_name THEN
        RAISE_APPLICATION_ERROR(-20345, 'No se puede modificar un campo con valor.');
    END IF;
    IF :OLD.born IS NOT NULL AND :OLD.born != :NEW.born THEN
        RAISE_APPLICATION_ERROR(-20345, 'No se puede modificar un campo con valor.');
    END IF;
    IF :OLD.born_in IS NOT NULL AND :OLD.born_in != :NEW.born_in THEN
        RAISE_APPLICATION_ERROR(-20345, 'No se puede modificar un campo con valor.');
    END IF;
END;
/
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Tuplas
--El dato m�nimo para adicionar un musico es su nombre
ALTER TABLE musician MODIFY (m_name NOT NULL);

--La fecha de nacimiento debe ser menor de la fecha de muerte
ALTER TABLE musician
ADD CONSTRAINT CHK_musician_dates
CHECK (born IS NULL OR died IS NULL OR born < died);
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Atributos

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
--------------------------------------------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------------------------------------------

--Acciones

--Los m�sicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos
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