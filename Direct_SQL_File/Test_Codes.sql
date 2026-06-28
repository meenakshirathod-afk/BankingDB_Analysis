use bankingdb_dir;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO employees VALUES
(1, 'Amit', 'IT', 70000),
(2, 'Neha', 'IT', 90000),
(3, 'Rohit', 'IT', 90000),
(4, 'Sneha', 'IT', 60000),
(5, 'Kiran', 'HR', 50000),
(6, 'Pooja', 'HR', 70000),
(7, 'Raj', 'HR', 70000);

SELECT 
    emp_name,
    dept,
    salary,
    RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rank_val,
    DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS dense_rank_val
FROM employees;


