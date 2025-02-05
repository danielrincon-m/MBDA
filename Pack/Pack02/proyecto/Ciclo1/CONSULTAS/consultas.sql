/*CONSULTAS*/

/*1CONSULTAR LOS USUARIOS QUE  HAN CREADO ALGUN GRUPO*/
SELECT DISTINCT USERNAME,U.NOMBRE,ID_GRUPO,G.NOMBRE  FROM USUARIOS U,GRUPOS  G
WHERE G.CREADOR= USERNAME;

/*2CONSULTAR LOS USUARIOS QUE  HAN CREADO ALGUN PROBLEMA*/
SELECT DISTINCT USERNAME,U.NOMBRE,ID_PROBLEMA,P.NOMBRE  FROM USUARIOS U,PROBLEMAS  P
WHERE P.CREADOR= USERNAME;

/*3CONSULTAR LOS INTEGRANTES DEL EQUIPO AL QUE PERTENECE CrkJohn*/
SELECT * FROM USUARIOS,(SELECT * FROM PERTENECE_EQUIPO
WHERE ID_EQUIPO= (SELECT ID_EQUIPO FROM PERTENECE_EQUIPO WHERE ID_USUARIO= 'CrkJohn' AND ROWNUM <= 1)) 
WHERE USERNAME= ID_USUARIO;

/*4-CONSULTAR LOS COMENTARIOS QUE HA HECHO Pedro Guerreiro Y SI HA HECHO UN COMENTARIO DE PROBLEMAS QUE HAYA CREADO ESTE NO SALE*/
SELECT DISTINCT * FROM COMENTARIOS C,PROBLEMAS P
WHERE ID_PROBLEMA = PROBLEMA AND CREADOR <>'Pedro Guerreiro' AND USUARIO= 'Pedro Guerreiro';

/*5-CONSULTAR LOS COMENTARIOS DE UN PROBLEMA*/
SELECT DISTINCT * FROM PROBLEMAS,COMENTARIOS 
WHERE ID_PROBLEMA= PROBLEMA;

/*6-CONSULTAR LAS PERSONAS QUE TIENEN COMO ESTUDIO 'INGENIERIA DE SISTEMAS'*/
SELECT * FROM (SELECT username,nombre,correo,ocupacion,lugar,fecha,telefono
	FROM  usuarios, XMLTABLE('/Perfil/estudios/estudio[@nombre = "Ingeniería de sistemas"]'
						passing perfil
						columns temp NUMBER PATH  '@nombre')) ;
/*7-CONSULTAR LAS PERSONAS QUE PERTENECEN AL PROYECTO 'TEAM' */
SELECT * FROM (SELECT username,nombre,correo,ocupacion,lugar,fecha,telefono
	FROM  usuarios, XMLTABLE('/Perfil/proyectos/proyecto[@nombre = "TEAM"]'
						passing perfil
						columns temp NUMBER PATH  '@nombre')) ;