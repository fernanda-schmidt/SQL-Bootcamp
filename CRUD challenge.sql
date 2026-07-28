-- create the table
CREATE TABLE shirts 
(
	shirt_id int PRIMARY KEY AUTO_INCREMENT,
	article varchar(25),
	color varchar(25),
	shirt_Size varchar(5),
	last_worn int
);

-- add data to table 
INSERT INTO shirts (article, color, shirt_size, last_worn)  
VALUES 
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);

INSERT INTO shirts (color, article, shirt_size, last_worn)
VALUES ('Purple', 'Polo Shirt', 'M', 50);

-- check table
DESC shirts;

SELECT * FROM shirts;

-- Select challenges: 
SELECT article, color FROM shirts;

SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size = 'M';

-- Update challenges:
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'Polo shirt';

SELECT* FROM shirts; -- to check table

UPDATE shirts SET last_worn = 0
WHERE LAST_worn = 15;

SELECT* FROM shirts; -- to check table

UPDATE shirts SET color = 'off white', shirt_SIZE = 'XS'
WHERE color = 'white';

SELECT* FROM shirts; -- to check table

-- DELETE challenges:
DELETE FROM shirts
WHERE last_worn >= 200;

DELETE FROM shirts 
WHERE article = 'tank top';

SELECT * FROM shirts; -- to check table

DELETE FROM shirts;

DROP TABLE shirts;