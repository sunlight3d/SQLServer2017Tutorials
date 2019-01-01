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
INSERT INTO Shippers(CompanyName, Phone) VALUES('Federal Shipper', '(555)-123-456');
CREATE TABLE Categories (
	CategoryId int NOT NULL IDENTITY PRIMARY KEY,
    CategoryName varchar(255),
    Description text
);
CREATE TABLE Sales (
	SaleId int IDENTITY PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    HireData date
);
INSERT INTO Sales(FirstName, LastName) VALUES('John', 'Smith');


