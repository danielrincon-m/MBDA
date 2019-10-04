--¿? Crear la base de datos sin restricciones (Tablas) 
CREATE TABLE camera(id NUMBER(11) NOT NULL, perim VARCHAR2(3));
CREATE TABLE vehicle(id VARCHAR2(10) NOT NULL, keeper NUMBER(11));
CREATE TABLE permit(reg VARCHAR2(10) NOT NULL, sDate TIMESTAMP NOT NULL, chargeType VARCHAR2(10));
CREATE TABLE image(camera NUMBER(11) NOT NULL, whn TIMESTAMP NOT NULL, reg VARCHAR2(10));
CREATE TABLE keeper(id NUMBER(11) NOT NULL, name VARCHAR2(20) , address VARCHAR2(25));
--¿? Adicionar las restricciones a la base de datos  (Atributos,Primarias, Unicas, Foraneas)
--¿?ATRIBUTOS 
ALTER TABLE camera 
ADD CONSTRAINT CK_camera_id CHECK (id > 0);
ALTER TABLE camera 
ADD CONSTRAINT CK_camera_perim CHECK(perim='IN' or perim='OUT');
ALTER TABLE permit 
ADD CONSTRAINT CK_permit_chargetype CHECK (chargetype in ('Monthly','Weekly','Daily','Annual'));
ALTER TABLE vehicle
ADD CONSTRAINT CK_vehicle_id CHECK(id like 'SO 02%P');
ALTER TABLE image 
ADD CONSTRAINT CK_image_camera CHECK(camera>0);
ALTER TABLE keeper 
ADD CONSTRAINT CK_keeper_id CHECK(id>0);
--¿? Poblar la base de datos con los datos iniciales (PoblarOK)
--¿?PRIMARIAS
ALTER TABLE camera
ADD CONSTRAINT PK_camera PRIMARY KEY (id);

ALTER TABLE image
ADD CONSTRAINT PK_image PRIMARY KEY (camera, whn);

ALTER TABLE keeper
ADD CONSTRAINT PK_keeper PRIMARY KEY (id);

ALTER TABLE permit
ADD CONSTRAINT PK_permit PRIMARY KEY (reg, sDate);

ALTER TABLE vehicle
ADD CONSTRAINT PK_vehicle PRIMARY KEY (id);
--¿?FORANEAS 
ALTER TABLE image
ADD CONSTRAINT FK_image_camera
FOREIGN KEY (camera)
REFERENCES camera(id);

ALTER TABLE image
ADD CONSTRAINT FK_image_vehicle
FOREIGN KEY (reg)
REFERENCES vehicle(id);

ALTER TABLE permit
ADD CONSTRAINT FK_permit_vehicle
FOREIGN KEY (reg)
REFERENCES vehicle(id);

ALTER TABLE vehicle
ADD CONSTRAINT FK_vehicle_keeper
FOREIGN KEY (keeper)
REFERENCES keeper(id);


--¿? Poblar la base de datos con los datos iniciales (PoblarOK) 
--##
INSERT INTO camera VALUES(1,'IN');
INSERT INTO camera VALUES(2,'IN');
INSERT INTO camera VALUES(3,'IN');
INSERT INTO camera VALUES(4,'IN');
INSERT INTO camera VALUES(5,'IN');
INSERT INTO camera VALUES(6,'IN');
INSERT INTO camera VALUES(7,'IN');
INSERT INTO camera VALUES(8,'IN');
INSERT INTO camera VALUES(9,'OUT');
INSERT INTO camera VALUES(10,'OUT');
INSERT INTO camera VALUES(11,'OUT');
INSERT INTO camera VALUES(12,'OUT');
INSERT INTO camera VALUES(13,'OUT');
INSERT INTO camera VALUES(14,'OUT');
INSERT INTO camera VALUES(15,'OUT');
INSERT INTO camera VALUES(16,'OUT');
INSERT INTO camera VALUES(17,'');
INSERT INTO camera VALUES(18,'');
INSERT INTO camera VALUES(19,'');
--##
INSERT INTO keeper VALUES (1,'Ambiguous, Arthur','Absorption Ave.');
INSERT INTO keeper VALUES (2,'Inconspicuous, Iain', 'Interception Rd.');
INSERT INTO keeper VALUES (3,'Contiguous, Carol', 'Circumscription Close');
INSERT INTO keeper VALUES (4,'Strenuous, Sam','Surjection Street');
INSERT INTO keeper VALUES (5,'Assiduous, Annie','Attribution Alley');
INSERT INTO keeper VALUES (6,'Incongruous, Ingrid','Irresolution Pl.');

