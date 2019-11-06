--************
--(Tablas) 
--************
CREATE TABLE camera(id NUMBER(11) NOT NULL, perim VARCHAR2(3));
CREATE TABLE vehicle(id VARCHAR2(9) NOT NULL, keeper NUMBER(11),descripcion XMLTYPE);
CREATE TABLE permit(reg VARCHAR2(9) NOT NULL, sDate TIMESTAMP NOT NULL, chargeType VARCHAR2(10));
CREATE TABLE image(camera NUMBER(11) NOT NULL, whn TIMESTAMP NOT NULL, reg VARCHAR2(9));
CREATE TABLE keeper(id NUMBER(11) NOT NULL, name VARCHAR2(20) , address VARCHAR2(25));
CREATE TABLE tarifas(chargeType VARCHAR(10),numero_de_dias NUMBER(10),valor_del_cobro NUMBER(10));
CREATE TABLE pagos(numero NUMBER(10), fecha TIMESTAMP NOT NULL, valor NUMBER(10), permiso_asociado VARCHAR2(9));
--************
--ATRIBUTOS 
--************
ALTER TABLE camera 
ADD CONSTRAINT CK_camera_id CHECK (id > 0);

ALTER TABLE camera 
ADD CONSTRAINT CK_camera_perim CHECK(perim='IN' or perim='OUT' or perim=NULL);

ALTER TABLE permit 
ADD CONSTRAINT CK_permit_chargetype CHECK (chargetype in ('Monthly','Weekly','Daily','Annual'));

ALTER TABLE vehicle
ADD CONSTRAINT CK_vehicle_id CHECK((REGEXP_LIKE(SUBSTR(id,1,2),'^[A-Z]+$')AND REGEXP_LIKE(SUBSTR(id,4,3),'^[0-9]+$') AND REGEXP_LIKE(SUBSTR(id,8,2),'^[A-Z]+$'))
              and (id like('% % %')));

ALTER TABLE image 
ADD CONSTRAINT CK_image_camera CHECK(camera>0);

ALTER TABLE keeper 
ADD CONSTRAINT CK_keeper_id CHECK(id>0);
--************
--PRIMARIAS
--************
ALTER TABLE pagos
ADD CONSTRAINT PK_pagos PRIMARY KEY(numero);

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
--************
--FORANEAS
--************
ALTER TABLE image
ADD CONSTRAINT FK_image_camera
FOREIGN KEY (camera)
REFERENCES camera(id);

ALTER TABLE vehicle
ADD CONSTRAINT FK_vehicle_keeper
FOREIGN KEY (keeper)
REFERENCES keeper(id);

ALTER TABLE pagos
ADD CONSTRAINT FK_pagos_permit
FOREIGN KEY (permiso_asociado,fecha)
REFERENCES permit(reg,sDate);

ALTER TABLE image
ADD CONSTRAINT FK_image_vehicle
FOREIGN KEY (reg)
REFERENCES vehicle(id) ON DELETE CASCADE;

ALTER TABLE permit
ADD CONSTRAINT FK_permit_vehicle
FOREIGN KEY (reg)
REFERENCES vehicle(id) ON DELETE CASCADE;
--************
--TRIGGERS
--************

