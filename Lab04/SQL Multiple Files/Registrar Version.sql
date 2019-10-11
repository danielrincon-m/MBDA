--Ciclo 1: CRUD: Registrar Version
--TAtributos----------------------------------------------------------------------------------------------------------------

--Tuplas----------------------------------------------------------------------------------------------------------------

--Un segmento no puede iniciar y finalizar en el mismo punto.
ALTER TABLE segmento
ADD CONSTRAINT CHK_segmento_startEnd
CHECK (
    iniciaEn != finalizaEn
);

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO segmento VALUES('seg1', 'C', 3, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 1, 2);

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO segmento VALUES('seg3', 'C', 2, 0, 0); -- No se puede iniciar y terminar un segmento en el mismo punto

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

--Disparadores----------------------------------------------------------------------------------------------------------------

--Si no se especifica un nombre de la version será de tipo: nombreCarrera_id
CREATE OR REPLACE TRIGGER TR_version_nombre
BEFORE INSERT
ON version
FOR EACH ROW
DECLARE
    nombreC carrera.nombre%TYPE;
BEGIN
    IF :NEW.nombre IS NULL THEN
        SELECT
            nombre
        INTO nombreC
        FROM carrera
        WHERE codigo = :NEW.carrera;
        :NEW.nombre := CONCAT(nombreC, '_');
        :NEW.nombre := CONCAT(:NEW.nombre, :NEW.id);
    END IF;
END;
/
--La fecha no puede repetirse para la misma carrera
CREATE OR REPLACE TRIGGER TR_version_fecha
BEFORE INSERT
ON version
FOR EACH ROW
BEGIN
    FOR fila IN (
        SELECT *
        FROM version
        WHERE carrera = :NEW.carrera
        )
    LOOP
        IF fila.fecha = :NEW.fecha THEN
            RAISE_APPLICATION_ERROR(-20008, 'No pueden haber dos versiones con la misma fecha para la misma carrera');
        END IF;
    END LOOP;
END;
/
--Un ciclista no puede participar en dos versiones en la misma fecha
CREATE OR REPLACE TRIGGER TR_participa_fecha
BEFORE INSERT
ON participa
FOR EACH ROW
DECLARE
    newDate version.fecha%TYPE;
BEGIN
    SELECT fecha
    INTO newDate
    FROM version
    WHERE id = :NEW.versionId;
    
    FOR fila IN (
        SELECT *
        FROM participa
        
        JOIN version
        ON versionId = id
        
        WHERE ciclistaId = :NEW.ciclistaId
        )
    LOOP
        IF fila.fecha = newDate THEN
            RAISE_APPLICATION_ERROR(-20009, 'Un ciclista no puede participar en dos versiones en la misma fecha');
        END IF;
    END LOOP;
END;
/
--Se puede modificar el nombre y tipo de un segmento si son de una version futura
CREATE OR REPLACE TRIGGER TR_segmento_modify
BEFORE UPDATE
ON segmento
FOR EACH ROW
DECLARE
    versionFecha version.fecha%TYPE;
BEGIN
    IF :OLD.contenidoEn <> :NEW.contenidoEn
        OR :OLD.iniciaEn <> :NEW.iniciaEn
        OR :OLD.finalizaEn <> :NEW.finalizaEn
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
    SELECT fecha
    INTO versionFecha
    FROM version
    WHERE id = :OLD.contenidoEn;
    IF versionFecha < CURRENT_DATE THEN
        RAISE_APPLICATION_ERROR(-20010, 'No se puede actualizar un evento pasado');
    END IF;
END;
/
-- Solo se puede modificar el nombre de una version
CREATE OR REPLACE TRIGGER TR_version_modify
BEFORE UPDATE
ON version
FOR EACH ROW
BEGIN
    IF :OLD.id <> :NEW.id
        OR :OLD.fecha <> :NEW.fecha
        OR :OLD.carrera <> :NEW.carrera
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
END;
/
-- No se puede eliminar una version. -- TR_version_del
CREATE OR REPLACE TRIGGER TR_version_del
BEFORE DELETE
ON version
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/
-- No se puede eliminar un segmento. -- TR_segmento_del
CREATE OR REPLACE TRIGGER TR_segmento_del
BEFORE DELETE
ON segmento
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO participa VALUES(1, 2);
INSERT INTO participa VALUES(1, 1);
INSERT INTO participa VALUES(2, 2);
INSERT INTO participa VALUES(2, 3);
INSERT INTO participa VALUES(3, 3);
INSERT INTO esOrganizador VALUES(3, 1);
INSERT INTO esOrganizador VALUES(2, 1);
INSERT INTO esOrganizador VALUES(3, 2);
INSERT INTO version VALUES(3, 'TDF', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(1, 'TDF2', TO_DATE('2019/10/27', 'yyyy/mm/dd'), '1');
INSERT INTO version VALUES(2, 'TDF3', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '2');
INSERT INTO version VALUES(4, 'TDF4', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '1');
INSERT INTO segmento VALUES('seg1', 'C', 3, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 1, 2);

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO version VALUES(5, 'TDF5', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0'); -- La fecha no puede repetirse para la misma carrera
INSERT INTO participa VALUES(1, 4); -- Un ciclista no puede participar en dos versiones en la misma fecha
UPDATE segmento
SET nombre = 'HOLA',
    tipo = 'M'
WHERE nombre = 'seg2'; -- Se puede modificar el nombre y tipo de un segmento si son de una version futura
DELETE FROM version; -- No se puede eliminar una version
DELETE FROM segmento; -- No se puede eliminar un segmento

--XDisparadores---------------------------------------------------------------------------------------------------------------
DROP TRIGGER TR_version_nombre;
DROP TRIGGER TR_version_fecha;
DROP TRIGGER TR_participa_fecha;
DROP TRIGGER TR_segmento_modify;
DROP TRIGGER TR_version_modify;
DROP TRIGGER TR_version_del;
DROP TRIGGER TR_segmento_del;