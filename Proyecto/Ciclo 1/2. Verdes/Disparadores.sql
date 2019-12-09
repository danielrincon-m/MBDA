--En deseaAdquirir la fecha de registro se asigna automáticamente
CREATE OR REPLACE TRIGGER TR_deseaAd_fecha
	BEFORE 
	INSERT
	ON deseaAdquirir
	FOR EACH ROW
BEGIN
	:NEW.fechaRegistro := TO_DATE(SYSDATE, 'DD/MM/YYYY');
END;
/

--No se puede agregar un producto cuya fecha de vencimiento sea el mismo día o antes
CREATE OR REPLACE TRIGGER TR_producto_fecha
	BEFORE
	INSERT
	ON producto
	FOR EACH ROW
BEGIN
	IF TO_DATE(:NEW.fechaVencimiento) <= TO_DATE(SYSDATE) THEN
		RAISE_APPLICATION_ERROR(-20005, 'La fecha debe ser en el futuro');
	END IF;
END;
/

--La fecha final de promoción de un producto no puede ser despues de su fecha de vencimiento
CREATE OR REPLACE TRIGGER TR_prod_fechaPromo
	BEFORE
	INSERT
	ON promocion
	FOR EACH ROW
DECLARE
	fechaV producto.fechaVencimiento%TYPE;
BEGIN
	SELECT 
		fechaVencimiento
	INTO
		fechaV
	FROM 
		producto
	WHERE
		idProducto = :NEW.idProducto;
	
	IF TO_DATE(:NEW.fechaFinal) > TO_DATE(fechaV) THEN
		RAISE_APPLICATION_ERROR(-20006, 'La fecha final de promoción debe ser antes de la fecha de vencimiento del producto');
	END IF;
END;
/

--Dos promociones del mismo producto no se pueden traslapar en fechas
CREATE OR REPLACE TRIGGER TR_promo_fechas
	BEFORE 
	INSERT
	ON promocion
	FOR EACH ROW
BEGIN
	FOR promo IN 
		(SELECT *
		FROM promocion
		WHERE idProducto = :NEW.idProducto)
	LOOP
		IF (TO_DATE(:NEW.fechaInicio) >= TO_DATE(promo.fechaInicio) AND TO_DATE(:NEW.fechaInicio) < TO_DATE(promo.fechaFinal))
			OR (TO_DATE(:NEW.fechaFinal) <= TO_DATE(promo.fechaFinal) AND TO_DATE(:NEW.fechaFinal) > TO_DATE(promo.fechaInicio))
		THEN
			RAISE_APPLICATION_ERROR(-20007, 'Las fechas de promoción de un producto no se pueden traslapar');
		END IF;
	END LOOP;
END;
/

--Los id se generan automáticamente
--crear las secuencias
CREATE SEQUENCE sec_cadena
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sec_donacion
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sec_sucursal
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sec_producto
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sec_cliente
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE sec_promocion
START WITH 1
INCREMENT BY 1;

--crear los triggers
CREATE OR REPLACE TRIGGER TR_cadena_sec
	BEFORE
	INSERT
	ON cadena
	FOR EACH ROW
BEGIN
	:NEW.idCadena := sec_cadena.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_donacion_sec
	BEFORE
	INSERT
	ON donacion
	FOR EACH ROW
BEGIN
	:NEW.numDonacion := sec_donacion.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_sucursal_sec
	BEFORE
	INSERT
	ON sucursal
	FOR EACH ROW
BEGIN
	:NEW.idSucursal := sec_sucursal.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_producto_sec
	BEFORE
	INSERT
	ON producto
	FOR EACH ROW
BEGIN
	:NEW.idProducto := sec_producto.NEXTVAL;
END;
/


CREATE OR REPLACE TRIGGER TR_cliente_sec
	BEFORE
	INSERT
	ON cliente
	FOR EACH ROW
BEGIN
	:NEW.idCliente := sec_cliente.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TR_promocion_sec
	BEFORE
	INSERT
	ON promocion
	FOR EACH ROW
BEGIN
	:NEW.idPromocion := sec_promocion.NEXTVAL;
END;
/