--TRIGGER Ad_RATE
CREATE OR REPLACE TRIGGER Ad_RATE
BEFORE INSERT ON tarifas 
FOR EACH ROW
BEGIN 
SELECT valor_del_cobro INTO :new.valor_del_cobro 
FROM tarifas
WHERE MOD(valor_del_cobro,50)=0;
END Ad_RATE;
/
--CONSECUTIVOS
CREATE OR REPLACE TRIGGER ID_Consecutivo
BEFORE INSERT ON camera
FOR EACH ROW
BEGIN 
SELECT COUNT(*)+1 INTO :new.id
FROM camera;
END ID_Consecutivo;
/
--Al modificar no se permite bajar el valor del cobro
--trigger MoRate
CREATE OR REPLACE TRIGGER valorCobro_Check
BEFORE UPDATE OF valor_del_cobro ON tarifas
FOR EACH ROW
WHEN (new.valor_del_cobro<old.valor_del_cobro)
BEGIN 
:new.valor_del_cobro := :old.valor_del_cobro;
raise_application_error(-2020,'valor del cobro debe ser MAYOR al valor de cobro anterior');
END valorCobro_Check;
/
--TRIGGER Mo_PAYMENT
CREATE OR REPLACE TRIGGER Mo_PAYMENT
BEFORE UPDATE ON pagos
FOR EACH ROW
BEGIN
raise_application_error(-20030,'La modificacion de valores no es permitida');
END  Mo_PAYMENT;
/
--TRIGGER El_PAYMENT 
CREATE OR REPLACE TRIGGER El_PAYMENT
BEFORE DELETE ON pagos
FOR EACH ROW
BEGIN
raise_application_error(-20031,'La eliminacion de valores no es permitida');
END  El_PAYMENT;
/
--**********
--TRIGGER BORRAR
--**********
DROP TRIGGER Ad_PAYMENT;
DROP TRIGGER Mo_PAYMENT;
DROP TRIGGER El_PAYMENT;
DROP TRIGGER ID_Consecutivo;
DROP TRIGGER valorCobro_Check;
DROP TRIGGER Ad_RATE;
--*****************

--**********
--Poblar OK
--*****************
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('IN');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
INSERT INTO camera(perim) VALUES('OUT');
--*****************
INSERT INTO keeper VALUES (1,'Ambiguous, Arthur','Absorption Ave.');
INSERT INTO keeper VALUES (2,'Inconspicuous, Iain', 'Interception Rd.');
INSERT INTO keeper VALUES (3,'Contiguous, Carol', 'Circumscription Close');
INSERT INTO keeper VALUES (4,'Strenuous, Sam','Surjection Street');
INSERT INTO keeper VALUES (5,'Assiduous, Annie','Attribution Alley');
INSERT INTO keeper VALUES (6,'Incongruous, Ingrid','Irresolution Pl.');
--*************
--##(PoblarOKFinal)
--*************
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 021 AS',1,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Nissan Murano" anho = "2015" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2015-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "Hidraulicos" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "56000000" nombre = "Juan Arkangel" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);

INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 022 BS', 3,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Mazda 3" anho = "2015" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2015-12-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Asistida" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> Airbags SI </accesorio> 
      <accesorio> Asistente Arranque SI <accesorio>
    </Seguridad>
    <Datos_Venta valor = "80500000" nombre = "Juana Arkangel" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 023 CS', 1,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ferrari FXX" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> Airbags SI </accesorio>
      <accesorio> Asistente Arranque SI </accesorio>
    </Seguridad>
    <Datos_Venta valor = "889000000" nombre = "Santa Claus" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 024 DS', 4,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Chevrolet Tahoe" anho = "2005" color = "Gris">
    <Recorrido Kilometraje = "100550" Fecha = "2007-11-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Asistida" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> Airbags SI </accesorio>
      <accesorio> Asistente Arranque SI </accesorio>
    </Seguridad>
    <Datos_Venta valor = "59000000" nombre = "Donha Claus" telefono = "3005858029"></Datos_Venta>
    <Otra_Informacion>Gasolina Premium</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 025 ES', 1,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Hyunday Tucson" anho = "2008" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2009-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> Airbags SI </accesorio>
      <accesorio> Asistente Arranque SI </accesorio>
    </Seguridad>  
    <Datos_Venta valor = "54000000" nombre = "Donald Trump" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 026 FS', 3,
