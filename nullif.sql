-- NULLIF
-- Takes 2 inputs and return NULL if both are equal
-- Otherwise returns the first argument passed.
SELECT NULLIF(10, 10)  -- null
SELECT NULLIF(12, 10)  -- 12

-- Creating a sample table
CREATE TABLE depts(
	first_name VARCHAR(50),
	department VARCHAR(50)
)

-- Insert data
INSERT INTO depts(
	first_name,
	department
)
VALUES
	('Vinton','A'),
	('Lauren','A'),
	('Claire','B');

-- Verify
SELECT * FROM depts

-- Doing math, total A / total B
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts

-- Removing items from department B. Now B is 0
DELETE FROM depts
WHERE department = 'B'

-- Verify
SELECT * FROM depts

-- Observe the error. Divison by zero, as B is 0 now.
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts

-- Using NULLIF

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END) /
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0)) 
AS department_ratio
FROM depts





