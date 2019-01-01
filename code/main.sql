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

DROP TABLE Shippers;
CREATE TABLE Shippers (
	ShipperId int NOT NULL IDENTITY PRIMARY KEY,    
    CompanyName varchar(255),
    Phone varchar(20)
);
INSERT INTO Shippers(CompanyName, Phone) VALUES('Speedy Shipper', '(555)-123-4567');
INSERT INTO Shippers(CompanyName, Phone) VALUES('Federal Express', '(503)-444-3123');
INSERT INTO Shippers(CompanyName, Phone) VALUES('Shipper', '(555)-123-7896');
CREATE TABLE Categories (
	CategoryId int NOT NULL IDENTITY PRIMARY KEY,
    CategoryName varchar(255),
    Description text
);
DELETE FROM Categories;
INSERT INTO Categories(CategoryName, Description) VALUES('Beverages','Coffees, tea, beers, juice')
INSERT INTO Categories(CategoryName, Description) VALUES('Seafood','Fish, Shrimp, squid, oyster')
INSERT INTO Categories(CategoryName, Description) VALUES('Confections','Candies, sweet breads, desserts')

CREATE TABLE Sales (
	SaleId int IDENTITY PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    HireDate datetime
);
DELETE FROM Sales;
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('John', 'Smith', CURRENT_TIMESTAMP);
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Nancy', 'Robert', '12-24-2017');
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Janet', 'King', '11-21-2017');
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Michael', 'Davolio', '5-21-2018');
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Anna', 'Syanana', '4-15-2018');
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Magaret', 'Dodswoth', '3-12-2018');
INSERT INTO Sales(FirstName, LastName, HireDate) VALUES('Robert', 'Valady', '4-15-2018');

SELECT * FROM Sales;