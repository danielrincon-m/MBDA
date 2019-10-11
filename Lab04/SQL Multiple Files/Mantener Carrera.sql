--Ciclo 1: CRUD: Mantener Carrera

--TAtributos----------------------------------------------------------------------------------------------------------------

--La distancia simpre debe ser mayor a 1 km
ALTER TABLE punto
ADD CONSTRAINT CHK_punto_distancia
CHECK (
    distancia > 1
);

--Tuplas----------------------------------------------------------------------------------------------------------------

--La velocidad máxima en cicla es de 100 km/hora.
ALTER TABLE punto
ADD CONSTRAINT CHK_punto_velocidad
CHECK (
    distancia / (tiempoLimite / 60) <= 100
);

--TuplasOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);

--TuplasNoOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(2, 0, 'Punto4', 'L', 30, 2, 1); -- La velocidad maxima es de 100 km/h

--Acciones----------------------------------------------------------------------------------------------------------------

--AccionesOK----------------------------------------------------------------------------------------------------------------

--Disparadores----------------------------------------------------------------------------------------------------------------

--El ordern (por carrera) se debe generar automáticamente
CREATE OR REPLACE TRIGGER TR_punto_orden_auto
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    newNumber punto.orden%TYPE;
BEGIN
    SELECT 
        MAX(orden)
    INTO newNumber
    FROM punto
    WHERE carrera = :NEW.carrera;
    IF newNumber IS NULL THEN
        newNumber := 1;
    ELSE
        newNumber := newNumber + 1;
    END IF;
END;
/
--El nombre del punto no se debe repetir dentro de una carrera
CREATE OR REPLACE TRIGGER TR_punto_nombre_rep
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    getNombre NUMBER;
BEGIN
    SELECT COUNT(nombre)
    INTO getNombre
    FROM punto
    WHERE nombre = :NEW.nombre
        AND carrera = :NEW.carrera;
    IF getNombre >= 1 THEN
        RAISE_APPLICATION_ERROR(-20004, 'No se puede repetir nombre de punto dentro de la misma carrera');
    END IF;
END;
/
--Solo debe existir un punto de partida y un punto de llegada.
CREATE OR REPLACE TRIGGER TR_punto_tipo_one
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    getTipo NUMBER;
BEGIN
    IF :NEW.tipo = 'P' OR :NEW.tipo = 'L' THEN
        SELECT COUNT(tipo)
        INTO getTipo
        FROM punto
        WHERE tipo = :NEW.tipo
            AND carrera = :NEW.carrera;
        IF getTipo >= 1 THEN
            RAISE_APPLICATION_ERROR(-20005, 'No pueden haber dos puntos de partida o de llegada en la misma carrera');
        END IF;
    END IF;
END;
/
--Si no se dice el tipo del punto se asume que es meta volante a no ser que sea el primer punto que es el de partida.
CREATE OR REPLACE TRIGGER TR_punto_tipo_auto
BEFORE INSERT
ON punto
FOR EACH ROW
DECLARE
    existe BOOLEAN;
BEGIN
    IF :NEW.tipo IS NULL THEN
        existe := FALSE;
        FOR fila IN (
            SELECT *
            FROM punto
            WHERE carrera = :NEW.carrera
        )
        LOOP
            existe := TRUE;
        END LOOP;
        IF existe = TRUE THEN
            :NEW.tipo := 'V';
        ELSE
            :NEW.tipo := 'P';
        END IF;
    END IF;
END;
/
--Si no se conoce la duración máxima se asume una velocidad de 60 km/hora
CREATE OR REPLACE TRIGGER TR_punto_tiempoLimite
BEFORE INSERT
ON punto
FOR EACH ROW
BEGIN
    IF :NEW.tiempoLimite IS NULL THEN
        :NEW.tiempoLimite := :NEW.distancia;
    END IF;
END;
/
--Los unicos datos que se pueden modificar son el tipo y la duracion, No se puede modificar el tipo de partida
CREATE OR REPLACE TRIGGER TR_punto_modificarX
BEFORE UPDATE
ON punto
FOR EACH ROW
BEGIN
    IF :NEW.id <> :OLD.id
        OR :NEW.orden <> :OLD.orden
        OR :NEW.nombre <> :OLD.nombre
        OR :NEW.distancia <> :OLD.distancia
        OR :NEW.carrera <> :OLD.carrera 
    THEN
        RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar alguno de los valores');
    END IF;
    IF :OLD.tipo = 'P' AND :OLD.tipo <> :NEW.tipo THEN
        RAISE_APPLICATION_ERROR(-20006, 'No se puede reemplazar un punto de partida');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER TR_punto_eliminar
BEFORE DELETE
ON punto
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'No se puede eliminar');
END;
/

--DisparadoresOK----------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);

--DisparadoresNoOK--------------------------------------------------------------------------------------------------------------

INSERT INTO punto VALUES(2, 0, 'Punto3', 'A', 15.2, 20, 1); --No se puede repetir el nombre del punto en una misma carrera
INSERT INTO punto VALUES(2, 0, 'Punto4', 'P', 15.2, 20, 1); --Solo puede existir un punto de partida
UPDATE punto
SET tipo = 'A'
WHERE id = 0; --No se puede modificar el tipo de un punto de partida
DELETE FROM punto WHERE id = 0; -- No se pueden eliminar puntos

--XDisparadores----------------------------------------------------------------------------------------------------------------
DROP TRIGGER TR_punto_orden_auto;
DROP TRIGGER TR_punto_nombre_rep;
DROP TRIGGER TR_punto_tipo_one;
DROP TRIGGER TR_punto_tipo_auto;
DROP TRIGGER TR_punto_tiempoLimite;
DROP TRIGGER TR_punto_modificarX;
DROP TRIGGER TR_punto_eliminar;