ALTER TABLE cadena
ADD CONSTRAINT PK_cadena
PRIMARY KEY (idCadena);

ALTER TABLE donacion
ADD CONSTRAINT PK_donacion
PRIMARY KEY (numDonacion);

ALTER TABLE sucursal
ADD CONSTRAINT PK_sucursal
PRIMARY KEY (idSucursal);

ALTER TABLE contiene
ADD CONSTRAINT PK_contiene
PRIMARY KEY (donacion, producto);

ALTER TABLE producto
ADD CONSTRAINT PK_producto
PRIMARY KEY (idProducto);

ALTER TABLE ofrecidoPor
ADD CONSTRAINT PK_ofrecidoPor
PRIMARY KEY (producto, sucursal);

ALTER TABLE deseaAdquirir
ADD CONSTRAINT PK_deseaAdquirir
PRIMARY KEY (cliente, producto);

ALTER TABLE promocion
ADD CONSTRAINT PK_promocion
PRIMARY KEY (idPromocion);

ALTER TABLE cliente
ADD CONSTRAINT PK_cliente
PRIMARY KEY (idCliente);