-----------Cursors-------------
declare @OrderID tinyint,@OrderStatus nvarchar(50)

declare Orders_Cursor Cursor
for select OrderID,OrderStatus from Orders

open Orders_Cursor
fetch next from Orders_Cursor into @OrderID,@OrderStatus;

while @@FETCH_STATUS=0
	begin
		print @OrderStatus+cast(@OrderID as nvarchar(23));
		fetch next from Orders_Cursor into @OrderID,@OrderStatus;
	end;

close Orders_Cursor;
Deallocate Orders_Cursor;

----------------------------------

CREATE TABLE Students  
    (  
      Id INT ,  
      RollNo INT ,  
      EnrollmentNo NVARCHAR(15) ,  
      Name NVARCHAR(50) ,  
      Branch NVARCHAR(50) ,  
      University NVARCHAR(50)  
    )

INSERT  INTO Students  
        ( Id, RollNo, EnrollmentNo, Name, Branch, University )  
VALUES  ( 1, 1, N'', N'Nikunj Satasiya', N'CE', N'RK University' ),  
        ( 2, 2, N'', N'Hiren Dobariya', N'CE', N'RK University' ),  
        ( 3, 3, N'', N'Sapna Patel', N'IT', N'RK University' ),  
        ( 4, 4, N'', N'Vivek Ghadiya', N'CE', N'RK University' ),  
        ( 5, 5, N'', N'Pritesh Dudhat', N'CE', N'RK University' ),  
        ( 5, 5, N'', N'Hardik Goriya', N'EC', N'RK University' ),  
        ( 6, 6, N'', N'Sneh Patel', N'ME', N'RK University' ) 

-----cursor  with update
declare @Id int,@RollNo int,@Branch nvarchar(50),@Year AS INT

set @Year=RIGHT(year(GETDATE()),2)

declare EnrollmentCursor cursor
for select Id,Branch,RollNo,@year from Students

open EnrollmentCursor
fetch next from EnrollmentCursor into @Id,@Branch,@RollNo,@Year

while @@FETCH_STATUS=0
begin
	declare @EnrollmentNo nvarchar(15)
	set @EnrollmentNo= '2KA'+CAST(@Year as varchar(2))+Cast(@Branch as nvarchar(50))+'0'+CAST(@RollNo as varchar(10));
	update Students set EnrollmentNo=@EnrollmentNo where Id=@Id;
	fetch next from EnrollmentCursor into @Id,@Branch,@RollNo,@Year

end;

close EnrollmentCursor;
deallocate EnrollmentCursor;


