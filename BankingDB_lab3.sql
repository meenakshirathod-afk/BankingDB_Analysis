#Lab3
#Task 1: Insert Banking Records
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2025-05-03', '2000-09-20');
#Directly running following insert query in accounts table will give error 1452(foreign key constrain failed there for need to add one data with 101 CustomerID in Customer table.

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', '2025-04-15', '1998-07-12');


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000); 

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000);



#Insert into rest tables atleast 5 records
#Customers
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(103, 'Amit', 'Joshi', 'amit.joshi@gmail.com', '9123456780', '2025-06-01', '1995-03-15'),
(104, 'Sneha', 'Kulkarni', 'sneha.k@gmail.com', '9234567891', '2025-06-02', '1999-11-25'),
(105, 'Rohit', 'Verma', 'rohit.verma@gmail.com', '9345678912', '2025-06-03', '1997-08-10'),
(106, 'Neha', 'Singh', 'neha.singh@gmail.com', '9456789123', '2025-06-04', '2001-02-18'),
(107, 'Karan', 'Mehta', 'karan.mehta@gmail.com', '9567891234', '2025-06-05', '1996-06-30');
#Accounts
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(203, 103, 'Savings', 30000),
(204, 104, 'Current', 45000),
(205, 105, 'Savings', 20000),
(206, 106, 'Current', 50000),
(207, 107, 'Savings', 35000);

#Transactions
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-06-01', 5000, 'Credit'),
(302, 201, '2025-06-02', 2000, 'Debit'),
(303, 202, '2025-06-03', 10000, 'Credit'),
(304, 202, '2025-06-04', 3000, 'Debit'),
(305, 201, '2025-06-05', 1500, 'Debit');

#Branches
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(401, 'Andheri Branch', 'Mumbai Andheri East', '9871111111'),
(402, 'Borivali Branch', 'Mumbai Borivali West', '9872222222'),
(403, 'Thane Branch', 'Thane West', '9873333333'),
(404, 'Pune Branch', 'Pune Shivajinagar', '9874444444'),
(405, 'Navi Mumbai Branch', 'Vashi', '9875555555');

#Account branches
INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
VALUES
(201, 401, '2025-05-01'),
(201, 402, '2025-05-02'),
(202, 403, '2025-05-03'),
(202, 404, '2025-05-04'),
(201, 405, '2025-05-05');

#Loans
INSERT INTO Loans
(LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
(501, 101, 500000, 8.5, '2025-01-01', '2030-01-01'),
(502, 102, 300000, 9.0, '2025-02-01', '2029-02-01'),
(503, 101, 200000, 7.5, '2025-03-01', '2028-03-01'),
(504, 102, 150000, 8.0, '2025-04-01', '2027-04-01'),
(505, 101, 100000, 9.5, '2025-05-01', '2026-05-01');
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM Branches;
SELECT * FROM Loans;

#Task 2: Update Existing Banking Records

UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email = 'priya.patil@gmail.com'
WHERE CustomerID = 102;

SELECT * FROM Customers
WHERE CustomerID = 102;

#Task 3: Delete Banking Records and Verify Data

DELETE FROM Transactions
WHERE TransactionID = 302;

SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;   #It will generate foreign key constraint failed error 1451 for that run : 
select * from Accounts;
DELETE FROM Transactions
WHERE AccountID = 202;
DELETE FROM AccountBranches
WHERE AccountID = 202;


Select * from Transactions;
DELETE FROM Accounts
WHERE AccountID = 202;
use bankingdb;
select * from Customers;
SELECT * FROM Accounts;
Select * from AccountBranches;
use sakila;
drop table customer;
use bankingdb;
 describe customers;
select * from emp_info;