USE book_shop;

DESC books;

SELECT * FROM books;

-- 1:
SELECT 
	count(*) AS total_books
FROM books;

-- 2:
SELECT 
	count(*) AS total_books,
	released_year
FROM books
GROUP BY released_year;

-- 3:
SELECT 
	sum(stock_quantity)
FROM books;

-- 4:
SELECT
	concat(author_lname, ', ', author_fname) AS author,
	avg(released_year)
FROM books
GROUP BY author;

-- 5:
SELECT 
	concat(author_lname, ', ', author_fname) AS author,
	pages
FROM books
WHERE pages = (SELECT
				max(pages)
				FROM books);

-- 6:
SELECT 
	released_year AS 'year',
	count(*) AS '# books',
	avg(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;
	







