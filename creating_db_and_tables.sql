-- We can only run this one time. As table already exists.
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)
-- creating supporting tables
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)
-- creating reference tables
CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP 
)

-- Inserting data
SELECT * FROM account
SELECT * FROM job
SELECT * FROM account_job

INSERT INTO account(username, password, email, created_on)
VALUES
('RRR', 'password', 'rrr@rrr.com', CURRENT_TIMESTAMP)

INSERT INTO job(job_name)
VALUES
('CEO')
INSERT INTO job(job_name)
-- Inserting another value.
VALUES
('CTO')
-- Adding data into other table
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP)
-- Simulating error to insert the user id which doesn't exist.
INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(10, 10, CURRENT_TIMESTAMP)

-- UPDATE
SELECT * FROM account

-- Dumb update
UPDATE account
SET last_login = CURRENT_TIMESTAMP

-- matching from other column
-- This will match the data exactly down to sub second.
-- Its just copy.
UPDATE account
SET last_login = created_on

-- Updated based of 2 tables
SELECT * FROM account_job
SELECT * FROM account
-- This exercise is for syntax purposes.
UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id

-- Using returning keyword
UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login

-- DELETE
SELECT * FROM job

INSERT INTO job(job_name)
VALUES
('Janitor')

DELETE FROM job
WHERE job_name = 'Janitor'
RETURNING job_id, job_name

-- ALTER
CREATE TABLE infomation(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) NOT NULL UNIQUE
)
SELECT * FROM infomation
-- renaming the table
ALTER TABLE infomation
RENAME TO new_info
-- new table
SELECT * FROM new_info
-- Renaming a column
ALTER TABLE new_info
RENAME COLUMN person TO people
-- Inserting data and sumilating the error of not-null constraint
INSERT INTO new_info(title)
VALUES ('some new title')
-- Alter the constraint
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL
-- Inserting data again
INSERT INTO new_info(title)
VALUES ('some new title')

SELECT * FROM new_info

-- DROP table
SELECT * FROM new_info
-- Dropping a column
ALTER TABLE new_info
DROP COLUMN people
-- Using If exists to avoid errors
ALTER TABLE new_info
DROP COLUMN IF EXISTS people

-- CHECK constraint
CREATE TABLE employees(SELECT * FROM employees
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

SELECT * FROM employees
-- Expecting to throw violation
INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES(
'RRR', 'RRRR', '1899-11-03', '2010-01-01', 100
)

-- This will go through
INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES(
'RRR', 'RRRR', '1990-11-03', '2010-01-01', 100
)

SELECT * FROM employees

-- new entry to fail constraint salary
INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES(
'SSS', 'SSSS', '1990-11-03', '2010-01-01', -100
)

INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES(
'SSS', 'SSSS', '1990-11-03', '2010-01-01', 100
)

SELECT * FROM employees

-- NOTE: the serial keeps an attempt to store the failed attempts
-- All failures will be skilled at the PK
