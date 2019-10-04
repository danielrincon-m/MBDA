INSERT INTO carrera VALUES('0', 'Carrera1', 'COLOMBIA', 1, 6);
INSERT INTO carrera VALUES('1', 'Carrera2', 'COLOMBIA', 2, 12);
INSERT INTO carrera VALUES('2', 'Carrera3', 'COLOMBIA', 3, 18);
INSERT INTO punto VALUES(0, 0, 'Punto1', 'P', 15.2, 20, 0);
INSERT INTO punto VALUES(1, 1, 'Punto2', 'L', 23.5, 20, 0);
INSERT INTO punto VALUES(2, 0, 'Punto3', 'P', 15.2, 20, 1);
INSERT INTO propiedadDe VALUES ('0', 0, 59.2);
INSERT INTO propiedadDe VALUES ('1', 1, 99.5);
INSERT INTO propiedadDe VALUES ('2', 2, 10);

INSERT INTO miembro VALUES(0, 'CC', 1032487556, 'COLOMBIA', 'asd@gmail.com');
INSERT INTO miembro VALUES(1, 'CC', 1032487557, 'COLOMBIA', 'asd1@gmail.com');
INSERT INTO miembro VALUES(2, 'CC', 1032487558, 'COLOMBIA', 'asd2@gmail.com');
INSERT INTO persona VALUES(0, 'Andres Garzon');
INSERT INTO persona VALUES(1, 'Andres Muñoz');
INSERT INTO persona VALUES(2, 'Mariaza Garzon');
INSERT INTO empresa VALUES(3, 'Monsters Inc.', 0);
INSERT INTO empresa VALUES(4, 'aaa cia.', 1);
INSERT INTO empresa VALUES(5, 'Next corp.', 2);
INSERT INTO ciclista VALUES(0, TO_DATE('1990/09/27', 'yyyy/mm/dd'), 1);
INSERT INTO ciclista VALUES(1, TO_DATE('1991/09/28', 'yyyy/mm/dd'), 2);
INSERT INTO ciclista VALUES(2, TO_DATE('1985/05/10', 'yyyy/mm/dd'), 3);

INSERT INTO participa VALUES(0, 0);
INSERT INTO participa VALUES(1, 1);
INSERT INTO participa VALUES(2, 0);
INSERT INTO esOrganizador VALUES(3, 0);
INSERT INTO esOrganizador VALUES(4, 1);
INSERT INTO esOrganizador VALUES(5, 0);
INSERT INTO version VALUES(0, 'TDF', TO_DATE('2019/09/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(1, 'TDF2', TO_DATE('2019/10/27', 'yyyy/mm/dd'), '0');
INSERT INTO version VALUES(2, 'TDF3', TO_DATE('2019/11/27', 'yyyy/mm/dd'), '0');
INSERT INTO segmento VALUES('seg1', 'C', 0, 0, 1);
INSERT INTO segmento VALUES('seg2', 'C', 1, 0, 2);
INSERT INTO segmento VALUES('seg3', 'C', 2, 0, 0);

INSERT INTO registro VALUES(0, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 50, 10, '', 'M', '', '', 0, 0, 'seg1');
INSERT INTO registro VALUES(1, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 100, 1, '', 'M', '', '', 0, 0, 'seg2');
INSERT INTO registro VALUES(2, TO_TIMESTAMP('10-SEP-2014:10:10.123000','DD-MON-RRHH24:MI:SS.FF'), 200, 5, '', 'M', '', '', 0, 0, 'seg3');