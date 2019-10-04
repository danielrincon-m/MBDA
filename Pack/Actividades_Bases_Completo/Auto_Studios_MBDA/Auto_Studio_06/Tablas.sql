create table camera (id int, perim varchar(3));

create table keeper (id int, name varchar(25), address varchar(25));

create table vehicle (id varchar(10), keeper int);

create table permit (reg varchar(10), sDate date, chargeType varchar(10));

create table image (camera int, whn date, reg varchar(10));

create table tarifas (chargeType varchar(10), numero_de_dias number(10), valor_del_cobro number(10));

create table pagos (numero number(10), fecha_pago date, valor number(10), permit varchar(9), permit_fecha date);