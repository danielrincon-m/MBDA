CREATE OR REPLACE PACKAGE BODY PC_CIUDADES IS

    PROCEDURE AD_CIUDAD(xnombre IN VARCHAR) IS
    BEGIN
        INSERT INTO Ciudades (nombre) VALUES (xnombre);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE EL_CIUDAD(xidCiudad IN INTEGER) IS 
    BEGIN
        DELETE
        FROM Ciudades
        WHERE idCiudad = xidCiudad;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;


    FUNCTION CO_CIUDADES RETURN SYS_REFCURSOR IS CO_CI SYS_REFCURSOR;
    BEGIN
        OPEN CO_CI FOR
            SELECT *
            FROM VCiudades;
        RETURN CO_CI;
    END;

    FUNCTION CO_REPARTIDORES_CIUDAD(xidCiudad IN INTEGER) RETURN SYS_REFCURSOR IS CO_RC SYS_REFCURSOR;
    BEGIN
        OPEN CO_RC FOR
            SELECT *
            FROM VCiudadesRepartidores
            WHERE idCiudad = xidCiudad;
        RETURN CO_RC;
    END;

END PC_CIUDADES;
/


CREATE OR REPLACE PACKAGE BODY PC_ENVIOS IS

    PROCEDURE AD_EMPRESA(xnombreEmpresa IN VARCHAR, xnit  IN  VARCHAR) IS
    BEGIN
        INSERT INTO EmpresasDeEnvios(nombreEmpresa, nit) VALUES (xnombreEmpresa, xnit);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE MO_EMPRESA(xidEmpresa IN INTEGER, xnombreEmpresa IN VARCHAR, xnit IN VARCHAR) IS
    BEGIN
        UPDATE EmpresasDeEnvios
        SET nombreEmpresa = xnombreEmpresa,
            nit = xnit
        WHERE idEmpresa = xidEmpresa;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20091, 'Error al modificar');
    END;

    PROCEDURE EL_EMPRESA(xidEmpresa IN INTEGER) IS
    BEGIN
        DELETE
        FROM EmpresasDeEnvios
        WHERE idEmpresa = xidEmpresa;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;

    PROCEDURE AD_REPARTIDOR(xtipoDocumento IN VARCHAR, xnumDocumento IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        INSERT INTO Repartidores (tipoDocumento, numDocumento, nombre) VALUES (xtipoDocumento, xnumDocumento, xnombre);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE MO_REPARTIDOR(xidRepartidor IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        UPDATE Repartidores
        SET nombre = xnombre
        WHERE idRepartidor = xidRepartidor;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20091, 'Error al modificar');
    END;

    PROCEDURE EL_REPARTIDOR(xidRepartidor IN INTEGER) IS
    BEGIN
        DELETE
        FROM Repartidores
        WHERE idRepartidor = xidRepartidor;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;

    PROCEDURE AD_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER) IS
    BEGIN
        INSERT INTO PertenecenA (repartidor, empresa) VALUES (xrepartidor, xempresa);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;
    
    PROCEDURE EL_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER) IS
    BEGIN
        DELETE
        FROM PertenecenA
        WHERE repartidor = xrepartidor
            AND empresa = xempresa;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;

    PROCEDURE AD_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER) IS
    BEGIN
        INSERT INTO OperanEn (repartidor, ciudad) VALUES (xrepartidor, xciudad);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE EL_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER) IS
    BEGIN
        DELETE
        FROM OperanEn
        WHERE repartidor = xrepartidor
            AND ciudad = xciudad;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;

    PROCEDURE AD_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR) IS
    BEGIN
        INSERT INTO Telefonos (repartidor, telefono) VALUES (xrepartidor, xtelefono);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE EL_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR) IS
    BEGIN
        DELETE
        FROM Telefonos
        WHERE repartidor = xrepartidor
            AND telefono = xtelefono;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20092, 'Error al eliminar');
    END;


    FUNCTION CO_EMPRESAS_REGISTRADAS RETURN SYS_REFCURSOR IS CO_ER SYS_REFCURSOR;
    BEGIN
        OPEN CO_ER FOR
            SELECT *
            FROM VEmpresas;
        RETURN CO_ER;
    END;

    FUNCTION CO_REPARTIDORES_EMPRESA(xidEmpresa IN INTEGER) RETURN SYS_REFCURSOR IS CO_RE SYS_REFCURSOR;
    BEGIN
        OPEN CO_RE FOR
            SELECT *
            FROM VRepartidores
            HAVING idEmpresa = xidEmpresa;
        RETURN CO_RE;
    END;

    FUNCTION CO_ENTREGAS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR IS CO_ENTR SYS_REFCURSOR;
    BEGIN
        OPEN CO_ENTR FOR
            SELECT *
            FROM VEntregas
            WHERE idRepartidor = xidRepartidor;
        RETURN CO_ENTR;
    END;

    FUNCTION CO_TELEFONOS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR IS CO_TEL SYS_REFCURSOR;
    BEGIN
        OPEN CO_TEL FOR
            SELECT *
            FROM VTelefonos
            WHERE idRepartidor = xidRepartidor;
        RETURN CO_TEL;
    END;

END PC_ENVIOS;
/

CREATE OR REPLACE PACKAGE BODY PC_COMPRAS IS
    PROCEDURE AD_COMPRA(xvalor IN NUMBER, xcliente IN INTEGER) IS
    BEGIN
        INSERT INTO Compras (valor, cliente) VALUES (xvalor, xcliente);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE AD_PAQUETE(xpeso IN NUMBER, xlargo IN NUMBER, xancho IN NUMBER, xalto IN NUMBER, xrepartidor IN INTEGER, xcompra IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        INSERT INTO Paquetes (peso, largo, ancho, alto, repartidor, compra, estado) VALUES (xpeso, xlargo, xancho, xalto, xrepartidor, xcompra, xestado);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    PROCEDURE MO_PAQUETE(xidPaquete IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        UPDATE Paquetes
        SET estado = xestado
        WHERE idPaquete = xidPaquete;
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20091, 'Error al modificar');
    END;

    PROCEDURE AD_CONTIENE(xpaquete IN INTEGER, xproducto IN INTEGER) IS
    BEGIN
        INSERT INTO Contienen (paquete, producto) VALUES (xpaquete, xproducto);
        COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                RAISE_APPLICATION_ERROR(-20090, 'Error al insertar');
    END;

    FUNCTION CO_COMPRAS(xidCompra IN INTEGER) RETURN SYS_REFCURSOR IS CO_CO SYS_REFCURSOR;
    BEGIN
        OPEN CO_CO FOR
            SELECT *
            FROM VPaquetes
            WHERE idCompra = xidCompra;
        RETURN CO_CO;
    END;

END PC_COMPRAS;
/