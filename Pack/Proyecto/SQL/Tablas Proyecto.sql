-------------------------------CREAR TABLAS-------------------------------------

CREATE TABLE paises
(nombre VARCHAR(50) NOT NULL,
restriccion VARCHAR(100) NOT NULL
);

CREATE TABLE casas
(num_casa NUMBER(10) NOT NULL,
pais VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE presentaciones
(cantidad VARCHAR(10) NOT NULL,
material VARCHAR(10) NOT NULL,
descripcion VARCHAR(100));

CREATE TABLE tiene_pres
(presentacion VARCHAR(10) NOT NULL,
material VARCHAR(10) NOT NULL,
licores_especifico VARCHAR(50) NOT NULL,
precio_venta NUMBER(10) NOT NULL,
unidades_disp NUMBER(10) NOT NULL
);

CREATE TABLE licores_especificos
(nombre VARCHAR(50) NOT NULL,
casa NUMBER(10) NOT NULL,
licor VARCHAR(20) NOT NULL,
descripcion VARCHAR(100),
por_alcohol NUMBER(5),
color VARCHAR(10)
);

CREATE TABLE licor_anejo
(licor_especifico VARCHAR(50) NOT NULL,
anos_anejamiento NUMBER(3) NOT NULL,
barril VARCHAR(20) NOT NULL,
sabor VARCHAR(30)NOT NULL
);

CREATE TABLE licor
(nombre VARCHAR(20) NOT NULL,
pais VARCHAR(50) NOT NULL,
rango_alc VARCHAR(10) NOT NULL,
sabor VARCHAR(30) NOT NULL,
descripcion XMLType
);

CREATE TABLE en_base
(licor VARCHAR(20) NOT NULL,
en_base VARCHAR(20) NOT NULL
);

CREATE TABLE coctel
(nombre VARCHAR(30) NOT NULL,
hielo CHAR(1) NOT NULL
);

CREATE TABLE pasos
(coctel VARCHAR(30) NOT NULL,
preparacion VARCHAR(500) NOT NULL
);

CREATE TABLE ingredientes
(coctel VARCHAR(30) NOT NULL,
ingrediente VARCHAR(30) NOT NULL
);

CREATE TABLE contiene
(licor VARCHAR(20) NOT NULL,
coctel VARCHAR(30) NOT NULL,
cantidad NUMBER NOT NULL
);

CREATE TABLE factura_compra
(num_fact NUMBER NOT NULL,
fecha DATE NOT NULL
);

CREATE TABLE esde
(factura_compra NUMBER NOT NULL,
licor_especifico VARCHAR(50) NOT NULL,
presentacion VARCHAR(10) NOT NULL,
cantidad NUMBER NOT NULL,
precio_unitario NUMBER NOT NULL,
material_pres VARCHAR(10) NOT NULL
);