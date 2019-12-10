CREATE TABLE EmpresasDeEnvios (
    idEmpresa INTEGER NOT NULL,
    nombreEmpresa VARCHAR(50) NOT NULL,
    nit VARCHAR(20)
);

CREATE TABLE PertenecenA (
    repartidor INTEGER NOT NULL,
    empresa INTEGER NOT NULL
);

CREATE TABLE Ciudades (
    idCiudad INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE OperanEn (
    repartidor INTEGER NOT NULL,
    ciudad INTEGER NOT NULL
);

CREATE TABLE Repartidores (
    idRepartidor INTEGER NOT NULL,
    tipoDocumento VARCHAR(2) NOT NULL,
    numDocumento INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Contienen (
    paquete INTEGER NOT NULL,
    producto INTEGER NOT NULL
);

CREATE TABLE Telefonos (
    repartidor INTEGER NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Paquetes (
    idPaquete INTEGER NOT NULL,
    peso NUMBER NOT NULL,
    largo NUMBER NOT NULL,
    ancho NUMBER NOT NULL,
    alto NUMBER NOT NULL,
    repartidor INTEGER,
    compra INTEGER NOT NULL, 
    estado VARCHAR(20) NOT NULL
);

CREATE TABLE Compras (
    idCompra INTEGER NOT NULL,
    valor NUMBER NOT NULL,
    cliente INTEGER NOT NULL,
    fecha DATE NOT NULL
);
