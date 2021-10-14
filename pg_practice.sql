SELECT first_name,last_name FROM actor;
SELECT * FROM city;
SELECT first_name,last_name,email FROM customer;

SELECT * FROM film;
SELECT DISTINCT(release_year) from film;
SELECT DISTINCT(rental_rate) from film;

SELECT DISTINCT rating FROM film;

SELECT COUNT(DISTINCT title) FROM film;

SELECT amount FROM payment;
SELECT COUNT(DISTINCT(amount)) from PAYMENT;

SELECT * FROM customer;
SELECT * FROM customer
WHERE first_name = 'Jared';

SELECT * FROM film;

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating ='R';

SELECT COUNT(*) FROM film
WHERE rating = 'R' or rating = 'PG-13';

SELECT COUNT(*) FROM film
WHERE rating != 'R';


SELECT first_name, last_name, email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT title, description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC ,first_name ASC;

select * from payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5

SELECT * FROM payment LIMIT 1;

SELECT customer_id, amount, payment_date FROM payment
WHERE amount != 0.00
ORDER BY payment_date ASC
LIMIT 10

SELECT COUNT(title) FROM film 
WHERE length <= 50;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' and '2007-02-15'

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99)

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie')


SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name ILIKE 's%'

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name







