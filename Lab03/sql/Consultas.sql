--CICLO 1: Consultar segmentos de montaña con secciones de descenso
SELECT v.nombre, s.nombre
FROM version v JOIN segmento s ON(v.id = s.contenidoEn);

--CICLO 1: Consultar los puntos de una carrera
SELECT nombre, tipo, distancia, tiempoLimite
FROM punto
ORDER BY distancia DESC;

--CICLO 1: Consultar los participantes en una carrera
SELECT p.id, p.nombres
FROM persona p JOIN ciclista c ON c.id = p.id
               JOIN participa ON c.id = ciclistaId
               JOIN version v on versionId = v.id
WHERE v.nombre = '--Dato de consulta--';

--CICLO 1: Consultar las empresas organizadoras de una carrera
SELECT e.razonSocial
FROM empresa e JOIN esOrganizador ON e.id = empresaId
               JOIN version v ON versionId = v.id
WHERE v.nombre = '--Dato de consulta--';