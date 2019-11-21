--Tarifas

insert into tarifas (chargeType, numero_de_dias, valor_del_cobro) values ('Daily', 1, 1000);

insert into tarifas (chargeType, numero_de_dias, valor_del_cobro) values ('Weekly', 7, 6000);

insert into tarifas (chargeType, numero_de_dias, valor_del_cobro) values ('Monthly', 30, 20000);

insert into tarifas (chargeType, numero_de_dias, valor_del_cobro) values ('Annual', 365, 270000);

--Camera

insert into camera (id, perim) values (1, 'IN');

insert into camera (id, perim) values (2, 'IN');

insert into camera (id, perim) values (3, 'IN');

insert into camera (id, perim) values (4, 'IN');

insert into camera (id, perim) values (5, 'IN');

insert into camera (id, perim) values (6, 'IN');

insert into camera (id, perim) values (7, 'IN');

insert into camera (id, perim) values (8, 'IN');

insert into camera (id, perim) values (9, 'OUT');

insert into camera (id, perim) values (10, 'OUT');

insert into camera (id, perim) values (11, 'OUT');

insert into camera (id, perim) values (12, 'OUT');

insert into camera (id, perim) values (13, 'OUT');

insert into camera (id, perim) values (14, 'OUT');

insert into camera (id, perim) values (15, 'OUT');

insert into camera (id, perim) values (16, 'OUT');

insert into camera (id, perim) values (17, null);

insert into camera (id, perim) values (18, null);

insert into camera (id, perim) values (19, null);
--Keeper

insert into keeper (id, name, address) values (1, 'Ambiguous, Arthur', 'Absorption Ave.');

insert into keeper (id, name, address) values (2, 'Inconspicuous, Iain', 'Interception Rd.');

insert into keeper (id, name, address) values (3, 'Contiguous, Carol', 'Circumscription Close');

insert into keeper (id, name, address) values (4, 'Strenuous, Sam', 'Surjection Street');

insert into keeper (id, name, address) values (5, 'Assiduous, Annie', 'Attribution Alley');

insert into keeper (id, name, address) values (6, 'Incongruous, Ingrid', 'Irresolution Pl.');

--Vehicle

insert into vehicle (id, keeper) values ('SO 02 ASP', 1);

insert into vehicle (id, keeper) values ('SO 02 BSP', 3);

insert into vehicle (id, keeper) values ('SO 02 CSP', 1);

insert into vehicle (id, keeper) values ('SO 02 DSP', 4);

insert into vehicle (id, keeper) values ('SO 02 ESP', 1);

insert into vehicle (id, keeper) values ('SO 02 FSP', 3);

insert into vehicle (id, keeper) values ('SO 02 GSP', 6);

insert into vehicle (id, keeper) values ('SO 02 HSP', 5);

insert into vehicle (id, keeper) values ('SO 02 ISP', 6);

insert into vehicle (id, keeper) values ('SO 02 JSP', 2);

insert into vehicle (id, keeper) values ('SO 02 KSP', 5);

insert into vehicle (id, keeper) values ('SO 02 LSP', 2);

insert into vehicle (id, keeper) values ('SO 02 MSP', 2);

insert into vehicle (id, keeper) values ('SO 02 NSP', 4);

insert into vehicle (id, keeper) values ('SO 02 OSP', 6);

insert into vehicle (id, keeper) values ('SO 02 PSP', 4);

insert into vehicle (id, keeper) values ('SO 02 QSP', 6);

insert into vehicle (id, keeper) values ('SO 02 RSP', 1);

insert into vehicle (id, keeper) values ('SO 02 SSP', 2);

insert into vehicle (id, keeper) values ('SO 02 TSP', 6);

insert into vehicle (id, keeper) values ('SO 02 ATP', 1);

insert into vehicle (id, keeper) values ('SO 02 BTP', 2);

insert into vehicle (id, keeper) values ('SO 02 CTP', 1);

insert into vehicle (id, keeper) values ('SO 02 DTP', 3);

insert into vehicle (id, keeper) values ('SO 02 ETP', 5);

insert into vehicle (id, keeper) values ('SO 02 FTP', 4);

insert into vehicle (id, keeper) values ('SO 02 GTP', 5);

insert into vehicle (id, keeper) values ('SO 02 HTP', 2);

insert into vehicle (id, keeper) values ('SO 02 ITP', 2);

insert into vehicle (id, keeper) values ('SO 02 JTP', 4);

insert into vehicle (id, keeper) values ('SO 02 KTP', 3);

insert into vehicle (id, keeper) values ('SO 02 MUP', null);

insert into vehicle (id, keeper) values ('SO 02 NUP', null);

insert into vehicle (id, keeper) values ('SO 02 OUP', null);

insert into vehicle (id, keeper) values ('SO 02 PUP', null);

insert into vehicle (id, keeper) values ('SO 02 QUP', null);

--Permit

