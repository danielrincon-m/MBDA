--conocer las promociones actuales
SELECT 
    nombre, 
    ROUND(precio), 
    descuento*100 AS descuento, 
    ROUND(precio - precio * descuento) AS precioFinal, 
    fechaFinal AS validoHasta, 
    fechaVencimiento
FROM producto prod 

JOIN promocion prom 
ON prod.idProducto = prom.idProducto

WHERE SYSDATE BETWEEN prom.fechaInicio 
    AND prom.fechaFinal
    
ORDER BY descuento DESC;


--consultar las sucursales
SELECT 
    nombre, 
    localidad, 
    barrio, 
    direccion
FROM cadena 

JOIN sucursal 
ON idCadena = cadena

ORDER BY nombre;


--Consultar alimentos en la lista de deseos del cliente
SELECT DISTINCT
    cl.idCliente, 
    prod.nombre, 
    prod.precio,
    prod.fechaVencimiento,
    prom.descuento * 100 AS descuento,
    prom.fechaFinal AS vigencia,
    cad.nombre AS cadena,
    suc.direccion AS direccion
FROM cliente cl

JOIN deseaAdquirir da
ON cl.idCliente = da.cliente

JOIN producto prod
ON da.producto = prod.idProducto

JOIN promocion prom
ON prod.idProducto = prom.idProducto

JOIN ofrecidoPor op
ON prod.idProducto = op.producto

JOIN sucursal suc
ON suc.idSucursal = op.sucursal

JOIN cadena cad
ON suc.cadena = cad.idCadena

WHERE cl.idCliente = 239
    AND SYSDATE BETWEEN prom.fechaInicio 
        AND prom.fechaFinal

ORDER BY prod.nombre ASC;


--Conocer los donantes
SELECT 
    nombre, 
    COUNT(numDonacion)
FROM donacion

JOIN cadena ON donante = idCadena

GROUP BY nombre
ORDER BY COUNT(numDonacion);