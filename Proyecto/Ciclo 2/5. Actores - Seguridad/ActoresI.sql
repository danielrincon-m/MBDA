CREATE OR REPLACE PACKAGE BODY PA_ADMIN_ENVIOS IS

    PROCEDURE AD_CIUDAD(xnombre IN VARCHAR) IS
    BEGIN
        PC_CIUDADES.AD_CIUDAD(xnombre);
    END;
    
    PROCEDURE EL_CIUDAD(xidCiudad IN INTEGER) IS
    BEGIN
        PC_CIUDADES.EL_CIUDAD(xidCiudad);
    END;
    
    PROCEDURE AD_EMPRESA(xnombreEmpresa IN VARCHAR, xnit  IN  VARCHAR) IS
    BEGIN
        PC_ENVIOS.AD_EMPRESA(xnombreEmpresa, xnit);
    END;
    
    PROCEDURE MO_EMPRESA(xidEmpresa IN INTEGER, xnombreEmpresa IN VARCHAR, xnit IN VARCHAR) IS
    BEGIN
        PC_ENVIOS.MO_EMPRESA(xidEmpresa, xnombreEmpresa, xnit);
    END;
    
    PROCEDURE EL_EMPRESA(xidEmpresa IN INTEGER) IS
    BEGIN
        PC_ENVIOS.EL_EMPRESA(xidEmpresa);
    END;
    
    PROCEDURE AD_REPARTIDOR(xtipoDocumento IN VARCHAR, xnumDocumento IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        PC_ENVIOS.AD_REPARTIDOR(xtipoDocumento, xnumDocumento, xnombre);
    END;
    
    PROCEDURE MO_REPARTIDOR(xidRepartidor IN INTEGER, xnombre IN VARCHAR) IS
    BEGIN
        PC_ENVIOS.MO_REPARTIDOR(xidRepartidor, xnombre);
    END;
    
    PROCEDURE EL_REPARTIDOR(xidRepartidor IN INTEGER) IS
    BEGIN
        PC_ENVIOS.EL_REPARTIDOR(xidRepartidor);
    END;
    
    PROCEDURE AD_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER) IS
    BEGIN
        PC_ENVIOS.AD_PERTENECENA(xrepartidor, xempresa);
    END;
    
    PROCEDURE EL_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER) IS
    BEGIN
        PC_ENVIOS.EL_PERTENECENA(xrepartidor, xempresa);
    END;    
    
    PROCEDURE AD_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER) IS
    BEGIN
        PC_ENVIOS.AD_OPERANEN(xrepartidor, xciudad);
    END;
    
    PROCEDURE EL_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER) IS
    BEGIN
        PC_ENVIOS.EL_OPERANEN(xrepartidor, xciudad);
    END;
    
    PROCEDURE AD_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR) IS
    BEGIN
        PC_ENVIOS.AD_TELEFONOS(xrepartidor, xtelefono);
    END;
    
    PROCEDURE EL_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR) IS
    BEGIN
        PC_ENVIOS.EL_TELEFONOS(xrepartidor, xtelefono);
    END;
    
    PROCEDURE AD_COMPRA(xvalor IN NUMBER, xcliente IN INTEGER) IS
    BEGIN
        PC_COMPRAS.AD_COMPRA(xvalor, xcliente);
    END;
    
    PROCEDURE AD_PAQUETE(xpeso IN NUMBER, xlargo IN NUMBER, xancho IN NUMBER, xalto IN NUMBER, xrepartidor IN INTEGER, xcompra IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.AD_PAQUETE(xpeso, xlargo, xancho, xalto, xrepartidor, xcompra, xestado);
    END;
    
    PROCEDURE MO_PAQUETE(xidPaquete IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.MO_PAQUETE(xidPaquete, xestado);
    END;
    
    PROCEDURE AD_CONTIENE(xpaquete IN INTEGER, xproducto IN INTEGER) IS
    BEGIN
        PC_COMPRAS.AD_CONTIENE(xpaquete, xproducto);
    END;
    

    FUNCTION CO_CIUDADES RETURN SYS_REFCURSOR IS CO_CI SYS_REFCURSOR;
    BEGIN
        CO_CI := PC_CIUDADES.CO_CIUDADES;
        RETURN CO_CI;
    END;

    FUNCTION CO_EMPRESAS_REGISTRADAS RETURN SYS_REFCURSOR IS CO_ER SYS_REFCURSOR;
    BEGIN
        CO_ER := PC_ENVIOS.CO_EMPRESAS_REGISTRADAS;
        RETURN CO_ER;
    END;
    
    FUNCTION CO_REPARTIDORES_EMPRESA(xidEmpresa IN INTEGER) RETURN SYS_REFCURSOR IS CO_RE SYS_REFCURSOR;
    BEGIN
        CO_RE := PC_ENVIOS.CO_REPARTIDORES_EMPRESA(xidEmpresa);
        RETURN CO_RE;
    END;
    
    FUNCTION CO_ENTREGAS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR IS CO_ENT SYS_REFCURSOR;
    BEGIN
        CO_ENT := PC_ENVIOS.CO_ENTREGAS(xidRepartidor);
        RETURN CO_ENT;
    END;
    
    FUNCTION CO_COMPRAS(xidCompra IN INTEGER) RETURN SYS_REFCURSOR IS CO_CO SYS_REFCURSOR;
    BEGIN
        CO_CO := PC_COMPRAS.CO_COMPRAS(xidCompra);
        RETURN CO_CO;
    END;
    
END PA_ADMIN_ENVIOS;
/

CREATE OR REPLACE PACKAGE BODY PA_ADMIN_SUCURSALES IS
    PROCEDURE AD_CIUDAD(xnombre IN VARCHAR) IS
    BEGIN
        PC_CIUDADES.AD_CIUDAD(xnombre);
    END;

    PROCEDURE EL_CIUDAD(xidCiudad IN INTEGER) IS
    BEGIN
        PC_CIUDADES.EL_CIUDAD(xidCiudad);
    END;


    FUNCTION CO_CIUDADES RETURN SYS_REFCURSOR IS CO_CI SYS_REFCURSOR;
    BEGIN
        CO_CI := PC_CIUDADES.CO_CIUDADES;
        RETURN CO_CI;
    END;
    
END PA_ADMIN_SUCURSALES;
/

CREATE OR REPLACE PACKAGE BODY PA_CLIENTE IS
    PROCEDURE AD_COMPRA(xvalor IN NUMBER, xcliente IN INTEGER) IS
    BEGIN
        PC_COMPRAS.AD_COMPRA(xvalor, xcliente);
    END;

    PROCEDURE AD_PAQUETE(xpeso IN NUMBER, xlargo IN NUMBER, xancho IN NUMBER, xalto IN NUMBER, xrepartidor IN INTEGER, xcompra IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.AD_PAQUETE(xpeso, xlargo, xancho, xalto, xrepartidor, xcompra, xestado);
    END;
    
    PROCEDURE MO_PAQUETE(xidPaquete IN INTEGER, xestado IN VARCHAR) IS
    BEGIN
        PC_COMPRAS.MO_PAQUETE(xidPaquete, xestado);
    END;
    
    PROCEDURE AD_CONTIENE(xpaquete IN INTEGER, xproducto IN INTEGER) IS
    BEGIN
        PC_COMPRAS.AD_CONTIENE(xpaquete, xproducto);
    END;
    

    FUNCTION CO_COMPRAS(xidCompra IN INTEGER) RETURN SYS_REFCURSOR IS CO_CO SYS_REFCURSOR;
    BEGIN
        CO_CO := PC_COMPRAS.CO_COMPRAS(xidCompra);
        RETURN CO_CO;
    END;
    
    FUNCTION CO_TELEFONOS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR IS CO_TEL SYS_REFCURSOR;
    BEGIN
        CO_TEL := PC_ENVIOS.CO_TELEFONOS(xidRepartidor);
        RETURN CO_TEL;
    END;

    FUNCTION CO_REPARTIDORES_CIUDAD(xidCiudad IN INTEGER) RETURN SYS_REFCURSOR IS CO_RC SYS_REFCURSOR;
    BEGIN
        CO_RC := PC_CIUDADES.CO_REPARTIDORES_CIUDAD(xidCiudad);
        RETURN CO_RC;
    END;
    
END PA_CLIENTE;
/