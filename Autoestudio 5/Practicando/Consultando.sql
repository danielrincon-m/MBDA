--1. Los otros nombres de un mÃºsico
SELECT EXTRACTVALUE(detail,'/Detalle/OtrosNombres/Nombre/@nombre') AS otrosNombres
FROM musician
WHERE m_name = 'Fred Bloggs';

--2. Los mÃºsicos de un sello especÃ­fico
SELECT *
FROM (
    SELECT m_name, EXTRACTVALUE(detail,'/Detalle/Sellos/Sello/@nombre') AS sello
    FROM musician
    )
where sello = 'Torphy-Torp';

--3. Los musicos mas premiados en un año específico
SELECT m_name, COUNT(m_name)
FROM musician
WHERE EXTRACTVALUE(detail,'/Detalle/Premios/Premio/@anho') = '2000'
GROUP BY m_name
ORDER BY COUNT(m_name);

--4. Los discos de un año dado
SELECT m_name AS Artista, EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@nombre') AS Disco
FROM musician
WHERE EXTRACTVALUE(detail,'/Detalle/Discos/Disco/@anho') = '2004';

--5. Los musicos que estudiaron en la misma universidad
SELECT *
FROM (
    SELECT 
        COUNT(m_no) AS nMusicos, 
        EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre') AS Universidad
        FROM musician
        GROUP BY EXTRACTVALUE(detail,'/Detalle/Universidades/Universidad/@nombre')
    )
ORDER BY nMusicos DESC, Universidad;
