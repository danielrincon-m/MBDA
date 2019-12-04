-- Centimetro es una tienda de cadena que decidió registrarse en nuestra aplicación, y tiene un
-- gran descuento en chocolate suizo
EXECUTE PA_ADMIN_SUCURSALES.AD_CADENA('Centimetro');
EXECUTE PA_ADMIN_SUCURSALES.AD_SUCURSAL(sec_cadena.CURRVAL, 'Usaquen', 'Cedritos', 'Cl. 151 #16-59');

EXECUTE PA_ORG_PRODUCTOS.AD_PRODUCTO('Lindt', 'Chocolate suizo', 12000, '28/12/2020');
EXECUTE PA_ORG_PRODUCTOS.AD_PROMOCION(sec_producto.CURRVAL, '31/12/2019', '15/06/2020', TO_NUMBER('0,6'));

-- Luis miguel es un famoso que le gusta el chocolate suizo, y compra kilos y kilos cada mes para regalar a 
-- todos quienes lo reconocen en la calle
EXECUTE PA_ADMIN_SISTEMA.AD_CLIENTE('CC', 1000394667, 'Luis Miguel');
EXECUTE PA_ADMIN_SISTEMA.AD_DESEO(sec_cliente.CURRVAL, sec_producto.CURRVAL)

-- Una tienda de cadena llamada carrefive quiere saber que tan exitosa es nuestra aplicacion 
-- y como va el conteo de tiendas ayudadas
DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PA_CLIENTE.CO_SUCURSALES INTO l_cursor FROM DUAL;
END;
/

-- Una vez se diÓ cuenta que la aplicación es exitosa,
-- desean consultar cuales son los descuentos que está manejando la competencia
DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PA_CLIENTE.CO_PROMOCIONES INTO l_cursor FROM DUAL;
END;
/

-- Luis miguel era un gran cliente de ellos, pero se ha pasado a otras tiendas debido a sus precios bajos
-- carrefive desea consultar la lisa de deseos de Luis Miguel, para conocer los productos que le interesan,
-- y asi dar unas grandes promociones y recuperar a Luis Miguel
DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PA_CLIENTE.CO_LISTADESEOS(sec_cliente.CURRVAL) INTO l_cursor FROM DUAL;
END;
/

-- Con toda la informacion, y el ánimo de recuperar a su más grande cliente se animaron a registrarse en nuestra aplicacion 
EXECUTE PA_ADMIN_SUCURSALES.AD_CADENA('Carrefive');
EXECUTE PA_ADMIN_SUCURSALES.AD_SUCURSAL(sec_cadena.CURRVAL, 'Usaquen', 'Cedritos', 'Cl. 151 #16-56');

-- Y registrar la promoción favorita de Luis Miguel, con un mayor descuento
EXECUTE PA_ORG_PRODUCTOS.AD_PRODUCTO('Lindt', 'Chocolate suizo', 11000, '28/12/2020');
EXECUTE PA_ORG_PRODUCTOS.AD_PROMOCION(sec_producto.CURRVAL, '31/12/2019', '15/06/2020', TO_NUMBER('0,8'));

-- Pero Luis miguel no les quizo comprar, así que donaron el producto al banco de alimentos
EXECUTE PA_ADMIN_DONACIONES.AD_DONACION(sec_cadena.CURRVAL);
EXECUTE PA_ADMIN_DONACIONES.AD_CONTIENE(sec_donacion.CURRVAL, sec_producto.CURRVAL, 1500);

-- Tambien nos solicitan que otro tipo de donaciones se realuiza con mas frecuencia
DECLARE
    l_cursor SYS_REFCURSOR;
BEGIN
    SELECT PA_BANCO_ALIMENTOS.CO_DONANTES INTO l_cursor FROM DUAL;
END;
/