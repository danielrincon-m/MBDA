execute mantener_tarifas.agregar_tarifa ('Daily', 0, 4000);
execute mantener_tarifas.modificar_tarifa ('hjfgf', 10, 34444);
execute mantener_tarifas.eliminar_tarifa ('cccc');

execute registrar_pago.agregar_pago (1, sysdate, 10000, 'SO cc02 BTP', to_date('2007-02-07 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));
execute registrar_pago.modificar_pago (1, 33333, 'SO 02c ATP', to_date('2007-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'));