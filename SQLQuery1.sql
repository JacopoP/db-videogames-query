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




-- query join
SELECT DISTINCT players.* FROM reviews
INNER JOIN players
ON player_id = players.id

SELECT DISTINCT videogames.id, videogames.name FROM tournaments
INNER JOIN tournament_videogame
ON tournament_id = tournaments.id
INNER JOIN videogames
ON videogame_id = videogames.id
WHERE tournaments.year = 2016

SELECT videogames.name AS videogame_name, categories.name AS category_name FROM videogames
INNER JOIN category_videogame
ON videogame_id = videogames.id
INNER JOIN categories
ON category_id = categories.id

SELECT DISTINCT software_houses.* FROM software_houses
INNER JOIN videogames
ON software_house_id = software_houses.id
WHERE YEAR(release_date) >= 2020

SELECT DISTINCT software_houses.name, award_videogame.award_id, award_videogame.year FROM awards
INNER JOIN award_videogame
ON award_id = award_id
INNER JOIN videogames
ON videogame_id = videogames.id
INNER JOIN software_houses
ON software_house_id = software_houses.id

SELECT DISTINCT videogames.name, categories.name, pegi_labels.name FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON categories.id = category_id
INNER JOIN pegi_label_videogame
ON videogames.id = pegi_label_videogame.videogame_id
INNER JOIN pegi_labels
ON pegi_label_id = pegi_labels.id
INNER JOIN reviews
ON reviews.videogame_id = videogames.id
WHERE rating >= 4

SELECT DISTINCT videogames.id, videogames.name FROM videogames
INNER JOIN tournament_videogame
ON videogame_id = videogames.id
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN player_tournament
ON tournaments.id = player_tournament.tournament_id
INNER JOIN players
ON players.id = player_id
WHERE players.name LIKE 'S%'

SELECT DISTINCT tournaments.city FROM tournaments
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE award_videogame.year = 2018 AND awards.name LIKE 'gioco dell''anno'

SELECT players.* FROM players
INNER JOIN player_tournament
ON players.id = player_tournament.player_id
INNER JOIN tournaments
ON player_tournament.tournament_id = tournaments.id
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE award_videogame.year = 2018 AND awards.name LIKE 'gioco più atteso' AND tournaments.year = 2019

SELECT TOP 1 software_houses.*, videogames.* FROM videogames
INNER JOIN software_houses
ON software_houses.id = software_house_id
ORDER BY videogames.release_date

SELECT TOP 1 videogames.id, videogames.name, videogames.release_date, COUNT(*) AS review_number FROM videogames
INNER JOIN reviews
ON reviews.videogame_id = videogames.id
GROUP BY videogames.id, videogames.name, videogames.release_date
ORDER BY review_number DESC

SELECT TOP 1 software_houses.id, software_houses.name, software_houses.city, software_houses.country, COUNT(*) AS awards_won FROM awards
INNER JOIN award_videogame
ON award_id = award_id
INNER JOIN videogames
ON videogame_id = videogames.id
INNER JOIN software_houses
ON software_house_id = software_houses.id
WHERE award_videogame.year = 2015 OR award_videogame.year = 2016
GROUP BY software_houses.id, software_houses.name, software_houses.city, software_houses.country
ORDER BY awards_won DESC

SELECT * FROM (
SELECT DISTINCT categories.name, AVG(reviews.rating) AS avg_rating FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON categories.id = category_id
INNER JOIN reviews
ON reviews.videogame_id = videogames.id
GROUP BY videogames.id, categories.name
) x
WHERE avg_rating < 2