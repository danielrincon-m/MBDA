--CICLO 1
--****************
--Tablas Construccion
--****************
--CRUD: Registrar colaboracion
CREATE TABLE colaboracion(numero NUMBER(10) NOT NULL, fecha TIMESTAMP NOT NULL, 
            descripcion VARCHAR2(100),estado VARCHAR2(100) NOT NULL,sintesis VARCHAR2(50),
            fechaCierre TIMESTAMP,reserva VARCHAR2(100) NOT NULL, realiza NUMBER(10) NOT NULL, testigo NUMBER(10),funcionario NUMBER(10) NOT NULL);
--CRUD: Mantener archivo         
CREATE TABLE archivo(colaboracion NUMBER(10) NOT NULL,archivo VARCHAR2(100) NOT NULL);
--CRUD: Mantener unidad
CREATE TABLE unidad(numero NUMBER(10), nombre VARCHAR2(100) NOT NULL,
            departamento NUMBER(10) NOT NULL);
--CRUD: Mantener reserva
CREATE TABLE reserva(nombre VARCHAR2(100) NOT NULL, fecha TIMESTAMP NOT NULL,
            estado VARCHAR2(100) NOT NULL, detalle VARCHAR2(100));
--CRUD: Mantener foto 
CREATE TABLE foto(Turl VARCHAR2(100), autor VARCHAR2(100) NOT NULL,reserva VARCHAR2(100) NOT NULL);
--CRUD: Mantener ubicacion
CREATE TABLE ubicadaEn(reserva VARCHAR2(100) NOT NULL, porcentaje NUMBER(6),
            departamento NUMBER(10) NOT NULL);
--CRUD: Mantener departamento
CREATE TABLE departamento(identificador NUMBER(10), nombre VARCHAR2(100) NOT NULL);
--CRUD: Mantener ciudadano
CREATE TABLE ciudadano(cedula NUMBER(15) NOT NULL, nombre VARCHAR2(100) NOT NULL, 
            correo VARCHAR2(100) NOT NULL, unidad NUMBER(2));
--CRUD: Mantener funcionario
CREATE TABLE funcionario(ciudadano NUMBER(15), vinculacion TIMESTAMP NOT NULL);
--CRUD: Mantener esconocidapor
CREATE TABLE esconocidapor(reserva VARCHAR2(100) NOT NULL, funcionario NUMBER(15) NOT NULL);
--****************
--Poblar Tablas
--****************
--TABLE reserva
INSERT INTO reserva(nombre,detalle) VALUES('La Pedrera','')
INSERT INTO reserva(nombre,detalle) VALUES('Mirit� Parana','')
INSERT INTO reserva(nombre,detalle) VALUES('Puerto Alegria','')
INSERT INTO reserva(nombre,detalle) VALUES('La Chorrera','')
INSERT INTO reserva(nombre,detalle) VALUES('Puerto Arica','')
INSERT INTO reserva(nombre,detalle) VALUES('Puerto Santander','')
INSERT INTO reserva(nombre,detalle) VALUES('Leticia','')
INSERT INTO reserva(nombre,detalle) VALUES('Puerto Nari�o','')
INSERT INTO reserva(nombre,detalle) VALUES('Puerto Santaner Colombia','')
INSERT INTO reserva(nombre,detalle) VALUES('Tarapaca','')
INSERT INTO reserva VALUES('Tarapac�','01/05/1909','Peligro','Corregimiento departamental colombiano');
INSERT INTO reserva VALUES('Pt Alegre','02/05/1981','Peligro','Corregimiento departamental colombiano');
INSERT INTO reserva VALUES('Cocuy','01/01/1977','Protegida','Reserva Forestal');
INSERT INTO reserva VALUES('Central','02/02/1994','Protegida','Reserva Forestal');
INSERT INTO reserva VALUES('Pacifico','03/03/1995','Protegida','Reserva Forestal');

