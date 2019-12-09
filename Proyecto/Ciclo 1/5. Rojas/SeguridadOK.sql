BEGIN
    PA_ADMIN_SUCURSALES.AD_CADENA('Nicolas-Skiles-two');
END;
/

BEGIN
    PA_ADMIN_SISTEMA.AD_CLIENTE('CC', 1032487557, 'DANIEL MUÑOZ');
END;
/

DECLARE
    donantes SYS_REFCURSOR;
BEGIN
    SELECT PA_BANCO_ALIMENTOS.CO_DONANTES INTO donantes FROM DUAL;
END;
/

DECLARE 
    l_cursor SYS_REFCURSOR;
    nombre cadena.nombre%TYPE;
    localidad sucursal.localidad%TYPE; 
    barrio sucursal.barrio%TYPE; 
    direccion sucursal.direccion%TYPE;
BEGIN
    SELECT PA_CLIENTE.CO_SUCURSALES INTO l_cursor FROM DUAL;

    LOOP
        FETCH l_cursor
        INTO nombre, localidad, barrio, direccion;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(nombre || ' | ' || localidad || ' | ' || barrio || ' | ' || direccion);
    END LOOP;
END;
/