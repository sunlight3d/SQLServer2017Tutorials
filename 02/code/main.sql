-- run ssms.exe in command line

CREATE LOGIN MyLogin WITH password='123456';
DROP LOGIN MyLogin;
DROP DATABASE sqltutorials;
CREATE DATABASE sqltutorials;
USE sqltutorials;
BACKUP DATABASE sqltutorials TO DISK = 'c:\mssql\sqltutorials.bak';
RESTORE DATABASE sqltutorials FROM DISK = 'c:\mssql\sqltutorials.bak';

DROP USER hoangnd;
CREATE USER hoangnd for login MyLogin;

DROP TABLE Customers;

CREATE TABLE Customers (
	CustomerID int NOT NULL IDENTITY PRIMARY KEY,    
    CustomerName varchar(300),
    Address varchar(1000),
    Phone varchar(20),
    City varchar(150),
    Country varchar(200),
);
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('Thomas Hardy', '120 Hanover Sq','0123-456-789','London', 'UK');
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('Ann Devon', '35 King George','0234-458-417', 'Madrid', 'Spain');
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('Maria Larsson', 'Åkergatan 24','0111-456-325', 'Bräcke', 'Sweden');
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('Christina Berglund', 'Berguvsvägen 8','0111-456-325', 'Luleå', 'Sweden');
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('André Fonseca', 'Av. Brasil, 442','0333-142-687', 'Campinas', 'Brazil');
INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('Lehmanns Marktstand', 'Magazinweg 7','0222-596-977', 'Frankfurt', 'Germany');

SELECT CustomerName, Phone,City, Country FROM Customers;
SELECT * FROM Customers;
SELECT DISTINCT(Country) FROM Customers;
SELECT COUNT(DISTINCT(Country)) FROM Customers;
SELECT * FROM Customers WHERE Country='Sweden';
SELECT * FROM Customers WHERE CustomerID BETWEEN 1 AND 3;
SELECT * FROM Customers WHERE Country='Sweden' AND City='Luleå';
SELECT * FROM Customers WHERE Country='Germany' OR Country='Spain';
SELECT * FROM Customers WHERE NOT CustomerID=1;
SELECT * FROM Customers ORDER BY Country;
SELECT * FROM Customers ORDER BY Country DESC;

INSERT INTO Customers(CustomerName,Address,Phone,City,Country) VALUES('John Steel', '12 Orchestra Terrace','0222-596-977', 'Walla Walla', NULL);
SELECT * FROM Customers WHERE Country is NULL;
SELECT * FROM Customers WHERE Country is NOT NULL;

SELECT * FROM Customers WHERE CustomerID=1;
UPDATE Customers SET CustomerName = 'Thomas Hardy A', City= 'England' WHERE CustomerID = 1;
--DELETE FROM Customers WHERE ;
SELECT TOP 4 * FROM Customers;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT * from Customers WHERE CustomerName LIKE 'm%';
SELECT * from Customers WHERE CustomerName LIKE '%d';
SELECT * from Customers WHERE CustomerName LIKE '%_%_%';
SELECT * from Customers WHERE CustomerName LIKE '[ace]%';
SELECT * from Customers WHERE CustomerName LIKE '[a-e]%';
SELECT * from Customers WHERE CustomerName NOT LIKE '[a-e]%';
SELECT * FROM Customers WHERE Country IN ('Brazil', 'Sweden');