--##
INSERT INTO vehicle VALUES ('SO 02 ASP',1);
INSERT INTO vehicle VALUES ('SO 02 BSP',3);
INSERT INTO vehicle VALUES ('SO 02 CSP',1);
INSERT INTO vehicle VALUES ('SO 02 DSP',4);
INSERT INTO vehicle VALUES ('SO 02 ESP',1);
INSERT INTO vehicle VALUES ('SO 02 FSP',3);
INSERT INTO vehicle VALUES ('SO 02 GSP',6);
INSERT INTO vehicle VALUES ('SO 02 HSP',5);
INSERT INTO vehicle VALUES ('SO 02 ISP',6);
INSERT INTO vehicle VALUES ('SO 02 JSP',2);
INSERT INTO vehicle VALUES ('SO 02 KSP',5);
INSERT INTO vehicle VALUES ('SO 02 LSP',2);
INSERT INTO vehicle VALUES ('SO 02 MSP',2);
INSERT INTO vehicle VALUES ('SO 02 NSP',4);
INSERT INTO vehicle VALUES ('SO 02 OSP',6);
INSERT INTO vehicle VALUES ('SO 02 PSP',4);
INSERT INTO vehicle VALUES ('SO 02 QSP',6);
INSERT INTO vehicle VALUES ('SO 02 RSP',1);
INSERT INTO vehicle VALUES ('SO 02 SSP',2);
INSERT INTO vehicle VALUES ('SO 02 TSP',6);
INSERT INTO vehicle VALUES ('SO 02 ATP',1);
INSERT INTO vehicle VALUES ('SO 02 BTP',2);
INSERT INTO vehicle VALUES ('SO 02 CTP',1);
INSERT INTO vehicle VALUES ('SO 02 DTP',3);
INSERT INTO vehicle VALUES ('SO 02 ETP',5);
INSERT INTO vehicle VALUES ('SO 02 FTP',4);
INSERT INTO vehicle VALUES ('SO 02 GTP',5);
INSERT INTO vehicle VALUES ('SO 02 HTP',2);
INSERT INTO vehicle VALUES ('SO 02 ITP',2);
INSERT INTO vehicle VALUES ('SO 02 JTP',4);
INSERT INTO vehicle VALUES ('SO 02 KTP',3);
INSERT INTO vehicle VALUES ('SO 02 MUP','');
INSERT INTO vehicle VALUES ('SO 02 NUP','');
INSERT INTO vehicle VALUES ('SO 02 OUP','');
INSERT INTO vehicle VALUES ('SO 02 PUP','');
INSERT INTO vehicle VALUES ('SO 02 QUP','');

