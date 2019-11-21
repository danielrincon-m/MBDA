execute mantener_tarifas.agregar_tarifa ('Hourly', 0, 4000);
execute mantener_tarifas.modificar_tarifa ('Hourly', 10, 34444);
execute mantener_tarifas.eliminar_tarifa ('Hourly');

execute registrar_pagos.agregar_pago (1, sysdate, 10000, 'SO 02 BTP', to_date('2007-02-07 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute registrar_pagos.modificar_pago (1, 33333, 'SO 02 ATP', to_date('2007-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));

create or replace package mantener_ciudadanos is
procedure agregar_ciudadano (cc number, nnombre varchar, ccorreo varchar, unum number, udpto char);
procedure consultar_ciudadano (cc number);
procedure modificar_ciudadano (cc number, ncorreo varchar);
procedure eliminar_ciudadano (cc number);
end mantener_ciudadanos;

create or replace package mantener_funcionarios is
procedure agregar_funcionario_ciudadano (cc number, nnombre varchar, ccorreo varchar, unum number, udpto char, fecha_vinc date);
procedure agregar_funcionario (cc number, fecha_vinc date);
procedure modificar_funcionario (cc number, ncorreo varchar);
procedure eliminar_funcionario (cc number);
end mantener_funcionarios;

execute mantener_ciudadanos.agregar_funcionario (1020456978, 'Juan Arkangel El Pra', 'arkan_pra@hotmail.com', 10203045, 'E', to_date('2007-02-07 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute mantener_ciudadanos.consultar_ciudadano (1020456978);
execute mantener_ciudadanos.modificar_ciudadano (1020456978, 'arkan_pra@hotmail.com');
execute mantener_ciudadanos.eliminar_ciudadano (1020456978);

execute mantener_funcionarios.agregar_funcionario_ciudadano (1020304050, 'Rick The Walking Deada', 'rick_neagan@hotmail.com',10203040, 'E', to_date('2012-02-12 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute mantener_funcionarios.agregar_funcionario (1020649845,to_date('2012-02-12 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute mantener_funcionarios.modificar_funcionario (1020304050,'rick_neagan@hotmail.com');
execute mantener_funcionarios.eliminar_funcionario(1020304050);



execute mantener_ciudadanos.agregar_funcionario ('Juan Arkangel El Pra',1020456978,to_date('2007-02-07 00:00:00', 'yyyy-mm-dd hh24:mi:ss') , 10203045, 'E', 'arkan_pra@hotmail.com');
execute mantener_ciudadanos.consultar_ciudadano ('Juan Arkangel El Pra');
execute mantener_ciudadanos.modificar_ciudadano ('arkan_pra@hotmail.com', 1020456978);
execute mantener_ciudadanos.eliminar_ciudadano ('arkan_pra@hotmail.com');

execute mantener_funcionarios.agregar_funcionario_ciudadano ('Rick The Walking Deada','rick_neagan@hotmail.com' ,'E',10203040, 1020304050, to_date('2012-02-12 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute mantener_funcionarios.agregar_funcionario (to_date('2012-02-12 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),1020649845);
execute mantener_funcionarios.modificar_funcionario ('rick_neagan@hotmail.com',1020304050);
execute mantener_funcionarios.eliminar_funcionario('rick_neagan@hotmail.com');

