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

DECLARE @myvar AS numeric(7,2) = 3.7

SELECT POWER(@myvar,3) as myPower
SELECT SQUARE(@myvar) as mySquare
SELECT FLOOR(@myvar) as myFloor
SELECT CEILING(@myvar) as myCeiling
SELECT ROUND(@myvar, 1) as myRound
GO

SELECT PI() as myPi
SELECT EXP(1) as myExp

DECLARE @myvar AS numeric(7,2) = 456
SELECT ABS(@myVar) as myABS, SIGN(@myVar) as mySIgn
GO
SELECT RAND(9765)

-- Converting between data types

SELECT @myvar

-- EXPLICIT

SELECT CONVERT(decimal(5,2),3)/2
SELECT CAST(3 as decimal(5,2))/2

--SELECT Convert(decimal(5,2),1000)

SELECT 3.0 / 2
SELECT 3 /2

SELECT 12.345+12.7
SELECT convert(int,12.345) + convert(int,12.7)
SELECT convert(int,12.345+12.7)
