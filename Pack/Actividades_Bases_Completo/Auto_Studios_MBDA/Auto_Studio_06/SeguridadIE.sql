create or replace package seg_admin is
procedure ad_tarifa (ct varchar, ndd number, vdc number);
procedure el_tarifa (ct varchar);
function pago_mes return sys_refcursor;
end seg_admin;

create or replace package seg_ciudadano is
procedure ad_pago (n number, f_p date, v number, p varchar, p_f date);
function ver_tarifas return sys_refcursor;
end seg_ciudadano;

create or replace package body seg_admin as
procedure ad_tarifa (ct varchar, ndd number, vdc number) is
begin
mantener_tarifas.agregar_tarifa (ct, ndd, vdc);
end;
procedure el_tarifa (ct varchar) is
begin
mantener_tarifas.eliminar_tarifa (ct);
end;
function pago_mes return sys_refcursor as pagos sys_refcursor;
begin
pagos := consultas.consultar_pagos_ultimo_mes;
end;
end seg_admin;

create or replace package body seg_ciudadano as
procedure ad_pago (n number, f_p date, v number, p varchar, p_f date) is
begin
registrar_pagos.agregar_pago(n, f_p, v, p, p_f);
end;
function ver_tarifas return sys_refcursor as tarifas sys_refcursor;
begin
tarifas := consultas.consultar_tarifas_vehiculos;
end;
end seg_ciudadano;