--TABLE foto
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/La_Pedrera_(Amazonas)','Carmen Lopez','La Pedrera');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Mirit�-Paran�','Eduardo Silva','Miriti Parana');
INSERT INTO foto VALUES('lachorrera.co/','Camilo Villa','La Chorrera');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Puerto_Alegr�a_(Colombia)','Sofia Martinez','Puerto Alegria');
INSERT INTO foto VALUES('www.puertoarica.cl/','Maria Pilar','Puerto Arica');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Puerto_Santander','Edgar Riffo','Puerto Santander');
INSERT INTO foto VALUES('https://en.wikipedia.org/wiki/Leticia,_Amazonas','Abel Peralta','Leticia');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Puerto_Nari�o','Ana Cortes','Puerto Nari�o');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Puerto_Santander','Mateo Lozano','Puerto Santander');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/Tarapac�_(Amazonas)','Luisa Perez','Tarapaca');
INSERT INTO foto VALUES('http://sea.gob.cl/regiones/region-de-tarapaca','Pedro Valenzuela Diez de Medina Director Regional','Tarapac�');
INSERT INTO foto VALUES('http://www.vinetrust.org/projects/puerto_alegria','Comunidad indigena Puerto Alegria','Pt Alegre');

--TABLE departamento
INSERT INTO departamento(identificador, nombre) VALUES(6,'Cauca');
INSERT INTO departamento(identificador, nombre) VALUES(5,'Amazonia');
INSERT INTO departamento(identificador, nombre) VALUES(4,'Vichada');
INSERT INTO departamento(identificador, nombre) VALUES(1,'Casanare');
INSERT INTO departamento(identificador, nombre) VALUES(2,'Bolivar');
INSERT INTO departamento(identificador, nombre) VALUES(8,'Magdalena');
INSERT INTO departamento(identificador, nombre) VALUES(7,'Bolivar');
INSERT INTO departamento(identificador, nombre) VALUES(9,'Huila');
INSERT INTO departamento(identificador, nombre) VALUES(13,'Nari�o');
INSERT INTO departamento(identificador, nombre) VALUES(22,'Putumayo');

--TABLE unidad
INSERT INTO unidad(numero, nombre, departamento) VALUES(2,'Neiva', 1);
INSERT INTO unidad(numero, nombre, departamento) VALUES(1,'Riohacha', 2);
INSERT INTO unidad(numero, nombre, departamento) VALUES(7,'Yopal', 6);
INSERT INTO unidad(numero, nombre, departamento) VALUES(6,'Villavicencio', 5);
INSERT INTO unidad(numero, nombre, departamento) VALUES(9,'Sogamoso', 4);
INSERT INTO unidad(numero, nombre, departamento) VALUES(8,'Duitama', 9);
INSERT INTO unidad(numero, nombre, departamento) VALUES(4,'La Dorada', 13);
INSERT INTO unidad(numero, nombre, departamento) VALUES(3,'Gigante', 22);
INSERT INTO unidad(numero, nombre, departamento) VALUES(12,'Guavio', 13);
INSERT INTO unidad(numero, nombre, departamento) VALUES(10,'Quimbo', 8);

--TABLE ubicadaEn
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('La Pedrera',5, 15);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Mirit�-Parana',5, 20);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('La Chorrera',5, 64);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Puerto Alegria',5, 70);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Puerto Arica',5, 35);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Puerto Santander',5, 45);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Leticia',5, 55);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Puerto Nari�o',5, 23);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Puerto Santander',5, 67);
INSERT INTO ubicadaEn(reserva, departamento, porcentaje) VALUES('Tarapaca',5, 89);

