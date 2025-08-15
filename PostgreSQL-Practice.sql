SELECT version();

SELECT 5*3;

CREATE TABLE movies(
	movie_id INT PRIMARY KEY,
	movie_name VARCHAR(40),
	movie_genre VARCHAR(30),
	imdb_rating REAL
);
SELECT * FROM movies;

INSERT INTO movies(movie_id, movie_name, movie_genre, imdb_rating) 
VALUES(101, 'Vertigo', 'Mystery, Romance', 8.3),
	  (102, 'The Shawshank Redemption', 'Fiction', 9.3),
	  (103, '12 Angry Men', 'Drama', 9.0),
	  (104, 'Dark Knight', 'Action', 9.0),
	  (105, 'The Matrix', 'Sci-Fi', 8.7),
	  (106, 'Se7en', 'Crime', 8.6),
	  (107, 'Interstellar', 'Adventure', 9.8),
	  (108, 'The Lion King', 'Animation, Adventure', 9.5);
SELECT * FROM movies;

-- DESCRIBE movies;  -> works only in MySQL, for pgAdmin...
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'movies';

-- UPDATE QUERY
UPDATE movies
SET movie_genre = 'Drama, Romance'
WHERE movie_id = 103;

SELECT * FROM movies
ORDER BY movie_id;

-- DELETE QUERY
DELETE FROM movies
WHERE movie_id = 108;

-- Operators usecase
SELECT * FROM movies
WHERE imdb_rating > 9;

-- BETWEEN operator
SELECT * FROM movies
WHERE imdb_rating
BETWEEN 8.7 AND 9.9;

SELECT movie_name, movie_genre FROM movies
WHERE imdb_rating < 9.0;

-- IN operator
SELECT * from movies
WHERE imdb_rating IN (8.7, 9.9, 8.3);
-- shows only those records whose imdb_rating is either 8.7, 9.9 or 8.3





-- create new table
CREATE TABLE employees(
	emp_id INT NOT NULL PRIMARY KEY,
	emp_name VARCHAR(40),
	emp_email VARCHAR(40),
	emp_gender VARCHAR(10),
	emp_department VARCHAR(40),
	emp_address VARCHAR(20),
	emp_salary REAL		-- REAL will ensure, salary has int or floating values!
);

SELECT * FROM employees;

-- insert values into employees table
INSERT INTO employees(
	emp_id, emp_name, emp_email, emp_gender, emp_department, emp_address, emp_salary
)
VALUES(101, 'Martin', 'martinfernandez8@gmail.com', 'Male', 'Computer Science', 'Washington D.C', 200000.00),
	  (102, 'Emily', 'emilydickson@icloud.com', 'Female', 'Biotechnology', 'New York City', 250000.50),
	  (103, 'Luke', 'lukekaret@yahoo.com', 'Male', 'Robotics', 'San Francisco', 380000.90),
	  (104, 'Peter', 'petertenison586@gmail.com', 'Male', 'Quantum Computing', 'Cupertino', 280000.50);

UPDATE employees
SET emp_address = 'Phoenix'
WHERE emp_id = 104;

SELECT * FROM employees
ORDER BY emp_id;

INSERT INTO employees (
    emp_id, emp_name, emp_email, emp_gender, emp_department, emp_address, emp_salary
)
VALUES
    (105, 'Alice Johnson', 'alice.johnson@example.com', 'Female', 'Computer Science', 'Washington D.C', 195000.00),
    (106, 'Robert King', 'robert.king@example.com', 'Male', 'Robotics', 'San Francisco', 320000.00),
    (107, 'Sophia Miller', 'sophia.miller@example.com', 'Female', 'Biotechnology', 'New York City', 230000.50),
    (108, 'Daniel Smith', 'daniel.smith@example.com', 'Male', 'Quantum Computing', 'Cupertino', 290000.00),
    (109, 'Olivia Brown', 'olivia.brown@example.com', 'Female', 'Computer Science', 'Phoenix', 210000.00),
    (110, 'Ethan Davis', 'ethan.davis@example.com', 'Male', 'Biotechnology', 'Washington D.C', 240000.75),
    (111, 'Isabella Wilson', 'isabella.wilson@example.com', 'Female', 'Robotics', 'San Francisco', 300000.00),
    (112, 'Mason Lee', 'mason.lee@example.com', 'Male', 'Computer Science', 'Phoenix', 205000.00),
    (113, 'Ava Martinez', 'ava.martinez@example.com', 'Female', 'Biotechnology', 'New York City', 260000.00),
    (114, 'Logan Anderson', 'logan.anderson@example.com', 'Male', 'Quantum Computing', 'Cupertino', 285000.25),
    (115, 'Mia Thomas', 'mia.thomas@example.com', 'Female', 'Computer Science', 'Washington D.C', 200000.00),
    (116, 'James Harris', 'james.harris@example.com', 'Male', 'Robotics', 'Phoenix', 310000.00),
    (117, 'Charlotte Clark', 'charlotte.clark@example.com', 'Female', 'Biotechnology', 'New York City', 255000.00),
    (118, 'Benjamin Young', 'benjamin.young@example.com', 'Male', 'Computer Science', 'San Francisco', 225000.50),
    (119, 'Amelia Allen', 'amelia.allen@example.com', 'Female', 'Quantum Computing', 'Cupertino', 295000.00),
    (120, 'Lucas Scott', 'lucas.scott@example.com', 'Male', 'Robotics', 'Washington D.C', 315000.00),
    (121, 'Harper Wright', 'harper.wright@example.com', 'Female', 'Computer Science', 'Phoenix', 215000.00),
    (122, 'Henry Baker', 'henry.baker@example.com', 'Male', 'Biotechnology', 'New York City', 250000.00),
    (123, 'Evelyn Green', 'evelyn.green@example.com', 'Female', 'Robotics', 'San Francisco', 305000.00),
    (124, 'Alexander Adams', 'alexander.adams@example.com', 'Male', 'Computer Science', 'Washington D.C', 220000.00);


