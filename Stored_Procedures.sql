------create stored procedure
create proc spGetAllCustomers
as
begin
	select * from Customer
end;
----execute stored procedure
spGetAllCustomers;
exec spGetAllCustomers;
execute spGetAllCustomers;

-----drop a procedure
drop proc spGetAllCustomers;

------alter/modify stored procedure
alter proc spGetAllCustomers
as
begin
	select * from Customer where CustomerId=2;
	select * from Customer where CustomerName='Anu';
end;

---input and output parameter
alter proc spGetAllCustomers
@CustomerId int,
@CustomerName varchar(50)
as
begin
	select * from Customer where CustomerId=@CustomerId;
	select * from Customer where CustomerName=@CustomerName;
end;
exec spGetAllCustomers @CustomerId=2,@CustomerName='Anu';
exec spGetAllCustomers 2,'Anu';


-----default values with procedures
alter proc spGetAllCustomers
@CustomerId int = 2,
@CustomerName varchar(50)='Anu'
as
begin
	select * from Customer where CustomerId=@CustomerId;
	select * from Customer where CustomerName=@CustomerName;
end;
----if we assign values then the default values will be ignored
exec spGetAllCustomers 2,'Prabha';

-----output parameters
create proc spAddDigit
@Num1 int,
@Num2 int,
@Result int OUTPUT
as
begin
	set @Result=@Num1+@Num2;
end;

declare @Result int 
exec spAddDigit 4,8,@Result OUTPUT;
select @Result;


-----encryption of stored procedure
alter proc spAddDigit
@Num1 int,
@Num2 int,
@Result int OUTPUT
with encryption
as
begin
	set @Result=@Num1+@Num2;
end;

-----content of stored procedure
sp_helptext spAddDigit

-------------
create proc spCustomerExample(
@minId as int,
@maxId as int
)
as
begin
	select CustomerName,Email,PhoneNumber 
	from Customer 
	where CustomerId>=@minId and CustomerId<=@maxId;
end;
exec spCustomerExample 3,7;

---------------
create procedure spCustomerExample2(
@minId as int,
@maxId as int,
@email as varchar(40)
)
as
begin
	select CustomerName,Email,PhoneNumber
	from Customer
	where CustomerId between @minId and @maxId
	and Email like '%'+@email+'%';
end;

exec spCustomerExample2 2,6,'mail';

-----------declare and set variables
create proc spCustomerCount
as
begin
	DECLARE @count int;
	set @count=(
	select COUNT(*) from Customer)
	print @count;
end;

alter proc spCustomerCount
as
begin
	DECLARE @count int;
	set @count=(
	select COUNT(*) from Customer)
	print 'There are '+Cast(@count as varchar (20))+' customers';
end;
exec spCustomerCount;

alter proc spCustomerCount(
@CustomerId  int,
@result varchar(50) OUTPUT
)
as
begin
	select * from Customer where CustomerId=@CustomerId;
	select @result =@@ROWCOUNT;
end;

exec spCustomerCount 5,'abc';



-------     Banking: Withdrawal with Balance Check (No Logging)
------  Implement a stored procedure to handle bank account withdrawals. Ensure:
---The withdrawal amount does not exceed the account balance.
---Raise errors for insufficient funds or non-existent accounts.

create proc spWithdrawAmount(
@AccountID bigint,
@amount money
)
as
begin
	begin try
		-----check if account axists
		if not exists(select AccountID from Accounts where AccountID=@AccountID)
		begin
			throw 50004,'Account not found.',1;
		end

		----check if balance is sufficient
		declare @Balance Decimal(10,2);
		set @Balance=select Balance from Accounts Where AccountID=@AccountID;

		if @Balance<@amount
		begin
			throw 50005,'Insufficient Funds',1;
		end

		-----deduct if it has sufficient balance
		update Accounts
		set Balance=Balance-@amount
		where AccountID=@AccountID;
		print 'Witdrawal successfull. Balance:'+cast(@Balance-@amount as nvarchar(30));
	end try
	begin catch
		----handle errors
		Declare @ErrorMessage nvarchar(4000),
		@ErrorSeverity int,
		@ErrorState int;
		select @ErrorMessage=ERROR_MESSAGE(),
		@ErrorSeverity=ERROR_SEVERITY(),
		@ErrorState=ERROR_STATE();
		--rethrow the error
		throw @ErrorSeverity,@ErrorMessage,@ErrorState;
	end catch

end;
