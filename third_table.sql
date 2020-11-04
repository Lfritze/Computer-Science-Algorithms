-- Derived table (lives in the FROM class)
-- QUeries always start with the FROM statment 

SELECT Department
FROM
(SELECT Department, count(*) AS NumberOfDepartments
FROM tblEmployee
GROUP BY Department)
AS newTable

-- NOTE we started with this 
SELECT Department, count(*) AS NumberOfDepartments
FROM tblEmployee
GROUP BY Department
--Result
-- Litigation	235
-- Customer Relations	274
-- Commercial	248
-- HR	249

-- THen we implemented a derived table (same as first item at top of this page)
SELECT Department
FROM
(SELECT Department, count(*) AS NumberOfDepartments
FROM tblEmployee
GROUP BY Department)
AS newTable
--Result
-- Litigation
-- Customer Relations
-- Commercial
-- HR

-- IF I want to simply count the number of departments
SELECT count(Department) as Number of Departments
FROM
(SELECT Department, count(*) as NumberOfDepartments
from tblEmployee
GROUP BY Department)
AS newTable
--Result
-- 4

-- Another way to just get the department - much easier!
SELECT DISTINCT(Department)
FROM tblEmployee
-- Result 
-- Litigation
-- Customer Relations
-- Commercial
-- HR

-- Now we are just making a new table
SELECT DISTINCT Department, '' as DepartmentHead
INTO tblDepartment
FROM tblEmployee

-- tweaking things
DROP TABLE tblDepartment
--then do it again tweaked
SELECT DISTINCT Department, convert(varchar(20), N'') as DepartmentHead
INTO tblDepartment
FROM tblEmployee

--Tweaking things again
alter table tblDepartment
alter column DepartmentHead varchar(30) null
