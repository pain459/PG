-- Advanced SQL Commands
-- Mostly timestamps
SHOW ALL  -- show all the commands available
SHOW TIMEZONE  -- show timezone your computer is working in.
SELECT NOW()  -- Current time with timestamp and timezone inf.
SELECT TIMEOFDAY()  -- as a string
SELECT CURRENT_TIME  -- just time
SELECT CURRENT_DATE  -- just current date
-- We will now extract the information from extract(), age(), to_char()
-- EXTRACT()
SELECT EXTRACT(YEAR FROM payment_date) AS myyear
FROM payment

SELECT EXTRACT(MONTH FROM payment_date) AS myyear
FROM payment

SELECT DISTINCT(EXTRACT(QUARTER FROM payment_date)) AS myyear
FROM payment
-- AGE()
SELECT AGE(payment_date)
FROM payment
-- TO_CHAR
SELECT TO_CHAR(payment_date,'MONTH-YYYY')
FROM payment

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH YYYY'))
FROM payment

SELECT TO_CHAR(payment_date,'mon/dd/YYYY')
FROM payment

SELECT TO_CHAR(payment_date,'MM/dd/YYYY')
FROM payment

-- TO_CHAR documentation here 
-- https://www.postgresql.org/docs/12/functions-formatting.html
-- Challenge tasks
SELECT * FROM payment LIMIT 10;
SELECT DISTINCT(TO_CHAR(payment.payment_date, 'MONTH')) 
FROM payment;
-- Solution 1 to get payments happened on monday
SELECT COUNT(payment_id)
FROM payment
WHERE (trim(TO_CHAR(payment.payment_date, 'DAY')) = 'MONDAY')
-- Solution 2 to do the same.
SELECT COUNT(payment_id)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1


-- Mathematical functions.
-- https://www.postgresql.org/docs/9.5/functions-math.html
SELECT * FROM film LIMIT 10

SELECT ROUND(rental_rate / replacement_cost, 4) * 100 AS percent_cost
FROM film LIMIT 10

SELECT 0.1 * replacement_cost AS deposit
FROM film LIMIT 10

-- String functions and operations
-- https://www.postgresql.org/docs/9.1/functions-string.html
SELECT * FROM customer LIMIT 10

SELECT LENGTH(first_name) from customer LIMIT 10
SELECT upper(first_name) ||' '|| upper(last_name) AS customer_name
from customer LIMIT 10

SELECT lower(left(first_name,1)) || lower(last_name) || '@gmail.com' 
AS email_id
FROM customer LIMIT 10;

-- SUB QUERY
SELECT * FROM film LIMIT 10;
-- Calculating the movie rents greater than average rent.
SELECT title, rental_rate
FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) FROM film);

-- Task is to get the list of movies titles returned during
-- specific period
SELECT * FROM rental LIMIT 10
SELECT * FROM inventory LIMIT 10

-- inner join to carve out the list of titles returned
SELECT inventory.film_id 
FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30'

-- Using the above as subquery
SELECT film_id, title FROM film
WHERE film_id IN 
(SELECT inventory.film_id 
FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id

-- Exists operator
-- Find customers who had one payment greater than $11. Need first_name and last_name
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS -- NOT EXISTS is a way to see this in reverse
(SELECT * FROM payment AS p
WHERE p.customer_id = c.customer_id
AND amount > 11)

-- Self Join
-- All details on the same table
/*
Syntax for self join 
SELECT tableA.col, tableB.col
FROM table AS tableA
JOIN table AS tableB ON
tableA.some_col = tableB.other_col
*/
-- Exercise: Find all the films of same length
SELECT * FROM film LIMIT 10
SELECT title, length FROM film LIMIT 10


SELECT f1.title, f2.title, f1.length 
--SELECT *
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length

--SELECT f1.title, f2.title, f1.length 

SELECT * FROM film LIMIT 10
SELECT title, length FROM film LIMIT 10


SELECT f1.title, f2.title, f2.length
FROM film as f1
INNER JOIN film as f2 ON
f1.length = f2.length AND
f1.title != f2.title















































