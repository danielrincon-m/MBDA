--Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos
INSERT INTO musician VALUES ('','Daniel Rincón','30/06/1942','','2','7');
DELETE FROM musician WHERE m_name = 'Daniel Rincón';
--Se puede realizar la eliminación porque el músico no figura en las demá tablas

DELETE FROM musician WHERE m_no = 3;
--No se puede realizar la inserción porque el músico 3 figura como organizador de concierto
