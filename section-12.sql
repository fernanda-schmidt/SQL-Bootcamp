-- UNIQUE
CREATE TABLE companies (
	supplier_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	phone varchar(15) NOT NULL UNIQUE,
	address varchar(255) NOT null
);

-- CHECK 
CREATE TABLE partiers (
	name varchar(50),
	age int CHECK (age > 21)
);

-- NAMED CONSTRAINTS
CREATE TABLE partiers2 (
	name varchar(50),
	age int
	CONSTRAINT overage CHECK (age > 21)
	);

INSERT INTO partiers2 (name, age)
VALUES ('Fernanda', 29);

INSERT INTO partiers2 (name, age)
VALUES ('Clara', 16); -- WILL NOT GO THROUGH, SHOWS ERROR

SELECT * FROM PARTIERS2;

-- MULTIPLE COLUMNS CONSTRAINT

DROP TABLE companies;

CREATE TABLE companies (
	supplier_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(255) NOT NULL,
	phone varchar(15) NOT NULL UNIQUE,
	address varchar(255) NOT NULL,
	CONSTRAINT name_adress unique(name , address)
);

INSERT INTO companies (name, phone, address)
VALUES ('blackbird','4105701058', '123 main street');

INSERT INTO companies (name, phone, address)
VALUES ('Luigi\'s','5551324125', '123 main street');

INSERT INTO companies (name, phone, address)
VALUES ('Luigi\'s','555132431', '123 main street'); -- wil not go through, shows error

-- ALTER TABLE: ADDING COLUMNS
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

SELECT * FROM companies;

-- ALTER TABLE: DROP COLUMNS
ALTER TABLE companies
DROP COLUMN phone;

-- ALTER TABLE: RENAMING
RENAME TABLE companies TO suppliers;

SHOW tables;

ALTER TABLE suppliers
RENAME COLUMN name TO biz_name;

SELECT * FROM suppliers;

-- ALTER TABLE: MODIFYING COLUMNS
DESC suppliers;

ALTER TABLE suppliers
MODIFY biz_name varchar(100) DEFAULT 'unknown';

DESC suppliers;

-- 

SHOW tables;
DESC employees;

ALTER TABLE employees
ALTER column current_status SET DEFAULT 'employed';

-- 
USE book_shop;
ALTER TABLE books
ADD COLUMN author varchar(150);

DESC books;

UPDATE books
SET author = concat(ifnull(author_lname, ''), ', ', ifnull(author_fname, ''));

SELECT title, author 
FROM books;












