--El número se genera automáticamente de forma consecutiva
DROP SEQUENCE musician_m_no_sequence;
DROP TRIGGER Ad_musician_m_no_sequence;

--La ciudad en la que vive por omisión es la ciudad de nacimiento
DROP TRIGGER Ad_musician_living_city;

--Los compositores solo pueden componer un tipo de musica
DROP TRIGGER Ad_composer_comp_type;

--Los interpretes pueden tocar máximo tres instrumentos
DROP TRIGGER Ad_performer_inst;

--Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)
DROP TRIGGER Ad_composer_type;