-- to carry out distinct values of address
SELECT DISTINCT emp_address from employees;

-- add some null values into emp_email column
UPDATE employees
SET emp_email = NULL
WHERE emp_id IN (105, 109, 114, 120);

SELECT * FROM employees
ORDER BY emp_id;

SELECT * FROM employees WHERE emp_email is NULL;


-- ALTER and RENAME query
ALTER TABLE employees
RENAME COLUMN emp_address to emp_US_address;


-- AND operator
SELECT * FROM employees
WHERE emp_us_address = 'Washington D.C' AND emp_gender = 'Male';


-- OR operator
SELECT * FROM employees
WHERE emp_department = 'Biotechnology' OR emp_us_address = 'Cupertino';


-- LIMIT query
SELECT * FROM employees
ORDER BY emp_salary
DESC LIMIT 5;

-- LIMIT and OFFSET query : skip the first 3 rows and print the next 5 rows!
SELECT * FROM employees ORDER BY emp_id DESC LIMIT 5 OFFSET 3;


-- FETCH query : top 3 employees that has the highest salary
SELECT * FROM employees ORDER BY emp_salary DESC FETCH FIRST 3 ROWS ONLY;

-- We can also use OFFSET along with FETCH clause : first 5 rows of information after excluding the top 3 rows
SELECT * FROM employees ORDER BY emp_salary DESC OFFSET 3 ROWS FETCH FIRST 5 ROWS ONLY;


-- LIKE clause : emp_name starts with A and following letters can be anything that's why %.
SELECT emp_name, emp_email FROM employees WHERE emp_name LIKE 'A%';

-- in the beginning the name can have any letters but should end by 's'
SELECT emp_name FROM employees WHERE emp_name LIKE '%s';

-- SUM function and ALIAS (AS)
SELECT SUM(emp_salary) AS total_salary FROM employees;
-- AVG function
SELECT AVG(emp_salary) AS avg_salary FROM employees;
-- MAX and MIN function
SELECT MAX(emp_salary) AS maximum_salary, MIN(emp_salary) AS minimum_salary FROM employees;
-- COUNT function
SELECT COUNT(DISTINCT emp_department) as total_dept FROM employees;


UPDATE employees
SET emp_email = 'Not Provided'
WHERE emp_email is NULL;

SELECT * FROM employees;


-- GROUP BY clause : which state has highest salary
SELECT emp_us_address, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_us_address
ORDER BY average_salary DESC;

-- GROUP BY clause: find maximum salary for male and female employees
SELECT emp_gender, MAX(emp_salary) AS max_salary_by_gender
FROM employees
GROUP BY emp_gender;

-- GROUP BY clause and COUNT function: find total number of employees from each country
SELECT emp_us_address, COUNT(emp_id)
FROM employees
GROUP BY emp_us_address;


-- HAVING clause: find the emp_us_address where the average salary is greater than $290,000
-- YOU CANNOT USE AGGREGATE FUNCTIONS(count(), min(), max(), sum(), avg()) ALONG WITH WHERE CLAUSE, that's where HAVING CLAUSE IS REQUIRED!
SELECT emp_us_address, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_us_address
HAVING AVG(emp_salary) > 290000;



-- CASE expression or statement (similar to IF-ELSE statement)
-- CASE statements are really useful when we need to create a new column based on some conditions from the existing table!
-- let's create a salary_range column
SELECT emp_department, emp_us_address, emp_salary,
CASE
WHEN emp_salary > 250000 AND emp_salary < 270000
THEN 'LOW SALARY 😕'
WHEN emp_salary > 270000 AND emp_salary < 290000
THEN 'MEDIUM SALARY 🙂'
WHEN emp_salary > 290000
THEN 'HIGH SALARY 😃'
END AS salary_range
FROM employees
ORDER BY emp_salary DESC;



-- SUB QUERIES or NESTED QUERIES
SELECT emp_name, emp_department, emp_us_address, emp_salary
FROM employees
WHERE emp_salary > (
	SELECT AVG(emp_salary) FROM employees
);