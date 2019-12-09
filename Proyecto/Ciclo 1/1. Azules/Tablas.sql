CREATE TABLE cadena (
  idCadena INTEGER,
  nombre VARCHAR(50) NOT NULL
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
  fabricante VARCHAR(50) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  precio NUMBER NOT NULL,
  fechaVencimiento DATE NOT NULL
);
CREATE TABLE contiene (
  donacion INTEGER,
  producto INTEGER,
  cantidad INTEGER NOT NULL
);
CREATE TABLE ofrecidoPor (producto INTEGER, sucursal INTEGER);
CREATE TABLE promocion (
  idPromocion INTEGER,
  idProducto INTEGER,
  fechaInicio DATE NOT NULL,
  fechaFinal DATE NOT NULL,
  descuento NUMBER NOT NULL
);
CREATE TABLE cliente (
  idCliente INTEGER,
  tipoDocumento VARCHAR(2) NOT NULL,
  nDocumento INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL
);
CREATE TABLE deseaAdquirir (
  cliente INTEGER,
  producto INTEGER,
  fechaRegistro DATE NOT NULL
);