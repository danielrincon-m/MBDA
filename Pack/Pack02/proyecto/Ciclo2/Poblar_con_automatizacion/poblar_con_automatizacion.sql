INSERT INTO ASOCIACIONES VALUES(seq_asociaciones.nextval,'Programers',3,'*',26);
INSERT INTO ASOCIACIONES VALUES(seq_asociaciones.nextval,'Anonimus',5,'*',12);
INSERT INTO ASOCIACIONES VALUES(seq_asociaciones.nextval,'AA',2,'*',2);
INSERT INTO ASOCIACIONES VALUES(seq_asociaciones.nextval,'Hackers',5,'*',4);
INSERT INTO ASOCIACIONES VALUES(seq_asociaciones.nextval,'Vjudge',5,'*',1);

INSERT INTO EVENTOS VALUES('CCPL6','Dificil',6,TO_DATE('1989/08/12','yyyy/mm/dd'),null,4,'Maraton',1000,1,0);
INSERT INTO EVENTOS VALUES('CCPL7','Dificil',7,TO_DATE('1989/08/12','yyyy/mm/dd'),null,3,'Maraton',1000,5,0);
INSERT INTO EVENTOS VALUES('CCPL8','Facil',8,TO_DATE('1989/08/12','yyyy/mm/dd'),null,3,'Maraton',1000,6,0);
INSERT INTO EVENTOS VALUES('CCPL9','Dificil',9,TO_DATE('1989/08/12','yyyy/mm/dd'),null,3,'Maraton',1000,8,0);
INSERT INTO EVENTOS VALUES('CCPL10','Medio',10,TO_DATE('1989/08/12','yyyy/mm/dd'),null,3,'Maraton',1000,1,0);

INSERT INTO EVENTOS VALUES ('A1','Experto',11,SYSDATE,null,4,'Conferencia',243000,18,0);
INSERT INTO EVENTOS VALUES ('A2','Experto',12,SYSDATE,null,3,'Conferencia',200970,19,0);
INSERT INTO EVENTOS VALUES ('A3','Experto',13,SYSDATE,null,4,'Conferencia',356000,11,0);
INSERT INTO EVENTOS VALUES ('A4','Experto',14,SYSDATE,null,3,'Conferencia',213160,2,0);
INSERT INTO EVENTOS VALUES ('A5','Experto',15,SYSDATE,null,3,'Conferencia',43500,3,0);
INSERT INTO EVENTOS VALUES ('A6','Experto',16,SYSDATE,null,3,'Conferencia',756080,4,0);
INSERT INTO EVENTOS VALUES ('A7','Experto',17,SYSDATE,null,3,'Conferencia',151350,6,0);
INSERT INTO EVENTOS VALUES ('A8','Experto',18,SYSDATE,null,4,'Conferencia',793250,8,0);
INSERT INTO EVENTOS VALUES ('A9','Experto',19,SYSDATE,null,4,'Conferencia',198978,10,0);
INSERT INTO EVENTOS VALUES ('A10','Experto',20,SYSDATE,null,3,'Conferencia',205000,15,0);
INSERT INTO EVENTOS VALUES ('A11','Experto',21,SYSDATE,null,4,'Conferencia',205000,19,0);
INSERT INTO EVENTOS VALUES ('A12','Experto',22,SYSDATE,null,3,'Conferencia',250000,12,0);


INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,2);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(2,3);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,4);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(2,5);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,6);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(3,7);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(3,8);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,9);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(4,10);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,11);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(5,12);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(6,13);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(7,14);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,15);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(8,16);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,17);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(9,18);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,19);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(10,20);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,21);
INSERT INTO REALIZAN (id_asociacion,id_evento) VALUES(1,22);



INSERT INTO TIENE VALUES(824,6);
INSERT INTO TIENE VALUES(825,6);
INSERT INTO TIENE VALUES(826,6);
INSERT INTO TIENE VALUES(827,6);
INSERT INTO TIENE VALUES(828,6);
INSERT INTO TIENE VALUES(830,6);
INSERT INTO TIENE VALUES(831,6);
INSERT INTO TIENE VALUES(832,6);
INSERT INTO TIENE VALUES(833,7);
INSERT INTO TIENE VALUES(834,7);
INSERT INTO TIENE VALUES(835,7);
INSERT INTO TIENE VALUES(836,7);
INSERT INTO TIENE VALUES(837,8);
INSERT INTO TIENE VALUES(838,8);
INSERT INTO TIENE VALUES(839,8);
INSERT INTO TIENE VALUES(840,8);
INSERT INTO TIENE VALUES(841,9);
INSERT INTO TIENE VALUES(842,9);
INSERT INTO TIENE VALUES(901,10);
INSERT INTO TIENE VALUES(902,10);
INSERT INTO TIENE VALUES(903,10);

INSERT INTO INSCRIPCIONES values(243000,seq_inscripcion.nextval,SYSDATE,2,11);
INSERT INTO INSCRIPCIONES values(243000,seq_inscripcion.nextval,SYSDATE,4,11);
INSERT INTO INSCRIPCIONES values(243000,seq_inscripcion.nextval,SYSDATE,3,11);
INSERT INTO INSCRIPCIONES values(243000,seq_inscripcion.nextval,SYSDATE,10,11);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,5,6);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,7,6);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,10,6);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,1,7);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,3,8);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,10,7);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,4,8);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,10,8);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,8,9);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,1,9);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,10,9);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,5,10);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,2,10);
INSERT INTO INSCRIPCIONES values(1000,seq_inscripcion.nextval,SYSDATE,10,10);

INSERT INTO ENVIOS VALUES(seq_envios.nextval,901,5,10,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,902,2,10,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,903,5,10,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,903,2,10,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,901,5,10,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,902,5,10,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,841,1,9,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,841,1,9,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,837,3,8,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,838,4,8,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,839,4,8,'Python');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,840,3,8,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,833,1,7,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,834,1,7,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,835,1,7,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,836,1,7,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,836,1,7,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,824,5,6,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,826,5,6,'Python');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,828,7,6,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,830,7,6,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,831,5,6,'JAVA');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,826,7,6,'C++');
INSERT INTO ENVIOS VALUES(seq_envios.nextval,826,7,6,'JAVA');
