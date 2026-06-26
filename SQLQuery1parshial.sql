Create table FFac (
letra Char(1) NOT NULL,
numero INT NOT NULL,
fecha DATE,
monto DECIMAL(16,2),
PRIMARY KEY (letra, numero)
)

sELECT * from FFac

insert into FFac (numero,letra)
values (4,'S')
insert into FFac (numero,letra)
values (4,'D')
insert into FFac (numero,letra)
values (4,'D')
insert into FFac (numero,letra)
values (6,'S')
insert into FFac (numero,letra,monto)
values (47,'S',522)
insert into FFac (numero,letra,monto)
values (48,'S',522)


Create Table Productos(
Codigo int IDENTITY,
nombre varchar(25) NOT NULL,
stock int NOT NULL,
Precio DECIMAL(16,2),
Origen varchar(30),
FechadeCreacion Date,
PRIMARY KEY (Codigo)
);

Insert into Productos(nombre,stock,Precio,Origen,FechadeCreacion)
values ('Iphone',120,3425.45,'USA','07/05/2019')

Insert into Productos(nombre,stock,Precio,Origen,FechadeCreacion)
values ('Dulce de Leche',1300,130.33,'Argentina',NULL)

Insert into Productos(nombre,stock,Precio,Origen,FechadeCreacion)
values ('Arepa',500,80,'Venezuela','10/09/1970')

Select * from Productos


/*Desde la base de datos AdventureWorks, 
consultar todos los campos de los productos (tabla Production.Product) 
con un peso (Weight) menor o igual a 20 y que sean color (Color) Yellow o Blue:*/

use AdventureWorks2022		

SELECT * FROM Production.Product 
WHERE Weight<=20 AND (Color='Yellow' OR Color='Blue') 


/*Desde la base de datos AdventureWorks, consultar el número de cuenta (AccountNumber),
Nombre (Name) y la clasificación de crédito (CreditRating) de los Proveedores (tabla Purchasing.Vendor)
cuya anteúltima letra del Nombre sea una “e”, 
ordenado por la clasificación de crédito descendente y por el nombre de forma ascendente:*/

Select AccountNumber as NumeroCuenta, Name as Nombre, CreditRating as Credito 
From Purchasing.Vendor
WHERE Name Like '%E_'
ORDER BY CreditRating DESC, Name ASC

/*Desde la base de datos AdventureWorks (tablas Sales.SalesOrderHeader y Sales.SalesOrderDetail), consultar por cada orden de venta, el número de orden (SalesOrderNumber), 
la cantidad de líneas de la orden (SalesOrderDetailID), el total de productos vendidos (OrderQty) y el total de dinero vendido (LineTotal),
sólo de aquellas órdenes de venta cuya cantidad de líneas (SalesOrderDetailID) sea mayor a 50, ordenadas desde la más grande a la más pequeña en cuestión de dinero (LineTotal). 
Hacer uso de Alias en las columnas a mostrar:*/


Select * from Sales.SalesOrderHeader

Select * from Sales.SalesOrderDetail

SELECT SalesOrderNumber as NumerodeOrden, COUNT(SalesOrderDetailID) as CantidadLineas, SUM(OrderQty) as ProductosVendidos, SUM(LineTotal) as DineroVendido
FROM Sales.SalesOrderHeader as s
INNER JOIN Sales.SalesOrderDetail AS d ON s.SalesOrderID = d.SalesOrderID
WHERE d.SalesOrderDetailID > 50
GROUP BY SalesOrderDetailID
ORDER BY LineTotal ASC







Select * from Sales.SalesOrderHeader