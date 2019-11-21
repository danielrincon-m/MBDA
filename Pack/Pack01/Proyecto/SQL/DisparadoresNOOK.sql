update casas set pais='Colombia'
where nombre='Stolichnaya';

update paises set nombre='GranColombia'
where nombre='Colombia';

delete from pais where nombre='Colombia';

update licor set nombre='Aguacaliente'
where nombre='Aguardiente';

delete from licor where nombre='Aguardiente';

INSERT INTO esde
(licor_especifico, presentacion, cantidad, precio_unitario, material_pres)
VALUES
('Nectar Rojo', '1 L', 5, 20000, 'Plastico');

delete from factura_compra;

update licores_especificos set nombre='jhhu'
where nombre='Meukow X.O Cognac';

delete from licores_especificos;

update coctel set nombre='hinigu';

update pasos set preparacion='hinigu';

update ingredientes set ingrediente='hinigu';