--Hay una empresa de envíos llamada 5/73
EXECUTE PA_ADMIN_ENVIOS.AD_EMPRESA('5/73', '47215-3');
SELECT * FROM EmpresasDeEnvios;

--Y un repartidor llamado Jose que trabaja en esa empresa
EXECUTE PA_ADMIN_ENVIOS.AD_REPARTIDOR('CC', '1032487559', 'Jose');
EXECUTE PA_ADMIN_ENVIOS.AD_PERTENECENA(Repartidores_seq.CURRVAL, Empresa_seq.CURRVAL);
EXECUTE PA_ADMIN_ENVIOS.AD_TELEFONOS(Repartidores_seq.CURRVAL, '3204561248')

SELECT * FROM Repartidores;
SELECT * FROM PertenecenA;
SELECT * FROM Telefonos;

--El repartidor opera en la ciudad de Bogotá
EXECUTE PA_ADMIN_ENVIOS.AD_CIUDAD('Bogotá');
EXECUTE PA_ADMIN_ENVIOS.AD_OPERANEN(Repartidores_seq.CURRVAL, Ciudades_seq.CURRVAL);

SELECT * FROM Ciudades;
SELECT * FROM OperanEn;

--Pedro es un cliente que vive en medellin, y desea hacer un pedido a esta ciudad,
--así que busca si hay repartidores que operan en esta ciudad
EXECUTE PA_ADMIN_ENVIOS.AD_CIUDAD('Medellín');

DECLARE 
    l_cursor SYS_REFCURSOR;
    idCiudad Ciudades.idCiudad%TYPE;
    nombreCiudad Ciudades.nombre%TYPE; 
    nombreRepartidor Repartidores.nombre%TYPE; 
BEGIN
    SELECT PA_CLIENTE.CO_REPARTIDORES_CIUDAD(Ciudades_seq.CURRVAL) INTO l_cursor FROM DUAL;

    LOOP
        FETCH l_cursor
        INTO idCiudad, nombreCiudad, nombreRepartidor;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(idCiudad || ' | ' || nombreCiudad || ' | ' || nombreRepartidor);
    END LOOP;
END;
/

--Se da cuenta que no hay repartidores en medellín, así que pone una petición en la compañia de envios
--Ellos viendo la creciente demanda en medellín, deciden contratar a Carlos para trabajar en medellin
EXECUTE PA_ADMIN_ENVIOS.AD_REPARTIDOR('CC', '1032487129', 'Carlos');
EXECUTE PA_ADMIN_ENVIOS.AD_PERTENECENA(Repartidores_seq.CURRVAL, Empresa_seq.CURRVAL);
EXECUTE PA_ADMIN_ENVIOS.AD_OPERANEN(Repartidores_seq.CURRVAL, Ciudades_seq.CURRVAL);
EXECUTE PA_ADMIN_ENVIOS.AD_TELEFONOS(Repartidores_seq.CURRVAL, '3204568420')

SELECT * FROM Repartidores;
SELECT * FROM PertenecenA;
SELECT * FROM OperanEn;
SELECT * FROM Telefonos;

--Le dan la notificación a Pedro, y el decide realizar un pedido para probar la eficiencia 
--del sistema, y si vale la pena hacer de esto un hábito.
EXECUTE PA_CLIENTE.AD_COMPRA(125000, 1);
EXECUTE PA_ADMIN_ENVIOS.AD_PAQUETE(5, 2, 4, 4, Repartidores_seq.CURRVAL, Compras_seq.CURRVAL, 'Reparto');
EXECUTE PA_ADMIN_ENVIOS.AD_PAQUETE(3, 1, 6, 7, Repartidores_seq.CURRVAL, Compras_seq.CURRVAL, 'Reparto');
EXECUTE PA_ADMIN_ENVIOS.AD_PAQUETE(1, 5, 2, 2, Repartidores_seq.CURRVAL, Compras_seq.CURRVAL, 'Reparto');

SELECT * FROM Compras;
SELECT * FROM Paquetes; 

--Luego de unos días el paquete de pedro aún no llega, así que consulta el número de
--su repartidor para consultar en donde está el paquete
DECLARE 
    l_cursor SYS_REFCURSOR;
    idRepartidor Repartidores.idRepartidor%TYPE;
    nombre Repartidores.nombre%TYPE; 
    telefono Telefonos.telefono%TYPE; 
BEGIN
    SELECT PA_CLIENTE.CO_TELEFONOS(Repartidores_seq.CURRVAL) INTO l_cursor FROM DUAL;
    
    LOOP
        FETCH l_cursor
        INTO idRepartidor, nombre, telefono; 
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(idRepartidor || ' | ' || nombre || ' | ' || telefono);
    END LOOP;
END;
/

--Llama al repartidor y el le informa que todo está bien con el pedido,
--luego de un día el pedido llega a la casa de Pedro
EXECUTE PA_ADMIN_ENVIOS.MO_PAQUETE(Paquetes_seq.CURRVAL - 2, 'Entregado');
EXECUTE PA_ADMIN_ENVIOS.MO_PAQUETE(Paquetes_seq.CURRVAL - 1, 'Entregado');
EXECUTE PA_ADMIN_ENVIOS.MO_PAQUETE(Paquetes_seq.CURRVAL, 'Entregado');

SELECT * FROM Paquetes; 

--Pedro quedó satisfecho con los precios, y decidió seguir comprando con la aplicación