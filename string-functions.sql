-- Set up
CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

-- Start section:

SELECT 
	concat(author_lname, ", ", author_fname) AS author 
FROM books;

-- 
SELECT
	concat_ws('-', title, author_lname, author_fname)
FROM books;

-- 
SELECT substring('Hello World', 1, 4); -- output: Hell

-- 
SELECT 
	concat(substr(title, 1, 10), '...')	AS short_title
FROM books;

-- 
SELECT 
	concat
	(substr(author_fname, 1, 1),
	'. ',
	author_lname) AS author
FROM
	books;

-- 
SELECT 
	replace('Hello World', 'Hell', '@#$%');

-- 
SELECT 
	REPLACE(title, ' ', '-')
FROM books;
-- 
SELECT
	CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long')
FROM
	books;

-- mini challenge:
SELECT 
	concat('I LOVE ',
			upper(title),
			' !!!')
FROM
	books;

-- Exercise:

-- 1:
SELECT 
	reverse(upper('why does my cat look at me with such hatred?'));

-- 2:
SELECT 
	REPLACE(
	concat('I', ' ', 'like', ' ', 'cats'),
	' ',
	'-'
	);

-- 3:
SELECT
	REPLACE (title, ' ', '->') AS title
FROM books;

-- 4:
SELECT author_lname AS forwards,
	reverse(author_lname) AS backwards
FROM books;

-- 5:
SELECT
	concat(upper(author_fname),
	' ', 
	upper(author_lname))
	AS 'full name in caps'
FROM 
	books;

-- 6:
SELECT * FROM books;

SELECT
	concat(title, 
	' was released in ', 
	released_year)
	AS blurb
FROM books;

-- 7:
SELECT 
	title,
	char_length(title) AS 'character count'
FROM books;

-- 8:

SELECT * FROM books;

SELECT
	concat(substring(title, 1, 10),
		'...')
		AS short_title,
	concat(
		author_lname,
		', ',
		author_fname)
		AS author,
	concat(stock_quantity,
		' in stock')
		AS quantity
FROM books;