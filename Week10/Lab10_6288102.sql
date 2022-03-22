-- Q1 --
CREATE VIEW vwCustomerRep (CustomerNum, CustomerName, Zip, RepFName, RepLastName) AS 
SELECT CustomerNum, CustomerName, Customer.Zip, Rep.FirstName, Rep.LastName
FROM Customer, Rep
WHERE Rep.RepNum = Customer.RepNum

SELECT * FROM vwCustomerRep
Go;

-- Q2 --
ALTER VIEW vwCustomerRep AS
SELECT CustomerNum, CustomerName, Customer.Zip, Rep.FirstName, Rep.LastName, CAST(Commission as DECIMAL(10,4)) as Commission, Rate
FROM Customer, Rep
WHERE Rep.RepNum = Customer.RepNum

SELECT * FROM vwCustomerRep
Go;

-- Q3 --
CREATE VIEW vwTotalOrder_Customer (CustomerNum, CustomerName, totalOrders) AS
SELECT Customer.CustomerNum, Customer.CustomerName, COUNT(Orders.OrderNum)
FROM Orders, Customer
WHERE Orders.CustomerNum = Customer.CustomerNum
GROUP BY Customer.CustomerNum, Customer.CustomerName

SELECT * FROM vwTotalOrder_Customer
Go;