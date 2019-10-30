insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (520, 'It', 'Hairy Cupgrass', 13252.498, '06/08/2021');
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1025, 520, '23/01/2020', '10/12/2019', 0.95);
--No se puede insertar un registro cuya fecha de inicio sea despues de su fecha de finalizacion