--##
INSERT INTO permit VALUES('SO 02 ASP',TIMESTAMP '2006-01-21 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 BSP',TIMESTAMP '2006-01-30 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 CSP',TIMESTAMP '2007-01-21 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 DSP',TIMESTAMP '2007-01-30 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 ESP',TIMESTAMP '2007-02-21 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 FSP',TIMESTAMP '2007-02-25 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 GSP',TIMESTAMP '2007-02-28 00:00:00','Weekly');
INSERT INTO permit VALUES('SO 02 HSP',TIMESTAMP '2006-01-21 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 ISP',TIMESTAMP '2006-01-30 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 JSP',TIMESTAMP '2007-01-21 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 KSP',TIMESTAMP '2007-01-30 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 LSP',TIMESTAMP '2007-02-21 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 MSP',TIMESTAMP '2007-02-25 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 NSP',TIMESTAMP '2007-02-28 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 OSP',TIMESTAMP '2006-01-21 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 PSP',TIMESTAMP '2006-01-30 00:00:00','Monthly');
INSERT INTO permit VALUES('SO 02 QSP',TIMESTAMP '2007-01-21 00:00:00','Annual');
INSERT INTO permit VALUES('SO 02 RSP',TIMESTAMP '2007-01-30 00:00:00','Annual');
INSERT INTO permit VALUES('SO 02 SSP',TIMESTAMP '2007-02-21 00:00:00','Annual');
INSERT INTO permit VALUES('SO 02 TSP',TIMESTAMP '2007-02-25 00:00:00','Annual');
INSERT INTO permit VALUES('SO 02 ATP',TIMESTAMP '2007-01-21 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2006-01-30 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 CTP',TIMESTAMP '2007-01-21 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 DTP',TIMESTAMP '2007-01-30 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 ETP',TIMESTAMP '2007-02-21 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 FTP',TIMESTAMP '2007-02-25 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 GTP',TIMESTAMP '2007-02-28 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 HTP',TIMESTAMP '2006-01-21 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 ITP',TIMESTAMP '2006-01-30 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 JTP',TIMESTAMP '2007-01-21 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 KTP',TIMESTAMP '2007-01-30 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 ATP',TIMESTAMP '2007-01-22 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2006-01-31 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 CTP',TIMESTAMP '2007-01-22 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 DTP',TIMESTAMP '2007-01-31 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 ETP',TIMESTAMP '2007-02-22 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 FTP',TIMESTAMP '2007-02-26 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 GTP',TIMESTAMP '2007-03-01 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 HTP',TIMESTAMP '2006-01-22 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 ITP',TIMESTAMP '2006-01-31 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 JTP',TIMESTAMP '2007-01-22 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 KTP',TIMESTAMP '2007-01-31 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2007-02-03 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2007-02-04 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2007-02-05 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2007-02-06 00:00:00','Daily');
INSERT INTO permit VALUES('SO 02 BTP',TIMESTAMP '2007-02-07 00:00:00','Daily');
--##
INSERT INTO image VALUES(1,TIMESTAMP '2007-02-25 06:10:13','SO 02 ASP');
INSERT INTO image VALUES(17,TIMESTAMP '2007-02-25 06:20:01','SO 02 ASP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 06:23:40','SO 02 ASP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 06:26:04','SO 02 ASP');
INSERT INTO image VALUES(17,TIMESTAMP '2007-02-25 06:57:31','SO 02 CSP');
INSERT INTO image VALUES(17,TIMESTAMP '2007-02-25 07:00:40','SO 02 CSP');
INSERT INTO image VALUES(12,TIMESTAMP '2007-02-25 07:04:31','SO 02 CSP');
INSERT INTO image VALUES(5,TIMESTAMP '2007-02-25 07:10:00','SO 02 GSP');
INSERT INTO image VALUES(16,TIMESTAMP '2007-02-25 07:13:00','SO 02 GSP');
INSERT INTO image VALUES(2,TIMESTAMP '2007-02-25 07:20:01','SO 02 TSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 07:23:00','SO 02 TSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 07:26:31','SO 02 TSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 07:29:00','SO 02 TSP');
INSERT INTO image VALUES(8,TIMESTAMP '2007-02-25 07:35:41','SO 02 CSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 07:39:04','SO 02 CSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 07:42:30','SO 02 CSP');
INSERT INTO image VALUES(10,TIMESTAMP '2007-02-25 07:45:11','SO 02 CSP');
INSERT INTO image VALUES(8,TIMESTAMP '2007-02-25 07:48:10','SO 02 CSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 07:51:10','SO 02 CSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 07:55:11','SO 02 CSP');
INSERT INTO image VALUES(11,TIMESTAMP '2007-02-25 07:58:01','SO 02 CSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 16:28:40','SO 02 SSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:31:01','SO 02 SSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 16:38:31','SO 02 RSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:39:10','SO 02 RSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:45:04','SO 02 HSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:48:11','SO 02 HSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:51:30','SO 02 HSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 16:58:01','SO 02 ISP');
INSERT INTO image VALUES(12,TIMESTAMP '2007-02-25 17:01:13','SO 02 ISP');
INSERT INTO image VALUES(3,TIMESTAMP '2007-02-25 17:07:00','SO 02 JSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 17:10:43','SO 02 JSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 17:14:11','SO 02 JSP');
INSERT INTO image VALUES(3,TIMESTAMP '2007-02-25 17:17:03','SO 02 JSP');
INSERT INTO image VALUES(10,TIMESTAMP '2007-02-25 18:23:11','SO 02 MUP');
INSERT INTO image VALUES(11,TIMESTAMP '2007-02-25 18:26:13','SO 02 NUP');
INSERT INTO image VALUES(12,TIMESTAMP '2007-02-25 18:29:01','SO 02 OUP');
INSERT INTO image VALUES(3,TIMESTAMP '2007-02-25 18:33:10','SO 02 PUP');
INSERT INTO image VALUES(15,TIMESTAMP '2007-02-25 18:36:31','SO 02 PUP');
INSERT INTO image VALUES(3,TIMESTAMP '2007-02-25 18:39:10','SO 02 PUP');
INSERT INTO image VALUES(10,TIMESTAMP '2007-02-26 05:13:30','SO 02 TSP');
INSERT INTO image VALUES(18,TIMESTAMP '2007-02-25 16:29:11','SO 02 DSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 16:31:01','SO 02 DSP');
INSERT INTO image VALUES(19,TIMESTAMP '2007-02-25 17:42:41','SO 02 DSP');
INSERT INTO image VALUES(9,TIMESTAMP '2007-02-25 18:54:30','SO 02 DSP');
INSERT INTO image VALUES(3,TIMESTAMP '2007-02-25 17:16:11','SO 02 ESP');
INSERT INTO image VALUES(10,TIMESTAMP '2007-02-25 18:08:40','SO 02 ESP');
INSERT INTO image VALUES(11,TIMESTAMP '2007-02-25 18:08:00','SO 02 FSP');
INSERT INTO image VALUES(12,TIMESTAMP '2007-02-25 18:08:13','SO 02 GSP');



