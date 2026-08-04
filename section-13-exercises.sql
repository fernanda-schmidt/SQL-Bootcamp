-- 1:
CREATE TABLE students(
	id int AUTO_INCREMENT PRIMARY KEY,
	first_name varchar(25) NOT NULL 
);

CREATE TABLE papers(
	title varchar(100) NOT NULL,
	grade int,
	student_id int,
	FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

-- 2:

SELECT 
	first_name,
	title,
	grade
FROM students
JOIN papers
ON students.id = papers.student_id
ORDER BY grade desc;

-- 3:
SELECT
	first_name,
	title,
	grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

-- 4:
SELECT 
	first_name,
	ifnull(title, 'MISSING'),
	ifnull(grade, 0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id;

-- 5:
SELECT
	first_name,
	ifnull(avg(grade), 0) AS average
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average desc;

-- 6: 
SELECT 
	first_name,
	ifnull(avg(grade), 0) AS average,
	CASE 
		WHEN avg(grade) >= 75 THEN 'PASS'
		ELSE 'FAIL'
	END AS passing_status
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average desc;

