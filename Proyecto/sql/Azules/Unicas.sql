ALTER TABLE sucursal
ADD CONSTRAINT UK_sucursal_direccion
UNIQUE (direccion);

ALTER TABLE cliente
ADD CONSTRAINT UK_cliente_doc
UNIQUE (tipoDocumento, nDocumento);