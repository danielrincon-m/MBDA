--tipo documento correcto
ALTER TABLE cliente
ADD CONSTRAINT CHK_cliente_tDoc
CHECK (
    tipoDocumento IN ('CC', 'TI', 'CE')
);

--El descuento debe estar entre 0 y 1
ALTER TABLE promocion
ADD CONSTRAINT CHK_promocion_descuento
CHECK (
    descuento BETWEEN 0 AND 1
);

--El precio del producto debe ser mayor o igual a cero
ALTER TABLE producto
ADD CONSTRAINT CHK_producto_precio
CHECK (
	precio >= 0;
);

--La cantidad de productos donados debe ser mayor a cero
ALTER TABLE contiene
ADD CONSTRAINT CHK_contient_cantidad
CHECK (
	cantidad > 0;
);