--La fecha de inicio de una promoción debe ser antes de la fecha de finalización
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (68, 'Tres-Zap', 'Toano Milkvetch', 99870.186, '17/03/2021');

insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1, 68, '23/01/2019', '10/12/2020', 0.95);