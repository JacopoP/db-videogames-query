-- Singola tabella
SELECT * FROM software_houses
WHERE country = 'United States' 

SELECT * FROM players
WHERE city = 'Rogahnland'

SELECT * FROM players
WHERE name LIKE '%a'

SELECT * FROM reviews
WHERE player_id = 800

SELECT * FROM tournaments
WHERE year = 2015

SELECT * FROM awards
WHERE description LIKE '%facere%'

SELECT DISTINCT videogame_id FROM category_videogame
WHERE category_id = 2 OR category_id = 6

SELECT * FROM reviews
WHERE rating >=2 AND rating <= 4

SELECT * FROM videogames
WHERE YEAR(release_date) = 2020

SELECT DISTINCT videogame_id FROM reviews
WHERE rating = 5

SELECT COUNT(*), AVG(rating) FROM reviews
WHERE videogame_id = 412

SELECT COUNT(*) FROM videogames
WHERE software_house_id = 1 AND YEAR(release_date) = 2018





-- query group by
SELECT COUNT(*) FROM software_houses
GROUP BY country

SELECT videogame_id, COUNT(*) FROM reviews
GROUP BY videogame_id

SELECT pegi_label_id, COUNT(*) FROM pegi_label_videogame
GROUP BY pegi_label_id

SELECT YEAR (release_date), COUNT(*) FROM videogames
GROUP BY YEAR(release_date)

SELECT device_id, COUNT(*) FROM device_videogame
GROUP BY device_id

SELECT videogame_id, AVG(rating) AS reviews_avg FROM reviews
GROUP BY videogame_id
ORDER BY reviews_avg