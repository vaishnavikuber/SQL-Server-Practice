----------Sub Queries----------

----List the names of customers who have placed orders.
select Name from Customers where CustomerId in (
   select CustomerId from Orders);

----Find the order IDs of orders that include products priced above 100.
select OrderID from OrderDetails where ProductID in
(select ProductID from Products where Price>100);

----Retrieve the names of products that are part of orders made 
--by customers from a specific city (e.g., "New York").
select Name from Products where ProductId in
(select ProductID from OrderDetails where OrderID in
(select OrderID from Orders where CustomerID in
(select CustomerID from Customers where City='New York')))

----Identify customers who have not placed any orders.
select Name from Customers where CustomerID not in
(select distinct CustomerID from Orders )

-----Find the customers who placed the maximum number of orders.
select Name,Email from Customers where CustomerID in (
 select CustomerID from Orders 
 group by CustomerId 
 having COUNT(OrderID) in (
   select max(CountOrder) from
   (select CustomerID,count(OrderID) 'CountOrder' 
    from Orders
    group by CustomerID) as CountOrders));

----Retrieve the details of orders where the total order amount exceeds the average order amount.
select * from Orders where TotalAmount>
(select AVG(TotalAmount) from Orders)

----List the names of customers who have ordered products priced higher than the average price 
--of all products.
select Name,Email,City from Customers where CustomerID in
(select CustomerID from Orders where OrderID in
(select OrderID from OrderDetails where ProductID in
(select ProductId from Products where Price>
(select AVG(Price) from Products))))

----Find the top most expensive products that have been ordered.
select top 1 Name,Category,Price from Products where ProductID in
(select distinct ProductID from OrderDetails) 
order by Price desc;

----List the customers who have ordered the most expensive product.
select Name,Email from Customers where CustomerId=
(select CustomerID from Orders where OrderID =
(select OrderID from OrderDetails where ProductID =
(select top 1 ProductID from Products where ProductID in
(select distinct ProductID from OrderDetails) 
order by Price desc)))

----Retrieve the names of customers who placed orders for products not ordered by other customers.


---- list of Products for which we have never received an order.
select Name,Category,Price  from Products where ProductID not in 
(select ProductID from OrderDetails)

----sub query in insert statement
create table DummyOrders (
OrderID tinyint,
CustomerID tinyint,
OrderStatus nvarchar(50),
TotalAmount float
)

insert into DummyOrders(OrderID,CustomerID,OrderStatus,TotalAmount)
select OrderID,CustomerID,OrderStatus,TotalAmount from Orders

select * from DummyOrders

----update subquery
-----Update the price of a product to the average price of products in the 'Electronics' category
update Products set Price=
(select AVG(Price) from Products where Category='Electronics')
where ProductID=4;

-----delete subquery
----Delete customers who have never placed any orders
delete from Customers where CustomerID not in
(select distinct CustomerID from Orders)

