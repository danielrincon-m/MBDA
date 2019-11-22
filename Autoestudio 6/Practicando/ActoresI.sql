CREATE OR REPLACE PACKAGE BODY PA_Administrador IS
    FUNCTION CO_Premiados RETURN XMLTYPE IS CO_PR_XML XMLTYPE;
    BEGIN
        CO_PR_XML := PC_Registrar_Composicion.CO_Premiados;
        RETURN CO_PR_XML;
    END;

    FUNCTION CO_Composiciones RETURN SYS_REFCURSOR IS CO_COMP_REFCURSOR SYS_REFCURSOR;
    BEGIN
        CO_COMP_REFCURSOR := PC_Registrar_Composicion.CO_Composiciones;
        RETURN CO_COMP_REFCURSOR;
    END;
END PA_Administrador;

CREATE OR REPLACE PACKAGE BODY PA_Musico IS
    FUNCTION CO_Musicos_Ciudad RETURN SYS_REFCURSOR IS CO_CI_REFCURSOR SYS_REFCURSOR;
    BEGIN
        CO_CI_REFCURSOR := PC_Mantener_Musico.CO_Musicos_Ciudad;
        RETURN CO_CI_REFCURSOR;
    END;

    FUNCTION CO_Musicos_Universidad RETURN XMLTYPE IS CO_UNI_XML XMLTYPE;
    BEGIN
        CO_UNI_XML := PC_Mantener_Musico.CO_Musicos_Universidad;
        RETURN CO_UNI_XML;
    END;

    FUNCTION CO_Premiados RETURN XMLTYPE IS CO_PR_XML XMLTYPE;
    BEGIN
        CO_PR_XML := PC_Mantener_Musico.CO_Premiados;
        RETURN CO_PR_XML;
    END;
END PA_Musico;