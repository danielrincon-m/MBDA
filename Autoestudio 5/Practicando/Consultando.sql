--1. Los otros nombres de un músico
SELECT EXTRACTVALUE(detail,'/Detalle/OtrosNombres/Nombre/@nombre') AS otrosNombres
FROM musician
WHERE m_name = 'Fred Bloggs';

--2. Los músicos de un sello específico
SELECT *
FROM (
    SELECT m_name, EXTRACTVALUE(detail,'/Detalle/Sellos/Sello/@nombre') AS sello
    FROM musician
    )
WHERE sello = 'Torphy-Torp';

--3. Los musicos mas premiados en un a�o espec�fico
SELECT m_name, COUNT(m_name)
FROM musician
WHERE EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho') = '2000'
GROUP BY m_name
ORDER BY COUNT(m_name);

--4. Los discos de un a�o dado
SELECT m_name AS Artista, EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@nombre') AS Disco
FROM musician
WHERE EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@anho') = '2004';

--5. Los musicos que estudiaron en la misma universidad
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre') AS Universidad,
        COUNT(m_no) AS nMusicos
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre')
    )
ORDER BY nMusicos DESC, Universidad;

--6. Los musicos con el mismo titulo
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@titulo') AS titulo,
        COUNT(m_no) AS nMusicos
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@titulo')
    )
ORDER BY nMusicos DESC, titulo;

--7. La cantidad de músicos que tienen el mismo premio
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@nombre') AS premio,
        COUNT(m_no) AS nMusicos
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@nombre')
    )
ORDER BY nMusicos DESC, premio;

--8. La cantidad de musicos con hijos de cada sexo
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Hijos/Hijo/@sexo') AS sexo,
        COUNT(m_no) AS nMusicos
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Hijos/Hijo/@sexo')
    )
ORDER BY nMusicos DESC, sexo;

--9. La cantidad de premios dados por año
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho') AS premios,
        COUNT(EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho')) AS nPremios
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho')
    )
ORDER BY nPremios DESC, premios;

--10. La cantidad de discos por año
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@anho') AS discos,
        COUNT(EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@anho')) AS nDiscos
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@anho')
    )
ORDER BY nDiscos DESC, discos;