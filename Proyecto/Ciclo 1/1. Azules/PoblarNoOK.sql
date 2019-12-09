--table cadena
INSERT INTO cadena VALUES (1200, 'Cadena1');
INSERT INTO cadena VALUES (1200, 'Cadena2'); --Violar la clave primaria -- PK_cadena

--table sucursal
INSERT INTO sucursal VALUES (1250, 100, 'Martires', 'Veraguas', 'dir1');
INSERT INTO sucursal VALUES (1251, 100, 'Suba', '', 'dir1'); --Violar clave �nica -- UK_sucursal_direccion
INSERT INTO sucursal VALUES (1250, 100, 'Martires', 'Veraguas', ''); --Violar NOT NULL en direccion

--table cliente
INSERT INTO cliente VALUES (3500, 'AA', 100012345675, 'Pedro'); --No existe el tipo de documento 'AA' -- CHK-cliente-tDoc

--table promocion
INSERT INTO promocion VALUES (2400, 15, TO_DATE('05/07/2019', 'DD/MM/YYYY'), TO_DATE('05/06/2020', 'DD/MM/YYYY'), 5); --El descuento debe ser entre 0 y 1 -- CHK_promocion_descuento

--table ofrecidoPor
INSERT INTO ofrecidoPor VALUES (1200, 3000); --Llaves foraneas fuera de rango -- FK_ofrecidoPor_producto