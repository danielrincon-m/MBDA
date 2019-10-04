--El número se genera automáticamente de forma consecutiva
--La ciudad en la que vive por omisión es la ciudad de nacimiento
INSERT INTO musician VALUES ('','Freddie Mercury','2/01/1948','','1','');
SELECT * FROM musician WHERE m_name = 'Freddie Mercury';
--La ciudad se coloca automáticamente, igual que el consecutivo


--Los compositores solo pueden componer un tipo de musica
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('13','2','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('14','2','classical');
--No se puede ejecutar ya que el mismo compositur figura con dos tipos de música diferentes


--Los interpretes pueden tocar máximo tres instrumentos
INSERT INTO performer VALUES ('40','3','horn','classical');
INSERT INTO performer VALUES ('41','3','viola','classical');
INSERT INTO performer VALUES ('42','3','guitar','classical');
--Se puede insertar ya que esta persona no tiene registrados mas de 3 instrumentos


--Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('40','7','');
SELECT * FROM composer WHERE comp_no = 40;
--Se observa que se genera el tipo de musica que interpreta


--No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.
UPDATE musician  
SET  born_in = 2
WHERE m_no = 21;
--Se puede actualizar un campo nulo
UPDATE musician  
SET  living_in = 2
WHERE m_no = 1;
--Se puede actualizar el campo 'living_in'
