
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