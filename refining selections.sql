SELECT * FROM books;

-- add new data
INSERT
	INTO
	books
    (title,
	author_fname,
	author_lname,
	released_year,
	stock_quantity,
	pages)
VALUES ('10% Happier',
'Dan',
'Harris',
2014,
29,
256), 
           ('fake_book',
'Freida',
'Harris',
2001,
287,
428),
           ('Lincoln In The Bardo',
'George',
'Saunders',
2017,
1000,
367);

SELECT * FROM books;
-- 'distinct'

SELECT DISTINCT author_lname
FROM books;

SELECT DISTINCT released_year
FROM books;

SELECT DISTINCT 
	concat(author_lname, ', ', author_fname) AS author
FROM books;

-- or:

SELECT DISTINCT author_lname, author_fname
FROM books;

-- 'order by'

SELECT *
FROM books
ORDER BY author_lname;

SELECT title, author_lname, released_year
FROM books
ORDER BY released_year;

SELECT title,
		concat(author_lname, ', ', author_fname) AS author,
		pages
FROM books
ORDER BY pages;

SELECT* FROM books;

SELECT book_id, title, author_lname, pages
FROM books
ORDER BY 3; -- orders by the "nth" column specified in SELECT

SELECT title, author_lname, released_year
FROM books
ORDER BY author_lname, released_year ; -- sorts by the first argument, then the second

SELECT 
	book_id,
	concat(author_lname, ', ', author_fname) AS author,
	title,
	released_year
FROM books
ORDER BY author, released_year;

-- 'limit'

SELECT 
	book_id,
	concat(author_lname, ', ', author_fname) AS author,
	title,
	pages
FROM books
ORDER BY pages desc
LIMIT 5;

-- 'like'

SELECT 
	title,
	author_fname,
	author_lname
FROM books
WHERE author_fname LIKE 'da%';


SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';

SELECT * FROM books
WHERE author_fname LIKE '____';
 
SELECT * FROM books
WHERE author_fname LIKE '_a_';

-- escape wildcards

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%\%%'; -- the \% escapes the wildcard











