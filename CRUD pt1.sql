-- Create table to work off:

CREATE TABLE cats
(
	cat_id int AUTO_INCREMENT PRIMARY KEY,
	name varchar(100),
	breed varchar(100),
	age int
);

DESC cats;

INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
		('Cindy', 'Maine Coon', 10),
		('Dumbledore', 'Maine Coon', 11),
		('Egg', 'Persian', 4),
		('Misty', 'Tabby', 13),
		('George Michael', 'Ragdoll', 9),
		('Jackson', 'Sphynx', 7);

SELECT * FROM cats;

-- Rapid fire exercises:
-- 1:
SELECT cat_id FROM cats;

-- 2:
SELECT name, breed FROM cats;

-- 3:
SELECT name, age FROM cats
WHERE breed = 'tabby';

-- 4:
SELECT cat_id, age FROM cats
WHERE cat_id = age;

-- Finished rapid-fire exercises part 1.

-- Next concept: Aliases

SELECT cat_id AS id, name FROM cats; -- shows "cat_id" as "id" in the output.

-- up next: The "U" in CRUD -> Update
UPDATE cats SET age=14
WHERE name='Misty';

SELECT * FROM cats;

-- Tip: A good rule of thumb:
-- Use SELECT before UPDATE

-- Exercises:
-- 1:
SELECT * FROM cats;

UPDATE cats SET name='Jack'
WHERE name = 'Jackson';

-- 2:
UPDATE cats SET breed='British Shorthair'
WHERE name = 'Ringo';

-- 3:
UPDATE cats SET age=12
WHERE breed = 'Maine Coon';

-- Finished exercises - check output:
SELECT * FROM cats;

-- Up next: Delete

-- 1:
DELETE FROM cats
WHERE age = 4;

-- 2:
DELETE FROM cats
WHERE age = cat_id;

-- 3:
DELETE FROM cats;

-- finished exercises

DESC cats;
SELECT * FROM cats;