CREATE OR REPLACE PACKAGE PC_TEMA IS
	PROCEDURE AD_TEMA (xID_TEMA IN VARCHAR, xNOMBRE IN VARCHAR, xPADRE IN VARCHAR);
	FUNCTION CO_TEMA RETURN SYS_REFCURSOR;
END PC_TEMA;

CREATE OR REPLACE PACKAGE BODY PC_TEMA IS
	PROCEDURE AD_TEMA (xID_TEMA IN VARCHAR, xNOMBRE IN VARCHAR, xPADRE IN VARCHAR) IS
	BEGIN
		INSERT INTO TEMAS (ID_TEMA,NOMBRE,PADRE) VALUES (xID_TEMA,xNOMBRE,xPADRE);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
		ROLLBACK;
		RAISE_APPLICATION_ERROR (-20021,'No se puede insertar el tema.');
	END;
	FUNCTION CO_TEMA RETURN SYS_REFCURSOR IS CON_TEMA SYS_REFCURSOR;
		BEGIN
			OPEN CON_TEMA FOR
				SELECT * FROM TEMAS;
			RETURN CON_TEMA;
		END;
END PC_TEMA;