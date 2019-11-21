SELECT m_name AS organiser FROM musician,concert WHERE concert_venue= 'Assembly Rooms' AND con_date>01/02/97 AND concert_orgniser = m_no
SELECT DISTINCT m_name FROM musician,performer,place WHERE (instrument='violin' or instrument = 'guitar') AND (place_no = born_in AND place_country='England' AND perf_is = m_no)
SELECT DISTINCT m_name,place_town,con_date FROM musician,concert,performances,place WHERE concert_orgniser = m_no AND concert_in=place_no AND place_country='USA'
SELECT DISTINCT con_date, concert_venue , c_title FROM place,musician,concert,composition,has_composed,composer,performances WHERE c_no = cmpn_no AND cmpr_no=comp_no AND comp_is=m_no AND m_name = ' Andy Jones' AND concert_no = performed_in AND performed = c_no
SELECT instrument,COUNT(instrument) AS 'Cantidad de personas', COUNT(instrument) / (SELECT COUNT(DISTINCT(perf_is)) FROM musician,performer WHERE m_no=perf_is) AS 'Promedio' FROM musician,performer WHERE m_no = perf_is GROUP BY instrument
SELECT m_name, born, instrument FROM musician,performer WHERE instrument IN (SELECT DISTINCT instrument FROM performer,musician WHERE m_name= 'Theo Mengel' AND m_no= perf_is) AND m_no= perf_is AND died is NULL AND m_name <>'Theo Mengel'

SELECT DISTINCT m_name FROM musician,performances,composer,place WHERE conducted_by = m_no AND comp_is=m_no AND living_in IN (SELECT place_no FROM place WHERE place_country= 'England' OR place_country= 'Scotland')

SELECT instrument from (SELECT count(perf_is) as n,instrument FROM performer GROUP BY instrument) AS NN WHERE n <= ALL(SELECT count(perf_no) FROM performer GROUP BY instrument)

SELECT band_name , c_title FROM musician,composer,has_composed,composition,performances,band WHERE m_no=comp_is AND comp_no=cmpr_no AND cmpn_no=c_no AND c_no=performed AND m_name ='Sue Little' AND band_no=gave	

SELECT m_name AS name, compositions,COALESCE(instrument, 0 ) AS instrument FROM (SELECT m_name,COALESCE(compositions, 0 ) AS compositions FROM (SELECT DISTINCT m_name from musician,place WHERE born_in= place_no AND (place_country= 'England' OR place_country= 'Scotland')) AS PRINCIPAL
LEFT JOIN
(SELECT COUNT(cmpr_no) AS compositions, m_name AS name FROM musician,composer,has_composed WHERE m_no= comp_is AND comp_no= cmpr_no GROUP BY (name)) AS COMPOSICIONES ON name= m_name) AS UNO
LEFT JOIN
(SELECT COUNT(perf_is) AS instrument , m_name AS name2 FROM musician,performer WHERE perf_is= m_no GROUP BY (name2)) AS DOS
ON m_name= name2


SELECT band_name AS banda, m_name AS conductor, m_name1 AS contact
FROM
(SELECT band_name,m_name FROM performances,musician,band WHERE performed_in IN (SELECT concert_no FROM concert WHERE con_date IN (SELECT MAX(con_date) AS date FROM concert WHERE concert_venue= 'Royal Albert Hall')) AND m_no= conducted_by AND band_no= gave) AS X
INNER JOIN
(SELECT band_name AS band_name1,m_name AS m_name1 FROM performances,musician,band WHERE performed_in IN (SELECT concert_no FROM concert WHERE con_date IN (SELECT MAX(con_date) AS date FROM concert WHERE concert_venue= 'Royal Albert Hall')) AND band_no= gave AND m_no= performed_in) AS Y
ON band_name= band_name1

SELECT 'BORN IN', m_name FROM musician,place WHERE (born_in = place_no ) AND place_town= 'Glasgow' UNION ALL
SELECT 'LIVES IN',m_name FROM musician,place WHERE (living_in= place_no ) AND place_town= 'Glasgow'
UNION ALL
SELECT 'IN_BAND_IN',m_name FROM band,place,musician,performer,plays_in WHERE band_home= place_no AND place_town= 'Glasgow'
AND band_id= band_no AND player= perf_no AND perf_is=m_no ORDER BY m_name

SELECT re AS Name,band_name AS 'Jeff''s band' ,n AS 'Sue''s band'
FROM
(SELECT DISTINCT m_name AS re,band_name FROM band,place,musician,performer,plays_in WHERE perf_is=m_no AND player= perf_no AND band_id= band_no AND band_name IN (SELECT band_name FROM band,place,musician,performer,plays_in WHERE perf_is=m_no AND player= perf_no AND band_id= band_no AND m_name = 'Jeff Dawn')) AS X
RIGHT OUTER JOIN
(SELECT DISTINCT m_name,band_name AS n FROM band,place,musician,performer,plays_in WHERE perf_is=m_no AND player= perf_no AND band_id= band_no AND band_name IN (SELECT band_name FROM band,place,musician,performer,plays_in WHERE perf_is=m_no AND player= perf_no AND band_id= band_no AND m_name = 'Sue Little')) AS Y
ON re=m_name
WHERE re IS NOT NULL
