----------PARA LA TABLA TIEMPO------------
SELECT CONVERT(DATE, OrderDate) OrderDate, DATEPART(YEAR, OrderDate) año, 
DATEPART(MONTH, OrderDate) mes, DATEPART(WEEK, OrderDate) semana, 
DATEPART(QUARTER, OrderDate) trimestre, DATENAME(WEEKDAY, OrderDate) dia_semana, 
ROW_NUMBER() OVER(ORDER BY OrderDate ASC) tiempoId
FROM Orders 
INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID INNER JOIN Shippers ON
Orders.ShipVia=Shippers.ShipperID INNER JOIN Products ON Products.ProductID=[Order Details].ProductID
GROUP BY Orders.OrderID, Orders.EmployeeID, Shippers.ShipperID, Products.ProductID,
OrderDate, CONVERT(DATE,OrderDate), DATEPART(YEAR, OrderDate), 
DATEPART(MONTH, OrderDate), DATEPART(WEEK, OrderDate), DATEPART(QUARTER, OrderDate), DATENAME(WEEKDAY, OrderDate)

----------PARA LA TABLA PRODUCTOS------------
select ProductID, ProductName from Products

----------PARA LA TABLA EMPLEADOS------------
select EmployeeID, CONCAT(FirstName, ' ', LastName) Nombre from Employees

----------PARA LA TABLA TRANSPORTISTAS------------
select ShipperID, CompanyName from Shippers

----------PARA LA TABLA HECHOS ORDENES------------
SELECT 
  Orders.OrderID,
  Orders.EmployeeID,
  Shippers.ShipperID, 
  SUM([Order Details].Quantity*[Order Details].UnitPrice*(1-[Order Details].Discount)) total_venta_producto,
  ROW_NUMBER() OVER(ORDER BY OrderDate ASC) tiempoId,
  Products.ProductID
FROM Orders 
INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID INNER JOIN Shippers ON
Orders.ShipVia=Shippers.ShipperID INNER JOIN Products ON Products.ProductID=[Order Details].ProductID
GROUP BY Orders.OrderID, Orders.EmployeeID, Shippers.ShipperID, Products.ProductID,
OrderDate, CONVERT(DATE,OrderDate), DATEPART(YEAR, OrderDate), 
DATEPART(MONTH, OrderDate), DATEPART(WEEK, OrderDate), DATEPART(QUARTER, OrderDate), DATENAME(WEEKDAY, OrderDate)