/*place*/
/*SELECT CONCAT('INSERT INTO place VALUES(',place_no,',',place_town,',',place_country,');') FROM place*/
INSERT INTO PLACE VALUES (1,'Manchester','England',
'<?xml version="1.0"?>
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
</detalle>');

INSERT INTO PLACE VALUES (2,'Edinburgh','Scotland',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "66" 
		longitud= "31147" 
		latidud= "555707">
	</ubicacion>
	<codigos
		codigo_postal= "EH1" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "7"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "2"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Morningside Apartments" estrellas= "5">
			<habitacion 
				nombre="Apartamento Deluxe" 
				precio= "3416860"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Balfour House Apt-Arthurs Seat view" estrellas= "4">
			<habitacion 
				nombre= "Apartamento con vistas a las montañas" 
				precio= "3616900" 
				servicio= "Tv pantalla plana, bañera, lavavajillas, wifi gratis"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion simple"
				precio= "45000"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Royal Mile" 
			importancia= "baja" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Puente de Forth" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (3,'Salzburg','Austria',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "435" 
		longitud= "130238" 
		latidud= "474757">
	</ubicacion>
	<codigos
		codigo_postal= "5020" 
		area= "662">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "10"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "21"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "14"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "3"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "MEININGER Hotel" estrellas= "3">
			<habitacion 
				nombre="Sencilla" 
				precio= "35000"
				tipo= "sencilla">
			</habitacion>
			<habitacion 
				nombre= "Habitacion doble" 
				precio= "45000"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Crowne Plaza" estrellas= "4">
			<habitacion 
				nombre= "Habitacion sencilla" 
				precio= "7000" 
				servicio= "wifi gratis, tv pantalla plana, lavanderia"
				tipo= "sencilla">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "18000"
				tipo= "sencilla">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Monasterio Capuchino" 
			importancia= "media" 
			tipo= "Historico">
		</atraccion>
		<atraccion
			nombre= "Lugar de nacimiento de Mozart" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (4,'New York','USA',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "57" 
		longitud= "740021" 
		latidud= "404251">
	</ubicacion>
	<codigos
		codigo_postal= "10001" 
		area= "718">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "7"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "17"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "0"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Row NYC" estrellas= "4">
			<habitacion 
				nombre="Habitacion simple" 
				precio= "700000"
				tipo= "simple">
			</habitacion>
			<habitacion 
				nombre= "Habitacion doble" 
				precio= "1600000"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "The Manhattan" estrellas= "4">
			<habitacion 
				nombre= "Habitacion simple" 
				precio= "650000" 
				servicio= "wifi gratis, tv pantalla plana"
				tipo= "simple">
			</habitacion>
			<habitacion
				nombre= "Habitacion doble"
				precio= "1300000"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Time Square" 
			importancia= "alta" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Rockefeller Center" 
			importancia= "media" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (5,'Birmingham','England','<?xml version="1.0"?>
<detalle>
	<ubicacion
		altitud= "149" 
		longitud= "15359" 
		latitud= "522853">
	</ubicacion>
	<codigos 
		codigo_postal= "B1" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "20"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "10"
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
		<hotel nombre= "Jurys Inn Birmingham" estrellas= "3">
			<habitacion 
			  nombre="Habitación Superior con cama extragrande" 
			  precio= "10161220"
			  tipo= "doble">
			</habitacion>
		    <habitacion 
			  nombre= "Habitación Executive con cama extragrande" 
			  precio= "14240880"
			  tipo= "doble">
		    </habitacion>
		</hotel>
		<hotel nombre= "Saint Pauls House" estrellas= "4">
		  <habitacion
			  nombre= "Habitación Doble Estándar" 
			  precio= "2467740" 
			  servicio= "Vistas a la ciudad,Aire acondicionado,Baño privado,WiFi gratis"
			  tipo= "doble">
		  </habitacion>
		  <habitacion
			  nombre= "Habitación Doble Superior"
			  precio= "2902760"
			  tipo= "doble">
		  </habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "National Motorcycle Museum Admission" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Symphony Hall" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
	</atracciones>
</detalle>') ;

INSERT INTO PLACE VALUES (6,'Glasgow','Scotland',
'<?xml version="1.0"?>
<detalle>
	<ubicacion
      altitud= "40" 
      longitud= "41527" 
      latidud= "555154">
  </ubicacion>
	<codigos 
      codigo_postal= "G1" 
      area= "3">
  </codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "15"
            mes_inicio= "marzo"
            mes_fin= "julio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "25"
            mes_inicio= "julio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "7"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "2"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
  <hoteles>
		<hotel nombre= "citizenM Glasgow" estrellas= "4">
			<habitacion
				nombre= "Habitación Doble" 
				precio= "1971820"
				servicio= "TV de pantalla plana, Aire acondicionado, Insonorización, Baño privado, WiFi gratis"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Jurys Inn Glasgow" estrellas= "4">
			<habitacion 
				nombre= "Habitación Doble Estándar - 2 camas" 
				precio= "1717940 " 
				servicio= " Aire acondicionado, Bañera Baño privado, TV de pantalla plana, WiFi gratis"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Triple"
				precio= "2424240"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Tour al lago Lomond y Castillo de Stirling desde Glasgow" 
			importancia= "media" 
			tipo= "Historia">
		</atraccion>
		<atraccion 
			nombre= "Excursión de un día al lago Ness, Glencoe y las Tierras Altas desde Glasgow" 
			importancia= "alta" 
			tipo= "Historia">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (7,'London','England',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "25" 
		longitud= "00732" 
		latidud= "513030">
	</ubicacion>
	<codigos
		codigo_postal= "E1" 
		area= "4">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "17"
            mes_inicio= "marzo"
            mes_fin= "mayo">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "22"
            mes_inicio= "junio"
            mes_fin= "agosto">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "19"
            mes_inicio= "septiembre"
            mes_fin= "noviembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "7"
            mes_inicio= "diciembre"
            mes_fin= "febrero">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "City Aldgate Apartments" estrellas= "3">
			<habitacion 
				nombre="Apartamento de 1 dormitorio" 
				precio= "300"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Apartamento de 2 dormitorios" 
				precio= "365"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Best Western London Peckham Hotel" estrellas= "3">
			<habitacion 
				nombre= "Habitación Doble - 2 camas" 
				precio= "241" 
				servicio= " Aire acondicionado, TV de pantalla plana, WiFi gratis"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Doble"
				precio= "241"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "London Eye" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
		<atraccion
			nombre= "Big Ben" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (8,'Chicago','USA',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "180" 
		longitud= "873900" 
		latidud= "415100">
	</ubicacion>
	<codigos
		codigo_postal= "60707" 
		area= "2">
	</codigos>
	<temperatura>
        <estacion
            nombre= "primavera"
            temperatura= "19"
            mes_inicio= "marzo"
            mes_fin= "junio">
        </estacion>
        <estacion
            nombre= "verano"
            temperatura= "28"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "15"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "-10"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "The Whitehall Hotel" estrellas= "4">
			<habitacion 
				nombre="Habitación con cama grande" 
				precio= "398"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Habitación con cama extragrande" 
				precio= "408"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "Staypineapple at The Alise Chicago" extrellas= "4">
			<habitacion 
				nombre= "Habitación Deluxe con cama extragrande" 
				precio= "340" 
				servicio= "Aire acondicionado, Baño privado, TV de pantalla plana"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Suite Junior"
				precio= "558"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Estación Millennium" 
			importancia= "baja" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Millennium Park" 
			importancia= "media" 
			tipo= "Entretenimiento">
		</atraccion>
	</atracciones>
</detalle>');

INSERT INTO PLACE VALUES (9,'Amsterdam','Netherlands',
'<?xml version="1.0"?>
<detalle>
	<ubicacion 
		altitud= "13" 
		longitud= "45322" 
		latidud= "522226">
	</ubicacion>
	<codigos
		codigo_postal= "1011" 
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
            temperatura= "25"
            mes_inicio= "junio"
            mes_fin= "septiembre">
        </estacion>
        <estacion
            nombre= "otoño"
            temperatura= "11"
            mes_inicio= "septiembre"
            mes_fin= "diciembre">
        </estacion>
        <estacion
            nombre= "invierno"
            temperatura= "3"
            mes_inicio= "diciembre"
            mes_fin= "marzo">
        </estacion>
	</temperatura>
	<hoteles>
		<hotel nombre= "Holiday Inn Express Amsterdam - Sloterdijk Station " estrellas= "3">
			<habitacion 
				nombre="Habitación Doble Estándar - 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
			<habitacion 
				nombre= "Habitación Doble Estándar - 1 o 2 camas" 
				precio= "368"
				tipo= "doble">
			</habitacion>
		</hotel>
		<hotel nombre= "NH Collection Amsterdam Grand Hotel Krasnapolsky" estrellas= "5">
			<habitacion 
				nombre= "Habitación Doble Superior - 1 o 2 camas" 
				precio= "898" 
				servicio= " Aire acondicionado, Baño privado, TV de pantalla plana"
				tipo= "doble">
			</habitacion>
			<habitacion
				nombre= "Habitación Doble Premium con vistas - 1 o 2 camas"
				precio= "1593"
				tipo= "doble">
			</habitacion>
		</hotel>
	</hoteles>
	<atracciones>
		<atraccion 
			nombre= "Basílica de San Nicolás" 
			importancia= "alta" 
			tipo= "Cultural">
		</atraccion>
		<atraccion
			nombre= "Casa de Ana Frank" 
			importancia= "alta" 
			tipo= "Historico">
		</atraccion>
	</atracciones>
</detalle>');



/*musician*/
/*SELECT CONCAT('INSERT INTO musician VALUES(',m_no,',',m_name,',','TO_DATE(',REPLACE(born,'-','/'),', yyyy/mm/dd)',',',CASE WHEN died IS NULL THEN 'null'  ELSE CONCAT('TO_DATE(',REPLACE(died,'-','/'),', yyyy/mm/dd)') END, ',',born_in,',',living_in,');') FROM musician*/
INSERT INTO musician VALUES(1,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),null,1,2);
INSERT INTO musician VALUES(2,'John Smith',TO_DATE('1950/03/03','YYYY/MM/DD'),null,3,4);
INSERT INTO musician VALUES(3,'Helen Smyth',TO_DATE('1948/08/08','YYYY/MM/DD'),null,4,5);
INSERT INTO musician VALUES(4,'Harriet Smithson',TO_DATE('1909/05/09','YYYY/MM/DD'),TO_DATE('1980/09/20','YYYY/MM/DD'),5,6);
INSERT INTO musician VALUES(5,'James First',TO_DATE('1965/06/10','YYYY/MM/DD'),null,7,7);
INSERT INTO musician VALUES(6,'Theo Mengel',TO_DATE('1948/08/12','YYYY/MM/DD'),null,7,1);
INSERT INTO musician VALUES(7,'Sue Little',TO_DATE('1945/02/21','YYYY/MM/DD'),null,8,9);
INSERT INTO musician VALUES(8,'Harry Forte',TO_DATE('1951/02/28','YYYY/MM/DD'),null,1,8);
INSERT INTO musician VALUES(9,'Phil Hot',TO_DATE('1942/06/30','YYYY/MM/DD'),null,2,7);
INSERT INTO musician VALUES(10,'Jeff Dawn',TO_DATE('1945/12/12','YYYY/MM/DD'),null,3,6);
INSERT INTO musician VALUES(11,'Rose Spring',TO_DATE('1948/05/25','YYYY/MM/DD'),null,4,5);
INSERT INTO musician VALUES(12,'Davis Heavan',TO_DATE('1975/10/03','YYYY/MM/DD'),null,5,4);
INSERT INTO musician VALUES(13,'Lovely Time',TO_DATE('1948/12/28','YYYY/MM/DD'),null,6,3);
INSERT INTO musician VALUES(14,'Alan Fluff',TO_DATE('1935/01/15','YYYY/MM/DD'),TO_DATE('1997/05/15','YYYY/MM/DD'),7,2);
INSERT INTO musician VALUES(15,'Tony Smythe',TO_DATE('1932/04/02','YYYY/MM/DD'),null,8,1);
INSERT INTO musician VALUES(16,'James Quick',TO_DATE('1924/08/08','YYYY/MM/DD'),null,9,2);
INSERT INTO musician VALUES(17,'Freda Miles',TO_DATE('1920/07/04','YYYY/MM/DD'),null,9,3);
INSERT INTO musician VALUES(18,'Elsie James',TO_DATE('1947/05/06','YYYY/MM/DD'),null,8,5);
INSERT INTO musician VALUES(19,'Andy Jones',TO_DATE('1958/10/08','YYYY/MM/DD'),null,7,6);
INSERT INTO musician VALUES(20,'Louise Simpson',TO_DATE('1948/01/10','YYYY/MM/DD'),TO_DATE('1998/02/11','YYYY/MM/DD'),6,6);
INSERT INTO musician VALUES(21,'James Steeple',TO_DATE('1947/01/10','YYYY/MM/DD'),null,5,6);
INSERT INTO musician VALUES(22,'Steven Chaytors',TO_DATE('1956/03/11','YYYY/MM/DD'),null,6,7);




/*composer*/
/*SELECT CONCAT('INSERT INTO composer VALUES(',comp_no,',',comp_is,',',comp_type,');') FROM composer*/
INSERT INTO composer VALUES(1,1,'jazz');
INSERT INTO composer VALUES(2,3,'classical');
INSERT INTO composer VALUES(3,5,'jazz');
INSERT INTO composer VALUES(4,7,'classical');
INSERT INTO composer VALUES(5,9,'jazz');
INSERT INTO composer VALUES(6,11,'rock');
INSERT INTO composer VALUES(7,13,'classical');
INSERT INTO composer VALUES(8,15,'jazz');
INSERT INTO composer VALUES(9,17,'classical');
INSERT INTO composer VALUES(10,19,'jazz');
INSERT INTO composer VALUES(11,10,'rock');
INSERT INTO composer VALUES(12,8,'jazz');



/*performer*/
/*SELECT CONCAT('INSERT INTO performer VALUES(',perf_no,',',perf_is,',',instrument,',',perf_type,');') FROM performer*/
INSERT INTO performer VALUES(1,2,'violin','classical');
INSERT INTO performer VALUES(2,4,'viola','classical');
INSERT INTO performer VALUES(3,6,'banjo','jazz');
INSERT INTO performer VALUES(4,8,'violin','classical');
INSERT INTO performer VALUES(5,12,'guitar','jazz');
INSERT INTO performer VALUES(6,14,'violin','classical');
INSERT INTO performer VALUES(7,16,'trumpet','jazz');
INSERT INTO performer VALUES(8,18,'viola','classical');
INSERT INTO performer VALUES(9,20,'bass','jazz');
INSERT INTO performer VALUES(10,2,'flute','jazz');
INSERT INTO performer VALUES(11,20,'cornet','jazz');
INSERT INTO performer VALUES(12,6,'violin','jazz');
INSERT INTO performer VALUES(13,8,'drums','jazz');
INSERT INTO performer VALUES(14,10,'violin','classical');
INSERT INTO performer VALUES(15,12,'cello','classical');
INSERT INTO performer VALUES(16,14,'viola','classical');
INSERT INTO performer VALUES(17,16,'flute','jazz');
INSERT INTO performer VALUES(18,18,'guitar','not known');
INSERT INTO performer VALUES(19,20,'trombone','jazz');
INSERT INTO performer VALUES(20,3,'horn','jazz');
INSERT INTO performer VALUES(21,5,'violin','jazz');
INSERT INTO performer VALUES(22,7,'cello','classical');
INSERT INTO performer VALUES(23,2,'bass','jazz');
INSERT INTO performer VALUES(24,4,'violin','jazz');
INSERT INTO performer VALUES(25,6,'drums','classical');
INSERT INTO performer VALUES(26,8,'clarinet','jazz');
INSERT INTO performer VALUES(27,10,'bass','jazz');
INSERT INTO performer VALUES(28,12,'viola','classical');
INSERT INTO performer VALUES(29,18,'cello','classical');




/*band*/
/*SELECT CONCAT('INSERT INTO band VALUES(',band_no,',',band_name,',',band_home,',',band_type,',',CASE WHEN b_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(b_date,'-','/'),', yyyy/mm/dd)') END, ',',band_contact,');') FROM band*/
INSERT INTO band VALUES(1,'ROP',5,'classical',TO_DATE('1930/01/01','YYYY/MM/DD'),11);
INSERT INTO band VALUES(2,'AASO',6,'classical',null,10);
INSERT INTO band VALUES(3,'The J Bs',8,'jazz',null,12);
INSERT INTO band VALUES(4,'BBSO',9,'classical',null,21);
INSERT INTO band VALUES(5,'The left Overs',2,'jazz',null,8);
INSERT INTO band VALUES(6,'Somebody Loves this',1,'jazz',null,6);
INSERT INTO band VALUES(7,'Oh well',4,'classical',null,3);
INSERT INTO band VALUES(8,'Swinging strings',4,'classical',null,7);
INSERT INTO band VALUES(9,'The Rest',9,'jazz',null,16);



/*composition*/
/*SELECT CONCAT('INSERT INTO composition VALUES(',c_no,',',CASE WHEN comp_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(comp_date,'-','/'),', 'yyyy/mm/dd)'') END, ',',c_title,',',c_in,');') FROM composition */
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','yyyy/mm/dd'),'A Last Song',6);
INSERT INTO composition VALUES(1,TO_DATE('1975/06/17','YYYY/MM/DD'),'Opus 1',1);
INSERT INTO composition VALUES(2,TO_DATE('1976/07/21','YYYY/MM/DD'),'Here Goes',2);
INSERT INTO composition VALUES(3,TO_DATE('1981/12/14','YYYY/MM/DD'),'Valiant Knight',3);
INSERT INTO composition VALUES(4,TO_DATE('1982/01/12','YYYY/MM/DD'),'Little Piece',4);
INSERT INTO composition VALUES(5,TO_DATE('1985/03/13','YYYY/MM/DD'),'Simple Song',5);
INSERT INTO composition VALUES(6,TO_DATE('1986/04/14','YYYY/MM/DD'),'Little Swing Song',6);
INSERT INTO composition VALUES(7,TO_DATE('1987/05/13','YYYY/MM/DD'),'Fast Journey',7);
INSERT INTO composition VALUES(8,TO_DATE('1976/02/14','YYYY/MM/DD'),'Simple Love Song',8);
INSERT INTO composition VALUES(9,TO_DATE('1982/01/21','YYYY/MM/DD'),'Complex Rythms',9);
INSERT INTO composition VALUES(10,TO_DATE('1985/02/23','YYYY/MM/DD'),'Drumming Rythms',9);
INSERT INTO composition VALUES(11,TO_DATE('1978/03/18','YYYY/MM/DD'),'Fast Drumming',8);
INSERT INTO composition VALUES(12,TO_DATE('1984/08/13','YYYY/MM/DD'),'Slow Song',7);
INSERT INTO composition VALUES(13,TO_DATE('1968/09/14','YYYY/MM/DD'),'Blue Roses',6);
INSERT INTO composition VALUES(14,TO_DATE('1983/11/15','YYYY/MM/DD'),'Velvet Rain',5);
INSERT INTO composition VALUES(15,TO_DATE('1982/05/16','YYYY/MM/DD'),'Cold Wind',4);
INSERT INTO composition VALUES(16,TO_DATE('1983/06/18','YYYY/MM/DD'),'After the Wind Blows',3);
INSERT INTO composition VALUES(17,null,'A Simple Piece',2);
INSERT INTO composition VALUES(18,TO_DATE('1985/01/12','YYYY/MM/DD'),'Long Rythms',1);
INSERT INTO composition VALUES(19,TO_DATE('1988/02/12','YYYY/MM/DD'),'Eastern Wind',1);
INSERT INTO composition VALUES(20,null,'Slow Symphony Blowing',2);

/*has_composed*/
/*SELECT CONCAT('INSERT INTO has_composed VALUES(',cmpr_no,',',cmpn_no,');') FROM has_composed*/
INSERT INTO has_composed VALUES(1,1);
INSERT INTO has_composed VALUES(1,8);
INSERT INTO has_composed VALUES(2,11);
INSERT INTO has_composed VALUES(3,2);
INSERT INTO has_composed VALUES(3,13);
INSERT INTO has_composed VALUES(3,14);
INSERT INTO has_composed VALUES(3,18);
INSERT INTO has_composed VALUES(4,12);
INSERT INTO has_composed VALUES(4,20);
INSERT INTO has_composed VALUES(5,3);
INSERT INTO has_composed VALUES(5,13);
INSERT INTO has_composed VALUES(5,14);
INSERT INTO has_composed VALUES(6,15);
INSERT INTO has_composed VALUES(6,21);
INSERT INTO has_composed VALUES(7,4);
INSERT INTO has_composed VALUES(7,9);
INSERT INTO has_composed VALUES(8,16);
INSERT INTO has_composed VALUES(9,5);
INSERT INTO has_composed VALUES(9,10);
INSERT INTO has_composed VALUES(10,17);
INSERT INTO has_composed VALUES(11,6);
INSERT INTO has_composed VALUES(12,7);
INSERT INTO has_composed VALUES(12,19);
/*plays_in*/
/*SELECT CONCAT('INSERT INTO plays_in VALUES(',player,',',band_id,');') FROM plays_in*/
INSERT INTO plays_in VALUES(1,1);
INSERT INTO plays_in VALUES(1,7);
INSERT INTO plays_in VALUES(3,1);
INSERT INTO plays_in VALUES(4,1);
INSERT INTO plays_in VALUES(4,7);
INSERT INTO plays_in VALUES(5,1);
INSERT INTO plays_in VALUES(6,1);
INSERT INTO plays_in VALUES(6,7);
INSERT INTO plays_in VALUES(7,1);
INSERT INTO plays_in VALUES(8,1);
INSERT INTO plays_in VALUES(8,7);
INSERT INTO plays_in VALUES(10,2);
INSERT INTO plays_in VALUES(12,2);
INSERT INTO plays_in VALUES(13,2);
INSERT INTO plays_in VALUES(14,2);
INSERT INTO plays_in VALUES(14,8);
INSERT INTO plays_in VALUES(15,2);
INSERT INTO plays_in VALUES(15,8);
INSERT INTO plays_in VALUES(17,2);
INSERT INTO plays_in VALUES(18,2);
INSERT INTO plays_in VALUES(19,3);
INSERT INTO plays_in VALUES(20,3);
INSERT INTO plays_in VALUES(21,4);
INSERT INTO plays_in VALUES(22,4);
INSERT INTO plays_in VALUES(23,4);
INSERT INTO plays_in VALUES(25,5);
INSERT INTO plays_in VALUES(26,6);
INSERT INTO plays_in VALUES(27,6);
INSERT INTO plays_in VALUES(28,7);
INSERT INTO plays_in VALUES(28,8);
INSERT INTO plays_in VALUES(29,7);


/*concert*/
/*SELECT CONCAT('INSERT INTO concert VALUES(',concert_no,',',concert_venue,',',concert_in,',','TO_DATE(',REPLACE(con_date,'-','/'),', yyyy/mm/dd)',',',concert_orgniser,');') FROM concert*/
INSERT INTO concert VALUES(1,'Bridgewater Hall',1,TO_DATE('1995/01/06','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(2,'Bridgewater Hall',1,TO_DATE('1996/05/08','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(3,'Usher Hall',2,TO_DATE('1995/06/03','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(4,'Assembly Rooms',2,TO_DATE('1997/09/20','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(5,'Festspiel Haus',3,TO_DATE('1995/02/21','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(6,'Royal Albert Hall',7,TO_DATE('1993/04/12','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(7,'Concertgebouw',9,TO_DATE('1993/05/14','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(8,'Metropolitan',4,TO_DATE('1997/06/15','YYYY/MM/DD'),21);


/*performances*/
/*SELECT CONCAT('INSERT INTO performances VALUES(',pfrmnc_no,',',gave,',',performed,',',conducted_by,',',performed_in,');') FROM performances*/
INSERT INTO performances VALUES(1,1,1,21,1);
INSERT INTO performances VALUES(2,1,3,21,1);
INSERT INTO performances VALUES(3,1,5,21,1);
INSERT INTO performances VALUES(4,1,2,1,2);
INSERT INTO performances VALUES(5,2,4,21,2);
INSERT INTO performances VALUES(6,2,6,21,2);
INSERT INTO performances VALUES(7,4,19,9,3);
INSERT INTO performances VALUES(8,4,20,10,3);
INSERT INTO performances VALUES(9,5,12,10,4);
INSERT INTO performances VALUES(10,5,13,11,4);
INSERT INTO performances VALUES(11,3,5,13,5);
INSERT INTO performances VALUES(12,3,6,13,5);
INSERT INTO performances VALUES(13,3,7,13,5);
INSERT INTO performances VALUES(14,6,20,14,6);
INSERT INTO performances VALUES(15,8,12,15,7);
INSERT INTO performances VALUES(16,9,16,21,8);
INSERT INTO performances VALUES(17,9,17,21,8);
INSERT INTO performances VALUES(18,9,18,21,8);
INSERT INTO performances VALUES(19,9,19,21,8);
INSERT INTO performances VALUES(20,4,12,10,3);