/*Comprobacion de  restricciones uno que funciona y otro que no por las restricciones*/
INSERT INTO musician VALUES(43,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),TO_DATE('1947/01/02','YYYY/MM/DD'),1,2);
INSERT INTO musician VALUES(43,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),TO_DATE('1949/01/02','YYYY/MM/DD'),1,2);

INSERT INTO composer VALUES(13,8,'Reguetron');
INSERT INTO composer VALUES(13,8,'not known');