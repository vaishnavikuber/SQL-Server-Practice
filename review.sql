create database ReviewDB

----Retrieve the Name, Email, and the total number of orders each customer has placed, 
----even if they haven't placed any, from the Customers table.
select c.Name,c.Email,COUNT(OrderId) as 'total orders'
from Customers c join Orders o 
on c.CustomerId=o.CustomerId 
group by c.Name;

-----Retrieve all Products where the price is greater than 100, sorted
--first by Category in ascending order and then by Price in descending order.
select * from Products 
where price>100
order by Category asc, Price desc;

---Retrieve the second page of customers, where each page
--contains 2 customers, sorted alphabetically by their Name.
select * from Customers
order by Name
offset 2 rows;

----Retrieve the top 2 customers with the highest total spending on orders. Include their Name and the total
----spending, calculated by summing the TotalAmount from the Orders table.
select top 2 c.Name,SUM(o.TotalAmount) as TotalAmount
from Customers c inner join Orders o 
on c.CustomerId = o.CustomerId
group by c.Name;

---Retrieve all Orders where the TotalAmount is between 1000 and 5000,
--and the customer is from a city other than "Chicago".
select * from Orders join Customers
on Orders.CustomerId=Customers.CustomerId
where TotalAmount between 1000 and 5000
and City != 'Chicago';

---Calculate the average Price of products for each Category, 
--and include only categories where the average price is greater than 500.
select Category,AVG(Price) from Products
group by Category
having AVG(Price)>500;

---Retrieve all Orders along with the corresponding Customer Name and Product Name. 
---Assume an additional OrderDetails table, 
---which maps Orders to Products with columns OrderID, ProductID, and Quantity.
select o.OrderId,o.OrderStatus,c.Name 'customer name',p.Name 'product name'
from OrderDetails od inner join Orders o
on od.OrderId=o.OrderId inner join Products p
on od.ProductId=p.ProductId inner join Customers c
on c.CustomerId=o.CustomerId;

----Retrieve all customers whose Name starts with the letter "A".
select Name from Customers
where Name like 'A%';

---Retrieve all products where the Name ends with the word "Maker".
select Name from Products
where Name like'%Maker';

---Retrieve all employees whose Name contains the substring "Smith".
select Name from Employees
where Name like'%Smith%';

---Retrieve all customers whose Email contains the domain "example".
select * from Customers
where Email like'%example%';

---Retrieve all orders where the OrderStatus starts with "D" and is exactly 9 characters long (e.g., "Delivered").
select * from Orders
where OrderStatus like 'D%' and LEN(OrderStatus)=9;






