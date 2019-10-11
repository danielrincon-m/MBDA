--Ciclo 1: CRUD: Registrar Resultado
--TAtributos----------------------------------------------------------------------------------------------------------------

--Tuplas----------------------------------------------------------------------------------------------------------------

--Un cilista solo puede tener un único registro en un segmento
ALTER TABLE registro
ADD CONSTRAINT UK_reg_esSobre_esPara
UNIQUE (esSobre, esPara);
-- No pueden quedar dos ciclistas con la misma posicion en el mismo segmento
ALTER TABLE registro
ADD CONSTRAINT UK_reg_posicion_esPara
UNIQUE (posicion, esPara);

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 2, 'seg1');
INSERT INTO registro VALUES(1, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '', 'M', '', 1, 'seg2');
INSERT INTO registro VALUES(2, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '', 'M', '', 1, 'seg3');

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 150, 5, '', 'M', '', 2, 'seg1'); --El ciclista numero 2 no puede tener un nuevo registro en el segmento 'seg1'
INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 10, '', 'M', '', 3, 'seg1'); --El ciclista numero 3 no puede ocupar la misma posicion que el ciclista 2 en el mismo segmento

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

--Disparadores----------------------------------------------------------------------------------------------------------------

--El numero y la fecha se asignan automáticamente
CREATE OR REPLACE TRIGGER TR_reg_date_number
BEFORE 
INSERT
ON registro
FOR EACH ROW
DECLARE
    n registro.numero%TYPE;
BEGIN
    SELECT 
        MAX(numero)
        INTO n
    FROM registro;
    IF n IS NULL THEN
        :NEW.numero := 1;
    ELSE
        :NEW.numero := n + 1;
    END IF;
    :NEW.fecha := CURRENT_DATE;
END;
/
--Solo se pueden registrar resultados de ciclistas que hayan participado en la version de la carrera a la que pertenece el segmento.
CREATE OR REPLACE TRIGGER TR_reg_participado
BEFORE
INSERT
ON registro
FOR EACH ROW
DECLARE
    i BOOLEAN;
    cid participa.ciclistaId%TYPE;
    vid participa.versionId%TYPE;
BEGIN
    SELECT 
        ciclistaId
    INTO
        cid
    FROM participa p
    
    JOIN version v
    ON p.versionId = v.id
    
    JOIN segmento s
    ON v.id = s.contenidoEn
    
    WHERE s.nombre = :NEW.esPara
        AND p.ciclistaId = :NEW.esSobre;
    
    SELECT 
        versionId
    INTO
        vid
    FROM participa p
    
    JOIN version v
    ON p.versionId = v.id
    
    JOIN segmento s
    ON v.id = s.contenidoEn
    
    WHERE s.nombre = :NEW.esPara
        AND p.ciclistaId = :NEW.esSobre;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'El ciclista no participó en la versión de la carrera a la cual pertenece el segmento');
END;
/
--Los datos a modificar son la revisión, las fotos y el comentario
CREATE OR REPLACE TRIGGER TR_reg_modificar
BEFORE 
UPDATE
OF numero, fecha, tiempo, posicion, dificultad, esSobre, esPara
ON registro
FOR EACH ROW
BEGIN
    IF :NEW.numero <> :OLD.numero
        OR :NEW.fecha <> :OLD.fecha
        OR :NEW.tiempo <> :OLD.tiempo
        OR :NEW.posicion <> :OLD.posicion
        OR :NEW.dificultad <> :OLD.dificultad
        OR :NEW.esSobre <> :OLD.esSobre
        OR :NEW.esPara <> :OLD.esPara
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER TR_foto_modificar
BEFORE 
UPDATE
OF numeroRegistro
ON foto
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
END;
/
--Sólo es posible eliminar un registro si no ha pasado mas de un dia desde que se creo.
CREATE OR REPLACE TRIGGER TR_reg_eliminar
BEFORE DELETE
ON registro
FOR EACH ROW
BEGIN
    IF SYSDATE - :OLD.fecha > 1 THEN
        RAISE_APPLICATION_ERROR(-20003, 'No se puede eliminar un registro de más de un día.');
    END IF;
END;
/

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(3, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 2, 'seg1');
INSERT INTO registro VALUES(1, TO_DATE('10-09-2014','DD-MM-YYYY'), 100, 1, '', 'M', '', 1, 'seg2');
INSERT INTO registro VALUES(2, TO_DATE('10-09-2014','DD-MM-YYYY'), 200, 5, '', 'M', '', 1, 'seg3');

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO registro VALUES(4, TO_DATE('10-09-2014','DD-MM-YYYY'), 50, 10, '', 'M', '', 1, 'seg1'); --No se puede registrar un ciclista que no haya competido en el segmento 'seg1'
UPDATE registro
SET tiempo = 90
WHERE numero = 1; -- No se puede actualizar el campo de tiempo

--XDisparadores-----------------------------------------------------------------------------------------------------------------

DROP TRIGGER TR_reg_date_number;
DROP TRIGGER TR_reg_participado;
DROP TRIGGER TR_reg_modificar;
DROP TRIGGER TR_reg_eliminar;