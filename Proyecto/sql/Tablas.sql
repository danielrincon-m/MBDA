CREATE TABLE cadena (
    idCadena INTEGER,
    nombre VARCHAR(50)
);
CREATE TABLE donacion (
    numDonacion INTEGER,
    donante INTEGER NOT NULL
);
CREATE TABLE sucursal (
    idSucursal INTEGER,
    cadena INTEGER NOT NULL,
    localidad VARCHAR(50),
    barrio VARCHAR(50),
    direccion VARCHAR(50) NOT NULL
);
CREATE TABLE producto (
    idProducto INTEGER,
    fabricante VARCHAR(50),
    nombre VARCHAR(50),
    precio NUMBER,
    fechaVencimiento DATE
);
CREATE TABLE contiene (
    donacion INTEGER,
    producto INTEGER,
    cantidad INTEGER
);
CREATE TABLE ofrecidoPor (
    producto INTEGER,
    sucursal INTEGER
);
CREATE TABLE promocion (
    idPromocion INTEGER,
    idProducto INTEGER,
    fechaInicio DATE,
    fechaFinal DATE,
    descuento NUMBER(3, 2)
);
CREATE TABLE cliente (
    idCliente INTEGER,
    tipoDocumento VARCHAR(2),
    nDocumento INTEGER,
    nombre VARCHAR(50)
);
CREATE TABLE deseaAdquirir (
    cliente INTEGER,
    producto INTEGER,
    fechaRegistro DATE
);