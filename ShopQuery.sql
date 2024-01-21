select * from orders
select * from Customers

select Customers.Name, Orders.Amount, Customers.CustomerID from Customers join Orders 
on 
Customers.CustomerID = Orders.CustomerID;

SELECT        Orders.Amount, Orders.CustomerID, Customers.Name, Customers.CustomerID AS Expr1
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
SELECT        Orders.Amount, Customers.Name
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
where Name like 'b%' or Name like 'D%'


select * from Customers 
select * from Orders 

 
--Inner join
 SELECT        Orders.Amount, Customers.CustomerID, Customers.Name
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID

--Left outer join / join 
SELECT        Customers.CustomerID, Customers.Name, Orders.Amount
FROM            Customers LEFT OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID

--Right outer join or Right join
SELECT        Orders.Amount, Customers.CustomerID, Customers.Name
FROM            Customers RIGHT OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID

--select Full join 
SELECT        Orders.Amount, Customers.CustomerID, Customers.Name
FROM            Customers FULL OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
						 