DROP TABLE Suppliers;
CREATE TABLE Suppliers (
    SupplierID int NOT NULL IDENTITY PRIMARY KEY,    
    SupplierName varchar(400),
    ContactName varchar(400),
    Address varchar(1000),
    Phone varchar(20),
    City varchar(150),
    Country varchar(200)
);
SELECT * FROM Sys.Tables;
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('Pavlova, Ltd', 'Ian Devling','74 Rose St. Moonie Ponds','(03) 444-2343','Melbourne','Australia');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('G''s day', 'Wendy Mackenzie','170 Prince Edward Parade Hunter''s Hill','(02) 555-5914','Sydney','Australia');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('New Orleans Cajun Delights', 'Shelley Burke','P.O. Box 78934','(03) 444-2343','New Orleans','USA');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('Svensk Sjöföda AB', 'Michael Björn','Brovallavägen 231','08-123 45 67','Melbourne','Sweden');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('Karkki Oy', 'Anne Heikkonen','Valtakatu 12','(953) 10956','Lappeenranta','Finland');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES('Escargots Nouveaux', 'Marie Delamare','22, rue H. Voiron','85.57.00.07','Montceau','France');
INSERT INTO Suppliers(SupplierName,ContactName,Address,Phone,City,Country) VALUES(' Leka Trading', 'Chandra Leka','471 Serangoon Loop, Suite #402','555-8787','Singapore','Singapore');

DROP TABLE Categories;
CREATE TABLE Categories (
    CategoryID int NOT NULL IDENTITY PRIMARY KEY,    
    CategoryName varchar(400),
    Description text
);
INSERT INTO Categories(CategoryName, Description) VALUES('Beverages', 'Soft drinks, beer, coffee, tea');
INSERT INTO Categories(CategoryName, Description) VALUES('Seafood', 'Fish, crabs, oysters');
INSERT INTO Categories(CategoryName, Description) VALUES('Cereals', 'Bread, cereals, corn');
INSERT INTO Categories(CategoryName, Description) VALUES('Confections', 'Candies, and sweet breads');
INSERT INTO Categories(CategoryName, Description) VALUES('Electronics', 'Laptop, desktop, iphone, ipad, macbook');

DROP TABLE Products;
CREATE TABLE Products (
    ProductID int NOT NULL IDENTITY PRIMARY KEY,    
    ProductName varchar(400),
    SupplierID int,
    CategoryID int,
    Unit varchar(250),
    Price float,
);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Chocolade', 2,4,'boxes', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Macbook pro 15.4 inches 2017', 2,6,'boxes', 2200);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Ipad mini 2014', 2,6,'pieces', 712.35);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Japanese seafood sushi', 7,2,'dishes', 25.5);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Beer 555', 3,1,'cups', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Bird-watching Coffee', 4, 4,'cups', 10.2);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Schoggi Schokolade', 5,4,'cups', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Northwoods Cranberry Sauce', 5,2,'jars', 12);

SELECT * FROM Products WHERE SupplierID=2;
SELECT MIN(Price) FROM Products;
SELECT MAX(Price) as "Highest price" FROM Products;
SELECT AVG(Price) as "Average Price" FROM Products;
SELECT SUM(Price) as "Sum" FROM Products;
SELECT SUM(Price) as "Sum", COUNT(*) as "Number of Products" FROM Products;
--inner join 1-n
SELECT Categories.*, Products.*
FROM Categories
INNER JOIN Products ON Categories.CategoryID=Products.CategoryID
ORDER BY Categories.CategoryID;
--left join 1-n
SELECT Categories.*, Products.*
FROM Categories
LEFT JOIN Products ON Categories.CategoryID=Products.CategoryID
ORDER BY Categories.CategoryID;

--right join 1-n
SELECT Categories.*, Products.*
FROM Categories
RIGHT JOIN Products ON Categories.CategoryID=Products.CategoryID
ORDER BY Categories.CategoryID;
--full outer join 1-n
SELECT Categories.*, Products.*
FROM Categories
FULL OUTER JOIN Products ON Categories.CategoryID=Products.CategoryID
ORDER BY Categories.CategoryID;

--inner join n-1
SELECT Products.*, Categories.*
FROM Products
INNER JOIN Categories ON Products.CategoryID=Categories.CategoryID
ORDER BY Products.ProductID;
--union
SELECT Suppliers.Country FROM Suppliers
UNION
SELECT Customers.Country FROM Customers
ORDER BY Country;

