--El dato m�nimo para adicionar un musico es su nombre
INSERT INTO musician VALUES ('','','9/05/1909','20/09/1980','','');
--no se puede realizar la inerci�n, ya que el nombre no debe ser nulo

--La fecha de nacimiento debe ser menor de la fecha de muerte
INSERT INTO musician VALUES ('4','Harriet Smithson','20/09/1980','9/05/1909','5','6');
--No se realiza la inserci�n ya que la fecha de nacimiento es despues de la fecha de muerte