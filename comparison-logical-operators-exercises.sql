-- 1:
SELECT *
FROM books
WHERE released_year < 1980;

-- 2:
SELECT 
	title,
	author_lname
	released_year
FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

-- 3:
SELECT 
	title,
	author_lname,
	released_year
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000
ORDER BY released_year;

-- 4:
SELECT
	title,
	author_lname,
	pages
FROM books
WHERE pages BETWEEN 100 AND 200;

-- 5:
SELECT
	title,
	author_lname
FROM books
WHERE author_lname LIKE 'C%' 
	OR author_lname LIKE 'S%';

SELECT 
	title,
	author_lname
FROM books
WHERE substr(author_lname, 1, 1) IN ('C', 'S');

-- 6:
SELECT 
	title,
	author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Sotries'
		WHEN title = 'Just Kids' OR title LIKE '%Staggering%' THEN 'Memoir'
		ELSE 'Novel'
	END AS 'type'
FROM books;

-- 7:
SELECT 
	author_fname,
	author_lname,
	CASE 
		WHEN count(*) = 1 THEN '1 book'
		ELSE concat(count(*),' books')
	END AS count
FROM books
GROUP BY author_fname, author_lname;
