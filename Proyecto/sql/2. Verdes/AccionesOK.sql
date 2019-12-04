insert into cadena (idCadena, nombre) values (1, 'Hackett Inc');
insert into sucursal (idSucursal, cadena, localidad, barrio, direccion) values (840, 1, '�sterg�tland', 'Corscot', '5206 Lerdahl Alley');
DELETE FROM cadena WHERE idCadena = 1;

insert into cadena (idCadena, nombre) values (1, 'Hackett Inc');
insert into sucursal (idSucursal, cadena, localidad, barrio, direccion) values (840, 1, '�sterg�tland', 'Corscot', '5206 Lerdahl Alley');
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (993, 'Duobam', 'Slender Lipfern', 37966.127, TO_DATE('01/04/2021', 'DD/MM/YYYY'));
insert into ofrecidoPor (producto, sucursal) values (993, 840);
DELETE FROM producto WHERE idProducto = 993;

insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (993, 'Duobam', 'Slender Lipfern', 37966.127, TO_DATE('01/04/2021', 'DD/MM/YYYY'));
insert into sucursal (idSucursal, cadena, localidad, barrio, direccion) values (900, 1, '�sterg�tland', 'Corscot', '5206 Lerdahl Alleyy');
insert into ofrecidoPor (producto, sucursal) values (993, 900);
DELETE FROM sucursal WHERE idSucursal = 900;

insert into cliente (idCliente, tipoDocumento, nDocumento, nombre) values (9, 'CE', 5639688203, 'Ermina Konzel');
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (998, 'Duobam', 'Slender Lipfern', 37966.127, TO_DATE('01/04/2021', 'DD/MM/YYYY'));
insert into deseaAdquirir (cliente, producto, fechaRegistro) values (9, 998, TO_DATE('03/11/2019', 'DD/MM/YYYY'));
DELETE FROM cliente WHERE idCliente = 9;