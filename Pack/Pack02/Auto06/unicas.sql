ALTER TABLE place ADD CONSTRAINT UK_place_place_town UNIQUE (place_town);
ALTER TABLE band ADD CONSTRAINT UK_band_band_name UNIQUE (band_name);
ALTER TABLE composition ADD  CONSTRAINT UK_composition_c_title UNIQUE (c_title);