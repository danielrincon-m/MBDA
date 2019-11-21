/*Insertar lugar*/
begin
PC_lugar.AD_LUGAR('Manchester','England',xmltype('<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "51" 
		longitud= "21414" 
		latidud= "532851">
	</ubicacion>
	<codigos
		codigo_postal= "M1" 
		area= "3">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "26"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "12"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "5"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "City Dreams" estrellas= "4">
			<habitacion 
				nombre= "Suit sencilla" 
				precio= "1200"
				tipo= "simple">
			</habitacion>
			<habitacion 
				nombre= "Suit precidencial" 
				precio= "1400"
				tipo= "simple">
			</habitacion>
		</hotel>
		<hotel nombre= "Holiday Inn Express Manchester City Centre" estrellas= "3">
			<habitacion 
				nombre= "Habitacion sencilla" 
				precio= "300" 
				servicio= "Conexión WiFi gratuita, Habitaciones no fumadores, Adaptado personas de movilidad reducida, Recepción 24 horas"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "560"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Teatro The Palace" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Barrio gay de Mánchester" 
			importancia= "media" 
			tipo= "Cultural">
		</atraccion>
	</atracciones>
</detalle>'));
end;

BEGIN
PC_LUGAR.AD_LUGAR('Edinburgh','Scotland',
XMLTYPE('<?xml version="1.0"?>
<detalle></detalle>'));
END;

BEGIN
PC_LUGAR.AD_LUGAR('London','Scotland',
XMLTYPE('<?xml version="1.0"?>
<detalle></detalle>'));
END;


/*INSERTAR MUSICO*/
EXECUTE PC_MUSICO.AD_MUSICO ('JOHN',TO_DATE('1998/01/02','YYYY/MM/DD'),null,100,null);
/*ELIMINAR MUSICO*/
EXECUTE PC_MUSICO.EL_MUSICO (1);
/*MODIFICAR MUSICO*/
EXECUTE PC_MUSICO.MOD_MUSICO (22,NULL,100);




