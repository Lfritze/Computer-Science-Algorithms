-- Joining 3 tables (tblDepartment, tblEmployee, tblTransaction)
SELECT *
FROM tblDepartment
LEFT JOIN tblEmployee
ON tblDepartment.Department = tblEmployee.Department
LEFT JOIN tblTransaction
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber

-- Joining 3 table witht the sum of Amount column per department
SELECT tblDepartment.Department, SUM(Amount) as SumOfAmount 
FROM tblDepartment
LEFT JOIN tblEmployee
ON tblDepartment.Department = tblEmployee.Department
LEFT JOIN tblTransaction
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblDepartment.Department
--RESULT
-- Litigation	-7838.31
-- Customer Relations	28745.85
-- Commercial	9505.96
-- HR	18336.61

-- We can also use aliases
SELECT D.DepartmentHead, SUM(T.Amount) as Sum_of_Amount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.DepartmentHead
ORDER by D.DepartmentHead

-- Here is a LEFT JOIN with Aliases
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, 
tblTransaction.EmployeeNumber, SUM(tblTransaction.Amount) AS TotalAmount
FROM tblEmployee
LEFT JOIN tblTransaction
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber, tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
ORDER BY tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber, tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
--Result sample
-- Jane	123	Zwilling	123	596.42
-- Carolyn	124	Zimmerman	124	-576.77
-- Jane	125	Zabokritski	125	-693.26
-- Ken	126	Yukish	126	118.30

-- ANother thing with a WHERE clause
SELECT tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, 
tblTransaction.EmployeeNumber, SUM(tblTransaction.Amount) AS TotalAmount
FROM tblEmployee
LEFT JOIN tblTransaction
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
WHERE tblTransaction.EmployeeNumber IS NULL
GROUP BY tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber, tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
ORDER BY tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber, tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
-- RESULT SAMPLE
-- 130	Gail	Wu	NULL	NULL
-- 135	Michael	Williams	NULL	NULL
-- 136	Ovidiu	Welcker	NULL	NULL

-- FOR DERIVED TABLES YOU CANNOT USER ORDER BY in the SOFT BRACKETS
-- DERIVED TABLE 

SELECT *
FROM (
SELECT tblEmployee.EmployeeNumber as Enumber, EmployeeFirstName, EmployeeLastName, 
tblTransaction.EmployeeNumber as TNumber, SUM(tblTransaction.Amount) AS TotalAmount
FROM tblEmployee
LEFT JOIN tblTransaction
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
GROUP BY tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber, tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
)
AS newTable
WHERE TNumber IS NULL
ORDER BY ENumber, EmployeeFirstName, EmployeeLastName
-- Sample Result
-- 130	Gail	Wu	NULL	NULL
-- 135	Michael	Williams	NULL	NULL
-- 136	Ovidiu	Welcker	NULL	NULL
-- 152	Jo	Trenary	NULL	NULL
-- 159	Suchitra	Sunkammurali	NULL	NULL


-- MOre NOtes 

begin transaction

SELECT COUNT(*) FROM tblTransaction

DELETE tblTransaction
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber IS NULL
SELECT COUNT(*) FROM tblTransaction

rollback transaction

-- NOTE: SELECT does not belong in a delete transaction


-- More notes using TRAN
BEGIN TRAN
UPDATE tblEmployee
SET DateOfBirth = '2101-01-01'
WHERE EmployeeNumber = 537
select * from tblEmployee ORDER BY DateOfBirth DESC
ROLLBACK TRAN

BEGIN TRAN
UPDATE tblEmployee
SET EmployeeGovernmentID = 'aaaa'
WHERE EmployeeNumber BETWEEN 530 AND 539
select * from tblEmployee ORDER BY EmployeeGovernmentID ASC
ROLLBACK TRAN