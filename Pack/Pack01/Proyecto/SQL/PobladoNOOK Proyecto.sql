--Poblado NOOK (1)

INSERT INTO contiene
(licor,coctel,cantidad)
VALUES
('Tequila','Tequila Sunrise',0);


INSERT INTO licores_especificos
(nombre, casa, licor, descripcion, por_alcohol, color)
VALUES
('Jose Cuervo Tradicional Silver', '1', 'Tequila',null,'40', 'Naranja');

INSERT INTO tiene_pres
(presentacion, material, licores_especifico, precio_venta, unidades_disp)
VALUES
('750 ML', 'Plastico', 'Ozeki', 10001, 15);


INSERT INTO esde
(licor_especifico, presentacion, cantidad, precio_unitario, material_pres)
VALUES
('Ozeki', '750 ML', 15, 5001, 'Plastico');

INSERT INTO licores_especificos
(nombre, casa, licor, descripcion, por_alcohol, color)
VALUES
('Jose Cuervo Tradicional Silver', '1', 'Tequila',null,'0', 'Naranja');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Tequila Sunrise','Yes')

INSERT INTO presentaciones
(cantidad, material)
VALUES
('1', 'Vidrio');

INSERT INTO esde
(licor_especifico, presentacion, cantidad, precio_unitario, material_pres)
VALUES
('Ozeki', '750', 15, 5001, 'Plastico');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Sake','Japon','14% 20%','Seco y Suave');

--Poblado NOOK (2)
INSERT INTO paises
(nombre,restriccion)
VALUES
(' ','No tiene');

INSERT INTO casas
(pais, nombre)
VALUES
('Francia', ' ');

INSERT INTO presentaciones
(cantidad, material)
VALUES
('L', 'Vidrio');

INSERT INTO licores_especificos
(nombre, casa, licor, descripcion, por_alcohol, color)
VALUES
(' ', '5', 'Sake',null,'14','Incoloro');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
(' ','Japon','14%-20%','Seco y Suave');

INSERT INTO en_base
(licor, en_base)
VALUES
('Whisky', ' ');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES
('cuba libre', ' ');

INSERT INTO coctel
(nombre,hielo)
VALUES
(' ','Y')