create or replace PACKAGE BODY PC_MUSICO IS
  PROCEDURE AD_MUSICO(xm_name IN VARCHAR, xborn  IN DATE, xdied IN DATE, xborn_in IN VARCHAR, xliving_in IN VARCHAR) IS
  BEGIN
    INSERT INTO musician(m_name,born,died,born_in,living_in) VALUES (xm_name,xborn,xdied,xborn_in,xliving_in);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20101,'Error al Insertar en musician');
  END;

  PROCEDURE EL_MUSICO(xm_no IN NUMBER) IS
  BEGIN
    DELETE FROM musician WHERE (xm_no=m_no);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20102,'Error al eliminar en musician');
  END;
  
  PROCEDURE MOD_MUSICO(xm_no IN NUMBER, xdied IN DATE, xliving_in IN VARCHAR) IS
  BEGIN 
    UPDATE  musician SET died= xdied, living_in= xliving_in WHERE m_no= xm_no;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20103,'Error al modificar en musician');
  END;
  FUNCTION CO_MUSICO RETURN XMLTYPE IS CO_XML XMLTYPE;
  BEGIN
    CO_XML := dbms_xmlgen.getxmltype(
      'SELECT * FROM MUSICIAN');
    RETURN CO_XML;
  END;
  
  FUNCTION CO_INTERPRETES RETURN SYS_REFCURSOR IS INTERPRETE SYS_REFCURSOR;
  BEGIN
    OPEN INTERPRETE FOR 
      SELECT * FROM HARD11;
    RETURN INTERPRETE;
  END;
END PC_MUSICO;

CREATE OR REPLACE PACKAGE BODY PC_LUGAR IS
  PROCEDURE AD_LUGAR(xplace_town IN VARCHAR, xplace_country  IN VARCHAR, xdetalle IN XMLTYPE) IS
  BEGIN
    INSERT INTO PLACE(place_town,place_country,detalles) VALUES (xplace_town,xplace_country,xdetalle);
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20201,'Error al Insertar en lugar');
  END;

  PROCEDURE MOD_LUGAR(xplace_no IN NUMBER, xdetalle IN XMLTYPE) IS 
  BEGIN 
    UPDATE PLACE SET detalles= xdetalle WHERE place_no= xplace_no;
    COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      raise_application_error(-20202,'Error al modificar en lugar');
  END;

  FUNCTION CO_LUGAR RETURN XMLTYPE IS CO_XML XMLTYPE;
  BEGIN
    CO_XML := dbms_xmlgen.getxmltype(
      'SELECT * FROM PLACE');
    RETURN CO_XML;
  END;
  FUNCTION CO_HOTELES RETURN SYS_REFCURSOR IS HOTELES SYS_REFCURSOR;
  BEGIN
    OPEN HOTELES FOR
       SELECT T.nombre
			FROM  PLACE P, XMLTABLE('/detalle/hoteles/hotel[habitacion/@tipo= "simple"]'
									passing P.detalles
								    columns precio NUMBER PATH  '@precio',
                                            nombre varchar(100) PATH  '@nombre') T
			WHERE place_country = 'USA'
		ORDER BY T.precio ASC;
    RETURN HOTELES;
  END;
END PC_LUGAR;
