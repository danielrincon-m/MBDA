CREATE INDEX Ipromo
    ON promocion (descuento);

CREATE INDEX Isucursal
    ON sucursal (cadena, direccion);

CREATE INDEX Icadena
    ON cadena (nombre);

CREATE INDEX Iproducto
    ON producto (nombre, precio);