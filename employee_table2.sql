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