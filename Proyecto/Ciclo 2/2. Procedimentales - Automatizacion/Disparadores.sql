--Los id son autogenerados
CREATE SEQUENCE Empresa_seq
START WITH 1;

CREATE SEQUENCE Ciudades_seq
START WITH 1;

CREATE SEQUENCE Repartidores_seq
START WITH 1;

CREATE SEQUENCE Paquetes_seq
START WITH 1;

CREATE SEQUENCE Compras_seq
START WITH 1;

CREATE OR REPLACE TRIGGER TR_Empresa_id
    BEFORE
    INSERT
    ON EmpresasDeEnvios
    FOR EACH ROW
BEGIN
    :NEW.idEmpresa := Empresa_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_Ciudades_id
    BEFORE
    INSERT
    ON Ciudades
    FOR EACH ROW
BEGIN
    :NEW.idCiudad := Ciudades_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_Repartidores_id
    BEFORE
    INSERT
    ON Repartidores
    FOR EACH ROW
BEGIN
    :NEW.idRepartidor := Repartidores_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_Paquetes_id
    BEFORE
    INSERT
    ON Paquetes
    FOR EACH ROW
BEGIN
    :NEW.idPaquete := Paquetes_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_Compras_id
    BEFORE
    INSERT
    ON Compras
    FOR EACH ROW
BEGIN
    :NEW.idCompra := Compras_seq.NEXTVAL;
END;
/

--No se puede modificar una ciudad
CREATE OR REPLACE TRIGGER TR_Ciudades_mod
    BEFORE
    UPDATE
    ON Ciudades
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20050, 'No se puede modificar una ciudad');
END;
/

--Solo se puede modificar el nombre de los repartidores
CREATE OR REPLACE TRIGGER TR_Repartidores_mod
    BEFORE
    UPDATE
    ON Repartidores
BEGIN
    IF UPDATING('idRepartidor')
        OR UPDATING('tipoDocumento')
        OR UPDATING('numDocumento') 
    THEN
        RAISE_APPLICATION_ERROR(-20051, 'Solo se puede modificar el nombre de los repartidores');
    END IF;
END;
/

--La fecha de compra se asigna automáticamente
CREATE OR REPLACE TRIGGER TR_Compras_fecha
    BEFORE
    INSERT
    ON Compras
    FOR EACH ROW
BEGIN
    :NEW.fecha := SYSDATE;
END;
/

--No se puede modificar una compra
CREATE OR REPLACE TRIGGER TR_Compras_mod
    BEFORE
    UPDATE
    ON Compras
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20050, 'No se puede modificar una ciudad');
END;
/

--Solo se puede modificar el estado de un paquete
CREATE OR REPLACE TRIGGER TR_Paquetes_mod
    BEFORE
    UPDATE
    ON Paquetes
    FOR EACH ROW
BEGIN
    IF UPDATING('idPaquete')
        OR UPDATING('peso')
        OR UPDATING('largo') 
        OR UPDATING('ancho') 
        OR UPDATING('alto') 
        OR UPDATING('repartidor') 
        OR UPDATING('compra') 
    THEN
        RAISE_APPLICATION_ERROR(-20052, 'Solo se puede modificar estado del paquete');
    END IF; 
END;
/

--No se puede eliminar una compra
CREATE OR REPLACE TRIGGER TR_Compras_del
    BEFORE
    DELETE
    ON Compras
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20053, 'No se puede eliminar una compra');
END;
/
