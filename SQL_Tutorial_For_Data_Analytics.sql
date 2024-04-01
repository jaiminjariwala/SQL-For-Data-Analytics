-- create payment table
CREATE TABLE payment
(
	customer_id int8 PRIMARY KEY,
	amount numeric,
	mode varchar(50),
	payment_date date
)

-- Looking up the payment table, before importing csv...
SELECT * FROM payment

-- Import the csv file into this payment table
/*

In Mac, do following steps...
--> open " /tmp " from terminal
--> " /tmp " folder opens in finder
--> Manually copy .csv data file to " /tmp "
--> Run below command from query tool... 
--> COPY tableName FROM '/private/tmp/employee.csv' DELIMITER ',' CSV HEADER;

*/
COPY payment(customer_id, amount, mode, payment_date)
FROM '/private/tmp/payment.csv'
DELIMITER ','
CSV HEADER;

-- After Importing the csv into table, looking at table...
SELECT * FROM payment

-- create customer table
CREATE TABLE customer
(
	customer_id int8 PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100),
	address_id numeric
)

-- Looking up the customer table, before importing csv file
SELECT * FROM customer

-- Import the csv file into this customer table
COPY customer(customer_id, first_name, last_name, email, address_id)
FROM '/private/tmp/customer.csv'
DELIMITER ','
CSV HEADER;

-- Again looking at customer table, after importing csv...
SELECT * FROM customer

-- performing the groupby clause
SELECT mode AS Mode_Of_Payment, SUM(amount) AS Total FROM payment
GROUP BY Mode_Of_Payment
ORDER BY Total DESC

/*
	Use of GROUP BY clause, HAVING clause, ORDER BY clause,
	WHERE clause altogether.
*/
SELECT mode AS MODE_OF_PAYMENT, COUNT(amount) AS TOTAL From payment
WHERE customer_id <= 10
GROUP BY mode
HAVING COUNT(amount) >= 2 AND COUNT(amount) < 4
ORDER BY TOTAL DESC
LIMIT 4;

/* About TIMESTAMP data type and their commands */

-- Check TimeZone
SHOW TIMEZONE;

-- Get Current Date and Time
SELECT NOW();

-- Get Current Time Only
SELECT TIMEOFDAY();

-- Get Current Time (alternate)
SELECT CURRENT_TIME;

-- Get Current Date only
SELECT CURRENT_DATE;



/* About EXTRACT methods */
SELECT EXTRACT(MONTH FROM payment_date) AS payment_month, payment_date
FROM payment

-- Learning JOINS through customer and payment table
-- 1. Through INNER JOIN
/*
Syntax:

SELECT column_name(s)
FROM TableA
INNER JOIN TableB
ON TableA.col_name = TableB.col_name

Note: ' col_name ' must be same at ' TableA.col_name = TableB.col_name '
*/
SELECT c.first_name, p.amount, p.mode
from customer AS c
INNER JOIN payment AS p		-- SAME syntax for "LEFT", "RIGHT", "FULL OUTER" JOIN(s).
ON c.customer_id = p.customer_id
ORDER BY c DESC
LIMIT 5;

/*
About Sub Query: A Sub Query or Inner Query or Nested Query allows us to create
				 complex query on the output of another query.
				 Sub Query Syntax involves 2 SELECT statements.

Syntax: SELECT column_name(s)
		FROM table_name
		WHERE column_name operator
			(SELECT column_name FROM table_name WHERE operator)
*/
SELECT * FROM payment



/* 
Find the details of customers, whose payment amount is more than the average
of total amount paid by all customers.
*/
SELECT * FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment) -- this query is called sub-query


-- Studying CASE Statement
SELECT customer_id, amount,
CASE
	WHEN amount > 60 THEN 'EXPENSIVE PRODUCT'
	WHEN amount = 60 THEN 'MODERATE PRODUCT'
	ELSE 'INEXPENSIVE PRODUCT'
END AS Product_Status
FROM payment

-- Studying CASE EXPRESSION Statement
SELECT customer_id,
CASE amount		-- here amount is our expression
	WHEN 90 THEN 'Prime Customer'
	WHEN 70 THEN 'Plue Customer'
	ELSE 'Regular Customer'
END AS Customer_Status
From payment