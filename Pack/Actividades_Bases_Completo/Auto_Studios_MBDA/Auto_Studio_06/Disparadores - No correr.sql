--No correr
--DISPARADOR
--TRIGGER Ad_RATE
CREATE OR REPLACE TRIGGER Ad_RATE
BEFORE INSERT ON tarifas 
FOR EACH ROW
BEGIN 
SELECT valor_del_cobro INTO :new.valor_del_cobro 
FROM tarifas
WHERE MOD(valor_del_cobro,50)=0;
END Ad_RATE;
--CONSECUTIVOS
CREATE OR REPLACE TRIGGER ID_Consecutivo
BEFORE INSERT ON camera
FOR EACH ROW
BEGIN 
SELECT COUNT(*)+1 INTO :new.id
FROM camera;
END ID_Consecutivo;
--Al modificar no se permite bajar el valor del cobro
--trigger MoRate
CREATE OR REPLACE TRIGGER valorCobro_Check
BEFORE UPDATE OF valor_del_cobro ON tarifas
FOR EACH ROW
WHEN (new.valor_del_cobro<old.valor_del_cobro)
BEGIN 
:new.valor_del_cobro := :old.valor_del_cobro;
raise_application_error(-2020,'valor del cobro debe ser MAYOR al valor de cobro anterior');
END valorCobro_Check;

--TRIGGER Ad_PAYMENT
--CREATE OR REPLACE TRIGGER Ad_PAYMENT
--BEFORE INSERT ON pagos
--FOR EACH ROW 
--BEGIN 
--SELECT COUNT(*)+1 into :new.numero FROM pago;

--END Ad_PAYMENT;

--TRIGGER Mo_PAYMENT
CREATE OR REPLACE TRIGGER Mo_PAYMENT
BEFORE UPDATE ON pagos
FOR EACH ROW
BEGIN
raise_application_error(-20030,'La modificacion de valores no es permitida');
END  Mo_PAYMENT;

--TRIGGER El_PAYMENT 
CREATE OR REPLACE TRIGGER El_PAYMENT
BEFORE DELETE ON pagos
FOR EACH ROW
BEGIN
raise_application_error(-20031,'La eliminacion de valores no es permitida');
END  El_PAYMENT;
--**********
--**********
--TRIGGER BORRAR
DROP TRIGGER Ad_PAYMENT;
DROP TRIGGER Mo_PAYMENT;
DROP TRIGGER El_PAYMENT;
DROP TRIGGER ID_Consecutivo;
DROP TRIGGER valorCobro_Check;
DROP TRIGGER Ad_RATE;