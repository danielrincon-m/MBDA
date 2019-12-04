BEGIN
    PC_SUCURSAL.AD_CADENA('Nicolas-Skiles');
END;
/

BEGIN
    PC_CLIENTE.AD_CLIENTE('CC', 1032487556, 'DANIEL RINCÓN');
END;
/

DECLARE
    donantes SYS_REFCURSOR;
BEGIN
    SELECT PC_DONACIONES.CO_DONANTES INTO donantes FROM DUAL;
END;
/

DECLARE 
    l_cursor SYS_REFCURSOR;
    nombre cadena.nombre%TYPE;
    localidad sucursal.localidad%TYPE; 
    barrio sucursal.barrio%TYPE; 
    direccion sucursal.direccion%TYPE;
BEGIN
    SELECT PC_SUCURSAL.CO_SUCURSALES INTO l_cursor FROM DUAL;

    LOOP
        FETCH l_cursor
        INTO nombre, localidad, barrio, direccion;
        EXIT WHEN l_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(nombre || ' | ' || localidad || ' | ' || barrio || ' | ' || direccion);
    END LOOP;
END;
/