/* Question 3 solution:
select the revenu (quantity * unit price)
from the orders that have not been invoiced
*/

CREATE PROCEDURE DisplayCustomerTurnovers2
	-- parameter for the stored procedure (1 is per year, 2 is per quarter, 3 is per month)
	-- MonthQuarterYear defines which month quarter or year
	@ReturnType int,
	@MonthQuarterYear int
AS

BEGIN
	IF @ReturnType = 1
	--ReturnType 1 is year
		BEGIN
			select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
			from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
			where not exists
				(
				select * from sales.Invoices as I
				where O.OrderID = I.OrderID
				)
			and o.OrderID = ol.OrderID
			and o.CustomerID = c.CustomerID
			and YEAR(o.OrderDate) = @MonthQuarterYear
			group by c.CustomerName
			order by LossOfRevenue DESC
		END

	IF @ReturnType = 2
	--ReturnType = 2 means per quarter
		BEGIN
			IF @MonthQuarterYear = 1
			BEGIN
				select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
				from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
				where not exists
					(
					select * from sales.Invoices as I
					where O.OrderID = I.OrderID
					)
				and o.OrderID = ol.OrderID
				and o.CustomerID = c.CustomerID
				and MONTH(o.OrderDate) BETWEEN 1 and 3
				group by c.CustomerName
				order by LossOfRevenue DESC
			END

			IF @MonthQuarterYear = 2
			BEGIN
				select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
				from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
				where not exists
					(
					select * from sales.Invoices as I
					where O.OrderID = I.OrderID
					)
				and o.OrderID = ol.OrderID
				and o.CustomerID = c.CustomerID
				and MONTH(o.OrderDate) BETWEEN 4 and 6
				group by c.CustomerName
				order by LossOfRevenue DESC
			END

			IF @MonthQuarterYear = 3
			BEGIN
				select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
				from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
				where not exists
					(
					select * from sales.Invoices as I
					where O.OrderID = I.OrderID
					)
				and o.OrderID = ol.OrderID
				and o.CustomerID = c.CustomerID
				and MONTH(o.OrderDate) BETWEEN 7 and 9
				group by c.CustomerName
				order by LossOfRevenue DESC
			END

			IF @MonthQuarterYear = 4
			BEGIN
				select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
				from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
				where not exists
					(
					select * from sales.Invoices as I
					where O.OrderID = I.OrderID
					)
				and o.OrderID = ol.OrderID
				and o.CustomerID = c.CustomerID
				and MONTH(o.OrderDate) BETWEEN 10 and 12
				group by c.CustomerName
				order by LossOfRevenue DESC
			END
		END

	IF @ReturnType = 3
	--ReturnType 3 means per month
		BEGIN
			select sum(ol.Quantity * ol.UnitPrice) as LossOfRevenue, c.CustomerName
			from sales.Orders as O, sales.OrderLines as ol, sales.Customers as c
			where not exists
				(
				select * from sales.Invoices as I
				where O.OrderID = I.OrderID
				)
			and o.OrderID = ol.OrderID
			and o.CustomerID = c.CustomerID
			and MONTH(o.OrderDate) = @ReturnType
			group by c.CustomerName
			order by LossOfRevenue DESC
		END
END;



