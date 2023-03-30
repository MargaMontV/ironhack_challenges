Challenge 1 ¿Qué producto ha sido el más vendido?

-- ventas por producto
SELECT p.Name As [Product], COUNT(*) AS [Total] – aunque más correcto sería hacer COUNT(DISTINCT soh.SalesOrderID)
FROM SalesLT.SalesOrderHeader AS soh 
    INNER JOIN SalesLT.SalesOrderDetail AS shd ON soh.SalesOrderID = shd.SalesOrderID
    INNER JOIN SalesLT.Product AS p ON shd.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY 2 DESC

Challenge 2 ¿Cuántas unidades han sido vendidas por categoría y producto?

-- ventas por categoría y producto
SELECT  pc.Name AS [Category], p.name AS Product, SUM(sod.OrderQty) AS [Total Qty]
FROM SalesLT.Product AS p
    INNER JOIN SalesLT.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
    INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY  pc.Name, p.Name
ORDER BY 1, 2 

Challenge 3 ¿Cuántas unidades han sido vendidas por categoría, y por categoría producto?

-- ventas por categoría, y categoría-producto
SELECT pc.Name AS [Category],  p.Name As [Product], SUM(shd.OrderQty) AS [Total Qty]
FROM SalesLT.SalesOrderHeader AS soh 
    INNER JOIN SalesLT.SalesOrderDetail AS shd ON soh.SalesOrderID = shd.SalesOrderID
    INNER JOIN SalesLT.Product AS p ON shd.ProductID = p.ProductID
    INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY GROUPING SETS ((pc.Name), (pc.Name, p.Name))
ORDER BY 1, 2 

Challenge 4 BONUS De la consulta anterior, descarta los grupos que tengan menos de 8 tickets de venta

-- ventas mayores de ocho por categoría, y categoría-producto
SELECT pc.Name AS [Category],  p.Name As [Product], SUM(shd.OrderQty) AS [Total Qty]
FROM SalesLT.SalesOrderHeader AS soh 
    INNER JOIN SalesLT.SalesOrderDetail AS shd ON soh.SalesOrderID = shd.SalesOrderID
    INNER JOIN SalesLT.Product AS p ON shd.ProductID = p.ProductID
    INNER JOIN SalesLT.ProductCategory AS pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY GROUPING SETS ((pc.Name), (pc.Name, p.Name))
HAVING COUNT(DISTINCT soh.SalesOrderID) >= 8