--union all => show dublicates
SELECT Suppliers.Country FROM Suppliers
UNION
SELECT Customers.Country FROM Customers
ORDER BY Country;
--group by
SELECT COUNT(Customers.CustomerID), Customers.Country
FROM Customers
GROUP BY Customers.Country
HAVING Customers.Country IS NOT NULL;
--having is "where" of group
--exists
SELECT Suppliers.*
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Suppliers.supplierId AND Price > 1000);
--clone a table
SELECT Products.* INTO ProductsBackup FROM Products;
SELECT Customers.* INTO CustomersBackup FROM Customers WHERE Customers.Country='Sweden';
SELECT * FROM ProductsBackup;
--clone a backup table with no-data
SELECT Products.* INTO ProductsBackup FROM Products WHERE 2=3;
SELECT * FROM ProductsBackup;
--backup using "insert into"
INSERT INTO ProductsBackup(ProductName, Price)
SELECT Products.ProductName, Products.Price FROM Products;
--case when
SELECT Products.*,
CASE
    WHEN Products.Price > 10 THEN 'Price: greater than 10'
    WHEN Products.Price > 100 THEN 'Price: greater than 100'
    ELSE 'Price: under 10'
END AS TextPrice
FROM Products;

--sell and deliver products:
--A customer meet one of my company's employee and order product.A shipper will deliver product to customer's house
DROP TABLE Orders;
CREATE TABLE Orders (
    OrderID int NOT NULL IDENTITY PRIMARY KEY,    
    CustomerID int, 
    EmployeeID int, 
    OrderDate datetime,
    ShipperID int, 
);
DROP TABLE Shippers;
CREATE TABLE Shippers (
    ShipperID int NOT NULL IDENTITY PRIMARY KEY,    
    ShipperName varchar(400),
    Phone varchar(20),
    Description text
);
INSERT INTO Shippers(ShipperName, Phone, Description) VALUES('Grab', '(123)-456-789', 'Install Grab in App Store and call');
INSERT INTO Shippers(ShipperName, Phone, Description) VALUES('Speedy Express', '(503) 555-9831', 'Deliver very fast');
INSERT INTO Shippers(ShipperName, Phone, Description) VALUES('Federal Shipping', '(500) 555-9931', 'Deliver with low cost');

DROP TABLE Employees;
CREATE TABLE Employees (
    EmployeeID int NOT NULL IDENTITY PRIMARY KEY,    
    FullName varchar(400),
    DateOfBirth datetime,
    Notes text
);


DROP TABLE OrderDetails;
CREATE TABLE OrderDetails (
    OrderDetailID int NOT NULL IDENTITY PRIMARY KEY,    
    OrderID int,
    ProductID int,
    Quantity int
);
--Vid2

DROP TABLE Products;
CREATE TABLE Products (
    ProductID int NOT NULL IDENTITY PRIMARY KEY,    
    ProductName varchar(400),
    SupplierID int,
    CategoryID int,
    Unit varchar(250),
    Price float,

    CONSTRAINT FK_CategoryProduct
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
    --CONSTRAINT Check_Product CHECK (Price>=0 AND Price<=2000)
);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Chocolade', 2,4,'boxes', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Macbook pro 15.4 inches 2017', 2,6,'boxes', 2200);
SELECT * FROM Categories WHERE CategoryID=6

ALTER TABLE Products
ADD CONSTRAINT FK_CategoryProduct
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

ALTER TABLE Products
DROP CONSTRAINT FK_CategoryProduct;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Products'

INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Ipad mini 2014', 2,6,'pieces', 712.35);

ALTER TABLE Products
ADD CONSTRAINT Check_Product CHECK (Price>=0 AND Price<=2000);

INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Japanese seafood sushi', 7,2,'dishes', 2001);
--Modify to:
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Japanese seafood sushi', 7,2,'dishes', 25.5);

ALTER TABLE Products
ADD CONSTRAINT UN_Product UNIQUE (ProductName);

INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Beer 555', 3,1,'cups', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Bird-watching Coffee', 4, 4,'cups', 10.2);

INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Schoggi Schokolade', 5,4,'cups', 12);
INSERT INTO Products(ProductName,SupplierID,CategoryID,Unit,Price) VALUES('Northwoods Cranberry Sauce', 5,2,'jars', 12);

--datetime values
INSERT INTO Employees(FullName, DateOfBirth, Notes) VALUES('Margaret Fuller','1994-10-25', 'He is in sales department');
--default date
ALTER TABLE Orders
ADD CONSTRAINT DF_OrderDate 
DEFAULT GETDATE() FOR OrderDate;

INSERT INTO Orders(CustomerID,EmployeeID,ShipperID) VALUES(2,1,3);
SELECT * FROM Orders;

--trigger
DROP TRIGGER trg_UpdateProduct;

CREATE TRIGGER trg_UpdateProduct 
ON Products AFTER UPDATE AS
DECLARE @Price AS FLOAT
SET @Price = (SELECT TOP 1 Price FROM Products WHERE Price<0)
IF @Price < 0
BEGIN
    RAISERROR  ('Cannot update negative Price',16,10);
    ROLLBACK
END
--severity level = mức độ nghiêm trọng = 11->20 = error
-- error state = 0->255

ALTER TABLE Products
DROP CONSTRAINT Check_Product;

UPDATE Products 
SET Price=-2.2
WHERE ProductID=8;

--Add "counts" field to Categories
ALTER TABLE Categories
DROP COLUMN counts;

ALTER TABLE Categories
ADD counts INT;
--update NULL to 0
UPDATE Categories
SET Categories.counts=0
WHERE Categories.counts is NULL;

DROP TRIGGER trg_InsertProduct;

CREATE TRIGGER trg_InsertProduct 
ON Products AFTER INSERT AS
DECLARE @CategoryID AS INT
BEGIN

    set @CategoryID=(select CategoryID from inserted)
    UPDATE Categories
    SET counts = counts+1
    WHERE CategoryID = @CategoryID;
END
INSERT INTO Products(ProductName, SupplierID, CategoryID, Unit, Price)
VALUES('Iphone XS Plus', 2,1,'pieces',233);

DROP TRIGGER trg_DeleteProduct;

CREATE TRIGGER trg_DeleteProduct 
ON Products AFTER DELETE AS
DECLARE @CategoryID AS INT
BEGIN
    set @CategoryID=(select CategoryID from deleted)
    UPDATE Categories
    SET counts = counts-1
    WHERE CategoryID = @CategoryID AND counts > 0;
END
DELETE FROM Products
WHERE ProductID=15;
SELECT * FROM Categories;

ALTER TABLE Products
DROP COLUMN ProductionDate;

ALTER TABLE Products
ADD ProductionDate datetime;

DROP TRIGGER trg_InsertProduct2;
CREATE TRIGGER trg_InsertProduct2
ON Products AFTER INSERT AS
DECLARE @ProductionDate AS DATETIME
set @ProductionDate=(SELECT ProductionDate FROM inserted)
IF @ProductionDate > GETDATE()
BEGIN
    RAISERROR ('ProductionDate must be before Today',16,10);
    ROLLBACK
END  


--drop a procedure
DROP PROCEDURE IF EXISTS searchProducts;   
--Create a procedure
CREATE PROCEDURE searchProducts   
    @NameContain nvarchar(200)
AS   
    SELECT *  
    FROM Products   
    WHERE ProductName LIKE '%'+@NameContain+'%';  
GO 
--Run a procedure, N - Unicode
EXECUTE  searchProducts  N'japanese'

-- Create View, view does not have "ORDER BY"
DROP VIEW view_category_products;
CREATE VIEW view_category_products AS
SELECT Categories.CategoryName, Products.ProductName, Products.Price
FROM Categories
INNER JOIN Products ON Categories.CategoryID=Products.CategoryID;
SELECT * FROM view_category_products;


















