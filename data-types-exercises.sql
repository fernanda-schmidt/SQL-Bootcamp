-- 1:
SELECT 
	curtime();

-- 2:
SELECT 
	curdate();

-- 3: 
SELECT 
	dayofweek(curdate());

-- 4:
SELECT 
	dayname(curdate());

-- 5:
SELECT 
	date_format(now(), '%m/%d/%Y');

-- 6:
SELECT
	date_format(now(),
				'%M %D at %H:%i');

-- 7:
CREATE TABLE tweets(
	tweet varchar(280),
	username varchar(20),
	created_at timestamp DEFAULT current_timestamp
);








