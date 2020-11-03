-- B0th tables have a EmployeeNumber

SELECT * FROM tblEmployee
join tblTransaction 
ON tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
--Result Sample (Note: the first and last numners match because they are the EmployeeNumbers)
-- 658	Alvaro	NULL	Hasty	IR948599H 	1992-02-16	Litigation	-964.05	2015-05-26 00:00:00	658
-- 987	Alejandro	NULL	Bremer	MU303906C 	1968-02-13	HR	-105.23	2015-09-14 00:00:00	987
-- 695	Shannon	P.	Graham	LA316887N 	1992-08-04	Customer Relations	-506.80	2015-05-05 00:00:00	695
-- 766	Brian	NULL	Evans	PG830721K 	1985-03-31	Customer Relations	239.55	2014-12-24 00:00:00	766
-- 629	Eric	E.	Hillmann	ET122970C 	1994-03-22	Customer Relations	672.19	2015-10-31 00:00:00	629
-- 864	Diane	F.	Con	BK954018M 	1989-06-04	Commercial	282.36	2014-11-15 00:00:00	864
-- 804	Ronald	K.	Drury	HQ138639E 	1980-01-01	HR	72.03	2015-10-07 00:00:00	804