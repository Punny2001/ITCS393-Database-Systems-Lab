USE ICTTutorial;

/*SELECT Syntax*/
select * from student;

select StudentID, Firstname, Lastname, Email
from student;
go

/*Computed or Derived Attribute*/
select	StudentID,
		Firstname + ' ' + Lastname as [Name],
		Year(getdate())-Year(birthdate) as age,
		Email
from student;
go

select	BookID, BookName, Remaining,
		Remaining*Price as TotPrice
from bookstocking

/*Search Condition*/
select	Firstname+' '+lastname as [Name],
		[address]
from	Instructor
where CharIndex('Bangkae',[address]) > 0
go

DECLARE @MyAge INT;
SET @MyAge = 40;
select	Firstname+' '+lastname as [Name],
		Year(getdate())-Year(birthdate) as Age
From Instructor
where Year(getdate())-Year(birthdate) > @MyAge
go

/*Aggregation Functions*/
select count(studentID) as TotalStudent
from enrollcourse
where courseID='ICT01'

select AVG(year(getdate())-year(birthdate)) as avg_age
from student

select courseid, count(bookid) as Book4Course
from bookstocking
group by courseid

/*Sorting Function*/
select	Firstname + '' + Lastname as Fullname,
		StudentID
from student
Order by Lastname ASC

/*Join Operation*/
select i.Firstname, i.Lastname, c.coursename
from	instructor i Inner join course c
		on i.instructorID=c.instructorID

select C.Coursename, B.BookName, Remaining, Price
from Course C Left Join Bookstocking B
on C.courseID=B.CourseID