--PUNTO 2
--Insertar un numero incorrecto de atributos
INSERT INTO miembro VALUES(1);
--Insertar un tipo de datos inválido
INSERT INTO empresa VALUES(5, NULL, NULL);
--Insertar un atributo NULL en un campo que no lo permite
INSERT INTO ciclista VALUES(0, TO_DATE('1990/09/27', 'yyyy/mm/dd'), NULL);
INSERT INTO version VALUES(0, 'TDF', NULL, '0');
INSERT INTO persona VALUES(0, NULL);

--PUNTO 3
--Insertar una llave primaria repetida
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com'); --La llave primaria ya existe
--Insertar un valor que no apunte a algun valor de otra tabla requerida
INSERT INTO persona VALUES(10, 'Andres Garzon'); --No existe el miembro 10
--Violar una restricion de atributos
INSERT INTO miembro VALUES(1, 'CD', 1032487557, 'COLOMBIA', 'asd1@gmail.com'); --No existe el tipo de documento CD
INSERT INTO punto VALUES(0, 0, 'Punto1', 'R', 15.2, 20, 0); --tipo no deberia tomar el valor 'R'