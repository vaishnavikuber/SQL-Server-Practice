------------User Defined Functions-----------

----create Scalar function
alter function TaxWithPrice(
@ProductID tinyint,
@Tax float
)
returns float
as

	begin
		
		declare @Price float
		select @Price=Price from Products where ProductID=@ProductID;
		return @Price+(@Price*@Tax/100);

	end;

------execute scalar function
select Name,Price,dbo.TaxWithPrice(ProductID,10) as PriceWithTax from Products;


create function TotalAmountOrderWithDiscount(
@TotalAmount float,
@Discount float
)
returns float
as
begin
	return @TotalAmount-(@TotalAmount*@Discount/100);
end;

select OrderID,TotalAmount,dbo.TotalAmountOrderWithDiscount(TotalAmount,5) as DiscountedAmount from Orders; 

-----------Table valued functions

create function QuantityCheck(
@ProductID tinyint,
@Quantity tinyint
)
returns table
as
	return
		select Name,Category from Products where ProductID in
		(select ProductID from OrderDetails where Quantity=@Quantity);

----execute table valued function
select * from dbo.QuantityCheck((select ProductID from Products),1);


create function PriceMaximum(
@MinPrice float
)
returns table
as
	return
		select * from Products where Price>@MinPrice;

select * from PriceMaximum(400);

-----deleting function 
drop function PriceMaximum;



