INSERT INTO paises
(nombre,restriccion)
VALUES
('Colombia','No tiene');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Rusia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Mejico','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Holanda','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Japon','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Cuba','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Brasil','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Italia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Curazao','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Alemania','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('USA','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Suiza','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Grecia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Francia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Escocia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Irlanda','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Polonia','Pendiente');

INSERT INTO paises
(nombre,restriccion)
VALUES
('Inglaterra','Pendiente');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Baileis','Irlanda','17%-17%','Suave y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Whisky','Escocia','40%-62%','Seco, Ahumado y Fuerte',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> Amarillo, color ambar </colores>
  <tradicional metodo="Se suele tomar solo, con hielo o con cocacola"> 
    <elementos> cocacola </elementos>
    <elementos> hielo </elementos>
  </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Grappa','Italia','38%-60%','Suave y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Armagnac','Francia','52%-72%','fuerte y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Cognac','Francia','36%-60%','Suave y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Brandy','Grecia','36%-60%','Suave y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Absenta','Suiza','55%-90%','Fuerte y Herbal',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> Verde claro </colores>
  <variacion>
    <sabor> fuerte, seco y muy herbal </sabor>
    <color> rojo </color>
  </variacion>
  <variacion>
    <sabor> fuerte, seco y muy herbal </sabor>
    <color> verde </color>
    <agregados> canabis </agregados>
  </variacion>
  <tradicional metodo="Es tan fuerte que se prepara con azucar y agua"> 
    <elementos> azucar </elementos>
    <elementos> agua </elementos>
  </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Everclear','USA','75%-95%','Fuerte y Seco');

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Jagermeister','Alemania','35%-35%','Fuerte y Herbal',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> negro </colores>
  <tradicional metodo="se toma solo o con redbull o cocacola"> 
    <elementos> redbull </elementos>
    <elementos> cocacola </elementos>
  </tradicional>
</descripcion>'));

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Amaretto','Italia','23%-30%','Suave y Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Vermouth','Italia','10%-20%','Suave');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Curacao','Curazao','15%-40%','Suave y Citrico');

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Limoncello','Italia','22%-30%','Suave y Citrico',XMLTYPE('
<descripcion>
  <colores> amarillo intenso </colores>
  <variacion>
    <sabor> suave citrico </sabor>
    <color> amarillo </color>
    <agregados> aparte de limon se puede hacer con otras frutas </agregados>
  </variacion>
  <tradicional metodo="es un aperitivo asi que se toma como acompañamiento"> </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Cachaza','Brasil','38%-51%','Fuerte y Seco');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Mezcal','Mejico','36%-55%','Fuerte y Seco');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Ron','Cuba','40%-80%','Dulce');

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Aguardiente','Colombia','24%-50%','Fuerte a anis');

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Vodka','Rusia','37%-60%','Seco y Fuerte sin distincion',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> incoloro </colores>
  <variacion>
    <sabor> sabores frutales </sabor>
    <color> incoloro, o leves tintes dependiendo del sabor </color>
    <agregados> al ser un licor tan fuerte y sin sabor, se hace tambien con frutas </agregados>
  </variacion>
  <tradicional metodo="Al no tener mucho sabor se suele tomar con jugo de naranja"> 
    <elementos> jugo de naranja </elementos>
  </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Tequila','Mejico','37%-60%','Fuerte y Seco',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> incoloro o amarillo </colores>
  <variacion>
    <sabor> muy parecido al tequila normal </sabor>
    <color> amarillo </color>
    <agregados> gusano del agabe </agregados>
    <agregados> animales del desierto </agregados>
  </variacion>
  <tradicional metodo="se ingiere sal, se toma el shot, y se come limon, en ese orden"> 
    <elementos> limon </elementos>
    <elementos> sal </elementos>
  </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor,descripcion)
