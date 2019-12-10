CREATE INDEX ICiudades
    ON Ciudades (nombre);

CREATE INDEX IEmpresas
    ON EmpresasDeEnvios (nombreEmpresa);

CREATE INDEX IRepartidores
    ON Repartidores (tipoDocumento, numDocumento, nombre);

CREATE INDEX ITelefonos
    ON Telefonos (telefono);

CREATE INDEX ICompras
    ON Compras (valor);

CREATE INDEX IPaquetes
    ON Paquetes (peso, largo, ancho, alto, estado);