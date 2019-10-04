--Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997.
SELECT m_name
FROM musician, concert
WHERE concert_venue = 'Assembly Rooms' AND 
               concert_orgniser = m_no;
--Find all the performers who played guitar or violin and were born in England.
SELECT DISTINCT m_name
FROM place, performer, musician
WHERE m_no = perf_is AND 
               born_in = place_no AND 
               place_country = 'England'AND 
               (instrument = 'guitar' OR instrument = 'violin');
--List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts.
SELECT m_name, place_town, con_date
FROM concert, place, musician
WHERE concert_in = place_no AND 
               place_country = 'USA' AND 
               concert_orgniser = m_no;
--How many concerts have featured at least one composition by Andy Jones? List concert date, venue and the composition's title.
SELECT con_date, concert_venue, c_title
FROM performance, composition, has_composed, composer, musician, concert
WHERE m_name = 'Andy Jones' AND 
      m_no = comp_is AND 
      comp_no = cmpr_no AND 
      cmpn_no = c_no AND 
      c_no = performed AND 
      performed_in = concert_no;
--list the different instruments played by the musicians and avg number of musicians who play the instrument.
SELECT con_date, concert_venue, c_title
FROM performance,composition, has_composed, composer, musician, concert
WHERE 
    m_name = 'Andy Jones' AND 
    m_no = comp_is AND 
    comp_no = cmpr_no AND 
    cmpn_no = c_no AND 
    c_no = performed AND 
    performed_in = concert_no;
--List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays.
SELECT m_name
FROM musician, performer
WHERE perf_is = m_no AND 
      died IS NULL AND 
      instrument IN (SELECT instrument 
                     FROM musician, performer 
                     WHERE perf_is = m_no AND 
                     m_name = 'Theo Mengel');
--List the name and the number of players for the band whose number of players is greater than the average number of players in each band.
SELECT band_name, COUNT(band_id) AS n_players
FROM band, plays_in
WHERE band_no = band_id
GROUP BY band_name
HAVING COUNT(band_id) > (SELECT AVG(n)
                         FROM (SELECT COUNT(band_id) as n
                         FROM plays_in
                         GROUP BY band_id));
--List the names of musicians who both conduct and compose and live in Britain.
SELECT m_name
FROM musician
WHERE m_no IN (SELECT m_no
               FROM concert, musician, place
               WHERE place_country = 'England' AND 
                     concert_in = place_no AND
                     m_no = concert_orgniser)
     AND m_no IN (SELECT m_no
                  FROM musician, composer, has_composed, composition, place
                  WHERE place_country = 'England' AND 
                        place_no = c_in AND
                        c_no = cmpn_no AND 
                        cmpr_no = comp_no AND 
                        comp_is = m_no)
     AND m_no IN (SELECT m_no
                  FROM musician, place
                  WHERE place_country = 'England' AND 
                        place_no = living_in);
--Show the least commonly played instrument and the number of musicians who play it.
SELECT inst, interpreters
FROM (SELECT instrument AS inst, COUNT(instrument) AS interpreters
      FROM performer
      GROUP BY instrument
      HAVING COUNT(instrument) = (SELECT MIN(c)
                                  FROM (SELECT COUNT(instrument) AS c
                                  FROM performer
                                  GROUP BY instrument) tcount)) minInst;
--List the bands that have played music composed by Sue Little; Give the titles of the composition in each case.
SELECT band_name, c_title
FROM band, performance, composition, has_composed, composer, musician
WHERE m_name = 'Sue Little' AND m_no = comp_is AND 
               comp_no = cmpr_no AND cmpn_no = c_no AND 
                c_no = performed AND gave = band_no;
--List the name and town of birth of any performer born in the same city as James First. 
SELECT DISTINCT m_name, place_town
FROM performer, musician, place
WHERE perf_is = m_no AND
               born_in = place_no AND
               place_town = (SELECT place_town
                             FROM musician, place
                             WHERE place_no = born_in AND 
                                   m_name = 'James First');
--Give the band name, conductor and contact of the bands performing at the most recent concert in the Royal Albert Hall.
SELECT band_name, conductor, contact
FROM (SELECT concert_no, band_name, con_date
              FROM concert, performance, band
              WHERE concert_venue = 'Royal Albert Hall' AND
                             concert_no = performed_in AND
                             gave = band_no) a 
JOIN
            (SELECT concert_no, m_name AS conductor, con_date
             FROM musician, concert
             WHERE concert_venue = 'Royal Albert Hall' AND
                           concert_orgniser = m_no) b 
ON (a.concert_no = b.concert_no AND 
        a.con_date = b.con_date AND
        b.con_date = (SELECT MAX(con_date) 
                                  FROM concert
                                  WHERE concert_venue = 'Royal Albert Hall')) 
JOIN
             (SELECT concert_no, m_name AS contact, con_date
              FROM musician, band, concert, performance
              WHERE concert_venue = 'Royal Albert Hall' AND
                             concert_no = performed_in AND
                             gave = band_no AND
                             band_contact = m_no) c 
ON (b.concert_no = c.concert_no AND 
        b.con_date = c.con_date AND
        c.con_date = (SELECT MAX(con_date) 
                                  FROM concert
                                  WHERE concert_venue = 'Royal Albert Hall'));
--Jeff Dawn plays in a band with someone who plays in a band with Sue Little. Who is it and what are the bands?
SELECT name, band_1, band_2
FROM (SELECT m_name AS name, band_name AS band_1
      FROM musician, performer, plays_in, band
      WHERE m_no = perf_is AND
            perf_no = player AND
            band_id = band_no AND
            band_id IN (SELECT band_id
                        FROM musician, performer, plays_in
                        WHERE m_name = 'Jeff Dawn' AND
                              m_no = perf_is AND
                              perf_no = player)) a
JOIN
           (SELECT m_name, band_name AS band_2
            FROM musician, performer, plays_in, band
            WHERE m_no = perf_is AND
                  perf_no = player AND
                  band_id = band_no AND
                  band_id IN (SELECT band_id
                              FROM musician, performer, plays_in
                              WHERE m_name = 'Sue Little' AND
                                    m_no = perf_is AND
                                    perf_no = player)) b
ON (a.name = b.m_name);