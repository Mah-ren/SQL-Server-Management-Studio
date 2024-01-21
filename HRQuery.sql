use hr
select totalEmployees = Count(MonthlySalary),
AverageSalaryOfAll = Avg(MonthlySalary),
x = Min(MonthlySalary),
b = Max(MonthlySalary)
from Employees;

select AverageSalaryOfDepartment1 = Avg(MonthlySalary) from Employees
where DepartmentID = 1;


select AverageSalaryOfDepartment12 = Avg(MonthlySalary) from Employees
where DepartmentID in (1,2);

select AverageSalaryOfDepartment23 = Avg(MonthlySalary) from Employees
where DepartmentID in (2,3);

select EXITDATE9 = Count(ExitDate) from Employees;

select * from Employees;
--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
select DepartmentID,
		TotalSalary = Count(MonthlySalary),
		Average = Avg(MonthlySalary),
		MinSalary = Min(MonthlySalary),
		MaxSalary = Max(MonthlySalary)
		from Employees
		Group By DepartmentID
		having MonthlySalary > 100
		order by DepartmentID desc;

		
select CountryID,
		TotalSalary = Count(MonthlySalary),
		AverageSalary = Avg(MonthlySalary),
		MinSalary = Min(MonthlySalary),
		MaxSalary = Max(MonthlySalary)
		from Employees
		Group By CountryID
		order by CountryID asc;

-- long way to use where with Group by, by creating new query and after that you write where :-)
select * from 
(
	select CountryID,
		TotalSalary = Count(MonthlySalary),
		AverageSalary = Avg(MonthlySalary),
		MinSalary = Min(MonthlySalary),
		MaxSalary = Max(MonthlySalary)
		from Employees
		Group By CountryID
	
) VirtualQuery
where VirtualQuery.TotalSalary > 100

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
--like statment
select FirstName, LastName from Employees
where FirstName like 'a%' and LastName like 'a%';

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
--like statment
select FirstName, LastName from Employees
where FirstName like '%a' and LastName like '%a';

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
--like statment firstName starts with 'a' and ends with 'a'
select FirstName, LastName from Employees
where FirstName like 'a%a' ;

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111

select FirstName from Employees
where FirstName like 'a________%' or FirstName like 'b_%';

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111

select * from Employees;

select  FirstName, LastName from Employees
where FirstName like 'Moh%' ;

insert into Employees
values
('Mohammad', 'Abu-Hadhoud', 'M', '2003-11-29', 1, 4, '2024-01-17', NULL, 5000, 0.3);

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
select FirstName, LastName from Employees
where FirstName = 'Mohammed' or FirstName = 'Mohammad';

--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
select ID, FirstName, LastName, MonthlySalary from Employees
where FirstName like 'Mohamm[ae]d'
--11111111111111111111111111111111111111111111111111111111111111111111111111111111111
select ID, FirstName, LastName, MonthlySalary from Employees
where FirstName like 'x%' or FirstName like 'z%';
--the same output but by short way
select ID, FirstName, LastName, MonthlySalary from Employees
where FirstName like '[xz]%' ;

-- search for the names that starts with letters from a to m
select ID, FirstName, LastName, MonthlySalary from Employees
where FirstName like '[a-m]%' 
order by MonthlySalary desc;


--creating View of all not resigned employees
create view ActiveEmployees as 
select * from Employees
where ExitDate is null;

select * from ActiveEmployees

--creating View of all resigned employees
create view ResignedEmployees as 
select * from Employees
where ExitDate is not null

select * from ResignedEmployees

--creating View of FirstName, LastName, and Gender of all employees
create view SimpleTableOfEmployees as 
select FirstName, LastName, Gendor from Employees

select * from SimpleTableOfEmployees 

--creating View of FirstName, LastName, and Gender of all employees
create view FirstAndLastNameAndMaleEmployees as 
select FirstName, LastName, Gendor from Employees
where Gendor in ('M', 'm');

select * from FirstAndLastNameAndMaleEmployees

select * from Departments
union
select * from Departments

-- Exists !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select * from Customers C1
where
	exists
	(
		select * from Orders
		where customerID = C1.CustomerID and Amount < 600
	)
--developed Exit  
select * from Customers C1
where
	exists
	(
		select top 1 * from Orders
		where customerID = C1.CustomerID and Amount < 600
	)
	
--more develped Exit

select * from Customers C1
where
	exists
	(				-- write anything here 
		select top 1 R = 1 from Orders
		where customerID = C1.CustomerID and Amount < 600
	)
	
select * from ResignedEmployees	
select * from ActiveEmployees
	
select * from SimpleTableOfEmployees


--Union get the distinct data = without dublication of data
select * from ActiveEmployees
union 
select * from ResignedEmployees


--Union All get the data = withdublication of data
select * from ActiveEmployees
union All
select * from ResignedEmployees


-- Case   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select FirstName, LastName, GendorTitle = 
Case 
	when Gendor = 'M' then 'ÐßÑ'
	when Gendor = 'F' then 'ÃäËì'
	else 'ãÔ ÚÇÑÝ'
End
from SimpleTableOfEmployees

select FirstName, LastName, 'ÊÇÑíÎ Úãáå' = 
Case 
	when ExitDate is Null then 'ÔÛÇá'
	when ExitDate is not null then 'ãÕÝí'
	else 'ãÔ ÚÇÑÝ'
End
from Employees


select FirstName, LastName, Gendor, MonthlySalary,
'ÇáÑÇÊÈ ÇáÌÏíÏ' =
case 
	when Gendor = 'M' then MonthlySalary * 1.1
	when Gendor = 'F'then MonthlySalary * 1.15
	else MonthlySalary * 1
End
from Employees

select * from Employees