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






