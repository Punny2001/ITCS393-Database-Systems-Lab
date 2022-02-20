use AdventureWorks2014;
/*  Student Name: Krissanapong Palakham		ID: 6288102*/

/*  	Q1 Write a query that returns BusinessEntityID, LastName ,
   	 NationalIDNumber, and JobTitle of all Person.
	[Table: Person, Employee]
 */
-- Your Solution is here!
select e.BusinessEntityID, p.LastName, e.NationalIDNumber, e.JobTitle
from HumanResources.Employee e
inner join Person.Person p
on e.BusinessEntityID = p.BusinessEntityID


/*	Q2 Write a query that returns FirstName, LastName and 
	CreditCardID of Person who have credit cards. 
	[Table: Person, PersonCreditCard]	
*/
-- Your Solution is here!
select p.Firstname, p.Lastname, c.CreditCardID
from Person.Person p
right join Sales.PersonCreditCard c
on p.BusinessEntityID = c.BusinessEntityID



/*	Q3 Write a query that returns Name, LogInID and DepartmentName 
	of Employee who were assigned the department and  loginID.
     [Table: Person, Employee, Department, EmployeeDepartmentHistory]
	*/
-- Your Solution is here! 
select (p.FirstName+' '+p.LastName) as "Name", e.LoginID, d.Name
from Person.Person p
inner join HumanResources.Employee e on p.BusinessEntityID = e.BusinessEntityID
inner join HumanResources.EmployeeDepartmentHistory edh on p.BusinessEntityID = edh.BusinessEntityID
inner join HumanResources.Department d on edh.DepartmentID = d.DepartmentID
where e.LoginID is not NULL


/*	Q4 Write a query that returns one column called Result and 
	contains the last name of the employee with NationalIDNumber 112457891.
    [Table: Person, Employee]
*/ 
-- Your Solution is here!
 select CONCAT (p.LastName, e.NationalIDNumber) as Result
 from Person.Person p
 inner join HumanResources.Employee e 
 on p.BusinessEntityID = e.BusinessEntityID
 where e.NationalIDNumber = '112457891'