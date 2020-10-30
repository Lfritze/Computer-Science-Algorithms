-- This makes a column name 'Result' semicolons are optional
SELECT 1 + 1 AS Result; 

-- GO interrups the batch
SELECT 1 + 1 AS Result;
GO
SELECT 1 * 1 AS Result;

use [70-461]
-- ______________________

CREATE TABLE tblSecond
(myNumbers int)

INSERT INTO tblSecond
VALUES (234)

INSERT INTO tblSecond VALUES (8),(13),(19)

SELECT myNumbers FROM tblSecond

SELECT * from tblFirst;
SELECT * FROM tblSecond;

SELECT myColumn FROM tblFirst
SELECT myNumbers FROM tblSecond

SELECT * FROM tblSecond
TRUNCATE TABLE tblSecond
SELECT * FROM tblSecond

SELECT * FROM tblFirst
TRUNCATE TABLE tblFirst
DROP TABLE tblFirst


DELETE FROM tblFirst

-- _---------------------------------

CREATE TABLE tblPrimeNumbers
(intField int)




DECLARE @myvar AS int = 2

-- or we can Do

DECLARE @myvar AS int
SET @myvar = 2

-- I like it like this
DECLARE @myvar AS int = 2
SELECT @myvar  AS myVariable


-- another thing with this
DECLARE @myvar AS int = 2

SET @myvar = @myvar + 9

SELECT @myvar  AS myVariable  -- it will be 11

-- to save memory 
DECLARE @myvar AS tinyint = 2

SET @myvar = @myvar + 9

SELECT @myvar  AS myVariable

-- NOTE  tinyint doesnt go to negative numbers

------------------------------------------------------------------------------
DECLARE @myvar AS numeric(7,2)

-- 12345.67 is valid for the above 
-- 123456.7 is not valid  - 2 digits must go after the decimal

SET @myvar = 12345.67

SELECT @myvar AS myVariable

GO

DECLARE @myvar AS numeric(7)

SET @myvar = 12345.67

SELECT @myvar AS myVariable
-- ________________________________________________----

DECLARE @myvar AS smallmoney = 123456.7891
SELECT @myvar as myVaraible

-- _______________________________________________---

DECLARE @myvar AS float(24) = 123456.7891
SELECT @myvar as myvaraible

-- _______________________________________________---

-- MATH

DECLARE @myvar AS numeric(7,2) = 3

SELECT POWER(@myvar,2)
