CREATE TABLE MyDB.dbo.Student
(
	StudentID int NOT NULL,
	Firstname varchar(255),
	Lastname varchar(255),
	Nickname varchar(255) NOT NULL,
	Email varchar(255),
	PhoneNumber varchar(10),
	Gender char(1),
	BirthDate varchar(255),
	CONSTRAINT PK_Student PRIMARY KEY (StudentID,NickName)
);

USE MyDB
INSERT INTO Student (StudentID, Firstname, Lastname, Nickname, Email, PhoneNumber, Gender, BirthDate)
VALUES	(6288102, 'Krissanapong', 'Palakham', 'Pun', 'krissanapong.pal@student.mahidol.ac.th', '0922843224', 'M', '26 February 2001')
		
INSERT INTO Student
VALUES	(6288099, 'Krittitee', 'Nildam', 'Boat', 'krittitee.nil@student.mahidol.ac.th', '0826288843', 'M', '1 December 2000'),
		(6288051, 'Thanawit', 'Thampakorn', 'Arm' , 'thanawit.thm@student.mahidol.ac.th','0897624647','M','16 January 2001'),
		(6288107, 'Pongsakorn', 'Piboonpongpun', 'Mark' , 'pongsakorn.pib@student.mahidol.ac.th','0802855506','M','12 September 2001'),
		(6288103, 'Nopparat', 'Pengsuk', 'Tob', 'nopparat.pen@student.mahidol.ac.th', '0901234567', 'M', '1 January 2001'),
		(6288077, 'Wasin', 'Heesawat', 'Oat', 'wasin.hee@student.mahidol.ac.th', '0846537222', 'M', '30 December 2000');

SELECT * FROM Student;