insert into permit (reg, sDate, chargeType) values ('SO 02 ASP', to_date('2006-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 BSP', to_date('2006-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 CSP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 DSP', to_date('2007-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 ESP', to_date('2007-02-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 FSP', to_date('2007-02-25 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 GSP', to_date('2007-02-28 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Weekly');

insert into permit (reg, sDate, chargeType) values ('SO 02 HSP', to_date('2006-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 ISP', to_date('2006-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 JSP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 KSP', to_date('2007-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 LSP', to_date('2007-02-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 MSP', to_date('2007-02-25 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 NSP', to_date('2007-02-28 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 OSP', to_date('2006-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 PSP', to_date('2006-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Monthly');

insert into permit (reg, sDate, chargeType) values ('SO 02 QSP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Annual');

insert into permit (reg, sDate, chargeType) values ('SO 02 RSP', to_date('2007-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Annual');

insert into permit (reg, sDate, chargeType) values ('SO 02 SSP', to_date('2007-02-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Annual');

insert into permit (reg, sDate, chargeType) values ('SO 02 TSP', to_date('2007-02-25 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Annual');

insert into permit (reg, sDate, chargeType) values ('SO 02 ATP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2006-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 CTP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 DTP', to_date('2007-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 ETP', to_date('2007-02-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 FTP', to_date('2007-02-25 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 GTP', to_date('2007-02-28 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 HTP', to_date('2006-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 ITP', to_date('2006-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 JTP', to_date('2007-01-21 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 KTP', to_date('2007-01-30 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 ATP', to_date('2007-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2006-01-31 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 CTP', to_date('2007-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 DTP', to_date('2007-01-31 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 ETP', to_date('2007-02-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 FTP', to_date('2007-02-26 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 GTP', to_date('2007-03-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 HTP', to_date('2006-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 ITP', to_date('2006-01-31 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 JTP', to_date('2007-01-22 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 KTP', to_date('2007-01-31 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2007-02-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2007-02-04 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2007-02-05 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2007-02-06 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

insert into permit (reg, sDate, chargeType) values ('SO 02 BTP', to_date('2007-02-07 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 'Daily');

--Image

insert into image (camera, whn, reg) values (1, to_date('2007-02-25 06:10:13', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ASP');

insert into image (camera, whn, reg) values (17, to_date('2007-02-25 06:20:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ASP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 06:23:40', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ASP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 06:26:04', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ASP');

insert into image (camera, whn, reg) values (17, to_date('2007-02-25 06:57:31', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (17, to_date('2007-02-25 07:00:40', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (12, to_date('2007-02-25 07:04:31', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (5, to_date('2007-02-25 07:10:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 GSP');

insert into image (camera, whn, reg) values (16, to_date('2007-02-25 07:13:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 GSP');

insert into image (camera, whn, reg) values (2, to_date('2007-02-25 07:20:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 TSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 07:23:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 TSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 07:26:31', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 TSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 07:29:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 TSP');

insert into image (camera, whn, reg) values (8, to_date('2007-02-25 07:35:41', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 07:39:04', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 07:42:30', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (10, to_date('2007-02-25 07:45:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (8, to_date('2007-02-25 07:48:10', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 07:51:10', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 07:55:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (11, to_date('2007-02-25 07:58:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 CSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 16:28:40', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 SSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:31:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 SSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 16:38:31', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 RSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:39:10', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 RSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:45:04', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 HSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:48:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 HSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:51:30', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 HSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 16:58:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ISP');

insert into image (camera, whn, reg) values (12, to_date('2007-02-25 17:01:13', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ISP');

insert into image (camera, whn, reg) values (3, to_date('2007-02-25 17:07:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 JSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 17:10:43', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 JSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 17:14:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 JSP');

insert into image (camera, whn, reg) values (3, to_date('2007-02-25 17:17:03', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 JSP');

insert into image (camera, whn, reg) values (10, to_date('2007-02-25 18:23:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 MUP');

insert into image (camera, whn, reg) values (11, to_date('2007-02-25 18:26:13', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 NUP');

insert into image (camera, whn, reg) values (12, to_date('2007-02-25 18:29:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 OUP');

insert into image (camera, whn, reg) values (3, to_date('2007-02-25 18:33:10', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 PUP');

insert into image (camera, whn, reg) values (15, to_date('2007-02-25 18:36:31', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 PUP');

insert into image (camera, whn, reg) values (3, to_date('2007-02-25 18:39:10', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 PUP');

insert into image (camera, whn, reg) values (10, to_date('2007-02-26 05:13:30', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 TSP');

insert into image (camera, whn, reg) values (18, to_date('2007-02-25 16:29:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 DSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 16:31:01', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 DSP');

insert into image (camera, whn, reg) values (19, to_date('2007-02-25 17:42:41', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 DSP');

insert into image (camera, whn, reg) values (9, to_date('2007-02-25 18:54:30', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 DSP');

insert into image (camera, whn, reg) values (3, to_date('2007-02-25 17:16:11', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ESP');

insert into image (camera, whn, reg) values (10, to_date('2007-02-25 18:08:40', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 ESP');

insert into image (camera, whn, reg) values (11, to_date('2007-02-25 18:08:00', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 FSP');

insert into image (camera, whn, reg) values (12, to_date('2007-02-25 18:08:13', 'yyyy-mm-dd hh24:mi:ss'), 'SO 02 GSP');