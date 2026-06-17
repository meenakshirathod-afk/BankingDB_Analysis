#Lab 4
SELECT * FROM Customers;

SELECT FirstName, LastName, Email, Phone
FROM Customers;

#Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.

SELECT AccountID, AccountType, Balance
FROM Accounts;

#Task 2: Investigate Specific Customer Transactions

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

/** Perform the following investigations:

Retrieve all current account records
Find accounts with balance less than 15000
Display transactions between 1000 and 10000
Retrieve customer records for CustomerID 104 and 105
Display customers whose last name starts with S */

SELECT *
FROM Accounts
WHERE AccountType = 'Current';

SELECT *
FROM Accounts
WHERE Balance < 15000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 1000 AND 10000;

SELECT *
FROM Customers
WHERE CustomerID IN (104, 105);

SELECT *
FROM Customers
WHERE LastName LIKE 'S%';

#Task 3: Generate Banking Reports for Management

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


/* Generate the following reports:

Display customers sorted by LastName
Retrieve top 5 transactions with highest amount
Display unique transaction types
Skip the first 3 transaction records and display the next 4 records*/
SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Transactions
ORDER BY Amount DESC
LIMIT 5;

SELECT DISTINCT TransactionType
FROM Transactions;

SELECT *
FROM Transactions
LIMIT 4 OFFSET 3;

#we can also write instead,
SELECT *
FROM Transactions
LIMIT 3, 4;


#Task 4: Identify Missing Banking Information
SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

/*Perform the following checks:

Find customers without email addresses
Display all accounts where balance information is available*/

SELECT *
FROM Customers
WHERE Email IS NULL;

SELECT *
FROM Accounts
WHERE Balance IS NOT NULL;

#Task 5: Categorize Customer Accounts Based on Balance
SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;


/* Create a report that categorizes transactions as:

High Transaction
Medium Transaction
Low Transaction
based on transaction amount.*/

SELECT 
    TransactionID,
    AccountID,
    Amount,
    CASE
        WHEN Amount >= 10000 THEN 'High Transaction'
        WHEN Amount BETWEEN 5000 AND 9999 THEN 'Medium Transaction'
        ELSE 'Low Transaction'
    END AS TransactionCategory
FROM Transactions;

#Task 6: Analyze Customer Transactions Using Window Functions

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