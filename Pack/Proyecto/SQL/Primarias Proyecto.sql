---------------------------Primarias

ALTER TABLE paises
ADD CONSTRAINT PK_PAISES
PRIMARY KEY (nombre);

ALTER TABLE casas
ADD CONSTRAINT PK_CASAS
PRIMARY KEY (num_casa);

ALTER TABLE presentaciones
ADD CONSTRAINT PK_PRESENTACIONES
PRIMARY KEY (cantidad, material);

ALTER TABLE tiene_pres
ADD CONSTRAINT PK_TIENE_PRES
PRIMARY KEY (presentacion, material, licores_especifico);

ALTER TABLE licores_especificos
ADD CONSTRAINT PK_LICORES_ESPECIFICOS
PRIMARY KEY (nombre);

ALTER TABLE licor_anejo
ADD CONSTRAINT PK_LICOR_ANEJO
PRIMARY KEY (licor_especifico);

ALTER TABLE licor
ADD CONSTRAINT PK_LICOR
PRIMARY KEY (nombre);

ALTER TABLE en_base
ADD CONSTRAINT PK_EN_BASE
PRIMARY KEY (licor, en_base);

ALTER TABLE coctel
ADD CONSTRAINT PK_COCTEL
PRIMARY KEY (nombre);

ALTER TABLE pasos
ADD CONSTRAINT PK_PREPARACION
PRIMARY KEY (coctel, preparacion);

ALTER TABLE ingredientes
ADD CONSTRAINT PK_INGREDIENTES
PRIMARY KEY (coctel, ingrediente);

ALTER TABLE contiene
ADD CONSTRAINT PK_CONTIENE
PRIMARY KEY (licor, coctel);

ALTER TABLE factura_compra
ADD CONSTRAINT PK_FACTURA_COMPRA
PRIMARY KEY (num_fact);

ALTER TABLE esde
ADD CONSTRAINT PK_ESDE
PRIMARY KEY (factura_compra, licor_especifico);