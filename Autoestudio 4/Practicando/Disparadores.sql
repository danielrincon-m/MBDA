--El número se genera automáticamente de forma consecutiva
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

--La ciudad en la que vive por omisión es la ciudad de nacimiento
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

--Los interpretes pueden tocar máximo tres instrumentos
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

--Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)
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

--No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.
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
