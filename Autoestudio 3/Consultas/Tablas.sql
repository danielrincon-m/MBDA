CREATE TABLE band (
    band_no NUMBER(11),
    band_name VARCHAR2(20),
    band_home NUMBER(11),
    band_type VARCHAR(10),
    b_date DATE,
    band_contact NUMBER(11)
);
CREATE TABLE composer (
    comp_no NUMBER(11),
    comp_is NUMBER(11),
    comp_type VARCHAR2(10)
);
CREATE TABLE composition (
    c_no NUMBER(11),
    comp_date DATE,
    c_title VARCHAR2(40),
    c_in NUMBER(11)
);
CREATE TABLE concert (
    concert_no NUMBER(11),
    concert_venue VARCHAR2(20),
    concert_in NUMBER(11),
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
    instrument VARCHAR2(10),
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