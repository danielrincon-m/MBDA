--El dato mínimo para adicionar un musico es su nombre
INSERT INTO musician VALUES ('','Fred Bloggs','','','','');
--Se inserta sin problemas con únicamente su nombre, ya que el id es generado automáticamente por una trigger

--La fecha de nacimiento debe ser menor de la fecha de muerte
INSERT INTO musician VALUES ('4','Harriet Smithson','9/05/1909','20/09/1980','5','6');
--se ejecuta sin problemas ya que la fecha de nacimiento es menor que la fecha de muerte