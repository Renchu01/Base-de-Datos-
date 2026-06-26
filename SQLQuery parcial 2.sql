SELECT p.Name AS Nombre, p.ProductNumber as Codigo, p.ListPrice as Precio 
FROM Production.Product p
WHERE p.ProductID IN (SELECT ProductID from Sales.SpecialOfferProduct) AND Color='Black'


SELECT FirstName
FROM Person.Person  
WHERE FirstName LIKE 'P%'
UNION ALL
SELECT FirstName
FROM Person.Person
WHERE FirstName LIKE 'Pa%'


SELECT ProductNumber AS Codigo, Name AS Nombre,
CASE (ProductLine)
WHEN 'R' THEN 'Calle'
WHEN 'M' THEN 'Montaña'
WHEN 'T' THEN 'Turismo'
WHEN 'S' THEN 'Otros'
ELSE 'No esta a la venta'
END AS Categoria
FROM Production.Product 
ORDER BY ProductNumber

Select ProductLine FROM Production.Product


Create Table ##Proveedores (
Cuenta nvarchar(15),
Nombre VARCHAR(50),
Website nvarchar(50)
)
INSERT INTO ##Proveedores SELECT AccountNumber, Name, PurchasingWebServiceURL
FROM Purchasing.Vendor

SELECT * FROM ##Proveedores 
WHERE Website IS NOT NULL

SELECT * FROM ##Proveedores 
WHERE Nombre LIKE '%bike%'

DROP TABLE ##Proveedores

SELECT * FROM ##Proveedores

SELECT PurchasingWebServiceURL,AccountNumber FROM Purchasing.Vendor

CREATE PROCEDURE spBuscadorDeProductos
@paramCategoria VARCHAR (10),
@paramSubCategoria VARCHAR(10),
@paramNombre VARCHAR(10)

AS

SELECT c.ProductCategoryID AS Categoria, s.ProductSubcategoryID AS Subcategoria, p.ProductID AS Codigo, p.Color AS Color, p.Name AS Nombre
FROM Production.Product p
INNER JOIN Production.ProductSubcategory AS s ON p.ProductSubcategoryID=s.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS c ON s.ProductCategoryID = c.ProductCategoryID
AND p.Name LIKE '%'+@paramNombre+'%'
AND s.Name LIKE '%'+@paramSubCategoria+'%'
AND c.Name LIKE '%'+@paramCategoria+'%'


GO
EXEC spBuscadorDeProductos 'othi', 'soc', 'bike'