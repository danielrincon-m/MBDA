--Consultar productos por casa
SELECT casas.nombre,licores_especificos.nombre
FROM licores_especificos,casas
WHERE casas.num_casa=licores_especificos.casa ;

--Consultar productos por licor general
SELECT licor,nombre
FROM licores_especificos
WHERE licor='Vodka';

--Consultar coctel con licor
SELECT coctel
FROM contiene
WHERE licor='Ron' ;

--Consulta XML
--Licores que tengan metodo tradicional
SELECT nombre,EXTRACTVALUE(descripcion,'descripcion/tradicional/@metodo')
FROM licor
WHERE EXTRACTVALUE(descripcion,'descripcion/tradicional/@metodo') is NOT null;

--Licores que tengan una variacion de color
SELECT nombre, EXTRACTVALUE(descripcion,'descripcion/colores/text()')
FROM licor
WHERE EXTRACTVALUE(descripcion,'descripcion/colores/text()') is NOT null;
