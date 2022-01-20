/*Assignment*/
/*Name: Krissanapong Palakham	Sec:1	6288102*/
USE ICTTutorial;

/*Question 1*/
SELECT	StudentID, FirstName, Lastname, 
		Year(getdate())-Year(birthdate) AS Age
FROM Student
WHERE EMail like '%hotmail%';

/*Question 2*/
SELECT	FirstName+' '+LastName AS [Fullname],
		Year(getdate())-Year(birthdate) AS Age
FROM Student
WHERE Year(getdate())-Year(birthdate) > 20

/*Question 3*/
SELECT	s.FirstName+' '+s.LastName AS [Fullname],
		s.Email, s.Phone
FROM	Student s INNER JOIN Payment p
		ON p.StudentID = s.StudentID
WHERE p.TransactionID is NULL

/*Question 4*/
SELECT	s.StudentID, e.ExamID, 
		s.FirstName+' '+s.LastName AS [Fullname],
		e.Score
FROM	Student s INNER JOIN PracticeExam p
		ON s.StudentID = p.StudentID
		INNER JOIN ExamScore e
		ON p.ExamID = e.ExamID

/*Question 5*/
SELECT	s.FirstName+' '+s.LastName AS [Fullname],
		e.Score
FROM	Student s INNER JOIN PracticeExam p
		ON s.StudentID = p.StudentID
		INNER JOIN ExamScore e
		ON p.ExamID = e.ExamID
WHERE	e.Score = (SELECT MAX(Score)
					FROM ExamScore);

/*Question 6*/
SELECT	i.FirstName+' '+i.LastName AS [Fullname]
FROM Instructor i
INNER JOIN Course c ON i.InstructorID=c.InstructorID
WHERE	c.CourseAmount = (SELECT MAX(CourseAmount)
						  FROM Course);

/*Question 7*/
SELECT TOP 5 s.FirstName+' '+s.LastName AS [Fullname]
FROM Student s
INNER JOIN EnrollCourse e ON s.StudentID=e.StudentID
INNER JOIN Course c ON e.CourseID=c.CourseID
ORDER BY c.CourseAmount DESC

/*Question 8*/
SELECT c.*
FROM Course c
LEFT JOIN ELearningVDO e ON c.CourseID=e.CourseID
WHERE e.CourseID IS NULL