--TABLE ciudadano
INSERT INTO ciudadano VALUES('1874593349','Mateo','mat@gmail.com',11);
INSERT INTO ciudadano VALUES('9823232642','Juan','juanito@gmail.com',2);
INSERT INTO ciudadano VALUES('6365436223','Oscar','Oscirr@hotmail.com',8);
INSERT INTO ciudadano VALUES('3576325324','Leonardo','Leini@hotmail.com',4);
INSERT INTO ciudadano VALUES('4232324156','Carlos','carlinit@hotmail.com',5);
INSERT INTO ciudadano VALUES('1234567898','Fernando','fercho@gmail.com',7);
INSERT INTO ciudadano VALUES('2321343465','Jonas','jojojo@gmail.com',9);
INSERT INTO ciudadano VALUES('7657865658','Antonio','anttt@hotmail.com',3);
INSERT INTO ciudadano VALUES('8754646745','Manuel','manolo@gmail.com',14);
INSERT INTO ciudadano VALUES('1020830119','Sergio','alejope@gmail.com',18);
INSERT INTO ciudadano VALUES('1020830119','Daniel Martinez','daniel.mar@hotmail.com','1');
INSERT INTO ciudadano VALUES('5711506','Sergio Gonzalez','sergiohola@gmail.com','2');
INSERT INTO ciudadano VALUES('46351265','Carlos Castillo','carloscastiiii@gmail.com','3');
INSERT INTO ciudadano VALUES('1057571525','Ana Cortes','anitac@hotmail.com','4');
INSERT INTO ciudadano VALUES('1057582512','Ramiro Andino','ramiri�o@gmail.com','5');
INSERT INTO ciudadano VALUES('1020586987','Ernesto Linares','erneslin@hotmail.com','6');

--TABLE funcionario
INSERT INTO funcionario VALUES('1874593349','11-ABR-78');
INSERT INTO funcionario VALUES('9823232642','04-AGO-99');
INSERT INTO funcionario VALUES('6365436223','22-JUN-85');
INSERT INTO funcionario VALUES('3576325324','01-NOV-98');
INSERT INTO funcionario VALUES('4232324156','30-ENE-01');
INSERT INTO funcionario VALUES('1234567898','17-JUL-06');
INSERT INTO funcionario VALUES('2321343465','20-FEB-05');
INSERT INTO funcionario VALUES('7657865658','15-MAY-88');
INSERT INTO funcionario VALUES('8754646745','09-SEP-10');
INSERT INTO funcionario VALUES('1020830119','10-DIC-11');
INSERT INTO funcionario VALUES('1020830119','17/02/1998');
INSERT INTO funcionario VALUES('5711506','02/06/2001');
INSERT INTO funcionario VALUES('46351265','30/12/2005');
INSERT INTO funcionario VALUES('1057571525','09/01/2002');
INSERT INTO funcionario VALUES('1057582512','06/08/1999');
INSERT INTO funcionario VALUES('1020586987','25/11/2004');

--TABLE esconocidapor
INSERT INTO esconocidapor VALUES('La Chorrera','1874593349');
INSERT INTO esconocidapor VALUES('Mirit� Parana','9823232642');
INSERT INTO esconocidapor VALUES('La Pedrera','6365436223');
INSERT INTO esconocidapor VALUES('Puerto Alegre','3576325324');
INSERT INTO esconocidapor VALUES('Puerto Arica','4232324156');
INSERT INTO esconocidapor VALUES('Puerto Santander','1234567898');
INSERT INTO esconocidapor VALUES('Leticia','2321343465');
INSERT INTO esconocidapor VALUES('Puerto Nari�o','7657865658');
INSERT INTO esconocidapor VALUES('Puerto Santander','8754646745');
INSERT INTO esconocidapor VALUES('Tarapaca','1020830119');
INSERT INTO esconocidapor VALUES('Tarapac�','1020830119');
INSERT INTO esconocidapor VALUES('Tarapac�','5711506');
INSERT INTO esconocidapor VALUES('Tarapac�','46351265');
INSERT INTO esconocidapor VALUES('Puerto Alegre','1057571525');
INSERT INTO esconocidapor VALUES('Puerto Alegre','1057582512');
INSERT INTO esconocidapor VALUES('Puerto Alegre','1020586987');

