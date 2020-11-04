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