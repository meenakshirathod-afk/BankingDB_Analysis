CREATE DATABASE BankingDB;
use BankingDB;

-- Create Table
CREATE TABLE loan_applications (
    application_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    loan_type VARCHAR(50),
    loan_amount DECIMAL(12,2),
    annual_income DECIMAL(12,2),
    credit_score INT,
    risk_score INT
);

-- Insert Records
INSERT INTO loan_applications
(application_id, customer_name, loan_type, loan_amount, annual_income, credit_score, risk_score)
VALUES
(1001, 'Amit Sharma', 'Personal Loan', 500000, 600000, 680, 82),
(1002, 'Priya Patel', 'Home Loan', 3500000, 1200000, 750, 45),
(1003, 'Rahul Verma', 'Auto Loan', 800000, 700000, 690, 70),
(1004, 'Sneha Joshi', 'Personal Loan', 300000, 400000, 620, 90),
(1005, 'Nitin Jain', 'Business Loan', 1500000, 1800000, 710, 55),
(1006, 'Kavita Mehta', 'Education Loan', 600000, 500000, 665, 78),
(1007, 'Arjun Desai', 'Home Loan', 4200000, 1500000, 760, 40),
(1008, 'Pooja Kulkarni', 'Auto Loan', 900000, 850000, 705, 62),
(1009, 'Rohan Gupta', 'Personal Loan', 450000, 550000, 640, 88),
(1010, 'Neha Singh', 'Business Loan', 2000000, 2200000, 730, 50),
(1011, 'Vikram Rao', 'Education Loan', 750000, 650000, 675, 72),
(1012, 'Anjali Nair', 'Home Loan', 2800000, 1100000, 745, 48),
(1013, 'Suresh Iyer', 'Auto Loan', 650000, 720000, 695, 67),
(1014, 'Meera Shah', 'Personal Loan', 250000, 380000, 610, 92),
(1015, 'Karan Malhotra', 'Business Loan', 1750000, 1900000, 720, 53);

-- View Data
SELECT * FROM loan_applications;

SELECT application_id,
       customer_name,
       risk_score,
       RANK() OVER (ORDER BY risk_score DESC) AS risk_rank
FROM loan_applications;

SELECT 
    application_id,
    customer_name,
    loan_type,
    risk_score,
    ROW_NUMBER() OVER (
        PARTITION BY loan_type
        ORDER BY risk_score DESC
    ) AS row_num
FROM loan_applications;

SELECT application_id,
       customer_name,
       loan_amount,
       risk_score,
       SUM(loan_amount) OVER (
           ORDER BY risk_score DESC
       ) AS running_total
FROM loan_applications;

SELECT application_id,
       customer_name,
       risk_score,
       LAG(risk_score) OVER 
       (ORDER BY risk_score DESC) 
       AS previous_risk_score
FROM loan_applications;

SELECT application_id,
       customer_name,
       risk_score,
       LEAD(risk_score) OVER 
       (ORDER BY risk_score DESC) 
       AS next_risk_score
FROM loan_applications;