--TABLE colaboracion
INSERT INTO colaboracion VALUES ('001','14/10/2015','Opinion acerca de la reserva LA PEDRERA','Recibida','La reserva no puede ser usada para construccion','22/10/2015','LA PEDRERA','123456784','123456786','123456789');
INSERT INTO colaboracion VALUES ('002','10-08/2012','Sugerencia sobre el uso de reserva LA PEDRERA para mineria.','Recibida','proteccion de flora y fauna','15/08/2012','LA PEDRERA','123456784','123456788','123456783');
INSERT INTO colaboracion VALUES ('003','14-OCT-15','Opinion acerca de la reserva LA PEDRERA','Recibida','La reserva no puede ser usada para construccion','22-OCT-15','LA PEDRERA','123456784','123456786','123456789');
INSERT INTO colaboracion VALUES ('004','15/11/2016','Opinion acerca de la reserva LA PEDRERA','Recibida','La reserva puede ser usada para construccion','22/11/2016','LA PEDRERA','12345','12345678','12345678');
INSERT INTO colaboracion VALUES ('005','11/09/2013','Sugerencia sobre el uso de reserva LA PEDRERA para CONSTRUCCION.','Recibida','proteccion de flora y fauna','15/09/2013','LA PEDRERA','123456','12345678','1234567');

--TABLE archivo
INSERT INTO archivo(colaboracion,archivo) VALUES(001,'www.ecoreserva.com');
INSERT INTO archivo(colaboracion,archivo) VALUES(002,'www.fconvida.org/');
INSERT INTO archivo(colaboracion,archivo) VALUES(003,'www.fundacionfepais.org.ar/');
INSERT INTO archivo(colaboracion,archivo) VALUES(004,'www.saludgeoambiental.org/toxicos');
INSERT INTO archivo(colaboracion,archivo) VALUES(005,'www.lanacion.com');
INSERT INTO archivo(colaboracion,archivo) VALUES(006,'www.ecoportal.net/');
INSERT INTO archivo(colaboracion,archivo) VALUES(007,'www.consumer.es');
INSERT INTO archivo(colaboracion,archivo) VALUES(008,'www.minambiente.gov.co/');
INSERT INTO archivo(colaboracion,archivo) VALUES(009,'www.andi.com.co');
INSERT INTO archivo(colaboracion,archivo) VALUES(010,'www.metropol.gov.co');
--****************
--PoblarNoOK
--****************
INSERT INTO ciudadano VALUES('1234567','Sergio','s@gmail.com','111');
INSERT INTO ciudadano VALUES(NULL,'Sergio','s@gmail.com','111');
INSERT INTO foto VALUES('https://es.wikipedia.org/wiki/La_Pedrera_(Amazonas)#/media/File:Colombia_location_map2.svg',NULL,NULL);
INSERT INTO colaboracion VALUES ('010',NULL,'Opinion Serrania Perija',NULL,'La reserva no puede ser usada para ningun otro proposito ademas de conservacion',NULL,'Serrania del Perija','123456784','Ramiro Vargas','123456');
INSERT INTO ciudadano VALUES('0000000000000000000000000000000000','Darius','darius@gmail.com','0000');
INSERT INTO ciudadano VALUES('123456',NULL,'@gmail.com','00000');
INSERT INTO reserva VALUES(NULL,NULL,'En estudio',NULL);
INSERT INTO funcionario VALUES('1234567','15-MAY-94');
INSERT INTO reserva VALUES('SERRANIA DEL PERIJA',NULL,'En estudio',NULL);
INSERT INTO funcionario VALUES('1233','10-MAY-96'); 
--AtributosOK
INSERT INTO colaboracion VALUES('006','25-MAY-14','Opinion reserva SIERRA PERIJA','Recibida','La reserva es apta para mineria','22-JUN-14','SIERRA PERIJA','1234567889','12345678878','123456787782');
INSERT INTO ubicadaEn VALUES('Madriguera',88, 20);
--AtributosNoOK
INSERT INTO COLABORACION VALUES('002','23-OCT-09','Opinion acerca de la reserva SIERRA','Recibida','La reserva puede ser usada para construccion','02-NOV-09','SIERRA','12345678878','12345678888','1234567887987');
INSERT INTO UBICADAEN VALUES('Sierra',2, -21);
--****************
--****************
--Llaves
--****************
--****************
--PRIMARIAS
--****************
ALTER TABLE archivo
ADD CONSTRAINT PK_archivo PRIMARY KEY(colaboracion);

