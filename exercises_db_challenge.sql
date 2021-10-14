SELECT * FROM cd.facilities LIMIT 10

SELECT name, membercost FROM cd.facilities LIMIT 10

SELECT * FROM cd.facilities
WHERE membercost != 0

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost < monthlymaintenance / 50
AND membercost != 0

SELECT * FROM cd.facilities
WHERE name like '%Tennis%'

SELECT * FROM cd.facilities
WHERE facid IN (1, 5)

SELECT * FROM cd.members LIMIT 5

SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE EXTRACT(MONTH from joindate) > 8
AND EXTRACT(YEAR from joindate) >= 2012

SELECT DISTINCT surname from cd.members 
ORDER by surname ASC LIMIT 10

SELECT joindate from cd.members
ORDER BY memid DESC LIMIT 1

SELECT * FROM cd.facilities LIMIT 5

SELECT COUNT(name)
FROM cd.facilities
WHERE guestcost >= 10

SELECT * FROM cd.bookings LIMIT 5

SELECT facid, SUM(slots)
FROM cd.bookings
WHERE EXTRACT(MONTH from starttime) = 9
AND EXTRACT(YEAR from starttime) = 2012
GROUP BY facid ORDER BY SUM(slots)


SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid ASC


SELECT cd.bookings.starttime, cd.facilities.name
FROM cd.facilities 
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE TO_CHAR(starttime, 'YYYY-MM-DD') = '2012-09-21' 
AND cd.facilities.name IN ('Tennis Court 1', 'Tennis Court 2')
ORDER BY cd.bookings.starttime


SELECT starttime
FROM cd.bookings 
WHERE memid =
(SELECT memid FROM cd.members WHERE firstname = 'David'
AND surname = 'Farrell')



