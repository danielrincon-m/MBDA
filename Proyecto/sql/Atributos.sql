ALTER TABLE cliente
ADD CONSTRAINT CHK_cliente_tDoc
CHECK (
    tipoDocumento IN ('CC', 'TI', 'CE')
);

ALTER TABLE promocion
ADD CONSTRAINT CHK_promocion_descuento
CHECK (
    descuento BETWEEN 0 AND 1
);