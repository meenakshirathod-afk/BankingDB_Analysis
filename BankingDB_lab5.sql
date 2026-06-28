Create database BankingDB;
show databases;
use BankingDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );
    
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) );
    
CREATE TABLE Branches (
	BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;

INSERT INTO Customers 
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul@gmail.com', '9999999999', '2025-05-01', '2001-04-15'),

(102, 'Priya', 'Patil', 'priya.patil@gmail.com', '9988776655', '2025-05-03', '2000-09-20'),

(103, 'Amit', 'Kulkarni', 'amit.k@gmail.com', '9876543210', '2025-05-05', '1999-12-11'),

(104, 'Sneha', 'More', 'sneha.more@gmail.com', '9898989899', '2025-05-07', '2002-02-14'),

(105, 'Rohan', 'Pawar', 'rohanp@gmail.com', '9765432109', '2025-05-08', '2001-11-05'),

(106, 'Sakshi', 'Mhatre', 'sakshi@yahoo.com', '9123456789', '2025-05-09', '2003-06-25'),

(107, 'Aniket', 'Sawant', 'aniket@gmail.com', '9012345678', '2025-05-10', '1998-08-19'),

(108, 'Meera', 'Patkar', 'meera@gmail.com', '9876501234', '2025-05-11', '2000-03-30');

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

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-01', 5000.00, 'Deposit'),

(302, 201, '2025-05-02', 2000.00, 'Withdrawal'),

(303, 202, '2025-05-03', 8000.00, 'Deposit'),

(304, 202, '2025-05-04', 3000.00, 'Transfer'),

(305, 201, '2025-05-05', 7000.00, 'Deposit'),

(306, 206, '2025-05-16', 4000.00, 'Payment'),

(307, 207, '2025-05-17', 30000.00, 'Deposit'),

(308, 208, '2025-05-18', 9000.00, 'Withdrawal'),

(309, 201, '2025-05-19', 6000.00, 'Deposit'),

(310, 202, '2025-05-20', 11000.00, 'Payment');

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

SELECT * FROM Customers
WHERE CustomerID = 102;

DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;

SELECT * FROM Customers;

SELECT FirstName, LastName, Email, Phone
FROM Customers;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Customers
ORDER BY FirstName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;

SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Customers
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;







