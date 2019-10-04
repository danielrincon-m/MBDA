--***********************************************************************
------------------------------Cocteles-----------------------------------
--***********************************************************************
Create or replace package PC_cocteles is
  procedure Ad_coctel(nombre Varchar, hielo Varchar);
  procedure Mo_coctel(Nnombre Varchar, Nhielo Varchar);
  procedure Ad_pasos (coctel Varchar, pasos Varchar);
  procedure Ad_ingrediente(coctel Varchar, ingrediente Varchar);
end;
/
Create or replace package body PC_cocteles is
  procedure Ad_coctel(nombre Varchar, hielo Varchar) IS
    Begin
    Insert into coctel(nombre, hielo) values(nombre, hielo);
    commit;
    exception when others then rollback;
    raise_application_error(-20050, 'Informacion Invalida');
    end Ad_coctel;
  
  procedure Mo_coctel (Nnombre Varchar, Nhielo Varchar) Is
    Begin
    Update coctel set hielo = Nhielo where nombre = Nnombre;
    commit;
    exception when others then rollback;
    raise_application_error(-20051, 'Informacion Invalida');
    end Mo_coctel;
  
  procedure Ad_pasos (coctel Varchar, pasos Varchar) Is
    Begin
    Insert Into pasos(coctel, preparacion) Values(coctel, pasos);
    commit;
    exception when others then rollback;
    raise_application_error(-20052, 'Informacion Invalida');
    End Ad_pasos;
    
  procedure Ad_ingrediente(coctel Varchar, ingrediente Varchar) IS
    Begin
    Insert Into ingredientes(coctel,ingrediente) Values (coctel, ingrediente);
    commit;
    exception when others then rollback;
    raise_application_error(-20053, 'Informacion Invalida');
    End Ad_ingrediente;
 End;
 /
 --************************************************************************
 -----------------------------Casa y pais-------------------------------------
 --***********************************************************************
Create or replace package PC_casa_pais IS
  procedure Ad_Casa(nombre Varchar, pais Varchar);
  procedure Mo_Casa(casa_vieja Varchar, casa_nueva Varchar);
  procedure El_Casa(viejo_nombre Varchar);
End;
/
Create or replace package body PC_casa_pais IS
  procedure Ad_Casa (nombre Varchar, pais Varchar) IS
  Begin
  Insert Into casas(nombre , pais ) Values(nombre, pais);
  commit;
  exception when others then rollback;
  raise_application_error(-20054, 'Informacion Invalida');
  End Ad_Casa;
  
  procedure Mo_casa(casa_vieja Varchar, casa_nueva Varchar) IS
  Begin
  Update casas set nombre = casa_nueva where nombre = casa_vieja;
  commit;
  exception when others then rollback;
  raise_application_error(-20055, 'Informacion Invalida');
  End Mo_casa;
  
  procedure El_Casa(viejo_nombre Varchar) IS
  Begin
  delete from casas where nombre = viejo_nombre;
  commit;
  exception when others then rollback;
  raise_application_error(-20056, 'Informacion Invalida');
  End El_Casa;
End;
/
--**********************************************************************
-------------------------Facturas-----------------------------------
--*********************************************************************
Create or replace package PC_factura Is
  procedure Ad_factura(numero Number);
  procedure Ad_esde(licor_esp Varchar, presentacion Varchar, cantidad Number, precio_unitario Number, material Varchar);
End;
/
Create or replace package body PC_factura Is
  Procedure Ad_factura(numero Number) IS
  Begin
  Insert into factura_compra(num_fact) values(numero);
  commit;
  exception when others then rollback;
  raise_application_error(-20057, 'Informacion Invalida');
  End Ad_factura;
  
  Procedure Ad_esde(licor_esp Varchar, presentacion Varchar, cantidad Number, precio_unitario Number, material Varchar) IS
  Begin
  Insert Into esde(licor_especifico, presentacion, cantidad, precio_unitario, material_pres) Values(licor_esp,presentacion,cantidad, precio_unitario, material );
  commit;
  exception when others then rollback;
  raise_application_error(-20058, 'Informacion Invalida');
  End Ad_esde;
