CREATE OR REPLACE PACKAGE BODY PC_Mantener_Musico IS
    PROCEDURE AD_Musico (xm_name IN VARCHAR, xborn  IN DATE, xdied IN DATE, xborn_in IN INTEGER, xliving_in IN INTEGER, xdetail IN XMLTYPE) IS
    BEGIN
        INSERT INTO musician(m_name, born, died, born_in, living_in, detail) VALUES (xm_name, xborn, xdied, xborn_in, xliving_in, xdetail);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20101,'Error al Insertar en la tabla Musicos');
    END;

    PROCEDURE EL_Musico (xm_no IN INTEGER) IS
    BEGIN
        DELETE FROM musician WHERE (m_no = xm_no);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20102,'Error al eliminar de la tabla Musicos');
    END;
    
    PROCEDURE MO_Musico (xm_no IN INTEGER, xdied IN DATE, xliving_in IN INTEGER) IS
    BEGIN 
        UPDATE  musician SET died = xdied, living_in = xliving_in WHERE m_no = xm_no;
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20103,'Error al modificar en musician');
    END;

    FUNCTION CO_Musico RETURN XMLTYPE IS CO_XML XMLTYPE;
    BEGIN
        CO_XML := dbms_xmlgen.getxmltype(
        'SELECT * FROM MUSICIAN');
        RETURN CO_XML;
    END;
    
    FUNCTION CO_Interpretes RETURN XMLTYPE IS CO_XML XMLTYPE;
    BEGIN
        CO_XML := dbms_xmlgen.getxmltype(
        'SELECT * FROM Performer');
        RETURN CO_XML;
    END;

    FUNCTION CO_Compositores RETURN XMLTYPE IS CO_XML XMLTYPE;
    BEGIN
        CO_XML := dbms_xmlgen.getxmltype(
        'SELECT * FROM Composer');
        RETURN CO_XML;
    END;

    FUNCTION CO_Musicos_Ciudad RETURN SYS_REFCURSOR IS CO_MC SYS_REFCURSOR;
    BEGIN
        OPEN CO_MC FOR
            SELECT place_town, m_name
            FROM musician

            JOIN place ON born_in = place_no
        RETURN CO_MC;
    END;

    FUNCTION CO_Musicos_Universidad RETURN XMLTYPE IS CO_MU XMLTYPE;
    BEGIN
        CO_MU := DBMS_XMLGEN.GETXMLTYPE("
        SELECT *
        FROM (
            SELECT 
                EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre') AS Universidad,
                COUNT(m_no) AS nMusicos
            FROM musician
            GROUP BY EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre')
        )
        ORDER BY nMusicos DESC, Universidad;
        ");
        RETURN CO_MU;
    END;

    FUNCTION CO_Premiados RETURN XMLTYPE IS CO_PR XMLTYPE;
    BEGIN
        CO_PR := DBMS_XMLGEN.GETXMLTYPE("
        SELECT m_name, COUNT(m_name)
        FROM musician
        WHERE EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho') = '2000'
        GROUP BY m_name
        ORDER BY COUNT(m_name);
        ")
        RETURN CO_PR;
    END;
END PC_Mantener_Musico;

CREATE OR REPLACE PACKAGE BODY PC_Registrar_Composicion IS
    PROCEDURE AD_Composicion (xc_no IN INTEGER, xcomp_date IN DATE, xc_title IN VARCHAR, xc_in IN INTEGER) IS
    BEGIN
        INSERT INTO Composition (xc_no, xcomp_date, xc_title, xc_in);
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20101,'Error al insertar una composición.');
    END;

    FUNCTION CO_Composicion RETURN SYS_REFCURSOR IS CO_XML SYS_REFCURSOR;
    BEGIN
        CO_XML := dbms_xmlgen.getxmltype(
        'SELECT * FROM Composition');
        RETURN CO_XML;
    END;

    FUNCTION CO_Premiados RETURN XMLTYPE IS CO_PR XMLTYPE;
    BEGIN
        CO_PR := DBMS_XMLGEN.GETXMLTYPE("
        SELECT m_name, COUNT(m_name)
        FROM musician
        WHERE EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho') = '2000'
        GROUP BY m_name
        ORDER BY COUNT(m_name);
        ")
        RETURN CO_PR;
    END;

    FUNCTION CO_Composiciones RETURN SYS_REFCURSOR IS CO_COMP SYS_REFCURSOR;
    BEGIN
        OPEN CO_COMP FOR
            SELECT c_title, COUNT(band_no)
            FROM band

            JOIN performance ON band_no = gave
            JOIN composition ON performed = c_no

            GROUP BY c_title
            ORDER BY COUNT(band_no) DESC;
        RETURN CO_COMP;
    END;
END PC_Registrar_Composicion;