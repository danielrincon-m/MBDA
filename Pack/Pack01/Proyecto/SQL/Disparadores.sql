--************************************************************
----------------------------Registrar casa--------------------
--************************************************************

-----Numero de la casa consecutivo
Create or replace Trigger Ad_Casa
Before Insert On Casas
For Each Row
Declare
cons Number;
Begin
Select count(*)+1 into cons from casas;
:new.num_casa := cons;
End Ad_Casa;
/
--Solo se puede cambiar el nombre de la casa
Create or replace Trigger Mo_casa
Before update On Casas
For each row
Begin
If :new.num_casa != :old.num_casa or :new.pais != :old.pais then
raise_application_error(-20007, 'Solo se puede cambiar el nombre de la casa');
end if;
end Mo_casa;
/

--***********************************************************
-----------------------Registrar Pais------------------------
--***********************************************************

--No se puede cambiar el nombre del pais
Create or replace trigger Mo_pais
Before Update of nombre on paises
for each row
Begin
raise_application_error(-20008, 'No se puede cambiar el nombre del pais');
End Mo_pais;
/

--No se puede eliminar un pais
Create or replace trigger El_pais
Before delete ON paises
for each row
begin
raise_application_error(-20009, 'No se puede eliminar un pais');
end El_pais;
/

--***********************************************************
--------------------Mantener licor general-------------------
--***********************************************************

--Solo se puede modificar la descripcion del licor general
Create or replace trigger Mo_licor
Before Update on licor
For Each Row
begin
If :new.nombre != :old.nombre or :new.pais != :old.pais or :new.rango_alc != :old.rango_alc or :new.sabor != :old.sabor then
raise_application_error(-20010, 'Solo se puede modificar la descripcion');
end if;
end Mo_licor;
/
--No se pueden eliminar los licores
Create or replace trigger El_licor
Before delete on licor
For Each Row
Begin
raise_application_error(-20003, 'No se puede eliminar los licores');
end;
/
--*************************************************************
----------------Registrar Factura de compra-------------------
--*************************************************************

---------Numero de factura consecutivo
Create or replace Trigger Ad_factura
Before Insert On factura_compra
for each row
declare
cons Number;
begin
Select count(*)+1 into cons from factura_compra;
:new.num_fact := cons;
:new.fecha := current_date;
end Ad_factura;
/
---------Solo se pueden insertar de la ultima factura de la tabla esde
Create or replace Trigger Ad_EsDe
Before Insert On ESDE
For Each Row
Declare
cons Number;
Begin
Select count(*) into cons from factura_compra;
:new.factura_compra := cons;
If :new.cantidad < 10 then
raise_application_error(-20004, 'No se puede comprar menos de 10 unidades');
end if;
End Ad_EsDe;
/

-----------NO se puede eliminar la factura
Create or replace trigger El_Factura
Before Delete ON factura_compra
For each Row
Begin
raise_application_error(-20005, 'No se puede Eliminar factura');
End El_factura;
/
Create or replace trigger El_EsDe
Before Delete ON EsDe
For each Row
Begin
raise_application_error(-20006, 'No se puede Eliminar factura');
End El_factura;
/

--**************************************************************
-----------------licores espesificos----------------------------
--**************************************************************
--No se puede modificar nada
Create or replace trigger Mo_licores_especificos
Before update on licores_especificos
Begin
raise_application_error(-20011, 'No se puede modificar');
end Mo_licores_especificos;
/
----No se puede elimiar licores espesificos
Create or replace trigger El_licores_especificos
Before delete on licores_especificos
For Each Row
Begin
raise_application_error(-20002, 'No se puede eliminar los licores espesificos');
end;
/

--********************************************************************
-----------------Mantener cocteles---------------------------------
--******************************************************************
--Adicioanr coctel
Create or replace trigger Ad_coctel
Before insert on coctel
for each row
begin
if :new.hielo Is NUll Then
:new.hielo := 'N';
end if;
end Ad_coctel;
/

--Modificar coctel
Create or replace trigger Mo_coctel
Before Update On coctel
for each row
Begin
If :new.nombre != :old.nombre then
raise_application_error(-200012, 'Solo se puede modificar el hielo');
end if;
end Mo_coctel;
/

Create or replace trigger Mo_pasos
Before update on pasos
for each row
Begin
If :new.coctel != :old.coctel or :new.preparacion != :old.preparacion then
raise_application_error(-200012, 'No se puede modificar nada');
end if;
end Mo_pasos;
/
Create or replace trigger Mo_Ingredientes
Before Update on ingredientes
for each row
Begin
If :new.coctel != :old.coctel or :new.ingrediente != :old.ingrediente then
raise_application_error(-200012, 'No se puede modificar nada');
end if;
end Mo_pasos;
/





