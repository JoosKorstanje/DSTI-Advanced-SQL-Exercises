CREATE PROCEDURE DisplayCustomerTurnovers 
	-- parameter for the stored procedure (1 is per year, 2 is per quarter, 3 is per month)
	@ReturnType int
AS

BEGIN
	IF @ReturnType = 1
	--ReturnType 1 is year
		BEGIN
			/*Return type 1: per year  */
			SELECT
			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND YEAR(i.InvoiceDate) = 2013
			)As [2013],

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND YEAR(i.InvoiceDate) = 2014
			)As [2014],

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND YEAR(i.InvoiceDate) = 2015
			)As [2015], 

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND YEAR(i.InvoiceDate) = 2016
			)As [2016]
		END

	IF @ReturnType = 2
	--ReturnType = 2 means per quarter
		BEGIN
			SELECT
			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(i.InvoiceDate) BETWEEN 1 AND 3
			)As Q1,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(i.InvoiceDate) BETWEEN 4 AND 6
			)As Q2,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(i.InvoiceDate) BETWEEN 7 AND 9
			)As Q3, 

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
					Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(i.InvoiceDate) BETWEEN 10 AND 12
			)As Q4
		END

	IF @ReturnType = 3
	--ReturnType 3 means per month
		BEGIN
			SELECT
			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 1
			)As Jan,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 2
			)As Feb,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 3
			)As Mar, 

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 4
			)As Apr,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 5
			)As May, 

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 6
			)As Jun, 

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 7
			)As Jul,
	
			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 8
			)As Aug,  

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 9
			)As Sep,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 10
			)As Oct,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 11
			)As Nov,

			(
				SELECT SUM(il.Quantity * il.UnitPrice)
				FROM Sales.InvoiceLines as il,
				Sales.Invoices AS i
				WHERE
					il.InvoiceID = i.InvoiceID
					AND MONTH(I.InvoiceDate) = 12
			)As [Dec]
		END
END;
