--Agregar musico
BEGIN
    PC_Mantener_Musico.AD_Musico('Fred Bloggs',TO_DATE('02/01/1948', 'DD/MM/YYYY'),'','1','2',
'<Detalle>
	<Pagina url="https://storify.com" />
	<OtrosNombres>
		<Nombre nombre="ngodfree0" razon="Bamity"/>
	</OtrosNombres>
	<Sellos>
		<Sello nombre="Torphy-Torp" />
	</Sellos>
	<Discos>
		<Disco nombre="Ragwort" anho="2005"/>
	</Discos>
	<Premios>
		<Premio nombre="disintermediate" anho="1990"/>
	</Premios>
	<Universidades>
		<Universidad nombre="Institute of Technology and Management" anhoInicio="1992" anhoFin="2002" titulo="Analyst Programmer"/>
	</Universidades>
	<Hijos>
		<Hijo nombre="Nanny Godfree" sexo="Femenino"/>
	</Hijos>
</Detalle>');
END;
/

--Modificar músico
BEGIN
    PC_Mantener_Musico.MO_Musico(1, TO_DATE('02/01/2019', 'DD/MM/YYYY'), 1);
END;
/

--Eliminar musico
BEGIN
    PC_Mantener_Musico.EL_Musico(1);
END;
/

--Consultar CRUD Musico
SELECT PC_Mantener_Musico.CO_Musico FROM DUAL;
SELECT PC_Mantener_Musico.CO_Interpretes FROM DUAL;
SELECT PC_Mantener_Musico.CO_Compositores FROM DUAL;

--Agregar composición
BEGIN
    PC_Registrar_Composicion.AD_Composicion('1',TO_DATE('17/06/1975', 'DD/MM/YYYY'),'Opus 1','1');
END;
/

--Consultar CRUD Composicion
SELECT PC_Registrar_Composicion.CO_Composicion FROM DUAL;