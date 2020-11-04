-- B0th tables have a EmployeeNumber

SELECT * FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--Result Sample (Note: the first and last numners match because they are the EmployeeNumbers)
-- 658	Alvaro	NULL	Hasty	IR948599H 	1992-02-16	Litigation	-964.05	2015-05-26 00:00:00	658
-- 987	Alejandro	NULL	Bremer	MU303906C 	1968-02-13	HR	-105.23	2015-09-14 00:00:00	987
-- 695	Shannon	P.	Graham	LA316887N 	1992-08-04	Customer Relations	-506.80	2015-05-05 00:00:00	695

-- Note We used tblEmployee.EmployeeNumber becasue we get an ambiguous error bc this is in both tables
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, Amount 
FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
-- Result Sample
-- 658	Alvaro	Hasty	-964.05
-- 987	Alejandro	Bremer	-105.23
-- 695	Shannon	Graham	-506.80
-- 766	Brian	Evans	239.55
-- 629	Eric	Hillmann	672.19

-- NOte we used sum with an alias, this means we had to use GROUP BY
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
-- Result Sample
-- 123	Jane	Zwilling	596.42
-- 124	Carolyn	Zimmerman	-576.77
-- 125	Jane	Zabokritski	-693.26
-- 126	Ken	Yukish	118.30

--Same as above but I ORDER BY EmployeeNumber (we did not have to specify tblEmployee.EmployeeNumber with the ORDER BY bc it runs the SELCT then the ORDER BY)
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber
--REsult Sample
-- 123	Jane	Zwilling	596.42
-- 124	Carolyn	Zimmerman	-576.77
-- 125	Jane	Zabokritski	-693.26
-- 126	Ken	Yukish	118.30

-- 4 kinds of of JOINS
INNER, LEFT, RIGHT, CROSS

-- This fixes the infamous Missing EmployeeNumber 1046 with LEFT JOIN
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
FROM tblEmployee
left join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
ORDER BY EmployeeNumber
