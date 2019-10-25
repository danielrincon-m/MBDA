ALTER TABLE sucursal
DROP CONSTRAINT FK_sucursal_cadena;

ALTER TABLE sucursal
ADD CONSTRAINT FK_sucursal_cadena
FOREIGN KEY (cadena) REFERENCES cadena (idCadena)
ON DELETE CASCADE;


ALTER TABLE ofrecidoPor
DROP CONSTRAINT FK_ofrecidoPor_producto;

ALTER TABLE ofrecidoPor
ADD CONSTRAINT FK_ofrecidoPor_producto
FOREIGN KEY (producto) REFERENCES producto (idProducto)
ON DELETE CASCADE;


ALTER TABLE ofrecidoPor
DROP CONSTRAINT FK_ofrecidoPor_sucursal;

ALTER TABLE ofrecidoPor
ADD CONSTRAINT FK_ofrecidoPor_sucursal
FOREIGN KEY (sucursal) REFERENCES sucursal (idSucursal)
ON DELETE CASCADE;


ALTER TABLE deseaAdquirir
DROP CONSTRAINT FK_deseaAdquirir_cliente;

ALTER TABLE deseaAdquirir
ADD CONSTRAINT FK_deseaAdquirir_cliente
FOREIGN KEY (cliente) REFERENCES cliente (idCliente)
ON DELETE CASCADE;


ALTER TABLE deseaAdquirir
DROP CONSTRAINT FK_deseaAdquirir_producto;

ALTER TABLE deseaAdquirir
ADD CONSTRAINT FK_deseaAdquirir_producto
FOREIGN KEY (producto) REFERENCES producto (idProducto)
ON DELETE CASCADE;
