--3. Consultar los segmentos de montaña con secciones de deascenso
SELECT *
FROM segmento

JOIN registro
ON nombre = esPara

WHERE EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/@Tipo') = 'Descenso';

--4. Consultar la inclinación máxima y el clima de las secciones de tipo Dura
SELECT
    EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/InclinacionMax/text()'),
    EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/Clima/text()')
FROM registro
WHERE EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/@Tipo') = 'Dura';

--5. Consultar las velocidades promedio de las secciones por tipo
SELECT 
    EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/@Tipo'), 
    AVG(EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/VelocidadProm/text()'))
FROM registro
GROUP BY EXTRACTVALUE(revision, '/TRevision/Secciones/Seccion/@Tipo');