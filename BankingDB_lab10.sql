CREATE VIEW Suspicious_Transactions AS
SELECT
    TransactionID,
    CustomerID,
    TransactionType,
    Amount
FROM Transactions_2
WHERE Amount > 75000;


select * from Suspicious_Transactions;


CREATE OR REPLACE VIEW Suspicious_Transactions AS
SELECT
    t.TransactionID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.BranchName,
    t.TransactionType,
    t.Amount
FROM Transactions_2 t
INNER JOIN Customers_2 c
    ON t.CustomerID = c.CustomerID
WHERE t.Amount > 75000;

SELECT
    TransactionID,
    CustomerName,
    BranchName,
    TransactionType,
    Amount
FROM Suspicious_Transactions
ORDER BY Amount DESC;