'<?xml version="1.0"?>
<descripcion>
  <Datos_Basicos modelo = "Mercedez Clase C" anho = "2016" color = "Gris">
    <Recorrido Kilometraje = "1550" Fecha ="2016-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Asistida Mecanica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> Airbags SI </accesorio>
      <accesorio> Asistente Arranque SI </accesorio>
    </Seguridad>
    <Datos_Venta valor = "890000000" nombre = "Silvestre Stallin" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Corriente</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 027 GS', 6,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ferrari Luxury" anho = "2014" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "950000000" nombre = "Ss Clinton" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 028 HS', 5,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Toyota Z" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "850000000" nombre = "Juan Claus" telefono = "3002558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 029 IS', 6,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Chevrolet Trucker" anho = "2004" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "900000000" nombre = "Enzo Dell" telefono = "3005408029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 020 JS', 2,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ford Edge" anho = "2013" color = "Gris">
    <Recorrido Kilometraje = "105500" Fecha = "2013-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "56000000" nombre = "San Miguel" telefono = "3003558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 011 KS', 5,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ford F150" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "105500" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "30000000" nombre = "Pedro Claus" telefono = "3005108029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 012 LS', 2,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Chevrolet" anho = "2015" color = "Gris">
    <Recorrido Kilometraje = "10580" Fecha = "2015-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "70000000" nombre = "Juan Marciano" telefono = "3009958029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 013 MS', 2,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Nissan Versa" anho =  "2004" color = "Gris">
    <Recorrido Kilometraje = "2205500" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "30000000" nombre = "Claus Sats" telefono = "3003558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 014 NS', 4,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ferrari Viejo" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "105005000" Fecha = "1990-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "95000000" nombre = "Hilary Jil" telefono = "3005058029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 015 OS', 6,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Toyota Corolla" anho = "2003" color = "Gris">
    <Recorrido Kilometraje = "10550000" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "450000000" nombre = "Carlos Clausula" telefono = "3005558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 016 PS', 4,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Toyota Prado" anho = "2007" color = "Gris"></Datos_Basicos>
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "900000000" nombre = "Closte Mrion" telefono = "3009558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 017 QS', 6,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Nissan X" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "700000000" nombre = "Marciano Dangong" telefono = "3004558029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);
INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 018 RS', 1,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Mazda Old" anho = "2007" color = "Gris">
    <Recorrido Kilometraje = "1050050" Fecha = "2003-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "200000000" nombre = "Marcha Rubio" telefono = "3005858029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);

INSERT INTO vehicle(id, keeper, descripcion) VALUES ('SO 019 SS', 2,
'<?xml version="1.0"?>
<descripcion>
	<Datos_Basicos modelo = "Ferrari California" anho = "2014" color = "Gris">
    <Recorrido Kilometraje = "10550" Fecha = "2007-02-10"></Recorrido>
    <Especificaciones Tipo_Direccion = "Hidraulica" Tipo_Frenos = "ABS" Cantidad_Cambios = "6" Rin_Size = "18"></Especificaciones>
    <Seguridad>
      <accesorio> SI airbags </accesorio>
      <accesorio> SI Asistente Arranque </accesorio> 
    </Seguridad>
    <Datos_Venta valor = "15000000" nombre = "Penta Claus" telefono = "3001058029"></Datos_Venta>
    <Otra_Informacion>Gasolina Diesel</Otra_Informacion>
  </Datos_Basicos>
</descripcion>'
);

