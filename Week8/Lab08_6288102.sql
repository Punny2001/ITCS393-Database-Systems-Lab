use PremierProducts;

/*	Q1	*/
select * 
from Part
where Price >= (
				select AVG(Price)
				from Part
				);

/*	Q2	*/
select distinct CurrentOrders.CustomerName
from CurrentOrders
inner join Orders on Orders.OrderNum = CurrentOrders.OrderNum
where Orders.OrderDate in (
							select OrderDate 
							from Orders
							where OrderDate < '2010-10-22'
							);

/*	Q3	*/
select CustomerName
from Customer
where CustomerName in (
			select Customer.CustomerName
			from Customer
			inner join Rep on Rep.RepNum = Customer.RepNum
			where Rep.FirstName = 'Valerie' and Rep.LastName = 'Kaiser'
			);

/*	Q4	*/
select CustomerName
from Customer
where CustomerName in (
				select CustomerName from Customer
				where Balance > (
								 select Balance from Customer
								 where CustomerName = 'Brookings Direct'
								)
				)