--¿? Probar las restricciones con los casos definidos en NoOK (PoblarNoOK) 
INSERT INTO camera VALUES(0,'');

INSERT INTO camera VALUES(5,'HOLA');

INSERT INTO image VALUES(0,'','SQL_ORACLE_PRUEBA');

INSERT INTO keeper VALUES(12,'_SQL_DEVELOPER_ORACLE_PRUEBA_TEST','01234567891011121314151617181920');

INSERT INTO permit VALUES('','','');

INSERT INTO vehicle VALUES('','');

--¿?Probar cada una de las consultas (Consultas)
--1.	Show the name and address of the keeper of vehicle SO 02 PSP.
SELECT name, address 
FROM keeper,vehicle  
WHERE vehicle.keeper = keeper.id
AND vehicle.id='SO 02 PSP'; 
--2.	Show the number of cameras that take images for incoming vehicles.
SELECT count(*) 
FROM camera where perim='IN'; 

--3.	List the image details taken by Camera 10 before 26 Feb 2007.

SELECT whn, reg
FROM image
WHERE camera=10
AND whn>'2007?02?26';


--4.	List the number of images taken by each camera. Your answer should show how many images have been taken by camera 1, camera 2 etc. The list must NOT include the images taken by camera 15, 16, 17, 18 and 19.

SELECT camera,count(*) 
FROM image 
WHERE camera<15 
GROUP BY camera;

--5.	A number of vehicles have permits that start on 30th Jan 2007. List the name and address for each keeper in alphabetical order without duplication.

SELECT distinct name,address 
FROM vehicle,keeper,permit
WHERE permit.sDate='2007?01?30' 
AND permit.reg=vehicle.id
AND keeper.id=vehicle.keeper
ORDER BY name;

--6.	List the owners (name and address) of Vehicles caught by camera 1 or 18 without duplication.

SELECT distinct name, address
FROM image AS i, vehicle AS v, keeper AS k
WHERE i.reg=v.id 
AND v.keeper=k.id AND (i.camera=1 or i.camera=18);


