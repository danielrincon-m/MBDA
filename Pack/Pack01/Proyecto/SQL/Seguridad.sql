--********************************************************************
------------------------------roles----------------------------------
--*******************************************************************
Create role administrador identified by administrador;
Create role empleado identified by empleado;

--********************************************************************
-----------------------------Permisos--------------------------------
--********************************************************************
Grant PC_CASA_PAIS TO administrador;
Grant PC_Factura TO empleado;
Grant PC_LICORES TO empleado;
Grant PC_cocteles TO empleado;
