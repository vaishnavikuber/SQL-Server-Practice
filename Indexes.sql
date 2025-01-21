----------------Index-------------

---to get the list of indexes in table
sp_helpindex Person

-----create a index
create index IX_Customer_Email
on Customer (Email asc);

----delete index
drop index Customer.IX_Customer_Email;

----alter an index
alter index IX_Customer_Email
on Customer rebuild;

----create unique index
create unique index UIX_Customer_Email
on Customer (Email);

drop  index Customer.UIX_Customer_Email;

select * from Customer

alter table stud.Student 
add constraint C_Roll_No
unique (roll_no);

----create clustered index
--create clustered index CIX_Customer_Email
--on Customer (Email);

----create non clustered index
create nonclustered index CIX_Customer_Email
on Customer (Email);


