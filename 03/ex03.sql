CREATE DATABASE TravelManagement;
USE TravelManagement;
CREATE TABLE tblTravels(
	id INT PRIMARY KEY NOT NULL IDENTITY(1, 1), --start from 1, increase 1
	name VARCHAR(200) NOT NULL,
	price FLOAT DEFAULT 0.0,
	numberOfDays INT DEFAULT 1,
	startDate DATE DEFAULT GETDATE() --today
);
SELECT * FROM tblTravels;
CREATE TABLE tblCategories(
	id INT PRIMARY KEY NOT NULL IDENTITY(1, 3), --start from 1, increase 1
	name VARCHAR(250) NOT NULL,
	numberOfTravels INT CHECK(numberOfTravels >= 0)
);