ALTER TABLE ciudadano
ADD CONSTRAINT PK_ciudadano PRIMARY KEY(cedula);

ALTER TABLE colaboracion
ADD CONSTRAINT PK_colaboracion PRIMARY KEY(numero);

ALTER TABLE departamento
ADD CONSTRAINT PK_departamento PRIMARY KEY(identificador);

ALTER TABLE foto
ADD CONSTRAINT PK_foto PRIMARY KEY(reserva);

ALTER TABLE funcionario
ADD CONSTRAINT PK_funcionario PRIMARY KEY(ciudadano);

ALTER TABLE unidad
ADD CONSTRAINT PK_unidad PRIMARY KEY(numero);

ALTER TABLE ubicadaEn
ADD CONSTRAINT PK_ubicadaEn PRIMARY KEY(reserva);

ALTER TABLE reserva
ADD CONSTRAINT PK_reserva PRIMARY KEY(nombre);
--ALTER TABLE esconocidapor
--ADD CONSTRAINT PK_esconocidapor PRIMARY KEY(reserva,funcionario);

--****************
--UNICAS
--****************
ALTER TABLE colaboracion
ADD CONSTRAINT UK_colaboracion UNIQUE(descripcion);

ALTER TABLE foto
ADD CONSTRAINT UK_foto UNIQUE(Turl);

ALTER TABLE unidad
ADD CONSTRAINT UK_unidad UNIQUE(nombre);
--****************
--FORANEAS
--****************
ALTER TABLE archivo
ADD CONSTRAINT FK_archivo_colaboracion FOREIGN KEY(colaboracion) 
REFERENCES colaboracion(numero) ON DELETE  SET NULL ;

ALTER TABLE colaboracion
ADD CONSTRAINT FK_colaboracion_reserva FOREIGN KEY(reserva)
REFERENCES reserva(nombre) ON DELETE SET NULL;

ALTER TABLE colaboracion
ADD CONSTRAINT FK_colaboracion_ciudadano FOREIGN KEY(realiza)
REFERENCES ciudadano(cedula) ON DELETE SET NULL;

ALTER TABLE colaboracion
ADD CONSTRAINT FK_colaboracion_funcionario FOREIGN KEY(funcionario)
REFERENCES funcionario(ciudadano) ON DELETE SET NULL;

ALTER TABLE colaboracion
ADD CONSTRAINT FK_colaboracion_ciudadano2 FOREIGN KEY(testigo)
REFERENCES ciudadano(cedula) ON DELETE SET NULL;

ALTER TABLE ciudadano
ADD CONSTRAINT FK_cuidadano_unidad FOREIGN KEY(unidad)
REFERENCES unidad(numero) ON DELETE CASCADE;

ALTER TABLE foto
ADD CONSTRAINT FK_foto_reserva FOREIGN KEY(reserva)
REFERENCES reserva(nombre) ON DELETE SET NULL;

ALTER TABLE esconocidapor
ADD CONSTRAINT FK_esconocidapor_funcionario FOREIGN KEY(funcionario)
REFERENCES funcionario(ciudadano) ON DELETE CASCADE;

ALTER TABLE esconocidapor
ADD CONSTRAINT FK_esconocidapor_reserva FOREIGN KEY(reserva)
REFERENCES reserva(nombre) ON DELETE CASCADE;

