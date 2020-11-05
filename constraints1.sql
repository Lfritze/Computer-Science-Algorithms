-- NOte
INSERT INTO tblEmployee
SELECT NULL, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID, DateOfBirth, Department
FROM tblEmployee
--Result Error
-- Msg 515, Level 16, State 2, Line 26
-- Cannot insert the value NULL into column 'EmployeeNumber', table '70-461.dbo.tblEmployee'; column does not allow nulls. INSERT fails.
-- The statement has been terminated.

-- Completion time: 2020-11-04T18:53:27.7559394-05:00

--Yuu can inset data this way and another way as shown below
INSERT INTO tblEmployee
VALUES (2001, 'FirstName', 'M', 'LastName', 'AB123456C', '1994-01-01', 'Commerical')
INSERT INTO tblEmployee
VALUES (2002, 'AnotherFirstName', 'N', 'AnotherLastName', 'AB123457C', '1994-01-02', 'Finance')INSERT INTO tblEmployee
--AND THIS WAY
VALUES (2001, 'FirstName', 'M', 'LastName', 'AB123456C', '1994-01-01', 'Commerical'),
(2002, 'AnotherFirstName', 'N', 'AnotherLastName', 'AB123457C', '1994-01-02', 'Finance')

-- ADD CONSTRAINT
ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);
-- There are duplicates so not allowed , So let's find the duplicates by COUNT
ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);

-- We found th ID now lets searh it
SELECT * FROM tblEmployee WHERE EmployeeGovernmentID IN ('TX593671R')
--Result
-- 131	Jossef	H	Wright	TX593671R 	1971-12-24	Litigation
-- 131	Jossef	H	Wright	TX593671R 	1971-12-24	Litigation

-- Then I used this to get the following result
BEGIN TRAN

DELETE TOP(1) FROM tblEmployee
WHERE EmployeeNumber = 131

SELECT * FROM tblEmployee WHERE EmployeeGovernmentID IN ('TX593671R')
ROLLBACK TRAN
--RESULT 
-- 131	Jossef	H	Wright	TX593671R 	1971-12-24	Litigation

--NOTE THEN WE COMMIT TRAN ******

-- NOW WE CAN CREATE A UNIQUE INDEX AGAIN AND IT WILL NOW WORK
ALTER TABLE tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);

-- REMEMBER LIMIT OFFSET INSTEAD OF TOP FOR VANILLA SQL
SELECT expressions
FROM tables
[WHERE conditions]
[ORDER BY expression [ ASC | DESC ]]
LIMIT number_rows [ OFFSET offset_value ];



