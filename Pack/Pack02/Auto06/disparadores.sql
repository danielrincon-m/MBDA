/*Adicionando disparadores*/

/*El número se genera automáticamente de forma consecutiva.*/
CREATE OR REPLACE TRIGGER myTrigger
BEFORE INSERT ON musician
FOR EACH ROW
DECLARE
tmpv NUMBER;
BEGIN
SELECT COUNT(*)+1 INTO tmpv FROM musician ;
:new.m_no := tmpv;
END myTrigger;

/*El número se genera automáticamente de forma consecutiva.*/
CREATE OR REPLACE TRIGGER lugar
BEFORE INSERT ON place
FOR EACH ROW
DECLARE
tmpv NUMBER;
BEGIN
SELECT COUNT(*)+1 INTO tmpv FROM place ;
:new.place_no := tmpv;
END lugar;


/*La ciudad en la que vive por omisión es la ciudad de nacimiento.*/
CREATE OR REPLACE TRIGGER living_TG
BEFORE INSERT ON musician
FOR EACH ROW 
BEGIN
IF :new.living_in IS NULL THEN
:new.living_in := :new.born_in; 
END IF;
END living_TG;

/*Los compositores sólo pueden componer un tipo de música y los interpretes pueden tocar máximo tres instrumentos.*/
CREATE OR REPLACE TRIGGER myT
BEFORE INSERT ON performer
FOR EACH ROW
DECLARE
tmpv NUMBER;
BEGIN
SELECT COUNT(instrument) INTO tmpv FROM performer WHERE perf_is=:new.perf_is;
if tmpv=3 THEN RAISE_application_error(-20007,'No se puede ingresar');
END IF;
END myT;

/*Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)*/
CREATE OR REPLACE TRIGGER  myTT
BEFORE INSERT ON composer
FOR EACH ROW
DECLARE
perf_x NUMBER;
type_x VARCHAR(10);
BEGIN
  SELECT COUNT(perf_is) INTO perf_x FROM performer WHERE :new.comp_is = perf_is;
  IF :new.comp_type IS NULL AND perf_x = 1 THEN 
  SELECT perf_type INTO type_x FROM performer WHERE :new.comp_is = perf_is;
  :new.comp_type := type_x ;
  ELSE raise_application_error(-20050,'Hay mas de un tipo');
  END IF;
END;

/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
CREATE OR REPLACE TRIGGER delete_mno
BEFORE DELETE ON musician
FOR EACH ROW
DECLARE
comp NUMBER ;
orgniser NUMBER ;
BEGIN
    SELECT COUNT(*) INTO comp FROM composer WHERE :old.m_no= comp_is;
    SELECT COUNT(*) INTO orgniser FROM concert WHERE :old.m_no= concert_orgniser;
    IF comp > 0 or orgniser >0  THEN
      raise_application_error(-20004,'No se puede eliminar');
    END IF;
END;

/*No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.*/
CREATE OR REPLACE TRIGGER update_musician
BEFORE UPDATE ON musician
FOR EACH ROW
BEGIN
  IF :new.m_no <> :old.m_no or :new.m_name<> :old.m_name or :new.born<>:old.born or  :new.born_in<> :old.born_in THEN
    :new.m_no:=:old.m_no; 
    :new.m_name:= :old.m_name;
    :new.born:=:old.born;
    :new.born_in:= :old.born_in;
  END IF;    
END;