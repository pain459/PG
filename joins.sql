-- JOINS
-- AS statement examples

SELECT * FROM payment LIMIT 5

SELECT customer_id AS valuable_customer, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 3

-- INNER JOIN
SELECT * FROM payment LIMIT 5
SELECT * FROM customer LIMIT 5

SELECT customer.customer_id, customer.first_name, customer.last_name  
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
LIMIT 10

-- Example 1
-- Send a report to users as email with their expense.
SELECT * FROM customer LIMIT 5;
SELECT * FROM payment LIMIT 5;

SELECT customer.email, SUM(payment.amount) FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id 
GROUP BY customer.email
HAVING SUM(payment.amount) BETWEEN 100.00 AND 200.00
ORDER BY SUM(payment.amount) DESC LIMIT 5

-- Outer Joins
SELECT * FROM payment LIMIT 5;
SELECT * FROM customer LIMIT 5;

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null 
OR payment.payment_id IS null
LIMIT 10

-- confirmation
SELECT COUNT(DISTINCT customer_id) FROM payment
SELECT COUNT(DISTINCT customer_id) FROM customer

SELECT payment.customer_id, customer.customer_id
FROM payment
FULL OUTER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.customer_id IS null
OR customer.customer_id IS null


-- LEFT OUTER JOIN
-- will not return anyting exclusive to table B.
SELECT * FROM film LIMIT 10
SELECT * FROM inventory LIMIT 10

SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
LEFT OUTER JOIN inventory
--ON inventory.film_id = film.film_id
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null

SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null


SELECT *
FROM film
LEFT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null


-- RIGHT JOINS
-- Expecting not to give any output.
SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM inventory
LEFT OUTER JOIN film
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null

-- Expecting no output
SELECT film.film_id, film.title, inventory.inventory_id, inventory.store_id
FROM film
RIGHT OUTER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null

-- UNION
-- essentially pasting one on the other.
-- syntax
-- SELECT * FROM table1
-- UNION
-- SELECT * FROM table2

-- JOIN Challenges
SELECT * FROM address WHERE district LIKE '%alifornia'  -- can be used for address

SELECT * FROM customer LIMIT 5  -- we can use this for email
SELECT * FROM address LIMIT 5  -- for district california
-- Both are connected via address_id

SELECT address.district, customer.email
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California'

-- Challenge 2

SELECT * FROM actor 
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'
-- actor id 2
SELECT * FROM film LIMIT 5
SELECT * FROM film_actor LIMIT 5
-- we will apply some join in film_id

SELECT film.title, actor.first_name, actor.last_name 
FROM film
LEFT OUTER JOIN film_actor
ON film.film_id = film_actor.film_id
LEFT OUTER JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' 
AND last_name = 'Wahlberg';




































