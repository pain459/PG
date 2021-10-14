-- Assessment test 1
SELECT * FROM payment LIMIT 5

SELECT customer_id FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

SELECT * FROM film LIMIT 5

SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';

SELECT * FROM customer LIMIT 5

SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC LIMIT 1;