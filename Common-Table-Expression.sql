------CTE---------

----Create a CTE that retrieves all the orders placed by a specific customer,
--including the order ID and total amount.
with OrderPlacedByCustomersCTE as 
  (select Customers.CustomerID,Name,OrderID,TotalAmount from Customers inner join Orders
   on Orders.CustomerID=Customers.CustomerID)
select * from OrderPlacedByCustomersCTE;

----Write a CTE to display the names of all products in a Electronics category, along with their prices.
with ProductDetails as(
select Name,Price from Products where Category='Electronics')

select * from ProductDetails;

-----Orders with average of total amount
with OrdersDetailsCTE as(
select OrderID,AVG(TotalAmount) 'AVGAmount' from Orders group by OrderID)
select * from OrdersDetailsCTE;

-----products priced higher than the average price
with ProductGreaterThanAVGCTE as
(select ProductID,AVG(price) 'AVGPrice' from Products group by ProductID)

select p.Name,p.Category,p.Price from Products p 
join ProductGreaterThanAVGCTE cte on  p.ProductID=cte.ProductID
where p.Price > cte.AVGPrice;

----total order amount for each customer, and then use it to show customers
--who have placed orders totaling more than price 100.
with CustomerCTE as
(select CustomerID,SUM(TotalAmount) 'Total_Order_Amount' from Orders where OrderID in
(select OrderID from OrderDetails where ProductID in
(select ProductID from Products where Price>100))
group by CustomerID)

select  c.Name,c.Email ,cte.Total_Order_Amount from Customers c
inner join CustomerCTE cte on cte.CustomerID=c.CustomerID;