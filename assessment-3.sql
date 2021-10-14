-- Assessment 3
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number VARCHAR(10) NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL,
	graduation_year SMALLINT NOT NULL
)

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL
)

SELECT * FROM students
SELECT * FROM teachers

-- Should throw error as the email is mandatory
INSERT INTO students(first_name, last_name, homeroom_number,
				   phone,graduation_year)
VALUES('Mark', 'Watney', 5, '777-555-1234', 2035)

-- Throws error as email and phone number are not in the table
INSERT INTO teachers(first_name, last_name)
VALUES('Jonas', 'Salk', 'jsalk@school.org', '777-555-1234')


-- Fixing the issues now.
-- Making the mail optional on students table
ALTER TABLE students
ALTER COLUMN email DROP NOT NULL
-- Inserting data.
INSERT INTO students(first_name, last_name, homeroom_number,
				   phone,graduation_year)
VALUES('Mark', 'Watney', 5, '777-555-1234', 2035)
-- verification
SELECT * FROM students

-- Creating columns in teachers table with constraints.

ALTER TABLE teachers
ADD COLUMN email VARCHAR(50) UNIQUE,
ADD COLUMN phone VARCHAR(50) UNIQUE NOT NULL;

-- Inserting data after fixing it
INSERT INTO teachers(first_name, last_name, email, phone)
VALUES('Jonas', 'Salk', 'jsalk@school.org', '777-555-1234')
-- verification
SELECT * FROM teachers
