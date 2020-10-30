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