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