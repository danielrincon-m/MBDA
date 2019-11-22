--Agregar musico
--Datos Faltantes
BEGIN
    PC_Mantener_Musico.AD_Musico('',TO_DATE('02/01/1948', 'DD/MM/YYYY'),'','1','2',
'<Detalle>
	<Pagina url="https://storify.com" />
	<OtrosNombres>
		<Nombre nombre="ngodfree0" razon="Bamity"/>
	</OtrosNombres>
	<Hijos>
		<Hijo nombre="Nanny Godfree" sexo="Femenino"/>
	</Hijos>
</Detalle>');
END;
/

--Modificar músico
--Id no existente
BEGIN
    PC_Mantener_Musico.MO_Musico(250000, TO_DATE('02/01/2019', 'DD/MM/YYYY'), 1);
END;
/

--Eliminar musico
--Id invalido
BEGIN
    PC_Mantener_Musico.EL_Musico(-1);
END;
/

--Agregar composición
--Composición sin nombre
BEGIN
    PC_Registrar_Composicion.AD_Composicion('1',TO_DATE('17/06/1975', 'DD/MM/YYYY'),'','1');
END;
/