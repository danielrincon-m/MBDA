--No se puede agregar un producto cuya fecha de vencimiento sea el mismo día o antes
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (1005, 'Konklux', 'Alaska Mistmaiden', 35585.56, TRUNC(SYSDATE));

--La fecha final de promoción de un producto no puede ser despues de su fecha de vencimiento
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (1002, 'Konklux', 'Alaska Mistmaiden', 35585.56, TO_DATE('11/11/2021', 'DD/MM/YYYY'));
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1008, 1002, TO_DATE('19/05/2019', 'DD/MM/YYYY'), TO_DATE('12/11/2021', 'DD/MM/YYYY'), 0.38);

--Dos promociones del mismo producto no se pueden traslapar en fechas
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (522, 'Konklux', 'Alaska Mistmaiden', 35585.56, TO_DATE('11/11/2021', 'DD/MM/YYYY'));
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1010, 522, TO_DATE('27/02/2019', 'DD/MM/YYYY'), TO_DATE('16/12/2019', 'DD/MM/YYYY'), 0.39);
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1011, 522, TO_DATE('14/12/2019', 'DD/MM/YYYY'), TO_DATE('12/06/2020', 'DD/MM/YYYY'), 0.9);