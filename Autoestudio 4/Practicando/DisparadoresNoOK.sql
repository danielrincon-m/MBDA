--Los compositores solo pueden componer un tipo de musica
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('13','2','jazz');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('14','2','classical');
--No se puede ejecutar ya que el mismo compositur figura con dos tipos de música diferentes

--Los interpretes pueden tocar máximo tres instrumentos
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('100','21','violin','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('101','21','viola','classical');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('102','21','banjo','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('104','21','guitar','jazz');
--Acá se observa como no se pueden agregar cuatro tipos diferentes de instrumentos para el mismo músico

--Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('30','6','');
SELECT * FROM performer WHERE perf_is = 6;
SELECT * FROM composer WHERE comp_is = 6;
--Acá no se actualiza la casilla ya que el músico sabe interpretar mas de un tipo de música

--No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.
UPDATE musician  
SET  m_name = 'D Rincon'
WHERE m_no = 1;
--No se puede modificar un campo que no es nulo