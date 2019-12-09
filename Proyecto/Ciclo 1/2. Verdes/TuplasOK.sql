--La fecha de inicio de una promoción debe ser antes de la fecha de finalización
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (68, 'Tres-Zap', 'Toano Milkvetch', 99870.186, TO_DATE('17/03/2021', 'DD/MM/YYYY'));

insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1, 68, TO_DATE('23/01/2019', 'DD/MM/YYYY'), TO_DATE('10/12/2020', 'DD/MM/YYYY'), 0.95);