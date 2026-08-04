SHOW tables;
DESC reviewers;
DESC reviews;
DESC series;
-- 1:
SELECT 
	title,
	rating
FROM series
JOIN reviews
ON series.id = reviews.series_id;

-- 2:
SELECT 
	title,
	avg(rating) AS avg_rating
FROM series
JOIN reviews
ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- 3:
SELECT
	first_name,
	last_name,
	rating
FROM reviewers
JOIN reviews
ON reviewers.id = reviews.reviewer_id;

-- 4:
SELECT 
	title AS unreviewed_series
FROM series
LEFT JOIN reviews
ON series.id = reviews.series_id
WHERE rating IS null;

-- 5:
SELECT
	genre,
	round(avg(rating), 2) AS avg_rating
FROM series
JOIN reviews
ON series.id = reviews.series_id
GROUP BY genre;

-- 6:
SELECT 
	first_name,
	last_name,
	count(rating) AS 'COUNT',
	ifnull(min(rating), 0) AS 'MIN',
	ifnull(MAX(rating), 0) AS 'MAX',
	ifnull(avg(rating), 0) AS 'AVG',
	CASE 
		WHEN count(rating) > 0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS 'status' -- could aso use IF (count(rating)> 0, 'ACTIVE', 'INACTIVE') AS 'STATUS'
FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;
	
-- 7:
SELECT
	title,
	rating,
	concat(first_name, ' ', last_name) AS reviewer
FROM series
JOIN reviews
ON series.id = reviews.series_id
JOIN reviewers
ON reviewers.id = reviews.reviewer_id
ORDER BY title;
