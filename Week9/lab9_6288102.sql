create database Lab9;

/*	Q1	*/
create table Q1 (
	userId		uniqueidentifier default newID(), 
	firstName	nvarchar(20),
	lastName	nvarchar(20)
	);

/*	Q2	*/
insert into Q1 (firstName, lastName)
values	('Krissanapong', 'Palakham'),
		('Krittitee', 'Nildam'),
		('Pongsakorn', 'Piboonpongpun');

/*	Q3	*/
select concat(firstName,' ', lastName) as [fullname], len(concat(firstName,' ', lastName)) as countstring
from Q1

/*	Q4	*/
create table Q2 (
	Uname	nvarchar(32),
	Upass	binary(64)
	);

/*	Q5	*/
insert into Q2 (Uname, Upass)
values ('u6288102', HASHBYTES('MD5', '260244'));

select Uname, Upass
from Q2