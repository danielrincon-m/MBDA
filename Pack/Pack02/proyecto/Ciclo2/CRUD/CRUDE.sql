CREATE OR REPLACE PACKAGE PC_ASOCIACION IS
	PROCEDURE AD_Asociacion (xnombre IN VARCHAR , xacreditacion IN NUMBER, xproposito IN VARCHAR,xlugar IN NUMBER);
	PROCEDURE MOD_Asociacion (xID_Asociacion IN NUMBER,xacreditacion IN NUMBER,xlugar IN NUMBER);
	PROCEDURE EL_Asociacion (xID_Asociacion IN NUMBER);
	
	PROCEDURE AD_REALIZAN (xid_evento IN NUMBER, xid_asociacion IN NUMBER);
	FUNCTION MAYOR_INGRESO RETURN SYS_REFCURSOR;
END PC_ASOCIACION;

/
CREATE OR REPLACE PACKAGE PC_EVENTO IS
	PROCEDURE AD_EVENTO (xid_evento IN NUMBER,xnombre IN VARCHAR, xnivel IN VARCHAR, xfecha IN DATE, xfechafin IN DATE,xcantidad_equipos IN NUMBER, xclase IN VARCHAR, xcosto IN NUMBER, xlugar IN NUMBER, xcapacidad_maxima IN NUMBER);
	PROCEDURE MOD_EVENTO (xid_evento IN NUMBER, xfechafin IN DATE, xcantidad_equipos IN NUMBER);
	PROCEDURE EL_EVENTO (xid_evento IN NUMBER);
	
	PROCEDURE AD_INSCRIPCION (xvalor IN NUMBER, xequipo IN NUMBER, xevento IN NUMBER);
	PROCEDURE EL_INSCRIPCION(xid_inscripcion IN NUMBER);
	
	PROCEDURE AD_ASISTE (xequipo IN NUMBER, xevento IN NUMBER);
	PROCEDURE AD_TIENE (xproblema IN NUMBER, xevento IN NUMBER);
	PROCEDURE MOD_SCOREBOARD (xproblemas_resueltos IN NUMBER, xequipo IN NUMBER, xid_evento IN NUMBER);

	FUNCTION MEJOR_EQUIPO RETURN SYS_REFCURSOR;
	FUNCTION RESULTADO_SCORE (xid_evento IN NUMBER)  RETURN SYS_REFCURSOR;
	FUNCTION CONFERENCIAS RETURN SYS_REFCURSOR;
	FUNCTION PREPARACION RETURN SYS_REFCURSOR;
	FUNCTION FACT_ECONO RETURN SYS_REFCURSOR;
	FUNCTION PROBLEMAS (xid_evento IN NUMBER) RETURN SYS_REFCURSOR;

END PC_EVENTO;
/
CREATE OR REPLACE PACKAGE PC_ENVIOS IS
	PROCEDURE AD_ENVIOS (xproblema IN NUMBER, xequipo IN NUMBER, xevento IN NUMBER, xlenguage IN VARCHAR);
	PROCEDURE AD_VEREDICTO (xtiempo IN NUMBER, xlenguage IN VARCHAR, xresultado IN VARCHAR, xenvio IN NUMBER, xproblema IN NUMBER, xusuario IN VARCHAR);
END PC_ENVIOS;
