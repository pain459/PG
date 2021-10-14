SELECT COUNT(amount) FROM payment
WHERE amount > 5.00;

SELECT COUNT(first_name) FROM actor 
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district)) FROM address;

SELECT DISTINCT(district) FROM address;

-- THis is my statement
SELECT COUNT(title) FROM film 
WHERE replacement_cost BETWEEN 5 AND 15
AND rating = 'R'

-- This is the actual solution
SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 and 15;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';