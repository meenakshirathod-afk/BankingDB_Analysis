CREATE DATABASE BankingDB;
use BankingDB;

CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    AccountCreationDate DATE,
    DateOfBirth DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul',  'Sharma',  'rahul@gmail.com',        '9999999999', '2025-05-01', '2001-04-15'),
(102, 'Priya',  'Patil',   'priya.patil@gmail.com',  '9988776655', '2025-05-03', '2000-09-20'),
(103, 'Amit',   'Kulkarni','amit.k@gmail.com',       '9876543210', '2025-05-05', '1999-12-11'),
(104, 'Sneha',  'More',    'sneha.more@gmail.com',   '9898989899', '2025-05-07', '2002-02-14'),
(105, 'Rohan',  'Pawar',   'rohanp@gmail.com',       '9765432109', '2025-05-08', '2001-11-05'),
(106, 'Sakshi', 'Mhatre',  'sakshi@yahoo.com',       '9123456789', '2025-05-09', '2003-06-25'),
(107, 'Aniket', 'Sawant',  'aniket@gmail.com',       '9012345678', '2025-05-10', '1998-08-19'),
(108, 'Meera',  'Patkar',  'meera@gmail.com',        '9876501234', '2025-05-11', '2000-03-30');

SELECT * FROM Customers;

CREATE TABLE Accounts (
    AccountID INT NOT NULL PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000.00),
(202, 102, 'Current', 40000.00),
(203, 103, 'Salary', 30000.00),
(204, 104, 'Savings', 15000.00),
(205, 105, 'Current', 55000.00),
(206, 106, 'Salary', 22000.00),
(207, 107, 'Savings', 80000.00),
(208, 108, 'Current', 12000.00);

SELECT * FROM Accounts;

SELECT SUM(Balance) as total_balance
FROM Accounts;

SELECT AVG(Balance) AS average_balance
FROM Accounts;

SELECT MAX(Balance) AS highest_balance
FROM Accounts;

SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

SELECT COUNT(*) AS total_accounts
FROM Accounts;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;