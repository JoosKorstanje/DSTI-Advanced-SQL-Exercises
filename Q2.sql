/****** Q2 - create view of customers with an order that has not been invoiced  ******/
CREATE VIEW CustomersWithUnivoicedOrder AS(

	SELECT C.CustomerName
	  FROM Sales.Customers as C, 
		   Sales.Orders as O
		
	  WHERE 
	  not exists(SELECT *
				 FROM Sales.Invoices as I
				 WHERE I.OrderID = O.OrderID)
	  AND O.CustomerID = C.CustomerID
	  
	  GROUP BY C.CustomerName)