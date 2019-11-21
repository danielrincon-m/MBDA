CREATE TABLE musician(
    m_no NUMBER(11) NOT NULL,
    m_name VARCHAR(20),
    born DATE,
    died DATE,
    born_in NUMBER(11),
    living_in NUMBER(11));
CREATE TABLE band(
    band_no NUMBER(11) NOT NULL,
    band_name VARCHAR(20),
    band_home NUMBER(11) NOT NULL,
    band_type VARCHAR(10),
    b_date DATE,
    band_contact NUMBER(11) NOT NULL);
CREATE TABLE composer(
    comp_no NUMBER(11) NOT NULL,
    comp_is NUMBER(11) NOT NULL,
    comp_type VARCHAR(10));
CREATE TABLE performer(
    perf_no NUMBER(11) NOT NULL,
    perf_is NUMBER(11),
    instrument VARCHAR(10) NOT NULL,
    perf_type VARCHAR(10));
CREATE TABLE performances(
    pfrmnc_no NUMBER(11) NOT NULL,
    gave NUMBER(11),
    performed NUMBER(11),
    conducted_by NUMBER(11),
    performed_in	NUMBER(11));
CREATE TABLE concert(
    concert_no	NUMBER(11) NOT NULL,
    concert_venue	varchar(20),
    concert_in	NUMBER(11) NOT NULL,
    con_date	DATE,
    concert_orgniser	NUMBER(11));
CREATE TABLE composition(
    c_no	NUMBER(11) NOT NULL,
    comp_date	DATE,
    c_title	VARCHAR(40) NOT NULL,
    c_in	NUMBER(11));
CREATE TABLE has_composed(
    cmpr_no	NUMBER(11)	NOT NULL,
    cmpn_no	NUMBER(11)	NOT NULL);
CREATE TABLE plays_in(
    player	NUMBER(11)	NOT NULL,
    band_id	NUMBER(11)	NOT NULL);
CREATE TABLE PLACE
	(PLACE_NO NUMBER(11) NOT NULL,
	PLACE_TOWN VARCHAR(20) NULL,
	PLACE_COUNTRY VARCHAR(20) NULL,
	DETALLES XMLTYPE NOT NULL);