End;
/
--*************************************************************************
--------------------------Licores------------------------------------------
--*************************************************************************
Create or replace package Pc_licores Is
  procedure Ad_present(cantidad Varchar, material Varchar, descripcion varchar);
  procedure Ad_pres(licor_espec Varchar, pres Varchar, material Varchar, precio_vent Number, unidades_disp Number);
  Procedure Mo_tiene_precio(licor_espec Varchar, pres Varchar, Nmaterial Varchar, precio_vent Number);
  Procedure Mo_tiene_unidades(licor_espec Varchar, pres Varchar, Nmaterial Varchar, unidades_quitadas Number);
  Procedure Ad_licor_espec(nombre Varchar, casa varchar, licor Varchar, descripcion Varchar, por_alcohol Number, color Varchar);
  Procedure Ad_licor(nombre Varchar,pais Varchar, rango_alc Varchar, sabor Varchar, descripcion XMLType);
  Procedure Mo_licor(Nnombre Varchar, Ndescripcion XMLType);
  Procedure Ad_licor_an(licor_espec Varchar,anos Number, barril Varchar, sabor Varchar);
  Procedure Ad_en_base(licor Varchar, en_base Varchar);
End;
/
Create or replace package body Pc_licores IS
  procedure Ad_present(cantidad Varchar, material Varchar, descripcion varchar) Is
  Begin
  Insert into presentaciones(cantidad, material, descripcion) Values (cantidad, material, descripcion);
  commit;
  exception when others then rollback;
  raise_application_error(-20059, 'Informacion Invalida');
  End Ad_present;
  
  procedure Ad_pres(licor_espec Varchar, pres Varchar, material Varchar, precio_vent Number, unidades_disp Number) IS
  Begin
  Insert into tiene_pres(licores_especifico, presentacion, material, precio_venta, unidades_disp) Values(licor_espec, pres, material, precio_vent, unidades_disp); 
  commit;
  exception when others then rollback;
  raise_application_error(-20060, 'Informacion Invalida');
  End Ad_pres;
  
  Procedure Mo_tiene_precio(licor_espec Varchar, pres Varchar, Nmaterial Varchar, precio_vent Number) IS
  Begin
  Update tiene_pres set precio_venta = precio_vent where licores_especifico = licor_espec and presentacion = pres and material = Nmaterial;
  commit;
  exception when others then rollback;
  raise_application_error(-20061, 'Informacion Invalida');
  End Mo_tiene_precio;
  
  Procedure Mo_tiene_unidades(licor_espec Varchar, pres Varchar, Nmaterial Varchar, unidades_quitadas Number) is
  Begin
  Update tiene_pres set unidades_disp=unidades_disp-unidades_quitadas where licores_especifico = licor_espec and presentacion = pres and material = Nmaterial;
  commit;
  exception when others then rollback;
  raise_application_error(-20062, 'Informacion Invalida');
  End Mo_tiene_unidades;
  
  Procedure Ad_licor_espec(nombre Varchar, casa varchar, licor Varchar, descripcion Varchar, por_alcohol Number, color Varchar) is
  Begin
  Insert Into licores_especificos(nombre, casa, licor, descripcion, por_alcohol, color) Values (nombre, casa, licor, descripcion, por_alcohol, color);
  commit;
  exception when others then rollback;
  raise_application_error(-20063, 'Informacion Invalida');
  End Ad_licor_espec;
  
  Procedure Ad_licor(nombre Varchar,pais Varchar, rango_alc Varchar, sabor Varchar, descripcion XMLType) IS
  Begin
  Insert into licor(nombre, pais, rango_alc, sabor, descripcion) Values(nombre, pais, rango_alc, sabor, descripcion);
  commit;
  exception when others then rollback;
  raise_application_error(-20064, 'Informacion Invalida');
  End Ad_licor;
  
  Procedure Mo_licor(Nnombre Varchar, Ndescripcion XMLType) IS
  BEgin
  Update licor set descripcion = Ndescripcion where nombre = Nnombre;
  commit;
  exception when others then rollback;
  raise_application_error(-20065, 'Informacion Invalida');
  End Mo_licor;
  
  Procedure Ad_licor_an(licor_espec Varchar,anos NUmber, barril Varchar, sabor Varchar) IS
  Begin
  Insert into licor_anejo(licor_especifico, anos_anejamiento, barril, sabor) Values (licor_espec, anos, barril, sabor);
  commit;
  exception when others then rollback;
  raise_application_error(-20066, 'Informacion Invalida');
  End Ad_licor_an;
  
  Procedure Ad_en_base(licor Varchar, en_base Varchar) IS
  Begin
  Insert into en_base(licor, en_base) Values(licor, en_base);
  commit;
  exception when others then rollback;
  raise_application_error(-20067, 'Informacion Invalida');
  End Ad_en_base;
end;
  
  
  
