-- GROUP BY statements

-- Aggregate Functions
SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;

SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 3) FROM film;  -- Default is 2
SELECT SUM(replacement_cost) FROM film;

-- Using GROUP BY
SELECT * FROM payment LIMIT 5;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id  -- This order doesn't matter. Select statement order is the key.
ORDER BY customer_id;


SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id, customer_id

SELECT * FROM payment LIMIT 5;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

-- challenges
-- Bonus to the staff with maximum transactions.
SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id;

--
SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC LIMIT 5;

-- Having clause

SELECT customer_id, SUM(amount) FROM payment
--WHERE customer_id NOT IN (184, 87, 477)
GROUP BY customer_id
HAVING SUM(amount) > 100

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300

-- challenges with HAVING clause
SELECT customer_id, COUNT(payment_date) FROM payment
GROUP BY customer_id
HAVING COUNT(payment_date) >= 40;

-- challenge 2
SELECT * FROM payment LIMIT 5;
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;













