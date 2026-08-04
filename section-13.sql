-- RELATIONSHIPS AND JOINS

 CREATE TABLE customers(
 	id int PRIMARY KEY AUTO_INCREMENT,
 	first_name varchar(50) NOT NULL DEFAULT 'unkown',
 	last_name varchar(50) NOT NULL DEFAULT 'unknown',
 	email varchar(50) UNIQUE NOT NULL 
 );
 
 CREATE TABLE orders(
 	id int PRIMARY KEY AUTO_INCREMENT,
 	order_date timestamp DEFAULT current_timestamp,
 	amount decimal(8,2),
 	customer_id int,
 	FOREIGN KEY (customer_id) REFERENCES customers(id)
 );
 
 DESC customers;
 DESC orders;
 
 -- correcting the typo:
 ALTER TABLE customers
 ALTER COLUMN first_name SET DEFAULT 'unknown';
 
 -- cleaning up the database:

 SHOW tables;
 
 DROP TABLE belcher, cats, partiers, partiers2, tweets, suppliers;
 
 -- 
 INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

-- CROSS JOINS

SELECT * FROM customers, orders; -- basically useless

-- INNER JOIN

SELECT
	customers.id,
	last_name,
	order_date,
	amount
FROM customers
JOIN orders
	ON customers.id = orders.customer_id
ORDER BY amount;
 
 -- INNER JOIN WITH GROUP BY

SELECT 
	customers.id,
	sum(amount) AS total
FROM customers
JOIN orders
	ON orders.customer_id = customers.id
GROUP BY customers.id
ORDER BY total;
 
-- LEFT JOIN

SELECT
	first_name,
	last_name,
	order_date,
	amount
FROM customers
LEFT JOIN 
	orders
	ON orders.customer_id = customers.id;

-- LEFT JOIN WITH GROUP BY

SELECT
	first_name,
	last_name,
	ifnull(sum(amount), 0) AS money_spent
FROM customers
LEFT JOIN 
	orders
	ON orders.customer_id = customers.id
GROUP BY first_name, last_name
ORDER BY money_spent;

-- RIGHT JOIN
SELECT 
	first_name,
	last_name,
	order_date,
	amount
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;


 
 
 
 
 
 
 
 
 
 
 
 
 
 