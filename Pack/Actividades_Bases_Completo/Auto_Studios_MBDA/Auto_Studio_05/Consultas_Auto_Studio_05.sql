--************
--1. Las especificaciones técnicas de un vehículo específico.
SELECT ID, EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Tipo_Direccion'),
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Tipo_Frenos'),
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Cantidad_Cambios'),
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Rin_Size')
FROM vehicle WHERE ID = 'SO 019 SS';
--************
--************
--2. Identificador de los vehículos que tienen bolsas de aire.
SELECT ID FROM vehicle 
WHERE
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Seguridad[accesorio[1] = "SI airbags"]') 
IS NOT NULL ;
--************
--************
--3. Los modelos de los vehículos que se encuentran en la base de datos.
SELECT DISTINCT(EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo'))
AS modelos_vehiculos 
FROM vehicle;
--************
--************
--4. Los valores promedios de oferta de venta por años específicos.
SELECT
AVG(EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Datos_Venta/@valor')) AS VALOR_promedio 
FROM vehicle;
--SELECT EXTRACTVALUE(descripcion,'/descripcion/Datos_Basicos/@anho') AS anhos, 
--AVG(EXTRACTVALUE(descripcion,'/descripcion/Datos_Basicos/Datos_Venta/@valor')) AS valor_promedio FROM vehicle;
--************
--************
--5. El modelo de los autos que tienen frenos hidráulicos
--************
SELECT ID, EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo') AS modelo_VEHICULO 
FROM vehicle 
WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Tipo_Frenos')= 'Hidraulicos';
--************
--ID y modelo de vehiculos con frenos ABS 
SELECT ID, EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo') AS modelo_VEHICULO 
FROM vehicle 
WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Tipo_Frenos')= 'ABS';
--************
--************
--ID carros que sean del año 2016.
--************
SELECT ID FROM vehicle WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@anho')=(SELECT to_char(sysdate,'YYYY') FROM DUAL);
--************
--************
--ID, modelo vehiculos con Tipo de Direccion distinta de Asistida.
SELECT ID, EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo') AS modelo_VEHICULO FROM vehicle 
WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Especificaciones/@Tipo_Direccion') != 'Asistida';
--************
--************
--ID,modelo,año de vehiculos con recorrido menor a 10000.
SELECT ID,EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo') AS modelo_vehiculo ,
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@anho') AS anho_vehiculo FROM vehicle 
WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Recorrido/@Kilometraje')>10000;
--************
--************
--ID y modelo de los vehiculos con detalles adicionales .
SELECT ID, EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/@modelo') AS modelo_vehiculo FROM vehicle WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos[Otra_Informacion]') IS NOT NULL; 
--************
--************
--ID vehiculos con valores de venta no nulos y con precio de venta mayor a 80000000.
SELECT ID FROM vehicle 
WHERE EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos/Recorrido/Datos_Venta/@valor')<=80000000 AND 
EXTRACTVALUE(descripcion,'descripcion/Datos_Basicos[Datos_Venta]') IS NULL;
--************




