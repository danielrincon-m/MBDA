ALTER TABLE sucursal
ADD CONSTRAINT UK_sucursal_direccion
UNIQUE (direccion);

ALTER TABLE cliente
ADD CONSTRAINT UK_cliente_doc
UNIQUE (tipoDocumento, nDocumento);

ALTER TABLE cadena
ADD CONSTRAINT UK_cadena_nombre
UNIQUE (nombre);