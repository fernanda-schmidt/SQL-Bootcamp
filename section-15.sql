-- VIEWS

CREATE VIEW full_reviews AS 
SELECT 
	title,
	released_year,
	genre,
	rating,
	concat(first_name, ' ', last_name) AS 'user'
FROM reviews
JOIN series
	ON series.id = reviews.series_id 
JOIN reviewers
	ON reviewers.id = reviews.reviewer_id;

SELECT * FROM full_reviews;

SELECT
	genre,
	avg(rating) AS 'avg_rating'
FROM full_reviews
GROUP BY genre;

-- UPDATEABLE VIEWS
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
DROP VIEW ordered_series;

-- HAVING CLAUSE
SELECT 
	title,
	avg(rating) AS 'avg_rating'
FROM full_reviews
GROUP BY title HAVING count(rating) > 1;

-- WITH ROLLUP
SELECT 
	title,
	avg(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
	released_year,
	avg(rating),
	genre
FROM full_reviews
GROUP BY released_year, genre WITH ROLLUP;

-- SQL MODES BASICS




