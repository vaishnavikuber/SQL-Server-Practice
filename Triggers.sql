create table EmployeeAudit
(
TgrId int identity(1,1),
Id int ,
Name varchar(50),
Operation varchar(25),
UpdatedTime datetime
)

select * from EmployeeAudit
--------------------Triggers on DML Operations
----------insert trigger
alter trigger EmployeeTgr
on Employee
after insert
as
begin
	set nocount on;
	insert into EmployeeAudit(Id,Name,Operation,UpdatedTime)
	select i.Id,i.Name,'insert',getdate() from inserted i;
end;

drop trigger EmployeeTgr

insert into Employee (Name,Salary,DateOfJoining)
values('Sourav',8000,'2021-02-19');

----update 
alter trigger EmployeeUpdateTgr
on Employee
after update
as
begin
	set nocount on;
	insert into EmployeeAudit(Id,Name,Operation,UpdatedTime)
	select i.Id,i.Name,'Update',getdate() from inserted i;
end;

update Employee set Salary=30000 where Id=12;


-------delete 
create trigger EmployeeDeleteTgr
on Employee
after delete
as
begin
	set nocount on;
	insert into EmployeeAudit(Id,Name,Operation,UpdatedTime)
	select i.Id,i.Name,'Delete',getdate() from deleted i;
end;

delete from Employee where Id=12;

-----------------------Triggers on DDL operations
create table ddlLogs(
LogId int identity primary key,
Event_Data xml ,
Changed_By sysname ,
Changed_Time datetime
)

create trigger EmployeeDBAudit
on database
for create_index,alter_index,drop_index
as
begin
	insert into ddlLogs(Event_Data,Changed_By,Changed_Time)
	values (EVENTDATA(),USER,GETDATE());
end;

select * from ddlLogs

create nonclustered index C_Name
on Employee(Name)

