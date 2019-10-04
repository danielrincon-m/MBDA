ALTER TABLE contiene
ADD CONSTRAINT CK_CONTIENE_CANTIDAD
CHECK (cantidad > 0);

ALTER TABLE licores_especificos
ADD CONSTRAINT CK_LICORES_COLOR
CHECK (color IN('Rojo','Amarillo','Azul', 'Verde', 'Morado', 'Negro', 'Incoloro','Cafe'));

ALTER TABLE tiene_pres
ADD CONSTRAINT CK_TIENE_PRES_PRECIO
CHECK (precio_venta >0 AND MOD(precio_venta, 50) = 0);

ALTER TABLE esde
ADD CONSTRAINT CK_ESDE_PRECIOU
CHECK (precio_unitario >0 AND MOD(precio_unitario, 50) = 0);

ALTER TABLE licores_especificos
ADD CONSTRAINT CK_LICORESP_POR_ALCOHOL
CHECK (por_alcohol >0 AND por_alcohol<=100);

ALTER TABLE coctel
ADD CONSTRAINT CK_COCTEL_HIELO
CHECK (hielo IN('Y', 'N'));

ALTER TABLE presentaciones
ADD CONSTRAINT CK_PRESENTA_CANTIDAD
CHECK(cantidad LIKE ('%L') OR cantidad LIKE ('%ML'));


ALTER TABLE esde
ADD CONSTRAINT CK_ESDE_PRESENTACION
CHECK(presentacion LIKE ('%L') OR presentacion LIKE ('%ML'));

ALTER TABLE licor
ADD CONSTRAINT CK_LICORES_RANGO
CHECK(rango_alc LIKE('%-%'));

Alter table paises
Add Constraint Ck_paises_nombre
Check (nombre Not like ' ');

Alter table casas
Add Constraint Ck_casas_nombre
Check (nombre Not like ' ');

Alter table presentaciones
Add Constraint Ck_presentaciones_cant
Check (cantidad Not Like 'L' or cantidad Not Like 'ML');

Alter table licores_especificos
Add Constraint Ck_Licores_Esp_Nombre
Check (nombre Not Like ' ');

Alter table licor
Add Constraint Ck_Licor_Nombre
Check (nombre Not Like ' ');

Alter table En_base
Add Constraint Ck_En_base_en_base
Check (en_base Not Like ' ');

Alter table coctel
Add Constraint Ck_Coctel_nombre
Check (nombre Not Like ' ');

Alter table ingredientes
Add Constraint Ck_ingredientes_ingrediente
Check (ingrediente Not Like ' ');