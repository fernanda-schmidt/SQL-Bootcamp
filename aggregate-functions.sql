USE book_shop;

DESC books;

SELECT * FROM books;

-- COUNT
SELECT COUNT(*)
FROM books;

SELECT count(*)
FROM books
WHERE pages >= 300;

SELECT
	count(DISTINCT(author_lname))
FROM books;

SELECT 
	count(title)
FROM books
WHERE title LIKE 'the%';

-- GROUP BY

SELECT
	author_lname,
	count(*)
FROM books
GROUP BY author_lname;

SELECT
	concat(author_lname, ', ', author_fname) AS author,
	count(*) AS book_count
FROM books
GROUP BY author
ORDER BY book_count desc;

-- MIN AND MAX

SELECT 
	MAX(pages) 
FROM books;
 
SELECT 
	MIN(author_lname) 
FROM books;

-- SUBQUERIES

SELECT *
FROM books
WHERE pages = (SELECT min(pages)
				FROM books);

SELECT
	title,
	concat(author_lname, ', ', author_fname) AS author,
	pages
FROM books
WHERE pages = (SELECT max(pages)
				FROM books);
	
SELECT 
	title,
	concat(author_lname, ', ', author_fname) AS author,
	released_year
FROM books
WHERE released_year = (SELECT 
						min(released_year)
						FROM books);

-- GROUP BY MULTIPLE COLUMNS

SELECT
	author_lname,
	count(*)
FROM books
GROUP BY author_lname, author_fname;

SELECT 
	concat(author_lname, ', ', author_fname) AS author,
	count(*)
FROM books
GROUP BY author;

-- MIN/MAX with GROUP BY

SELECT 
	concat(author_lname, ', ', author_fname) AS author,
	min(released_year) AS earliest_work,
	max(released_year) AS latest_work,
	count(*) AS total_works
FROM books
GROUP BY author; 

SELECT 
	author_lname, 
    author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books 
GROUP BY author_lname, author_fname;

-- SUM

SELECT
	author_lname,
	sum(pages)
FROM books
GROUP BY author_lname;

SELECT 
	author_lname, 
	COUNT(*), 
	SUM(pages)
FROM books
GROUP BY author_lname;

-- AVG

SELECT 
	concat(author_lname, ', ', author_fname) AS author,
	avg(pages)
FROM books
GROUP BY author;



