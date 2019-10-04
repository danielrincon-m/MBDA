--El nombre debe tener minimo dos palabras: primer nombre y primer apellido
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES ('1','FredBloggs','2/01/1948','','1','2'); 
--No se puede insertar ya que el nombre no es de la forma 'Nombre Apellido'


--El tipo de musica puede tomar los siguientes valores: jazz, classical, rock, blues o not known
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES ('1','2','violin','metal');
INSERT INTO composer (comp_no,comp_is,comp_type) VALUES ('1','1','reggaeton');
--No se pueden insertar ya que los géneros NO pertenecen al conjunto aceptado