USE book_shop;

-- NOT EQUAL

SELECT title
FROM books
WHERE released_year != 2017;

SELECT 
	title,
	author_lname
FROM books
WHERE author_lname != 'Gaiman';

-- NOT LIKE

SELECT 
	title,
	author_lname
FROM books
WHERE title NOT LIKE '% %';

SELECT 
	title,
	author_lname,
	author_fname
FROM books
WHERE author_fname NOT LIKE 'DA%';

-- GREATER THAN OR EQUAL TO

SELECT
	title,
	released_year
FROM books
WHERE released_year > 2005;

SELECT 
	title,
	pages
FROM books
WHERE pages >= 300;

-- LESS THAN OR EQUAL TO

SELECT 
	title,
	released_year
FROM books
WHERE released_year <= 2000
ORDER BY released_year;

-- LOGICAL AND

SELECT * 
FROM books
WHERE author_lname = 'Eggers' 
		AND released_year > 2010
		AND title LIKE '%novel%';

SELECT 
	title,
	pages
FROM books
WHERE char_length(title) > 30 
		AND pages > 400
ORDER BY pages;

-- LOGICAL OR

SELECT 
	title,
	author_lname,
	released_year
FROM books
WHERE author_lname = 'Eggers'
	OR released_year >= 2010
ORDER BY released_year;

SELECT
	title,
	pages
FROM books
WHERE pages < 200
	OR title LIKE '%stories%'
ORDER BY pages;

-- BETWEEN

SELECT 
	title,
	pages
FROM books
WHERE pages BETWEEN 200 AND 400
ORDER BY pages;

SELECT 
	title,
	released_year
FROM books
WHERE released_year BETWEEN 2000 AND 2010
ORDER BY released_year;

SELECT 
	title,
	released_year
FROM books
WHERE released_year NOT BETWEEN 2000 AND 2010
ORDER BY released_year;

-- COMPARING DATES

SELECT * 
FROM people
WHERE YEAR(birthdt) < 2005
ORDER BY YEAR(birthdt);

SELECT * 
FROM people
WHERE hour(birthdt) > 12;

SELECT *
FROM people
WHERE birthtime BETWEEN '10:00:00' AND '16:00:00';

SELECT *
FROM people
WHERE birthtime BETWEEN CAST('10:00:00' AS TIME)
				AND CAST('16:00:00' AS TIME);

-- TROUBLESHOOTING THE ERROR I GOT
-- SELECT version();
-- 
-- SELECT @@version_comment;
-- 
-- DESC people;
-- 
-- SELECT CAST('10:00:00' AS TIME);
-- 
-- SELECT TIME('10:00:00');
-- 
-- SELECT *
-- FROM people
-- WHERE birthtime BETWEEN '10:00:00' AND '16:00:00';
-- 
-- SHOW FUNCTION STATUS
-- WHERE Db = DATABASE();
-- 
-- SHOW FUNCTION STATUS LIKE 'CAST';
-- 
-- SELECT birthtime
-- FROM people
-- LIMIT 10;
-- 
-- SELECT *
-- FROM people
-- WHERE birthtime BETWEEN '10:00:00' AND '16:00:00';

-- Continuing

SELECT *
FROM people
WHERE hour(birthtime) BETWEEN 10 AND 16;

-- THE IN OPERATOR

SELECT 
	title,
	author_lname
FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT 
	title,
	author_lname
FROM books
WHERE author_lname NOT IN ('Gaiman');

SELECT
	title,
	released_year
FROM books
WHERE released_year % 2 != 0
ORDER BY released_year;

-- CASE

SELECT 
	title,
	released_year,
CASE
	WHEN released_year >= 2000
	THEN '21st Century Literature'
	ELSE '20th Century Literature'
END AS genre
FROM books;

SELECT 
	title,
	concat(author_lname, ', ', author_fname) AS author,
	stock_quantity,
	CASE 
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
		WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
		ELSE '***'
	END AS stock
FROM books
ORDER BY stock;

-- Rewriting the query above:

SELECT 
	title,
	concat(author_lname, ', ', author_fname) AS author,
	stock_quantity,
	CASE
		WHEN stock_quantity <= 50 THEN '*'
		WHEN stock_quantity <= 100 THEN '**'
		ELSE '***'
	END AS stock
FROM books
ORDER BY stock;
	
-- IS NULL
DESC books;

INSERT INTO books(title, author_fname, stock_quantity, pages)
VALUES ('The Odyssey', 'Homer', 750, 541);

SELECT * 
FROM books
WHERE released_year IS NULL;
