CREATE TABLE tblEmployee
(
EmployeeNumber INT NOT NULL,
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) NULL,
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeGovernmentID CHAR(10) NULL,
DateOfBirth DATE NOT NULL
)

-- This is how we delete a table
DROP TABLE tblEmployee

-- Add a column
ALTER TABLE tblEmployee
ADD Department VARCHAR(10)

- queries
SELECT * FROM tblEmployee

---
ALTER TABLE tblEmployee
ADD Department VARCHAR(10);

SELECT * FROM tblEmployee

INSERT INTO tblEmployee
VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations')

ALTER TABLE tblEmployee
DROP COLUMN Department

ALTER TABLE tblEmployee
ADD Department VARCHAR(15)

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(20)

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(19)

SELECT LEN( 'Customer Relations')

INSERT INTO tblEmployee([EmployeeFirstName],[EmployeeMiddleName],
[EmployeeLastName],[EmployeeGovernmentID],[DateOfBirth],[Department],[EmployeeNumber])
VALUES ('Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation',131)

INSERT INTO tblEmployee
VALUES (1, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations'),
(2,'Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation')


------------------

SELECT * FROM tblEmployee

--INSERT INTO tblEmployee([EmployeeFirstName],[EmployeeMiddleName],
--[EmployeeLastName],[EmployeeGovernmentID],[DateOfBirth],[Department],[EmployeeNumber])
--VALUES ('Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation',131)

SELECT * FROM tblEmployee

-----
-- INSERT 2 Employees ata atime into the table 
INSERT INTO tblEmployee
VALUES (1, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations'),
(2,'Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation')

-----

SELECT * FROM tblEmployee WHERE [EmployeeLastName] = 'jones'

SELECT * FROM tblEmployee WHERE [EmployeeLastName] >= 'word'

-- NOTE: the % means and word that starts with 'w' and has as many letter after
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like 'w%'
-- Note - this means 'w' is the second letter in the name
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '_w%'
-- NOte this puts w at the end of the name
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '%w'
-- NOte this check if w is anywhere in the name
SELECT * FROM tblEmployee WHERE [EmployeeLastName] like '%w%'

-- % = 0-infinity characters
-- _ = 1 character
-- [A-G] = In the range A-G.
-- [AGQ] = A, G or Q.
-- [^AGQ] = NOT A, G or Q.


-- Note Nae starts with any letter between r through t
Select * from tblEmployee where [EmployeeLastName] like '[r-t]%'
-- NOTE ^ is the equivalent of NOT

-- Note Employee NUmber <= 200
select * from tblEmployee
where EmployeeNumber <= 200