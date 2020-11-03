-- NOte this makes the empty strings to NULL using SET
Update tblEmployee
Set EmployeeMiddleName = NULL
Where EmployeeMiddleName = ''

-- If you want to see the date in english and not a number use DATENAME

-- THis puts it in order by month - we added Datepart in the GROUP BY
SELECT DATENAME(month, DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees
FROM tblEmployee
GROUP BY DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, DateOfBirth)

SELECT DATENAME(month, DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
COUNT(*)-COUNT(EmployeeMiddleName) as NoMiddleName
FROM tblEmployee
GROUP BY DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, DateOfBirth)
-- RESULT
-- January	90	58	32
-- February	80	50	30
-- March	109	74	35
-- April	86	54	32
-- May	79	56	23
-- June	80	64	16
-- July	77	53	24
-- August	77	54	23
-- September	74	50	24
-- October	73	48	25
-- November	93	60	33
-- December	88	57	31

-- SELECT DATENAME(month, DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
COUNT(*)-COUNT(EmployeeMiddleName) as NoMiddleName,
min(DateOfBirth) as EarliestDateOfBirth,
max(DateOfBirth) as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, DateOfBirth)
-- RESULT 
-- January	90	58	32	1967-01-06	1994-01-26
-- February	80	50	30	1966-02-04	1994-02-27
-- March	109	74	35	1966-03-01	1994-03-24
-- April	86	54	32	1966-04-18	1994-04-29
-- May	79	56	23	1966-05-08	1994-05-30
-- June	80	64	16	1966-06-09	1994-06-28
-- July	77	53	24	1966-07-04	1994-07-11
-- August	77	54	23	1966-08-19	1993-08-27
-- September	74	50	24	1966-09-25	1993-09-30
-- October	73	48	25	1966-10-01	1993-10-09
-- November	93	60	33	1965-11-07	1993-11-22
-- December	88	57	31	1965-12-02	1993-12-21


-- Let's use format for the date
SELECT DATENAME(month, DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
COUNT(*)-COUNT(EmployeeMiddleName) as NoMiddleName,
min(DateOfBirth) as EarliestDateOfBirth,
format(max(DateOfBirth), 'D') as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, DateOfBirth)
-- RESULT 
-- January	90	58	32	1967-01-06	Wednesday, January 26, 1994
-- February	80	50	30	1966-02-04	Sunday, February 27, 1994
-- March	109	74	35	1966-03-01	Thursday, March 24, 1994
-- April	86	54	32	1966-04-18	Friday, April 29, 1994
-- May	79	56	23	1966-05-08	Monday, May 30, 1994
-- June	80	64	16	1966-06-09	Tuesday, June 28, 1994
-- July	77	53	24	1966-07-04	Monday, July 11, 1994
-- August	77	54	23	1966-08-19	Friday, August 27, 1993
-- September	74	50	24	1966-09-25	Thursday, September 30, 1993
-- October	73	48	25	1966-10-01	Saturday, October 9, 1993
-- November	93	60	33	1965-11-07	Monday, November 22, 1993
-- December	88	57	31	1965-12-02	Tuesday, December 21, 1993

-- Here we also formated th min count
SELECT DATENAME(month, DateOfBirth) as MonthName, COUNT(*) as NumberOfEmployees,
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
COUNT(*)-COUNT(EmployeeMiddleName) as NoMiddleName,
format(min(DateOfBirth), 'yyyy-MM-dd') as EarliestDateOfBirth,
format(max(DateOfBirth), 'D') as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(month, DateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, DateOfBirth)
-- RESULT
-- January	90	58	32	1967-01-06	Wednesday, January 26, 1994
-- February	80	50	30	1966-02-04	Sunday, February 27, 1994
-- March	109	74	35	1966-03-01	Thursday, March 24, 1994
-- April	86	54	32	1966-04-18	Friday, April 29, 1994
-- May	79	56	23	1966-05-08	Monday, May 30, 1994
-- June	80	64	16	1966-06-09	Tuesday, June 28, 1994
-- July	77	53	24	1966-07-04	Monday, July 11, 1994
-- August	77	54	23	1966-08-19	Friday, August 27, 1993
-- September	74	50	24	1966-09-25	Thursday, September 30, 1993
-- October	73	48	25	1966-10-01	Saturday, October 9, 1993
-- November	93	60	33	1965-11-07	Monday, November 22, 1993
-- December	88	57	31	1965-12-02	Tuesday, December 21, 1993