ALTER TABLE donacion
ADD CONSTRAINT FK_donacion_donante
FOREIGN KEY (donante) REFERENCES cadena (idCadena)
ON DELETE CASCADE;

ALTER TABLE sucursal
ADD CONSTRAINT FK_sucursal_cadena
FOREIGN KEY (cadena) REFERENCES cadena (idCadena)
ON DELETE CASCADE;

ALTER TABLE contiene
ADD CONSTRAINT FK_contiene_donacion
FOREIGN KEY (donacion) REFERENCES donacion (numDonacion)
ON DELETE CASCADE;

ALTER TABLE contiene
ADD CONSTRAINT FK_contiene_producto
FOREIGN KEY (producto) REFERENCES producto (idProducto)
ON DELETE CASCADE;

ALTER TABLE ofrecidoPor
ADD CONSTRAINT FK_ofrecidoPor_producto
FOREIGN KEY (producto) REFERENCES producto (idProducto)
ON DELETE CASCADE;

ALTER TABLE ofrecidoPor
ADD CONSTRAINT FK_ofrecidoPor_sucursal
FOREIGN KEY (sucursal) REFERENCES sucursal (idSucursal)
ON DELETE CASCADE;

ALTER TABLE deseaAdquirir
ADD CONSTRAINT FK_deseaAdquirir_cliente
FOREIGN KEY (cliente) REFERENCES cliente (idCliente)
ON DELETE CASCADE;

ALTER TABLE deseaAdquirir
ADD CONSTRAINT FK_deseaAdquirir_producto
FOREIGN KEY (producto) REFERENCES producto (idProducto)
ON DELETE CASCADE;

ALTER TABLE promocion
ADD CONSTRAINT FK_promocion_idProducto
FOREIGN KEY (idProducto) REFERENCES producto (idProducto)
ON DELETE CASCADE;