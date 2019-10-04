--Los compositores solo pueden componer un tipo de musica
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('13','2','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('14','2','classical');
--No se puede ejecutar ya que el mismo compositur figura con dos tipos de m�sica diferentes

--Los interpretes pueden tocar m�ximo tres instrumentos
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('100','21','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('101','21','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('102','21','banjo','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('104','21','guitar','jazz');
--Ac� se observa como no se pueden agregar cuatro tipos diferentes de instrumentos para el mismo m�sico

--Si no se indica el tipo de m�sica de un compositor, se supone que el tipo de m�sica que sabe interpretar (si solamente es uno)
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('30','6','');
SELECT * FROM performer WHERE perf_is = 6;
SELECT * FROM composer WHERE comp_is = 6;
--Ac� no se actualiza la casilla ya que el m�sico sabe interpretar mas de un tipo de m�sica

--No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el m�sico y la fecha de muerte.
UPDATE musician  
SET  m_name = 'D Rincon'
WHERE m_no = 1;
--No se puede modificar un campo que no es nulo