CREATE OR REPLACE PACKAGE PC_Mantener_Musico IS
    PROCEDURE AD_Musico (xm_name IN VARCHAR, xborn IN DATE, xdied IN DATE, xborn_in IN INTEGER, xliving_in IN INTEGER, xdetail IN XMLTYPE);
    PROCEDURE EL_Musico (xm_no IN INTEGER);
    PROCEDURE MO_Musico (xm_no IN INTEGER, xdied IN DATE, xliving_in IN INTEGER);
    FUNCTION CO_Musico RETURN XMLTYPE;
    FUNCTION CO_Interpretes RETURN XMLTYPE;
    FUNCTION CO_Compositores RETURN XMLTYPE;
    FUNCTION CO_Musicos_Ciudad RETURN SYS_REFCURSOR;
    FUNCTION CO_Musicos_Universidad RETURN XMLTYPE;
    FUNCTION CO_Premiados RETURN XMLTYPE;
END PC_Mantener_Musico;

CREATE OR REPLACE PACKAGE PC_Registrar_Composicion IS
    PROCEDURE AD_Composicion (xc_no IN INTEGER, xcomp_date IN DATE, xc_title IN VARCHAR, xc_in IN INTEGER);
    PROCEDURE CO_Composicion RETURN XMLTYPE;
    FUNCTION CO_Premiados RETURN XMLTYPE;
    FUNCTION CO_Composiciones RETURN SYS_REFCURSOR;
END PC_Registrar_Composicion;