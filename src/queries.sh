#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "g29dhali/02242484@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
--Query: Help determine the overall status of customer
SELECT account_status, COUNT(*) AS Customer_Count
FROM customers
GROUP BY account_status
ORDER BY Customer_Count DESC;

SELECT DISTINCT nationality 
FROM customers
ORDER BY nationality;
--query--
SELECT Bank_Name, Branch_Location
FROM Bank
GROUP BY Bank_Name, Branch_Location
ORDER BY Bank_Name ASC;
SELECT Gender, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Gender
ORDER BY Employee_Count DESC;

SELECT customers.customer_name,customers.customer_id, chequing_accounts.account_id, chequing_accounts.balance, transactions.transaction_id, 
transactions.transaction_amount 
FROM customers
JOIN chequing_accounts ON customers.customer_id = chequing_accounts.customer_id
JOIN transactions ON customers.customer_id = transactions.customer_id;


CREATE VIEW CustomerValidTransactions AS
SELECT customers.customer_name,customers.customer_id, chequing_accounts.account_id, chequing_accounts.balance, transactions.transaction_id, transactions.transaction_amount 
FROM customers
JOIN chequing_accounts ON customers.customer_id = chequing_accounts.customer_id
JOIN transactions ON customers.customer_id = transactions.customer_id;

SELECT * 
FROM CustomerValidTransactions
WHERE balance < transaction_amount;

-- Select all customers who have a higher chequing balance than 25 000, in descending order
SELECT customer_id, balance 
FROM chequing_accounts 
WHERE balance > 25000 
ORDER BY balance DESC;

-- Select all customers who have a higher chequing balance than 25 000, sums up the total balance for each account_type and outputs it in descending order --
SELECT account_type, SUM(balance) AS total_balance
FROM chequing_accounts
WHERE balance > 25000 
GROUP BY account_type 
ORDER BY total_balance DESC;

-- Select all student customer accounts, sort by descending balance
SELECT customer_id, balance, account_type 
FROM savings_accounts 
WHERE account_type = 'Student Account' 
ORDER BY balance DESC;

SELECT DISTINCT balance
FROM savings_accounts
ORDER BY balance;

-- Select all people who have a chequing account, savings, and credit card account, show name and balance
SELECT  c.customer_id, c.customer_name, chequing_accounts.balance AS chequing_balance, cca.balance AS credit_card_balance, 
sa.balance AS savings_balance FROM customers c
JOIN chequing_accounts ON c.customer_id = chequing_accounts.customer_id
JOIN credit_card_accounts cca ON c.customer_id = cca.customer_id
JOIN savings_accounts sa ON c.customer_id = sa.customer_id;

-- View define a virtual table, used like a real table. Here is a view that lists customers with a high balance
CREATE VIEW high_ccas AS
SELECT c.customer_id, c.customer_name, cca.balance FROM customers c JOIN credit_card_accounts cca
ON c.customer_id = cca.customer_id WHERE cca.balance > 2500;

SELECT * FROM high_ccas;

-- Select principal from loan table and output the amount in ascending order --
SELECT principal as amount
FROM loan
GROUP BY principal
ORDER BY amount ASC;
-- select transaction date and time and order by date --
SELECT transaction_date, transaction_time
FROM transactions
GROUP BY transaction_date, transaction_time
ORDER BY transaction_date;
--Joint Query--
SELECT transactions.transaction_date, transactions.transaction_amount, customers.customer_name, monthly_statements.account_type, monthly_statements.opening_balance, monthly_statements.closing_balance
FROM transactions
JOIN customers on transactions.customer_id = customers.customer_id
JOIN monthly_statements on transactions.transaction_id = monthly_statements.transaction_id;


--Queries to update the monthly_statement's closing balance to match the transaction history--
UPDATE monthly_statements
SET closing_balance = 3500.00
WHERE customer_id = 1;

UPDATE monthly_statements
SET closing_balance = 7000
WHERE customer_id = 2;
--View to show all transactions above 1000 dollars--
CREATE VIEW Above_A_Thousand AS
SELECT transactions.transaction_amount, transactions.transaction_date, customers.customer_name
FROM transactions
JOIN customers on transactions.customer_id = customers.customer_id
WHERE transactions.transaction_amount > 1000;
SELECT * FROM above_a_thousand;
-- Select all customers who have a savings account interest rate above average
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM savings_accounts sa
    WHERE sa.customer_id = c.customer_id
      AND sa.interest_rate > (SELECT AVG(interest_rate) FROM savings_accounts)
);

-- Select all credit card accounts that have a lower average balance than the average for credit card accounts
SELECT c.customer_id, c.customer_name, AVG(cca.balance) AS Avg_CCA_Balance
FROM credit_card_accounts cca
JOIN customers c ON c.customer_id = cca.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING AVG(cca.balance) < (
    SELECT AVG(balance)
    FROM credit_card_accounts
);



--Select customers who are not from China and have sufficient funds in their account and/or made a transaction below 2000--
SELECT c.customer_id, c.customer_name, t.transaction_amount AS amount, 'Transaction below 2000' AS source
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE c.nationality != 'China'
  AND t.transaction_amount < 2000
UNION
SELECT c.customer_id, c.customer_name, ms.closing_balance AS amount, 'Account with sufficient funds' AS source
FROM customers c
JOIN monthly_statements ms ON c.customer_id = ms.customer_id
WHERE c.nationality != 'China'
  AND ms.closing_balance > 5000;


--Select all customers whose combined savings and chequing account balances do not indicate financial stability, but were still granted loan.--
SELECT c.customer_id, c.customer_name, ca.balance AS chequing_balance, s.balance AS savings_balance, l.principal
FROM customers c
JOIN chequing_accounts ca ON c.customer_id = ca.customer_id
JOIN savings_accounts s ON c.customer_id = s.customer_id
JOIN loan l ON c.customer_id = l.customer_id
WHERE (s.balance + ca.balance) < 3000
AND l.status = 'active';

--Counts the number of active loans of each customer and displays it from lowest to highest principal amount--
SELECT loan_id, principal, status, COUNT(customer_id) AS Active_loans
FROM loan
GROUP BY loan_id, principal, status
ORDER BY principal ASC;

--List all customers (customer ID, name, and gender only) who are not male.
SELECT customer_id, customer_name, gender
FROM Customers
MINUS
SELECT customer_id, customer_name, gender
FROM Customers
WHERE Gender = 'Male';

-- List all customers (customer ID, age, and name only) who have both chequing and savings accounts but do not have any loans, ordered by age in descending order.
SELECT c.customer_id, c.age, c.customer_name
FROM Customers c
JOIN chequing_accounts a1 ON c.customer_id = a1.customer_id
JOIN savings_accounts a2 ON c.customer_id = a2.customer_id
WHERE NOT EXISTS (
    SELECT 1
    FROM loan a3  
    WHERE a3.customer_id = c.customer_id
)
ORDER BY c.age DESC;

