USE book_shop;

DESC books;

-- data types

-- DATE / TIME / DATETIME

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

SELECT * FROM people;

-- DATE TIME FUNCTIONS

SELECT curtime();
SELECT curdate();
SELECT now();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('hazel', curdate(), curtime(), now());

SELECT * FROM people;

-- DATE FUNCTIONS

SELECT
	birthdate,
	day(birthdate),
	dayofweek(birthdate)
FROM people;

SELECT
	birthdate,
	monthname(birthdate) AS 'month',
	year(birthdate)
FROM people;

-- TIME FUNCTIONS

SELECT
	name, 
	birthtime,
	hour(birthtime)
FROM people;

SELECT 
    birthdt,
    MONTH(birthdt),
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

-- FORMATTING DATES

SELECT
	date_format(birthdate, '%a, %b %D '),
	date_format(birthdt, '%H:%i')
FROM people;

-- DATE MATH

SELECT
	birthdate,
	curdate() AS today,
	datediff(curdate(), birthdate) AS 'datediff'
FROM people;

SELECT
	curdate(),
	date_Add(curdate(), INTERVAL 1 DAY)
FROM people;

SELECT
	name,
	birthdate,
	date_Add(birthdate, INTERVAL 21 year) AS legal_drink
FROM people;

-- TIMESTAMPS

CREATE TABLE captions (
	capt varchar(150),
	created_at timestamp DEFAULT current_timestamp
);

INSERT INTO captions (capt)
VALUES ('Just chilling');

INSERT INTO captions (capt)
VALUES ('beautiful sunset');

SELECT * FROM captions;

CREATE TABLE captions2 (
	text varchar(150),
	created_at timestamp DEFAULT current_timestamp,
	updated_at timestamp ON UPDATE current_timestamp
);

INSERT INTO captions2(text)
VALUES ('i love life');

SELECT * FROM captions2;

UPDATE captions2 SET text='i love life!!!!';

SELECT * FROM captions2;













