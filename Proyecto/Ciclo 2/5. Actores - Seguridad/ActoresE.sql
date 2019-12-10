CREATE OR REPLACE PACKAGE PA_ADMIN_ENVIOS IS
    PROCEDURE AD_CIUDAD(xnombre IN VARCHAR);
    PROCEDURE EL_CIUDAD(xidCiudad IN INTEGER);
    PROCEDURE AD_EMPRESA(xnombreEmpresa IN VARCHAR, xnit  IN  VARCHAR);
    PROCEDURE MO_EMPRESA(xidEmpresa IN INTEGER, xnombreEmpresa IN VARCHAR, xnit IN VARCHAR);
    PROCEDURE EL_EMPRESA(xidEmpresa IN INTEGER);
    PROCEDURE AD_REPARTIDOR(xtipoDocumento IN VARCHAR, xnumDocumento IN INTEGER, xnombre IN VARCHAR);
    PROCEDURE MO_REPARTIDOR(xidRepartidor IN INTEGER, xnombre IN VARCHAR);
    PROCEDURE EL_REPARTIDOR(xidRepartidor IN INTEGER);
    PROCEDURE AD_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER);
    PROCEDURE EL_PERTENECENA(xrepartidor IN INTEGER, xempresa IN INTEGER);
    PROCEDURE AD_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER);
    PROCEDURE EL_OPERANEN(xrepartidor IN INTEGER, xciudad IN INTEGER);
    PROCEDURE AD_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR);
    PROCEDURE EL_TELEFONOS(xrepartidor IN INTEGER, xtelefono IN VARCHAR);
    PROCEDURE AD_COMPRA(xvalor IN NUMBER, xcliente IN INTEGER);
    PROCEDURE AD_PAQUETE(xpeso IN NUMBER, xlargo IN NUMBER, xancho IN NUMBER, xalto IN NUMBER, xrepartidor IN INTEGER, xcompra IN INTEGER, xestado IN VARCHAR);
    PROCEDURE MO_PAQUETE(xidPaquete IN INTEGER, xestado IN VARCHAR);
    PROCEDURE AD_CONTIENE(xpaquete IN INTEGER, xproducto IN INTEGER);

    FUNCTION CO_CIUDADES RETURN SYS_REFCURSOR;
    FUNCTION CO_EMPRESAS_REGISTRADAS RETURN SYS_REFCURSOR;
    FUNCTION CO_REPARTIDORES_EMPRESA(xidEmpresa IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION CO_ENTREGAS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION CO_COMPRAS(xidCompra IN INTEGER) RETURN SYS_REFCURSOR;
END PA_ADMIN_ENVIOS;
/

CREATE OR REPLACE PACKAGE PA_ADMIN_SUCURSALES IS
    PROCEDURE AD_CIUDAD(xnombre IN VARCHAR);
    PROCEDURE EL_CIUDAD(xidCiudad IN INTEGER);

    FUNCTION CO_CIUDADES RETURN SYS_REFCURSOR;
END PA_ADMIN_SUCURSALES;
/

CREATE OR REPLACE PACKAGE PA_CLIENTE IS
    PROCEDURE AD_COMPRA(xvalor IN NUMBER, xcliente IN INTEGER);
    PROCEDURE AD_PAQUETE(xpeso IN NUMBER, xlargo IN NUMBER, xancho IN NUMBER, xalto IN NUMBER, xrepartidor IN INTEGER, xcompra IN INTEGER, xestado IN VARCHAR);
    PROCEDURE MO_PAQUETE(xidPaquete IN INTEGER, xestado IN VARCHAR);
    PROCEDURE AD_CONTIENE(xpaquete IN INTEGER, xproducto IN INTEGER);

    FUNCTION CO_COMPRAS(xidCompra IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION CO_TELEFONOS(xidRepartidor IN INTEGER) RETURN SYS_REFCURSOR;
    FUNCTION CO_REPARTIDORES_CIUDAD(xidCiudad IN INTEGER) RETURN SYS_REFCURSOR;
END PA_CLIENTE;
/