-- VIEWS

SELECT * FROM customer
SELECT * FROM address

-- Example most used view
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

-- Creating a view
CREATE VIEW customer_info AS 
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

-- Updating by adding a column
CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

-- Renaming view
ALTER VIEW customer_info RENAME TO c_info
-- Doesn't exist
SELECT * FROM customer_info
-- Renamed view
SELECT * FROM c_info

-- Removing a view
DROP VIEW IF EXISTS c_info
-- Returns the error.
SELECT * FROM c_info









