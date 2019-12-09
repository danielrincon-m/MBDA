ALTER TABLE EmmpresasDeEnvios
ADD CONSTRAINT PK_Empresas_Envios
PRIMARY KEY (idEmpresa);

ALTER TABLE PertenecenA
ADD CONSTRAINT PK_PertenecenA
PRIMARY KEY (repartidor, empresa);

ALTER TABLE Ciudades
ADD CONSTRAINT PK_Ciudades
PRIMARY KEY (idCiudad);

ALTER TABLE OperanEn
ADD CONSTRAINT PK_OperanEn
PRIMARY KEY (repartidor, ciudad);

ALTER TABLE Repartidores
ADD CONSTRAINT PK_Repartidores
PRIMARY KEY (idRepartidor);

ALTER TABLE Contienen
ADD CONSTRAINT PK_Contienen
PRIMARY KEY (paquete, producto);

ALTER TABLE Telefonos
ADD CONSTRAINT PK_Telefonos
PRIMARY KEY (repartidor, telefono);

ALTER TABLE Paquetes
ADD CONSTRAINT PK_Paquetes
PRIMARY KEY (idPaquete);

ALTER TABLE Compras
ADD CONSTRAINT PK_Compras
PRIMARY KEY (idCompra);