create or replace package mantener_tarifas is
procedure agregar_tarifa (ct varchar, ndd number, vdc number);
procedure eliminar_tarifa (ct varchar);
procedure modificar_tarifa (ct varchar, newndd number, newvdc number);
end mantener_tarifas;

create or replace package body mantener_tarifas as
procedure agregar_tarifa (ct varchar, ndd number, vdc number) is
begin
insert into tarifas (chargeType, numero_de_dias, valor_del_cobro) values (ct, ndd, vdc);
commit;
exception
when others then
rollback;
raise_application_error(20000, 'Parametro invalido');
end;
procedure eliminar_Tarifa (ct varchar) is
begin
delete from tarifas where chargeType = ct;
commit;
exception
when others then
rollback;
raise_application_error(20000, 'Parametro invalido');
end;
procedure modificar_tarifa (ct varchar, newndd number, newvdc number) is
begin
update tarifas set numero_de_dias = newndd, valor_del_cobro = newvdc
where chargeType = ct;
commit;
exception
when others then
rollback;
raise_application_error(20000, 'Parametro invalido');
end;
end mantener_tarifas;

create or replace package registrar_pagos is
procedure agregar_pago (n number, f_p date, v number, p varchar, p_f date);
procedure eliminar_pago (n number);
procedure modificar_pago (num number, newv number, newp varchar, newp_f date);
end registrar_pagos;

create or replace package body registrar_pagos as
procedure agregar_pago (n number, f_p date, v number, p varchar, p_f date) is
begin
if (f_p is null) then
insert into pagos (numero, fecha_pago, valor, permit, permit_fecha) values (n, sysdate, v, p, p_f);
else
insert into pagos (numero, fecha_pago, valor, permit, permit_fecha) values (n, f_p, v, p, p_f);
end if;
commit;
exception
when others then
rollback;
raise_application_error(20001, 'Error');
end;
procedure eliminar_pago (n number) is
begin
delete from pagos where numero = n;
commit;
exception
when others then
rollback;
raise_application_error(20001, 'Error');
end;
procedure modificar_pago (num number, newv number, newp varchar, newp_f date) is
begin
update pagos set valor = newv, permit = newp, permit_fecha = newp_f
where numero = num;
commit;
exception
when others then
rollback;
raise_application_error(20001, 'Error');
end;
end registrar_pagos;

--Crear la vista para que el paquete funcione
create or replace view pagos_mes as
(select * from pagos where fecha_pago between add_months(trunc(sysdate,'mm'),-1) and last_day(add_months(trunc(sysdate,'mm'),-1)));

create or replace package consultas is
function consultar_pagos_ultimo_mes return sys_refcursor;
function consultar_tarifas_vehiculos return sys_refcursor;
end consultas;

create or replace package body consultas as
function consultar_pagos_ultimo_mes return sys_refcursor as pagos sys_refcursor;
begin
open pagos for select * from pagos_mes;
return pagos;
commit;
exception
when others then
rollback;
raise_application_error(20001, 'Error');
end;
function consultar_tarifas_vehiculos return sys_refcursor as tarifas sys_refcursor;
begin
open tarifas for select * from tarifas;
return tarifas;
commit;
exception
when others then
rollback;
raise_application_error(20001, 'Error');
end;
end consultas;