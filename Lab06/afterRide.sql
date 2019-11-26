---------------------------Extendiendo. Contenidos.------------------------------

--A.
SELECT * FROM MBDA.miembros;

--B.
INSERT INTO MBDA.miembros
VALUES ('CC', 1034596448, 'Colombia', 'daniel.rincon-m@mail.escuelaing.edu.co', NULL, 'Daniel Rincon', TO_DATE('1996-12-03', 'YYYY-MM-DD'), 1);
INSERT INTO MBDA.miembros
VALUES ('CC', 1038478463, 'Colombia', 'michael.perilla@mail.escuelaing.edu.co', NULL, 'Michael Perilla', TO_DATE('1998-08-03', 'YYYY-MM-DD'), 1);

--C.
DELETE FROM MBDA.miembros WHERE numero = 1034596448;
--Aparece un mensaje de error en donde dice que no se tienen privilegios suficientes.

--D.
GRANT
    UPDATE, DELETE ON MBDA.personas TO bd3104340;
--La deberia escribir un usuario que ya tenga los permisos en la tabla

--E.
CREATE SEQUENCE miembro_id_seq
    START WITH 1
    INCREMENT BY 1;
    
CREATE OR REPLACE TRIGGER miembro_id_tr
  BEFORE INSERT ON miembro
  FOR EACH ROW
BEGIN
  :NEW.id := miembro_id_seq.NEXTVAL;
END;
/

--DELETE FROM miembro;

INSERT INTO miembro (idn, idt, pais, correo) 
    SELECT numero, tipo, pais, correo
    FROM MBDA.miembros
    WHERE
        tipo IS NOT NULL
        AND numero IS NOT NULL
        AND numero IN (SELECT numero
                        FROM (
                                SELECT numero, COUNT(*)
                                FROM MBDA.miembros
                                GROUP BY numero
                                HAVING COUNT(*) = 1
                                )
                        );

INSERT INTO persona
    SELECT id, nombres
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        nombres IS NOT NULL;
        
INSERT INTO empresa
    SELECT id, razon, NULL
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        razon IS NOT NULL;

--No funciona debido a que las fechas en la tabla de origen no tienen un fromato predefinido
INSERT INTO ciclista
    SELECT id, TO_DATE(nacimiento), categoria
    FROM 
        miembro JOIN MBDA.miembros
        ON (idn = numero)
    WHERE
        nacimiento IS NOT NULL
        AND categoria IS NOT NULL;
        
        
        
        