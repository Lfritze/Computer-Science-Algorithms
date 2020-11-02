
 -- STRINGS

DECLARE @chrMyCharacters as char(10)

set @chrMyCharacters = 'hello'

SELECT @chrMyCharacters as salutation, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength

--------------------------------

DECLARE @chrMyCharacters as varchar(10)

set @chrMyCharacters = ''

SELECT @chrMyCharacters as salutation, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength

-- USE CHAR if you know the length of the char

DECLARE @chrMyCharacters as nchar(10)

set @chrMyCharacters = 'hello'

SELECT @chrMyCharacters as salutation, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength

--- SPECIAL SYMBOS b=use capital N

DECLARE @chrMyCharacters as nchar(10)

set @chrMyCharacters = N'helloפֿ'

SELECT @chrMyCharacters as salutation, len(@chrMyCharacters) as MyLength, DATALENGTH(@chrMyCharacters) as myDataLength

--Char ASCII - 1 byte per character
--varchar ASCII - 1 byte per character
--nchar, UNICODE 2 bytes per character
--nvarchar UNICODE 2 bytes per character
--A-Z, a-z, 0-9
--65  97  48 32
-- 0-255

--ASCII
--UNICODE


--- THESE RETURN NULL
DECLARE @mychar as int

SELECT @mychar + 2 as myCol

DECLARE @mydecimal decimal(5,2)
SELECT try_convert(decimal(5,2),1000)
SELECT try_cast(1000 as decimal(5,2))

--- JOINING 2 STRINGS

declare @firstname as nvarchar(20)
declare @middlename as nvarchar(20)
declare @lastname as nvarchar(20)

set @firstname = 'John'
set @middlename = 'Walker'
set @lastname = 'Smith'

select @firstname +' '+ @middlename +' '+ @lastname as FullName

-- Another thing to do if middlename is null

declare @firstname as nvarchar(20)
declare @middlename as nvarchar(20)
declare @lastname as nvarchar(20)

set @firstname = 'Sarah'
--set @middlename = 'Walker'
set @lastname = 'Milligan'

--select @firstname +' '+ @middlename +' '+ @lastname as FullName

select @firstname + iif(@middlename is null, '',' ' + @middlename) +' '+ @lastname as FullName


-- OR YOU CAN USE CONCAT
SELECT CONCAT(@firstname,' '+ @middlename, ' ', @lastname) as FullName

-- Join number to string 

SELECT 'My Number is ' + convert(varchar(20), 4567)
-- or
SELECT 'My Number is ' + cast(4567 as varchar(20))

-- CONVERT it to Currency

SELECT 'my salary is: $' + convert(varchar(20), 2345.60) -- works but not well
SELECT 'my salary is: ' + format(2345.60,'C') -- works best

-- PRACTICE 

--Add the letter A to the end of each name.

--Add the letter Ⱥ to the end of each name. (You may want to copy and paste this letter, as it is an A with a stroke through it). If you are getting question marks, then give it another try.

--Remove the first character from name.

--Remove the last original character from name.



--select [name] + 'A'
--from sys.all_columns

--select [name] + N'Ⱥ'
--from sys.all_columns

--select substring([name],2,len([name])-1) as [name]
--from sys.all_columns

--select substring([name],1,len([name])-1) as [name]
--from sys.all_columns