CREATE INDEX Ipromo
    ON promocion (descuento, fechaFinal);

CREATE INDEX Isucursal
    ON sucursal (cadena, localidad, barrio, direccion);

CREATE INDEX Iproducto
    ON producto (nombre, precio, fechaVencimiento);

CREATE INDEX IDonante
    ON Donacion (donante);

CREATE INDEX IDonacion
    ON Contiene (producto, cantidad);