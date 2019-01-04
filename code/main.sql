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

CREATE TABLE Products (
    ProductID int NOT NULL IDENTITY PRIMARY KEY,    
    ProductName varchar(400),
    SupplierID int,
    CategoryID int,
    Unit varchar(250),
    Price float,
);
