--Funciones

--Consultar las ciudades registradas en el sistema
SELECT
    nombre
FROM Ciudades;

--Se pueden consultar las empresas registradas en el sistema y sus respectivos repartidores, 
--con sus datos, incluyendo sus teléfonos y en donde operan
SELECT
    nombreEmpresa,
    r.nombre,
    r.tipoDocumento,
    r.numDocumento,
    t.telefono,
    c.nombre
FROM EmpresasDeEnvios

JOIN PertenecenA p
ON idEmpresa = p.empresa

JOIN Repartidores r
ON p.repartidor = r.idRepartidor

JOIN Telefonos t
ON r.idRepartidor = t.repartidor

JOIN OperanEn o
ON r.idRepartidor = o.repartidor

JOIN Ciudades c
ON o.ciudad = c.idCiudad

ORDER BY nombreEmpresa;

--Se pueden consultar las compras de un cliente, y los paquetes relacionados a la misma
SELECT
    idCompra,
    valor,
    idPaquete,
    peso,
    largo,
    ancho,
    estado,
    producto
FROM Compras

JOIN Paquetes
ON idCompra = compra

JOIN Contienen
ON idPaquete = paquete;



--Consultas Operativas

--consultar las empresas de envíos y sus repartidores
SELECT
    nombreEmpresa,
    tipoDocumento,
    numDocumento,
    nombre
FROM EmpresasDeEnvios

JOIN pertenecenA
ON idEmpresa = empresa

JOIN Repartidores
ON repartidor = idRepartidor

ORDER BY nombreEmpresa, nombre;


--Conocer las entregas realizadas por un repartidor
SELECT
    numDocumento,
    nombre,
    idPaquete,
    peso,
    largo,
    ancho,
    alto
FROM Repartidores

JOIN Paquetes
ON idRepartidor = repartidor

WHERE estado = 'Entregado'
    AND idRepartidor = 1
    
ORDER BY idPaquete;


--Consultar los teléfonos de un repartidor
SELECT
    nombre,
    telefono
FROM Repartidores

JOIN Telefonos
ON idRepartidor = repartidor

WHERE idRepartidor = 1;


--Consultar las ciudades y los repartidores que operan en ellas
SELECT 
    c.nombre,
    r.nombre
FROM Ciudades c

JOIN OperanEn
ON c.idCiudad = ciudad

JOIN Repartidores r
ON repartidor = idRepartidor

ORDER BY c.nombre, r.nombre;


--Consultar los paquetes relacionados a una compra y que producto contienen
SELECT
    nombre,
    producto,
    peso,
    largo,
    ancho,
    alto,
    estado

FROM Compras

JOIN Paquetes
ON idCompra = compra

JOIN Contienen
ON idPaquete = paquete

JOIN Repartidores
ON repartidor = idRepartidor

WHERE idCompra = 1

ORDER BY estado;
