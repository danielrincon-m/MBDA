--En deseaAdquirir la fecha de registro se asigna automáticamente
insert into deseaAdquirir (cliente, producto, fechaRegistro) values (769, 822, '');
SELECT *
FROM deseaAdquirir
WHERE cliente = 769
    AND producto = 822;
	
--No se puede agregar un producto cuya fecha de vencimiento sea el mismo día o antes
insert into producto (idProducto, fabricante, nombre, precio, fechaVencimiento) values (1001, 'Konklux', 'Alaska Mistmaiden', 35585.56, '11/11/2021');

--La fecha final de promoción de un producto no puede ser despues de su fecha de vencimiento
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1003, 1001, '19/05/2019', '09/11/2021', 0.38);

--Dos promociones del mismo producto no se pueden traslapar en fechas
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1005, 484, '27/02/2019', '16/12/2019', 0.39);
insert into promocion (idPromocion, idProducto, fechaInicio, fechaFinal, descuento) values (1006, 484, '17/12/2019', '12/06/2020', 0.9);