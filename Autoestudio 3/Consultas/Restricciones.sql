--table place
ALTER TABLE place ADD (
    CONSTRAINT PLACE_PK PRIMARY KEY(place_no)
);

--table musician
ALTER TABLE musician ADD (
    CONSTRAINT MUSICIAN_PK PRIMARY KEY(m_no),
    CONSTRAINT MUSICIAN_BORN_IN_FK FOREIGN KEY(born_in) REFERENCES place(place_no),
    CONSTRAINT MUSICIAN_LIVING_IN_FK FOREIGN KEY(living_in) REFERENCES place(place_no)
);

--table performer
ALTER TABLE performer ADD (
    CONSTRAINT PERFORMER_PK PRIMARY KEY(perf_no),
    CONSTRAINT PERFORMER_PERF_IS_FK FOREIGN KEY(perf_is) REFERENCES musician(m_no)
);
ALTER TABLE performer MODIFY (
    instrument NOT NULL
);

--table composer
ALTER TABLE composer ADD (
    CONSTRAINT COMPOSER_PK PRIMARY KEY(comp_no),
    CONSTRAINT COMPOSER_COMP_IS_FK FOREIGN KEY(comp_is) REFERENCES musician(m_no)
);
ALTER TABLE composer MODIFY (
    comp_is NOT NULL
);

--table band
ALTER TABLE band ADD (
    CONSTRAINT BAND_PK PRIMARY KEY(band_no),
    CONSTRAINT BAND_BAND_NAME_UK UNIQUE(band_name),
    CONSTRAINT BAND_BAND_HOME_FK FOREIGN KEY(band_home) REFERENCES place(place_no),
    CONSTRAINT BAND_BAND_CONTACT_FK FOREIGN KEY(band_contact) REFERENCES musician(m_no)
);
ALTER TABLE band MODIFY (
    band_home NOT NULL,
    band_contact NOT NULL
);

--table concert
ALTER TABLE concert ADD (
    CONSTRAINT CONCERT_PK PRIMARY KEY(concert_no),
    CONSTRAINT CONCERT_CONCERT_IN_FK FOREIGN KEY(concert_in) REFERENCES place(place_no),
    CONSTRAINT CONCERT_CONCERT_ORGNISER_FK FOREIGN KEY(concert_orgniser) REFERENCES musician(m_no)
);
ALTER TABLE concert MODIFY (
    concert_in NOT NULL
);

--table composition
ALTER TABLE composition ADD (
    CONSTRAINT COMPOSITION_PK PRIMARY KEY(c_no),
    CONSTRAINT COMPOSITION_C_IN_FK FOREIGN KEY(c_in) REFERENCES place(place_no)
);
ALTER TABLE composition MODIFY (
    c_title NOT NULL
);

--table plays_in
ALTER TABLE plays_in ADD (
    CONSTRAINT PLAYS_IN_PK PRIMARY KEY(player, band_id),
    CONSTRAINT PLAYS_IN_PLAYER_FK FOREIGN KEY(player) REFERENCES performer(perf_no),
    CONSTRAINT PLAYS_IN_BAND_ID_FK FOREIGN KEY(band_id) REFERENCES band(band_no)
);

--table has_composed
ALTER TABLE has_composed ADD (
    CONSTRAINT HAS_COMPOSED_PK PRIMARY KEY(cmpr_no, cmpn_no),
    CONSTRAINT HAS_COMPOSED_CMPR_NO_FK FOREIGN KEY(cmpr_no) REFERENCES composer(comp_no),
    CONSTRAINT HAS_COMPOSED_CMPN_NO_FK FOREIGN KEY(cmpn_no) REFERENCES composition(c_no)
);

--table performance
ALTER TABLE performance ADD (
    CONSTRAINT PERFORMANCE_PK PRIMARY KEY(pfrmnc_no),
    CONSTRAINT PERFORMANCE_GAVE_FK FOREIGN KEY(gave) REFERENCES band(band_no),
    CONSTRAINT PERFORMANCE_PERFORMED_FK FOREIGN KEY(performed) REFERENCES composition(c_no),
    CONSTRAINT PERFORMANCE_CONDUCTED_BY_FK FOREIGN KEY(conducted_by) REFERENCES musician(m_no),
    CONSTRAINT PERFORMANCE_PERFORMED_IN_FK FOREIGN KEY(performed_in) REFERENCES concert(concert_no)
);