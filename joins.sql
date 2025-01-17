------Retrieve all rows from a table where a specific column has a value greater than a given threshold.
select * from Person
where PersonAge > 18;

---Fetch all rows from a table and order them by a specific column in ascending or descending order.
select * from Person
order by PersonName desc;

---Retrieve the top 5 rows from a table based on a column's value.
select top 5 PersonName
from Person
order by PersonAge;

---Fetch 10 rows starting from the 5th row in a table.
select * from Person
order by PersonName
offset 4 rows
fetch first 10 rows only;

---Retrieve rows where values in ColumnD are between 50 and 100, and ColumnE contains the word "Active".
select * from Person
where (PersonAge between 20 and 40) and PersonName like '%na%';

---Fetch rows where a column matches any value from a specified list.
select * from Person
where City in('hubli','bangalore','mysore');

create schema stud;
go

create table stud.Student(
roll_no int identity(1,1),
name varchar(50),
address varchar(50),
phone varchar(10),
age int
)

insert into stud.Student(name,address,phone,age)
values ('Ramesh','Bangalore',3456656778,23),
('Sakshi','Bagalkot',7896578768,23),
('Reshma','Bangalore',5098678909,23),
('Seeta','Anjanapur',9123465432,23),
('Darshan','Hubli',7654367721,23),
('Hemant','Davangere',7643523415,23),
('Janhavi','Gulbarga',9086758495,23),
('Shri','Mysore',8709457890,23);

create table stud.Course(
course_id int,
roll_no int
)

insert into stud.Course(course_id,roll_no)
values(1,1),(2,2),(2,3),(3,4),(1,5),(4,9),(5,10),(4,11);

----inner join
select c.course_id,s.name
from stud.Student s inner join stud.Course c
on s.roll_no=c.roll_no;

select c.course_id,s.name,s.roll_no
from stud.Student s inner join stud.Course c
on s.roll_no=c.roll_no
where s.address='Bangalore';

---left join
select c.course_id,s.name
from stud.Student s left join stud.Course c
on s.roll_no=c.roll_no;

select c.course_id,s.name
from stud.Student s left join stud.Course c
on s.roll_no=c.roll_no
where c.course_id=2;

---right join
select c.course_id,s.name
from stud.Student s right join stud.Course c
on s.roll_no=c.roll_no;

select c.course_id,s.name
from stud.Student s right join stud.Course c
on s.roll_no=c.roll_no
where c.course_id=3;

---outer join
select * from stud.Student s
full outer join stud.Course c 
on s.roll_no=c.roll_no;

select * from stud.Student s
full  join stud.Course c 
on s.roll_no=c.roll_no
where c.course_id is null;

---cross join
select * from stud.Student s
cross join stud.Course c; 

select * from stud.Student 
cross join stud.Course  
order by name;

select * from stud.Student 
cross join stud.Course 
where name='janhavi';

----self join
insert into Customer values('Manju','manju@gmail.com','6543234567','Bombay','2024-12-23','M');

select c1.CustomerName as 'Customer 1',c2.CustomerName as 'Customer 2'
from dbo.Customer c1 join dbo.Customer c2 on c1.CustomerId = c2.CustomerId;

select c1.CustomerName as 'Customer 1',c2.CustomerName as 'Customer 2'
from dbo.Customer c1 join dbo.Customer c2 on c1.CustomerId <> c2.CustomerId 
where c1.Address='bombay';



select * from Customer