VALUES
('Ginebra','Holanda','37%-50%','Herbal y Fuerte',XMLTYPE('
<!DOCTYPE descripcion[
  <!ELEMENT descripcion (colores+,variacion*,tradicional?)>
  <!ELEMENT colores (#PCDATA)>
  <!ELEMENT variacion (sabor,color,agregados*)>
  <!ELEMENT tradicional (elementos*)>
  <!ELEMENT sabor (#PCDATA)>
  <!ELEMENT color (#PCDATA)>
  <!ELEMENT agregados (#PCDATA)>
  <!ELEMENT elementos (#PCDATA)>

  <!ATTLIST tradicional metodo CDATA #REQUIRED>
]> 

<descripcion>
  <colores> incoloro </colores>
  <tradicional metodo="Es un trago con mucho olor y fuerte, se toma con agua tonica y pepino"> 
    <elementos> pepino </elementos>
    <elementos> agua tonica </elementos>
  </tradicional>
</descripcion>'
));

INSERT INTO licor
(nombre,pais,rango_alc,sabor)
VALUES
('Sake','Japon','14%-20%','Seco y Suave');

INSERT INTO en_base
(licor, en_base)
VALUES
('Baileis', 'Whisky');

INSERT INTO en_base
(licor, en_base)
VALUES
('Whisky', 'Trigo');

INSERT INTO en_base
(licor, en_base)
VALUES
('Whisky', 'Cebada');

INSERT INTO en_base
(licor, en_base)
VALUES
('Whisky', 'Malta');

INSERT INTO en_base
(licor, en_base)
VALUES
('Grappa', 'Uva');

INSERT INTO en_base
(licor, en_base)
VALUES
('Armagnac', 'Uva');

INSERT INTO en_base
(licor, en_base)
VALUES
('Cognac', 'Uva');

INSERT INTO en_base
(licor, en_base)
VALUES
('Brandy', 'Uva');

INSERT INTO en_base
(licor, en_base)
VALUES
('Absenta', 'Anis');

INSERT INTO en_base
(licor, en_base)
VALUES
('Absenta', 'Flor de hinojo');

INSERT INTO en_base
(licor, en_base)
VALUES
('Absenta', 'Ajenjo');

INSERT INTO en_base
(licor, en_base)
VALUES
('Everclear', 'Maiz');

INSERT INTO en_base
(licor, en_base)
VALUES
('Jagermeister', 'hierbas');

INSERT INTO en_base
(licor, en_base)
VALUES
('Amaretto', 'Albaricoque');

INSERT INTO en_base
(licor, en_base)
VALUES
('Amaretto', 'Almendras');

INSERT INTO en_base
(licor, en_base)
VALUES
('Vermouth', 'Ajenjo');

INSERT INTO en_base
(licor, en_base)
VALUES
('Vermouth', 'Vino blanco');

INSERT INTO en_base
(licor, en_base)
VALUES
('Curacao', 'Naranja amarga');

INSERT INTO en_base
(licor, en_base)
VALUES
('Limoncello', 'Cascara de limon');

INSERT INTO en_base
(licor, en_base)
VALUES
('Cachaza', 'Caña de azucar');

INSERT INTO en_base
(licor, en_base)
VALUES
('Mezcal', 'Agave');

INSERT INTO en_base
(licor, en_base)
VALUES
('Ron', 'Caña de azucar');

INSERT INTO en_base
(licor, en_base)
VALUES
('Aguardiente', 'Anis');

INSERT INTO en_base
(licor, en_base)
VALUES
('Vodka', 'Papa');

INSERT INTO en_base
(licor, en_base)
VALUES
('Vodka', 'Maiz');

INSERT INTO en_base
(licor, en_base)
VALUES
('Vodka', 'Trigo');

INSERT INTO en_base
(licor, en_base)
VALUES
('Tequila', 'Agave');

INSERT INTO en_base
(licor, en_base)
VALUES
('Ginebra', 'Centeno');

INSERT INTO en_base
(licor, en_base)
VALUES
('Ginebra', 'Cebada');

INSERT INTO en_base
(licor, en_base)
VALUES
('Ginebra', 'Maiz');

INSERT INTO en_base
(licor, en_base)
VALUES
('Ginebra', 'Enebro');

INSERT INTO en_base
(licor, en_base)
VALUES
('Sake', 'Arroz');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Tequila sunrise','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Tequila','Tequila sunrise','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Tequila sunrise','Granadina');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Tequila sunrise','Jugo naranja');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Tequila sunrise','Poner hielo, agregar el tequila y jugo de naranja, servir y ponerle granadina, adornar con una rodaja de naranja');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Tequini','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Tequila','Tequini','1');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Vermouth','Tequini','1.5');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Tequini','Revolver el vermouth y el tequila con el hielo, y servir adornado con cascara de limon');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Bloody Mary','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Vodka','Bloody Mary','1');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Bloody Mary','Jugo de tomate');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Bloody Mary','Jugo de limon');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Bloody Mary','Gotas de salsa inglesa');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Bloody Mary','Meter todos los ingredientes a la coctelera, y servir adornado de apio');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Blue Lagoon','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Vodka','Blue Lagoon','1');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Curacao','Blue Lagoon','1');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Blue Lagoon','Sprite');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Blue Lagoon','Combinar el vodka y el curacao azul y servir, llenar lo que falta de la copa con sprite, adornar con limon');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Caipirinha','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Cachaza','Caipirinha','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Caipirinha','Limon');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Caipirinha','Azucar');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Caipirinha','poner el jugo de limon con el azucar y macerarlo junto al limon, agregar la cachaza y servir');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Martini','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Ginebra','Martini','2');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Vermouth','Martini','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Martini','Gotas amargas');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Martini','Revolver la ginebra con el vermouth y el hielo, servir y agregar las gotas amargas');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Gin Tonic','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Ginebra','Gin Tonic','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Gin Tonic','Pepino');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Gin Tonic','Agua Tonica');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Gin Tonic','Servir el hielo adornando con pepino en rodajas, ponerle ginebra y por ultimo el agua tonica');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Mojito','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Ron','Mojito','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Mojito','Jugo de limon');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Mojito','Hojas de menta');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Mojito','Azucar');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Mojito','Revolver el jugo de limon junto al ron y el azucar, servirlo en un vaso con hielo y adornar con hojas de menta');

INSERT INTO coctel
(nombre,hielo)
VALUES
('Piña Colada','Y');

INSERT INTO contiene
(licor, coctel,cantidad)
VALUES
('Ron','Piña Colada','2');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Piña Colada','Jugo de piña');

INSERT INTO ingredientes
(coctel, ingrediente)
VALUES 
('Piña Colada','Leche de coco');

INSERT INTO pasos
(coctel,preparacion)
VALUES
('Piña Colada','Poner la leche de coco junto al jugo de piña, el hielo y el ron en una licuadora y servir');
