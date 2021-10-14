SELECT * FROM customer

-- Using general case statements to segregate the customers.
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premuim'
	WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class  -- allows us to rename to column
FROM customer

-- Using case expression

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second Place'
	ELSE 'Normal'
END AS raffle_results
FROM customer

-- Can be done using group by but working with case expressions.
SELECT * FROM film
SELECT
SUM(CASE rental_rate 
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
   WHEN 2.99 THEN 1
   ELSE 0
 END) AS regular,
SUM(CASE rental_rate
   WHEN 4.99 THEN 1
   ELSE 0
 END) AS premium
FROM film

-- CASE challenge using case expression
SELECT
SUM(CASE rating 
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
   WHEN 'PG' THEN 1
   ELSE 0
 END) AS pg,
SUM(CASE rating
   WHEN 'PG-13' THEN 1
   ELSE 0
 END) AS pg13
FROM film


-- COALESCE
-- Returns the first non-null value. 
-- If all are null, then it will return null
/* Sample table
Item  |  Price  | Discount
--------------------------
A         100      20
B         300      null
C         200      10

-- Imagine if you want to see the final price..
SELECT item, (price - discount) AS final
FROM TABLE

Item | final
------------
A       80
B       null
C       190
-- We can fix the problem of null here with COALESCE
SELECT item,(price - COALESCE(discount,0))
AS final FROM table

Item  |  final
--------------
A        80
B        300
C        190

-- Most practical example in real world!
*/

-- CAST
-- Converts data from one type to another.
-- Not as extensive as Python, but should be reasonable.
-- '5' to 5 but not 'five' to 5
/*
Syntax for CAST function
SELECT CAST('5' AS INTEGER)

PostgreSQL CAST operator
SELECT '5'::INTEGER

We won't use this on a single cell, instead we will use this
on a column name
SELECT CAST(date AS TIMESTAMP)
FROM table
*/

SELECT CAST('5' AS INTEGER) as new_int

-- Will return error. Unreasonable
SELECT CAST('five' AS INTEGER)

-- Exclusive to postgres
SELECT '5'::INTEGER AS new_int

-- Realworld example
-- Counting number of digits
SELECT CHAR_LENGTH(CAST(inventory_id as VARCHAR)) 
FROM rental


-- NULLIF
-- Takes 2 inputs and return NULL if both are equal
-- Otherwise returns the first argument passed.
SELECT NULLIF(10, 10)  -- null
SELECT NULLIF(12, 10)  -- 12