ALTER TABLE unidad
ADD CONSTRAINT FK_unidad_departamento FOREIGN KEY(departamento)
REFERENCES departamento(identificador) ON DELETE SET NULL;

ALTER TABLE ubicadaEn
ADD CONSTRAINT FK_ubicadaEn_reserva FOREIGN KEY(reserva)
REFERENCES reserva(nombre) ON DELETE CASCADE;

ALTER TABLE ubicadaEn
ADD CONSTRAINT FK_ubicadaEn_unidad FOREIGN KEY(departamento)
REFERENCES unidad(numero) ON DELETE CASCADE;
--****************
--Atributos
--****************
ALTER TABLE archivo
ADD CONSTRAINT CK_archivo_colaboraciones CHECK (colaboracion>0);

ALTER TABLE ciudadano
ADD CONSTRAINT CK_ciudadano_cedula CHECK (cedula>0);

ALTER TABLE colaboracion
ADD CONSTRAINT CK_colaboracion_numero CHECK (numero>0);

ALTER TABLE departamento
ADD CONSTRAINT CK_departamento_identificador CHECK (identificador>0);

ALTER TABLE esconocidapor
ADD CONSTRAINT CK_esconocidapor_funcionario CHECK (funcionario>0);

ALTER TABLE foto
ADD CONSTRAINT CK_foto_Turl CHECK (Turl LIKE 'https://%.%');

ALTER TABLE ubicadaEn
ADD CONSTRAINT CK_ubicadaEn_porcentaje CHECK (porcentaje>0);

ALTER TABLE unidad
ADD CONSTRAINT CK_unidad_numero CHECK (numero>0);
--****************
--Disparadores
--****************
-- La fecha corresponde a la del dia de adci�n y el estado inicial es enEstudio
CREATE OR REPLACE TRIGGER Automatizacion_Reserva
BEFORE INSERT ON reserva
FOR EACH ROW
BEGIN
:new.estado := 'en studio';
:new.fecha := SYSDATE;
END Automatizacion_Reserva;
-- El nombre y la fecha de registro de la reserva no se pueden modificar
CREATE OR REPLACE TRIGGER Modificacion_Reserva
BEFORE UPDATE OF nombre, fecha 
ON reserva
BEGIN 
raise_application_error(-2030,'No es permitido modificar nombre o fecha de las reservas');
END Modificacion_Reserva;
-- Los porcentajes asociados a su ubicaci�n no pueden ser mayores al 100%
CREATE OR REPLACE TRIGGER Porcentaje_UbicadaEn
BEFORE INSERT 
ON ubicadaEn
FOR EACH ROW
WHEN(new.porcentaje>100)
BEGIN 
  :new.porcentaje := :old.porcentaje;
  raise_application_error(-2031,'No es permitido los porcentajes asociados a su ubicaci�n mayores al 100%');