--7.	Show keepers (name and address) who have more than 5 vehicles.

SELECT k.name, k.address, count(v.id) 
FROM keeper AS k, vehicle AS v
WHERE v.keeper= k.id
GROUP BY k.name, k.address
HAVING count(v.id)>5;

--8.	For each vehicle show the number of current permits (suppose today is the 1st of Feb 2007). The list should include the vehicle.s registration and the number of permits. Current permits can be determined based on charge types, e.g. for weekly permit you can use the date after 24 Jan 2007 and before 02 Feb 2007.

SELECT v.id , count(v.id) 
FROM vehicle AS v, permit AS p
WHERE v.id = p.reg AND(  
         (p.chargeType = 'Daily' AND p.sDate = '2007?02?01') OR
         (p.chargeType = 'Weekly' AND p.sDate > '2007?01?24') OR
         (p.chargeType = 'Monthly' AND p.sDate > '2007?01?01') OR
         (p.chargeType = 'Annual' AND p.sDate > '2006?02?01') ) 
GROUP BY v.id;

--9.	Obtain a list of every vehicle passing camera 10 on 25th Feb 2007. Show the time, the registration and the name of the keeper if available.

SELECT whn, reg, name
FROM image AS i,vehicle AS v left outer JOIN keeper AS k 
ON v.keeper= k.id  
WHERE  i.reg=v.id AND Date(i.whn)='2007?02?25' AND i.camera=10;

--10.	List the keepers who have more than 4 vehicles and one of them must have more than 2 permits. The list should include the names and the number of vehicles.

SELECT k.name, count(v.id)
FROM vehicle AS v, keeper AS k, permit AS p
WHERE  v.keeper = k.id AND p.reg = v.id
GROUP BY k.name
HAVING count(v.id)>4 AND count(p.reg) >2;



--12.	There are four types of permit. The most popular type means that this type has been issued the highest number of times. Find out the most popular type, together with the total number of permits issued.

SELECT * 
FROM(SELECT chargeType, count(*) AS ToplamAdet FROM permit GROUP BY chargeType) AS D
ORDER BY ToplamAdet desc
LIMIT 1;

--13.	For each of the vehicles caught by camera 19 - show the registration, the earliest time at camera 19 and the time and camera at which it left the zone.

SELECT i.reg, regs.earlyCaught, c.id AS leftCamera, whn   
FROM image AS i, camera AS c,
             (SELECT i.reg , min(i.whn) AS earlyCaught FROM image AS i
              WHERE i.camera = 19
              GROUP BY reg
             ) AS regs
WHERE regs.reg = i.reg AND
             i.camera = c.id AND
             regs.earlyCaught<i.whn AND
             c.perim = 'OUT' 

--14.	For all 19 cameras - show the position as IN, OUT or INTERNAL and the busiest hour for that camera.

SELECT c.id, IFNULL(c.perim, 'INTERNAL'), Hour FROM camera AS c,
              (SELECT i.camera, Hour(whn) AS Hour,  count(*) AS imagesTaken
              FROM image AS i
              GROUP BY i.camera, Hour(whn)
              ORDER BY i.camera, Hour, imagesTaken desc
             ) AS Hours,
             (SELECT CamHour.camera, Max(imagesTaken) AS MaxImages
FROM  
(select i.camera, Hour(whn) AS Hour, count(*) AS imagesTaken
                FROM image AS i  
GROUP BY i.camera, Hour(whn)
                ORDER BY i.camera, Hour, imagesTaken desc
               ) AS CamHour
              GROUP BY CamHour.camera
             )  AS busiest
WHERE Hours.imagesTaken = busiest.MaxImages AND
             Hours.camera = busiest.camera AND
             c.id = Hours.camera;

--#Despoblar la base de datos (XPoblar)
DELETE FROM camera;

DELETE FROM image;

DELETE FROM KEEPER;

DELETE FROM PERMIT;

DELETE FROM VEHICLE;
--#Eliminar toda la información de la base de datos (XTablas) 
DROP TABLE permit;

DROP TABLE image;

DROP TABLE camera;

DROP TABLE vehicle;

DROP TABLE keeper;

