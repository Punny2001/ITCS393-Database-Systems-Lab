CREATE PROCEDURE sp_Customer_Order
    @date DATE,
    @orderCount INT
AS 
BEGIN
    SET NOCOUNT ON;

    SELECT o.OrderNum, o.OrderDate,  o.CustomerNum, COUNT(o.CustomerNum) AS AmountOrder, SUM(ol.QuotedPrice) AS SumPrice
    FROM Orders o
    INNER JOIN OrderLine ol ON o.OrderNum = ol.OrderNum
    WHERE o.OrderDate = @date
    GROUP BY o.OrderNum, o.OrderDate, o.CustomerNum
    HAVING COUNT(o.CustomerNum) >= @orderCount;
END
GO

EXEC sp_Customer_Order
@date = '2010-10-21', @orderCount = 1