INSERT INTO permit VALUES('SO 021 AS', TO_DATE('2006-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 022 BS', TO_DATE('2006-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 023 CS', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 024 DS', TO_DATE('2007-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 025 ES', TO_DATE('2007-02-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 026 FS', TO_DATE('2007-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 027 GS', TO_DATE('2007-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Weekly');
INSERT INTO permit VALUES('SO 028 HS', TO_DATE('2006-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 029 IS', TO_DATE('2006-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 020 JS', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 011 KS', TO_DATE('2007-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 012 LS', TO_DATE('2007-02-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 013 MS', TO_DATE( '2007-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 014 NS', TO_DATE('2007-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 015 OS', TO_DATE('2006-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 016 PS', TO_DATE('2006-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Monthly');
INSERT INTO permit VALUES('SO 017 QS', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Annual');
INSERT INTO permit VALUES('SO 018 RS', TO_DATE('2007-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Annual');
INSERT INTO permit VALUES('SO 019 SS', TO_DATE('2007-02-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Annual');
INSERT INTO permit VALUES('SO 031 TS', TO_DATE('2007-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Annual');
INSERT INTO permit VALUES('SO 032 AT', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 033 BT', TO_DATE('2006-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 034 CT', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 035 DT', TO_DATE('2007-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 036 ET', TO_DATE('2007-02-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 037 FT', TO_DATE('2007-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 038 GT', TO_DATE('2007-02-28 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 039 HT', TO_DATE('2006-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 040 IT', TO_DATE('2006-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 041 JT', TO_DATE('2007-01-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 042 KT', TO_DATE('2007-01-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 043 MU', TO_DATE('2007-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 044 NU', TO_DATE('2006-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 045 OU', TO_DATE('2007-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 046 PU', TO_DATE('2007-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 047 QU', TO_DATE('2007-02-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 048 FP', TO_DATE('2007-02-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 049 GP', TO_DATE('2007-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 050 HP', TO_DATE('2006-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 051 IP', TO_DATE('2006-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 052 JP', TO_DATE('2007-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 053 KT', TO_DATE('2007-01-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 054 TP', TO_DATE('2007-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 055 BP', TO_DATE('2007-02-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 056 TP', TO_DATE('2007-02-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 057 BP', TO_DATE('2007-02-06 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');
INSERT INTO permit VALUES('SO 058 BP', TO_DATE('2007-02-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'Daily');

INSERT INTO image VALUES(1, TO_DATE('2007-02-25 06:10:13', 'YYYY-MM-DD HH24:MI:SS'), 'SO 021 AS');
INSERT INTO image VALUES(17, TO_DATE('2007-02-25 06:20:01', 'YYYY-MM-DD HH24:MI:SS'), 'SO 022 BS');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 06:23:40', 'YYYY-MM-DD HH24:MI:SS'), 'SO 023 CS');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 06:26:04', 'YYYY-MM-DD HH24:MI:SS'), 'SO 024 DS');
INSERT INTO image VALUES(17, TO_DATE('2007-02-25 06:57:31', 'YYYY-MM-DD HH24:MI:SS'), 'SO 025 ES');
INSERT INTO image VALUES(17, TO_DATE('2007-02-25 07:00:40', 'YYYY-MM-DD HH24:MI:SS'), 'SO 026 FS');
INSERT INTO image VALUES(12, TO_DATE('2007-02-25 07:04:31', 'YYYY-MM-DD HH24:MI:SS'), 'SO 027 GS');
INSERT INTO image VALUES(5, TO_DATE('2007-02-25 07:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'SO 028 HS');
INSERT INTO image VALUES(16, TO_DATE('2007-02-25 07:13:00', 'YYYY-MM-DD HH24:MI:SS'), 'SO 029 IS');
INSERT INTO image VALUES(2, TO_DATE('2007-02-25 07:20:01', 'YYYY-MM-DD HH24:MI:SS'), 'SO 020 JS');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 07:23:00', 'YYYY-MM-DD HH24:MI:SS'), 'SO 011 KS');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 07:26:31', 'YYYY-MM-DD HH24:MI:SS'), 'SO 012 LS');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 07:29:00', 'YYYY-MM-DD HH24:MI:SS'), 'SO 013 MS');
INSERT INTO image VALUES(8, TO_DATE('2007-02-25 07:35:41', 'YYYY-MM-DD HH24:MI:SS'), 'SO 014 NS');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 07:39:04', 'YYYY-MM-DD HH24:MI:SS'), 'SO 015 OS');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 07:42:30', 'YYYY-MM-DD HH24:MI:SS'), 'SO 016 PS');
INSERT INTO image VALUES(10, TO_DATE('2007-02-25 07:45:11', 'YYYY-MM-DD HH24:MI:SS'), 'SO 017 QS');
INSERT INTO image VALUES(8, TO_DATE('2007-02-25 07:48:10', 'YYYY-MM-DD HH24:MI:SS'), 'SO 018 RS');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 07:51:10', 'YYYY-MM-DD HH24:MI:SS'), 'SO 019 SS');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 07:55:11', 'YYYY-MM-DD HH24:MI:SS'), 'SO 031 TS');
INSERT INTO image VALUES(11, TO_DATE('2007-02-25 07:58:01', 'YYYY-MM-DD HH24:MI:SS'), 'SO 032 AT');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 16:28:40', 'YYYY-MM-DD HH24:MI:SS'), 'SO 033 BT');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:31:01', 'YYYY-MM-DD HH24:MI:SS'), 'SO 034 CT');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 16:38:31', 'YYYY-MM-DD HH24:MI:SS'), 'SO 035 DT');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:39:10', 'YYYY-MM-DD HH24:MI:SS'), 'SO 036 ET');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:45:04', 'YYYY-MM-DD HH24:MI:SS'), 'SO 037 FT');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:48:11', 'YYYY-MM-DD HH24:MI:SS'), 'SO 038 GT');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:51:30', 'YYYY-MM-DD HH24:MI:SS'), 'SO 039 HT');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 16:58:01', 'YYYY-MM-DD HH24:MI:SS'), 'SO 040 IT');
INSERT INTO image VALUES(12, TO_DATE('2007-02-25 17:01:13', 'YYYY-MM-DD HH24:MI:SS'), 'SO 041 JT');
INSERT INTO image VALUES(3, TO_DATE('2007-02-25 17:07:00', 'YYYY-MM-DD HH24:MI:SS'), 'SO 042 KT');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 17:10:43', 'YYYY-MM-DD HH24:MI:SS'), 'SO 043 MU');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 17:14:11', 'YYYY-MM-DD HH24:MI:SS'), 'SO 044 NU');
INSERT INTO image VALUES(3, TO_DATE('2007-02-25 17:17:03', 'YYYY-MM-DD HH24:MI:SS'), 'SO 045 OU');
INSERT INTO image VALUES(10, TO_DATE('2007-02-25 18:23:11', 'YYYY-MM-DD HH24:MI:SS'), 'SO 046 PU');
INSERT INTO image VALUES(11, TO_DATE('2007-02-25 18:26:13', 'YYYY-MM-DD HH24:MI:SS'), 'SO 047 QU');
INSERT INTO image VALUES(12, TO_DATE('2007-02-25 18:29:01', 'YYYY-MM-DD HH24:MI:SS'),'SO 048 UP');
INSERT INTO image VALUES(3, TO_DATE('2007-02-25 18:33:10', 'YYYY-MM-DD HH24:MI:SS'),'SO 049 PP');
INSERT INTO image VALUES(15, TO_DATE('2007-02-25 18:36:31', 'YYYY-MM-DD HH24:MI:SS'),'SO 050 YP');
INSERT INTO image VALUES(3, TO_DATE('2007-02-25 18:39:10', 'YYYY-MM-DD HH24:MI:SS'),'SO 051 PJ');
INSERT INTO image VALUES(10, TO_DATE('2007-02-26 05:13:30', 'YYYY-MM-DD HH24:MI:SS'),'SO 052 SP');
INSERT INTO image VALUES(18, TO_DATE('2007-02-25 16:29:11', 'YYYY-MM-DD HH24:MI:SS'),'SO 053 DP');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 16:31:01', 'YYYY-MM-DD HH24:MI:SS'),'SO 054 DT');
INSERT INTO image VALUES(19, TO_DATE('2007-02-25 17:42:41', 'YYYY-MM-DD HH24:MI:SS'),'SO 055 UY');
INSERT INTO image VALUES(9, TO_DATE('2007-02-25 18:54:30', 'YYYY-MM-DD HH24:MI:SS'),'SO 056 OI');
INSERT INTO image VALUES(3, TO_DATE('2007-02-25 17:16:11', 'YYYY-MM-DD HH24:MI:SS'),'SO 057 PI');
INSERT INTO image VALUES(10, TO_DATE('2007-02-25 18:08:40', 'YYYY-MM-DD HH24:MI:SS'),'SO 058 OP');
INSERT INTO image VALUES(11, TO_DATE('2007-02-25 18:08:00', 'YYYY-MM-DD HH24:MI:SS'),'SO 059 FP');
INSERT INTO image VALUES(12, TO_DATE('2007-02-25 18:08:13', 'YYYY-MM-DD HH24:MI:SS'),'SO 060 GP');



DELETE FROM camera;

DELETE FROM image;

DELETE FROM KEEPER;

DELETE FROM PERMIT;

DELETE FROM VEHICLE;

DROP TABLE permit CASCADE CONSTRAINTS;

DROP TABLE image CASCADE CONSTRAINTS;

DROP TABLE camera CASCADE CONSTRAINTS;

DROP TABLE vehicle CASCADE CONSTRAINTS;

DROP TABLE keeper CASCADE CONSTRAINTS;

DROP TABLE tarifas CASCADE CONSTRAINTS;

DROP TABLE pagos CASCADE CONSTRAINTS;