--Los m�sicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos
INSERT INTO musician VALUES ('','Daniel Rinc�n','30/06/1942','','2','7');
DELETE FROM musician WHERE m_name = 'Daniel Rinc�n';
--Se puede realizar la eliminaci�n porque el m�sico no figura en las dem� tablas

DELETE FROM musician WHERE m_no = 3;
--No se puede realizar la inserci�n porque el m�sico 3 figura como organizador de concierto
