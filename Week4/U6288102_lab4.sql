USE ICTTutorial;

/* Q1 */
Select count(*) as Who_Live_in_BKK
From Student
Where Address in ('Bangkok')

/* Q2 */
Select count(*) as Summer_child
From Student
Where Month(Birthdate) > 3 AND Month(Birthdate) < 8;

/* Q3 */
Select		count(i.InstructorID) as Cnt_Courses, i.FirstName+' '+i.LastName as [Instructor_name]
From		Course c
Inner  Join Instructor i
On			c.InstructorID=i.InstructorID
Group by	i.FirstName+' '+i.LastName;

/* Q4 */
Select		AVG(e.Score) as Avg_Score, c.CourseName
From		ExamScore e
Inner Join	PracticeExam p on e.ExamID=p.ExamID
Inner Join	Student s on p.StudentID=s.StudentID
Inner Join	EnrollCourse ec on s.StudentID=ec.StudentID
Inner Join	Course c on ec.CourseID=c.CourseID
Group by	c.CourseName

/* Q5 */
Select		SUM(t.Amount) as Tot_Amount, s.StudentID, s.Firstname+' '+s.Lastname as [fullname]
From		[Transaction] t
Inner Join	Payment p on t.TransactionID=p.TransactionID
Inner Join	Student s on p.StudentID=s.StudentID
Group by	s.StudentID, s.Firstname+' '+s.Lastname