END Porcentaje_UbicadaEn;
--- Se debe poder eliminar la reserva, si no hay contribuciones sobre ella.
CREATE OR REPLACE TRIGGER Eliminar_Reserva
BEFORE DELETE ON reserva
FOR EACH ROW
DECLARE
contador number(3):=0;
BEGIN
SELECT COUNT(*) INTO contador FROM colaboracion where :old.nombre=reserva;
if contador>0 then
raise_application_error(-20050,'No se puede eliminar una reserva que tenga una colaboracion');
END IF;
END Eliminar_Reserva;
--Modificacion_Funcionario
CREATE OR REPLACE TRIGGER Modificacion_Funcionario
BEFORE UPDATE OF ciudadano, vinculacion 
ON funcionario
BEGIN 
raise_application_error(-2032,'No es permitido modificar estos datos');
END Modificacion_Funcionario;
--Eliminar_Funcionario
CREATE OR REPLACE TRIGGER Eliminar_Funcionario
BEFORE DELETE ON funcionario
BEGIN 
raise_application_error(-2033,'No es permitido borrar estos datos');
END Eliminar_Funcionario;
--****************
--Eliminar Disparadores
--****************
--DROP TRIGGERS
DROP TRIGGER Automatizacion_Reserva;
DROP TRIGGER Modificacion_Reserva;
DROP TRIGGER Porcentaje_UbicadaEn;
DROP TRIGGER Eliminar_Reserva;
DROP TRIGGER Modificacion_Funcionario;
DROP TRIGGER Eliminar_Funcionario;
--****************
--DisparadoresOK
--****************
INSERT INTO reserva(nombre,detalle) VALUES('Mineria','');
INSERT INTO reserva(nombre,detalle) VALUES('Serrania Minera','');
INSERT into ubicadaEn VALUES('Serrania De Perija',22,85);
INSERT into ubicadaEn VALUES('Serrania Del Baudo',23,95);
UPDATE reserva SET nombre = 'Test Reserva' WHERE nombre='Mineria';
UPDATE reserva SET nombre = 'Test Reserva' WHERE nombre='Serrania Minera';
INSERT into ubicadaEn VALUES('SIERRA NEVADA',120,24);
INSERT INTO colaboracion VALUES ('001','10-MAY-15','Opinion de la reserva La Mitica','Recibida','La reserva puede ser usada para turismo','15-MAY-15','La Mitica','12344','123486','12349');
DELETE FROM reserva WHERE nombre='La Mitica';
DELETE FROM reserva WHERE nombre='Mineria';
UPDATE reserva SET nombre= 'Cantera Turistica';
UPDATE reserva SET estado = 'cancelado';
INSERT INTO ciudadano VALUES('1874593349','Mateo','mat@gmail.com',11);
UPDATE ciudadano SET cedula='' WHERE cedula='1874593349';
DELETE FROM ciudadano WHERE cedula='1874593349';
INSERT INTO ciudadano VALUES('9823232642','Juan','juanito@gmail.com',2);
--****************
--DisparadoresNoOK
--****************
UPDATE reserva SET estado = 'En Espera';
DELETE FROM reserva;
UPDATE reserva set nombre='Reserva Nacional';
INSERT into ubicadaEn VALUES('Sierra De San Baudo',102,30);
INSERT INTO ciudadano VALUES('1874593349','Mateo','mat@gmail.com',11);
UPDATE ciudadano SET cedula='' WHERE cedula='1874593349';
DELETE FROM ciudadano WHERE cedula='1874593349';
INSERT INTO ciudadano VALUES('9823232642','Juan','juanito@gmail.com',2);
INSERT INTO reserva VALUES('Tarapac�','01/05/1909','Peligro','Corregimiento departamental colombiano');
INSERT INTO reserva VALUES('Pt Alegre','02/05/1981','Peligro','Corregimiento departamental colombiano');
--****************
--Eliminar Informacion de tablas
--****************
--Acciones OK
DELETE FROM ciudadano;
DELETE FROM colaboracion;
DELETE FROM departamento;
DELETE FROM esconocidapor;
DELETE FROM foto;
DELETE FROM funcionario;
DELETE FROM reserva;
DELETE FROM ubicadaEn;
DELETE FROM unidad;
DELETE FROM archivo;
--****************
--Eliminar Tablas
--****************
DROP TABLE ciudadano CASCADE CONSTRAINTS;
DROP TABLE colaboracion CASCADE CONSTRAINTS;
DROP TABLE departamento CASCADE CONSTRAINTS;
DROP TABLE esconocidapor CASCADE CONSTRAINTS;
DROP TABLE foto CASCADE CONSTRAINTS;
DROP TABLE funcionario CASCADE CONSTRAINTS;
DROP TABLE reserva CASCADE CONSTRAINTS;
DROP TABLE ubicadaEn CASCADE CONSTRAINTS;
DROP TABLE unidad CASCADE CONSTRAINTS;
DROP TABLE archivo CASCADE CONSTRAINTS;