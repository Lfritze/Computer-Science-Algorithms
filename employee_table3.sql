-- NOte this makes the empty strings to NULL using SET
Update tblEmployee
Set EmployeeMiddleName = NULL
Where EmployeeMiddleName = ''