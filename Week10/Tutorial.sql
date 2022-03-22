-- Q1 --
CREATE VIEW Housewares AS
SELECT PartNum, Description, OnHand, Price
FROM Part
WHERE Class = 'HW';

-- Q1.1 --
-- Create view from multiple tables with alias name
CREATE VIEW SalesRepCust (SNum, SLast, SFirst, CNum) AS
SELECT Rep.RepNum, LastName, FirstName, CustomerNum
FROM Rep, Customer
WHERE Rep.RepNum = Customer.RepNum;
-- Q1.2 --
-- Create view with derived attribute
CREATE VIEW RepCountAvgBalance AS
SELECT RepNum, COUNT(*) AS NumCustomers, AVG(Balance) AS AvgBalance
FROM Customer
GROUP BY RepNum;

-- Q2 --
DROP VIEW Housewares;

-- Q3 --
SELECT * FROM Housewares;

-- Q4 --
SELECT PartNum, Description, OnHand, Price
FROM Part
WHERE Class = 'HW';

-- Q5 --
SELECT * FROM Housewares
WHERE OnHand < 25;

-- Q6 --
SELECT PartNum, Description, OnHand, Price
FROM Part
WHERE Class = 'HW'
AND OnHand < 25;

-- Q7 --
UPDATE Housewares
SET Price = 229.90
WHERE PartNum = 'DL71';

-- Q8 --
UPDATE Part
SET Price = 229.90
WHERE PartNum = 'DL71';

-- Q9 --
-- Create view with alias name
CREATE VIEW SalesCust (SNum, SLast, SFirst, CNum) AS
SELECT Rep.RepNum, LastName, FirstName, CustomerNum
FROM Rep, Customer
WHERE Rep.RepNum = Customer.RepNum;

-- Q10 --
SELECT SNum, SLast, SFirst
FROM SalesCust
WHERE CNum = '282';-- Q11 --SELECT Rep.RepNum, Rep.LastName, Rep.FirstNameFROM RepINNER JOIN Customer on Rep.RepNum = Customer.RepNumWHERE Customer.CustomerNum = '282';-- Q12 --
UPDATE SalesCust
SET SLast = 'AAA'
WHERE CNum = '282';

-- Q13 -- INVALID FK
UPDATE SalesCust
SET SNum = '70'
WHERE CNum = '282';