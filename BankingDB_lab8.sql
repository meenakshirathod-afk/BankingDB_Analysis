CREATE DATABASE BankingDB;
use BankingDB_dir;

CREATE TABLE Customers_2 (
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    AccountCreationDate DATE,
    DateOfBirth DATE
);

INSERT INTO Customers_2
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

SELECT * FROM Customers_2;

CREATE TABLE Transactions_2 (
    TransactionID INT NOT NULL PRIMARY KEY,
    AccountID INT,
    CustomerID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Transactions_2
(TransactionID, AccountID, CustomerID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, 101, '2025-05-01',  5000.00, 'Deposit'),
(302, 201, 101, '2025-05-02',  2000.00, 'Withdrawal'),
(303, 202, 102, '2025-05-03',  8000.00, 'Deposit'),
(304, 202, 102, '2025-05-04',  3000.00, 'Transfer'),
(305, 201, 101, '2025-05-05',  7000.00, 'Deposit'),
(306, 206, 106, '2025-05-16',  4000.00, 'Payment'),
(307, 207, 107, '2025-05-17', 30000.00, 'Deposit'),
(308, 208, 108, '2025-05-18',  9000.00, 'Withdrawal'),
(309, 201, 101, '2025-05-19',  6000.00, 'Deposit'),
(310, 202, 102, '2025-05-20', 11000.00, 'Payment');
select *  from customers_2;
select *  from transactions_2;
select *  from accounts;
select *  from accountbranches;
select *  from loans;
select *  from transactions;

SELECT * FROM Transactions;

SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionType,
    t.Amount
FROM Customers_2 c
INNER JOIN Transactions_2 t
    ON c.CustomerID = t.CustomerID;
    
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionType,
    t.Amount
FROM Customers_2 c
LEFT JOIN Transactions_2 t
    ON c.CustomerID = t.CustomerID;
    
SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionType,
    t.Amount
FROM Customers_2 c
INNER JOIN Transactions_2 t
    ON c.CustomerID = t.CustomerID
WHERE t.Amount > (
    SELECT AVG(Amount)
    FROM Transactions_2
)
ORDER BY t.Amount DESC;	

UPDATE Transactions_2
SET Amount = 75000.00
WHERE TransactionID = 301;

UPDATE Transactions_2
SET Amount = 62000.00
WHERE TransactionID = 307;

UPDATE Transactions_2
SET Amount = 85000.00
WHERE TransactionID = 309;

SELECT * 
FROM Transactions;

SELECT 
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Customers_2 c
INNER JOIN Transactions_2 t
    ON c.CustomerID = t.CustomerID
WHERE t.TransactionType = 'Deposit'
  AND t.Amount > 50000
ORDER BY t.Amount DESC;

#Drop table transactions_2,customers_2;