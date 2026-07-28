SELECT * FROM books;

-- 1:
SELECT 
	title
FROM books
WHERE title LIKE '%stories%';

-- 2:
SELECT
	title,
	pages
FROM books
ORDER BY pages DESC
LIMIT 1;

-- 3:
SELECT 
	concat(title,
			' - ',
			released_year)
	AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

-- 4:
SELECT
	title,
	author_lname
FROM books
WHERE author_lname LIKE '% %';

-- 5:
SELECT 
	title,
	released_year,
	stock_quantity
FROM books
ORDER BY stock_quantity 
LIMIT 3;

-- 6:
SELECT 
	title,
	author_lname
FROM books
ORDER BY author_lname , title;

-- 7:
SELECT 
	concat(
	'MY FAVORITE AUTHOR IS ',
	CONCAT(upper(author_fname), ' ', upper(author_lname)),
	' !'
	) AS yell
FROM books
ORDER BY author_lname;

