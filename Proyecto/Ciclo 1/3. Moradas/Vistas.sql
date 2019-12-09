--Consultas Operativas
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
--conocer las promociones actuales
CREATE OR REPLACE VIEW Vpromociones AS
    SELECT
        nombre,
        ROUND(precio) AS precioR,
        descuento * 100 AS descuento,
        ROUND(precio - precio * descuento) AS precioFinal,
        fechaFinal AS validoHasta,
        fechaVencimiento
    FROM
        producto prod
        JOIN promocion prom ON prod.idProducto = prom.idProducto
    WHERE
        SYSDATE BETWEEN prom.fechaInicio
        AND prom.fechaFinal
    ORDER BY
        descuento DESC; 

----------------------------------------------------------------------------------------------------------
--consultar las sucursales
CREATE OR REPLACE VIEW Vsucursales AS
    SELECT
        nombre,
        localidad,
        barrio, 
        direccion
    FROM
        cadena
        JOIN sucursal ON idCadena = cadena
    ORDER BY
        nombre;

----------------------------------------------------------------------------------------------------------
--Consultar alimentos en la lista de deseos del cliente
CREATE OR REPLACE VIEW VlistaDeseos AS
    SELECT
        DISTINCT cl.idCliente,
        prod.nombre,
        prod.precio,
        prod.fechaVencimiento,
        prom.descuento * 100 AS descuento,
        prom.fechaFinal AS vigencia,
        cad.nombre AS cadena,
        suc.direccion AS direccion
    FROM
        cliente cl
        JOIN deseaAdquirir da ON cl.idCliente = da.cliente
        JOIN producto prod ON da.producto = prod.idProducto
        JOIN promocion prom ON prod.idProducto = prom.idProducto
        JOIN ofrecidoPor op ON prod.idProducto = op.producto
        JOIN sucursal suc ON suc.idSucursal = op.sucursal
        JOIN cadena cad ON suc.cadena = cad.idCadena
    WHERE
        cl.idCliente = 1
        AND SYSDATE BETWEEN prom.fechaInicio
        AND prom.fechaFinal
    ORDER BY
        prod.nombre ASC;

----------------------------------------------------------------------------------------------------------
--Conocer los donantes
CREATE OR REPLACE VIEW Vdonantes AS
    SELECT
        nombre,
        COUNT(numDonacion) AS CountNDonacion
    FROM
        donacion
        JOIN cadena ON donante = idCadena
    GROUP BY
        nombre
    ORDER BY
        COUNT(numDonacion);

--Consultas gerenciales
----------------------------------------------------------------------------------------------------------
--Consultar al proovedor mas eficiente
CREATE  OR REPLACE VIEW VproveedorEficiente AS
    SELECT 
        idCadena, 
        COUNT(idPromocion) AS countIdProm
    FROM 
        cadena
        JOIN sucursal ON idCadena = idSucursal
        JOIN ofrecidoPor ON idSucursal = sucursal
        JOIN producto Prod ON producto = Prod.idProducto 
        JOIN promocion Prom ON Prod.idProducto = Prom.idProducto
    GROUP BY idCadena
    ORDER BY COUNT(idPromocion);

