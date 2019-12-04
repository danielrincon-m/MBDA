BEGIN
    PC_SUCURSAL.MO_CADENA(2583, 'Carrefour');
END;
/
--La cadena #2583 no existe

BEGIN
    PC_CLIENTE.AD_DESEO(1520, 6984);
END;
/
--No existe ni el cliente ni el producto

DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PC_CLIENTE.CO_LISTADESEOS(2500) INTO l_cursor FROM DUAL;
END;
/
--No existe el cliente

DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PC_CLIENTE.CO_LISTADESEOS INTO l_cursor FROM DUAL;
END;
/
--Se llamó a la consulta sin un argumento