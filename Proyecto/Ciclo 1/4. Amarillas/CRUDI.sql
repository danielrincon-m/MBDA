CREATE OR REPLACE PACKAGE BODY PC_DONACIONES IS

    PROCEDURE AD_DONACION(xdonante IN INTEGER) IS
    BEGIN
        INSERT INTO donacion (donante) VALUES (xdonante);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20001, 'Error al insertar la donacion');
    END;

    PROCEDURE AD_CONTIENE(xdonacion IN INTEGER, xproducto IN INTEGER, xcantidad IN INTEGER) IS
    BEGIN
        INSERT INTO contiene (donacion, producto, cantidad) VALUES (xdonacion, xproducto, xcantidad);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20002, 'Error al insertar el dato');
    END;

    FUNCTION CO_DONANTES RETURN SYS_REFCURSOR IS CO_DO SYS_REFCURSOR;
    BEGIN
        OPEN CO_DO FOR
            SELECT 
                nombre, 
                COUNT(numDonacion)
            FROM donacion

            JOIN cadena ON donante = idCadena

            GROUP BY nombre
            ORDER BY COUNT(numDonacion);
        RETURN CO_DO;
    END;

END PC_DONACIONES;
/

CREATE OR REPLACE PACKAGE BODY PC_SUCURSAL IS

    PROCEDURE AD_CADENA(xnombre IN VARCHAR) IS
    BEGIN
        INSERT INTO cadena (nombre) VALUES (xnombre);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20003, 'Error al insertar la cadena');
    END;

    PROCEDURE MO_CADENA(xidCadena IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        UPDATE cadena
        SET nombre = xnombre
        WHERE idCadena = xidCadena;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20004, 'Error al modificar la cadena');
    END;

    PROCEDURE AD_SUCURSAL(xcadena IN INTEGER, xlocalidad IN VARCHAR, xbarrio IN VARCHAR, xdireccion IN VARCHAR) IS
    BEGIN
        INSERT INTO sucursal (cadena, localidad, barrio, direccion) VALUES (xcadena, xlocalidad, xbarrio, xdireccion);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20005, 'Error al insertar la sucursal');
    END;

    PROCEDURE MO_SUCURSAL(xidSucursal IN INTEGER, xlocalidad IN VARCHAR, xbarrio IN VARCHAR, xdireccion IN VARCHAR) IS
    BEGIN
        UPDATE sucursal
        SET localidad = xlocalidad,
            barrio = xbarrio,
            direccion = xdireccion
        WHERE idSucursal = xidSucursal;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20006, 'Error al modificar la sucursal');
    END;

    PROCEDURE EL_SUCURSAL(xidSucursal IN INTEGER) IS
    BEGIN
        DELETE 
        FROM sucursal
        WHERE idSucursal = xidSucursal;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20007, 'Error al eliminar la sucursal');
    END;

    FUNCTION CO_SUCURSALES RETURN SYS_REFCURSOR IS CO_SUC SYS_REFCURSOR;
    BEGIN
        OPEN CO_SUC FOR
            SELECT 
                nombre, 
                localidad, 
                barrio, 
                direccion
            FROM cadena 

            JOIN sucursal 
            ON idCadena = cadena

            ORDER BY nombre;
        RETURN CO_SUC;
    END;

END PC_SUCURSAL;
/

CREATE OR REPLACE PACKAGE BODY PC_PRODUCTO IS

    PROCEDURE AD_PRODUCTO(xfabricante IN VARCHAR, xnombre IN VARCHAR, xprecio IN NUMBER, xfechaVencimiento IN DATE) IS
    BEGIN
        INSERT INTO producto (fabricante, nombre, precio, fechaVencimiento) VALUES (xfabricante, xnombre, xprecio, TO_DATE(xfechaVencimiento, 'DD/MM/YYYY'));
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20008, 'Error al insertar el producto');
    END;

    PROCEDURE MO_PRODUCTO(xidProducto IN INTEGER, xprecio IN NUMBER) IS
    BEGIN
        UPDATE producto
        SET precio = xprecio
        WHERE idProducto = xidProducto;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20009, 'Error al modificar el producto');    
    END;

    PROCEDURE EL_PRODUCTO(xidProducto IN INTEGER) IS
    BEGIN
        DELETE
        FROM producto
        WHERE idProducto = xidProducto;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20010, 'Error al eliminar el producto');
    END;

    PROCEDURE AD_PROMOCION(xidProducto IN INTEGER, xfInicio IN VARCHAR, xfFinal IN VARCHAR, xdescuento IN NUMBER) IS
    BEGIN
        INSERT INTO promocion (idProducto, fechaInicio, fechaFinal, descuento) VALUES (xidProducto, TO_DATE(xfInicio, 'DD/MM/YYYY'), TO_DATE(xfFinal, 'DD/MM/YYYY'), xdescuento);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20011, 'Error al insertar la promocion');
    END;

    PROCEDURE MO_PROMOCION(xidPromocion IN INTEGER, xfFinal IN DATE) IS
    BEGIN
        UPDATE promocion
        SET fechaFinal = xfFinal
        WHERE idPromocion = xidPromocion;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20012, 'Error al modificar la promocion');
    END;

    FUNCTION CO_PROMOCIONES RETURN SYS_REFCURSOR IS CO_PROM SYS_REFCURSOR;
    BEGIN
        OPEN CO_PROM FOR
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
        RETURN CO_PROM;
    END;

END PC_PRODUCTO;
/

CREATE OR REPLACE PACKAGE BODY PC_CLIENTE IS

    PROCEDURE AD_CLIENTE(xtipoDocumento IN VARCHAR, xnDocumento IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        INSERT INTO cliente (tipoDocumento, nDocumento, nombre) VALUES (xtipoDocumento, xnDocumento, xnombre);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20013, 'Error al insertar el cliente');
    END;

    PROCEDURE MO_CLIENTE(xidCliente IN INTEGER, xtipoDocumento IN VARCHAR, xnDocumento IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        UPDATE cliente
        SET tipoDocumento = xtipoDocumento,
            nDocumento = xnDocumento,
            nombre = xnombre
        WHERE idCliente = xidCliente;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20014, 'Error al modificar el cliente');
    END;

    PROCEDURE EL_CLIENTE(xidCliente IN INTEGER) IS
    BEGIN
        DELETE
        FROM cliente
        WHERE idCliente = xidCliente;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20015, 'Error al eliminar el cliente');
    END;

    PROCEDURE AD_DESEO(xcliente  IN  INTEGER, xproducto  IN  INTEGER) IS
    BEGIN
        INSERT INTO deseaAdquirir (cliente, producto) VALUES (xcliente, xproducto);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20016, 'Error al insertar el deseo');
    END;

    PROCEDURE EL_DESEO(xcliente IN INTEGER, xproducto IN INTEGER) IS
    BEGIN
        DELETE
        FROM deseaAdquirir
        WHERE cliente = xcliente
            AND producto = xproducto;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20017, 'Error al eliminar el deseo');
    END;


    FUNCTION CO_LISTADESEOS(xidCliente IN INTEGER) RETURN SYS_REFCURSOR IS CO_LD SYS_REFCURSOR;
    BEGIN
        OPEN CO_LD FOR
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
        RETURN CO_LD;
    END;

END PC_CLIENTE;
/