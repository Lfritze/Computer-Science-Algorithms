-- THIS WILL HELP YOU REMEMBER THE QUERY ORDER (S F W GB H OB)
-- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY

select * from tblEmployee
where DateOfBirth between '19760101' and '19861231'

-- MOre ways
SELECT * FROM tblEmployee WHERE DateOfBirth >= '19760101' and DateOfBirth < '19861231'

-- More BUT DO NOT USE THIS METHOD!!!!  BECAUSE of SARGd
SELECT * FROM tblEmployee WHERE year(DateOfBirth) between 1976 and 1986

-- Get the YEAR datofbirth column only from table
SELECT year(DateOfBirth) FROM tblEmployee

-- title the column
SELECT year(DateOfBirth) as YearOfBirth FROM tblEmployee

-- Summarize it with COUNT to see how many born per year and GROUP BY year

SELECT year(DateOfBirth) as YearOfBirth, count(*) as NumberBorn 
FROM tblEmployee
GROUP BY year(DateOfBirth)

-- Select by specific year
SELECT * FROM tblEmployee WHERE year(dateofbirth) = 1967


-- NOTE you cannot use aliases in GROUPBY
-- by name 
SELECT year(DateOfBirth) as YearOfBirth, count(*) as NumberBorn 
FROM tblEmployee
WHERE EmployeeFirstName = 'john' 
GROUP BY year(DateOfBirth)
-- NOTE THIS actually calculates it like this
FROM tblEmployee
WHERE EmployeeFirstName = 'john' 
GROUP BY year(DateOfBirth)
SELECT year(DateOfBirth) as YearOfBirth, count(*) as NumberBorn 


-- IF i want it in a specific order ORDER BY
SELECT year(DateOfBirth) as YearOfBirth, count(*) as NumberBorn 
FROM tblEmployee
WHERE EmployeeFirstName = 'john' 
GROUP BY year(DateOfBirth)
ORDER BY year(DateOfBirth)

-- THis can be don with ASC and DESC - see below 
SELECT year(DateOfBirth) as YearOfBirth, count(*) as NumberBorn 
FROM tblEmployee
WHERE EmployeeFirstName = 'john' 
GROUP BY year(DateOfBirth)
ORDER BY year(DateOfBirth) DESC

-- THIS is how we select the first letter of EmployeeLastName
SELECT left(EmployeeLastName,1) as Initial FROM tblEmployee

-- THis is how we get the count of the query above
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
GROUP By left(EmployeeLastName,1)

-- Same thing then we order it by Initial
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
GROUP By left(EmployeeLastName,1)
ORDER BY left(EmployeeLastName,1)
-- Same thing then we order it by Count  (NOTE - it always goes by DESC unless you specify is ASC)
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
GROUP By left(EmployeeLastName,1)
ORDER BY count(*) ASC

-- SAME thing but SELECTING only the top 5 and using the DESC
SELECT top(5)left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
GROUP By left(EmployeeLastName,1)
ORDER BY count(*) DESC
-- REsult
-- B	123
-- M	111
-- C	108
-- H	90
-- K	68

-- What if we want rows with a specific amount -- We can use HAVING
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
GROUP By left(EmployeeLastName,1)
HAVING count(*) >=50
ORDER BY count(*) DESC
-- RESULT
-- B	123
-- M	111
-- C	108
-- H	90
-- K	68
-- L	59
-- A	57

-- What if we want rows with a specific amount & a spcific initial (WHERE left(EmployeeLastName,1) = 'B') -- We can use HAVING
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
WHERE left(EmployeeLastName,1) = 'B'
GROUP By left(EmployeeLastName,1)
HAVING count(*) >=50
ORDER BY count(*) DESC
--RESULT
-- B	123

-- SAME AS ABOVE
-- What if we want rows with a specific amount & Specific date of birth (WHERE DateOfBirth > '1975')-- We can use HAVING
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
WHERE DateOfBirth > '1975'
GROUP By left(EmployeeLastName,1)
HAVING count(*) >=50
ORDER BY count(*) DESC
-- RESULT
-- B	75
-- M	75
-- C	73
-- H	65
-- K	51

SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
WHERE DateOfBirth > '19781231'
GROUP By left(EmployeeLastName,1)
HAVING count(*) >=50
ORDER BY count(*) DESC
--RESULT
-- M	60
-- C	58
-- H	55
-- B	55

-- NOTE you can use the Alias in this ORDER BY CountOfInitial  (you cannot use it in GROUP BY)
SELECT left(EmployeeLastName,1) as Initial, count(*) as CountOfInitial 
FROM tblEmployee
WHERE DateOfBirth > '19781231'
GROUP By left(EmployeeLastName,1)
HAVING count(*) >=20
ORDER BY CountOfInitial  ASC   -- NOTE WE ARe USING AN ALIAS