----------Views----------

----create view
create view Order_Sales
as 
select p.ProductID,p.Name,Quantity*o.TotalAmount as sales
from Orders o inner join OrderDetails od
on o.OrderID=od.OrderID
inner join Products p
on p.ProductID=od.ProductID;

select * from Order_Sales order by Name;

--------delete view
drop view Order_Sales;

--------renaming view
sp_rename Order_Sales,Sales_Of_Orders;

select * from Sales_Of_Orders;

------details of view
sp_helptext Sales_Of_Orders;

create view Course_Enrollment
as
select c.course_id,s.Name
from dbo.Students s left join stud.Course c
on s.RollNo=c.roll_no
where c.course_id=2;

select * from Course_Enrollment

create view CS_Students
as
select c.course_id,s.name,s.RollNo
from dbo.Students s inner join stud.Course c
on s.RollNo=c.roll_no
where s.Branch='CS';

select * from CS_Students where course_id=3;

