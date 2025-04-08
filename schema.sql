--DATABASE FOR RETAIL BANKING SYSTEM --

--CUSTOMER TABLE--
CREATE TABLE customers (
    customer_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name varchar2(255) NOT NULL,
    email varchar2(255) NOT NULL,
    address varchar2(255) NOT NULL,
    phone_number varchar2(255) NOT NULL,
    social_insurance_number varchar2(255) NOT NULL UNIQUE,
    nationality varchar2(255),
    age NUMBER NOT NULL,
    gender varchar2(255),
    account_status varchar2(255) NOT NULL,
    PIN NUMBER NOT NULL
);    

insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Prudence Egdal', 'pegdal0@shareasale.com', '19737 Kinsman Street', '527-170-8707', '138-93-0308', 'China', 65, 'Genderfluid', 'Good standing', 5);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Didi Prover', 'dprover1@exblog.jp', '9 Clarendon Lane', '730-933-0605', '441-08-0840', 'China', 9, 'Female', 'Good standing', 5);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Morry Feifer', 'mfeifer2@nasa.gov', '0 Bunting Crossing', '949-639-8327', '258-22-4751', 'Peru', 3, 'Male', 'Bad Standing', 4);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Flint Grzegorecki', 'fgrzegorecki3@printfriendly.com', '1665 Farmco Parkway', '285-474-0468', '197-92-8267', 'Indonesia', 63, 'Male', 'Bad Standing', 4);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Valeria Gulliman', 'vgulliman4@trellian.com', '946 Pepper Wood Trail', '605-660-1832', '758-88-9683', 'Thailand', 28, 'Female', 'Bad Standing', 4);

--Query: Help determine the overall status of customer
SELECT account_status, COUNT(*) AS Customer_Count
FROM customers
GROUP BY account_status
ORDER BY Customer_Count DESC;


SELECT DISTINCT nationality 
FROM customers
ORDER BY nationality;


--BANK TABLE--
CREATE TABLE Bank (
    Bank_Name VARCHAR(100) NOT NULL,
    Branch_Location VARCHAR(100) NOT NULL,
    Transit_No CHAR(5) PRIMARY KEY NOT NULL, 
    Website VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL
);

INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website,  Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '100 King St W, Toronto, ON','00001','www.tmubank.ca','support@tmubank.ca','416-555-1000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website,  Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '200 Bay St, Toronto, ON','00002','www.tmubank.ca', 'support@tmubank.ca', '416-555-2000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '300 Queen St W, Toronto, ON', '00003', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-3000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '400 Front St W, Toronto, ON', '00004', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-4000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '500 Bloor St W, Toronto, ON', '00005', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-5000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('New York Metropolitan Bank', '100 Market St, New York, NY, USA', '00006', 'www.tmubank.ca', 'support@tmubank.ca', '212-555-6000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('London Metropolitan Bank', '200 Oxford St, London, UK', '00007', 'www.tmubank.ca', 'support@tmubank.ca', '+44-20-555-7000');

--query--
SELECT Bank_Name, Branch_Location
FROM Bank
GROUP BY Bank_Name, Branch_Location
ORDER BY Bank_Name ASC;

--Employee--
CREATE TABLE Employee (
    Employee_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Address VARCHAR(255) NOT NULL,
    Phone_Number VARCHAR(15) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR (20) NOT NULL,
    Nationality VARCHAR(50) NOT NULL
);

INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Kale Smooth', 'kale.smooth@tmuBank.com', '123 Cherry St, Toronto, ON', '123-456-7890', 30, 'Male', 'Canadian');
INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Rose Mary', 'rose.mary@tmuBank.com', '456 Derry Rd,  Mississauaga, CA', '987-654-3210', 28, 'Female', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Robert Johnson', 'robert.johnson@tmuBank.com', '789 WoodPine Rd,  Oakville, London', '555-123-4567', 35, 'Male', 'American');
INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Jolly Maez', 'jolly.maez@tmuBank.com', '321 Holiday Blvd,  North York, ON', '444-987-6543', 26, 'Female', 'Mexican');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Casey Jordan', 'casey.jordan@tmuBank.com', '909 Maple Leaf Rd, Toronto, ON', '444-987-6544', 25, 'Non-Binary', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Avery Taylor', 'avery.taylor@tmuBank.com', '121 King St, New York, NY,', '187-654-3214', 31, 'Genderfluid', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Robin Knight', 'robin.knight@tmuBank.com', '99 Oxford Ave, London, UK', '787-654-3445', 28, 'Agender', 'Canadian');

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

DROP VIEW CustomerValidTransactions;


-- CHEQUINGG ACCOUNT TABLE --
CREATE TABLE chequing_accounts (
    customer_id INT, -- Foreign key from customer owning acc
    account_id INT GENERATED ALWAYS AS IDENTITY,
    balance DECIMAL(25, 2) DEFAULT 0,
    account_type VARCHAR2(255),
    PRIMARY KEY (customer_id, account_id), -- Composite key
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(1, 0, 'Student Account');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(2, 0, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(3, 2000, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(4, 50000, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(5, 100000, 'RBC Banking Supreme');

SELECT * FROM chequing_accounts;

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

--SAVINGS ACCOUNT TABLE--
CREATE TABLE savings_accounts (
    customer_id INT, -- Foreign key
    account_id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    balance DECIMAL(25, 2) DEFAULT 0,
    account_type VARCHAR2(255),
    interest_rate DECIMAL(10, 2),
    PRIMARY KEY (customer_id, account_id), -- Composite key
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(1, 0, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(3, 1000, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(4, 5.92, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(5, 6, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(2, 0, 'Economy Account', 0.75);



-- Select all student customer accounts, sort by descending balance
SELECT customer_id, balance, account_type 
FROM savings_accounts 
WHERE account_type = 'Student Account' 
ORDER BY balance DESC;

SELECT DISTINCT balance
FROM savings_accounts
ORDER BY balance;

--CREDIT CARD ACCOUNT TABLE
CREATE TABLE credit_card_accounts (
    customer_id INT,
    balance DECIMAL(25, 2) DEFAULT 0,
    credit_limit INT DEFAULT 2500,
    minimum_payment DECIMAL(25, 2) DEFAULT 10,
    payment_due_date DATE NOT NULL,
    PRIMARY KEY (customer_id, card_number),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (1, 123456789, 0, 2500, 10, TO_DATE('17/12/2015', 'DD/MM/YYYY'), TO_DATE('17/12/2020', 'DD/MM/YYYY'));
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (2, 987654321, 0, 2500, 10, TO_DATE('17/12/2017', 'DD/MM/YYYY'), TO_DATE('17/12/2023', 'DD/MM/YYYY'));
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (3, 287654321, 1000, 10000, 10, TO_DATE('17/12/2027', 'DD/MM/YYYY'), TO_DATE('20/12/2023', 'DD/MM/YYYY'));
INSERT INTO cards(card_number, expiration_date) VALUES (123456789, TO_DATE('17/12/2015', 'DD/MM/YYYY'));
INSERT INTO cards(card_number, expiration_date) VALUES (987654321, TO_DATE('17/12/2017', 'DD/MM/YYYY'));
INSERT INTO cards(card_number, expiration_date) VALUES (287654321, TO_DATE('17/12/2027', 'DD/MM/YYYY'));

CREATE TABLE cards (
    card_number INT PRIMARY KEY,
    expiration_date DATE NOT NULL
);

SELECT * FROM credit_card_accounts;
-- Select all credit cards where the credit limit > 2000, order by descending balance
SELECT customer_id, balance, credit_limit 
FROM credit_card_accounts 
WHERE credit_limit > 2000 
GROUP BY customer_id, balance, credit_limit 
ORDER BY balance DESC;
-- Select all credit cards with a payment due on a certain day
SELECT customer_id, payment_due_date 
FROM credit_card_accounts 
WHERE TRUNC(payment_due_date) = TO_DATE('20/12/2023', 'DD/MM/YYYY');

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

INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (4, 287454321, 10000, 10000, 10, TO_DATE('17/12/2027', 'DD/MM/YYYY'), TO_DATE('20/12/2023', 'DD/MM/YYYY'));

DROP VIEW high_ccas;


--LOANS TABLE --
CREATE TABLE loan (
   customer_id NUMBER, -- Foreign Key
   loan_id NUMBER GENERATED ALWAYS AS IDENTITY UNIQUE,
   principal DECIMAL(25, 2),
   interest DECIMAL(5, 2),
   payment_amount DECIMAL(25, 2),
   status VARCHAR(10) DEFAULT 'inactive' CHECK (status IN ('active', 'inactive', 'closed')),
   PRIMARY KEY (customer_id, loan_id),
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
   
);

INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (1, 50000.00, 5.25, 1200.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (2, 15000.00, 3.20, 450.00, 'active');

-- Select principal from loan table and output the amount in ascending order --
SELECT principal as amount
FROM loan
GROUP BY principal
ORDER BY amount ASC;

-- TRANSACTIONS TABLE--
CREATE TABLE transactions (
  customer_id NUMBER, -- Foreign Key
  transaction_id NUMBER GENERATED ALWAYS AS IDENTITY UNIQUE,
  transaction_date DATE,
  transaction_time TIMESTAMP,
  account_from NUMBER,
  account_to NUMBER,
  transaction_amount DECIMAL(25, 2),
  PRIMARY KEY (customer_id, transaction_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
  
);

INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), SYSTIMESTAMP, 1001, 1025, 1500.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (2, TO_DATE('2024-09-15', 'YYYY-MM-DD'), SYSTIMESTAMP, 1011, 1003, 3000.00);

--Additional data into transactions table--
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (2, TO_DATE('2024-09-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1012, 1023, 5000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (1, TO_DATE('2024-05-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1022, 1028, 2000.00);



-- select transaction date and time and order by date --
SELECT transaction_date, transaction_time
FROM transactions
GROUP BY transaction_date, transaction_time
ORDER BY transaction_date;

--MONTHLY STATEMENT TABLE--
CREATE TABLE monthly_statements (
  customer_id NUMBER, -- Foreign Key
  balance_sheet_id NUMBER GENERATED ALWAYS AS IDENTITY UNIQUE,
  transaction_id NUMBER,
  account_id NUMBER,
  account_type VARCHAR2(255),
  statement_period VARCHAR2(20),
  start_date DATE,
  end_date DATE,
  opening_balance DECIMAL(25, 2),
  closing_balance DECIMAL(25, 2),
  PRIMARY KEY (balance_sheet_id, account_id, customer_id),
  FOREIGN KEY (transaction_id, customer_id) REFERENCES transactions(transaction_id, customer_id)
);

INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (1, 1, 1011, 'CHEQUEING', 'JAN 2024', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 5000.00, 4300.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (2, 2, 1025, 'SAVINGS', 'MARCH 2024', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 10000.00, 6000.00);

--select distinct account type and statement period and order by statement period in ascending order --
SELECT DISTINCT account_type, statement_period
FROM monthly_statements
ORDER BY statement_period ASC;

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

DROP VIEW above_a_thousand;

SELECT * FROM above_a_thousand;


select * from customers
where gender = 'Male';

--Advanced Queries for Assignment 5--

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

--Additional data insertion--
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (3, 90000.00, 5.25, 4500.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (4, 45500.00, 3.42, 1000.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (5, 8000.00, 2.67, 500.00, 'active');

INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (3, TO_DATE('2022-09-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1007, 1003, 2000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (4, TO_DATE('2024-05-02', 'YYYY-MM-DD'), SYSTIMESTAMP, 1033, 1051, 1000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (5, TO_DATE('2023-04-15', 'YYYY-MM-DD'), SYSTIMESTAMP, 1001, 1041, 250.00);

INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (3, 44, 1007, 'SAVINGS', 'SEP 2022', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 10000.00, 8000.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (4, 45, 1033, 'SAVINGS', 'MAY 2024', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), 5000.00, 4000.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (5, 46, 1001, 'SAVINGS', 'APRIL 2023', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 50000.00, 48000.00);

--SELECT TABLES--
SELECT * FROM customers;
SELECT * FROM loan;
SELECT * FROM transactions;
SELECT * FROM monthly_statements;
SELECT * FROM bank;
SELECT * FROM chequing_accounts;
SELECT * FROM savings_accounts;
SELECT * FROM credit_card_accounts;
SELECT * FROM Employee;

--DROP TABLES--
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE loan CASCADE CONSTRAINTS;
DROP TABLE monthly_statements CASCADE CONSTRAINTS;
DROP TABLE transactions CASCADE CONSTRAINTS;
DROP TABLE Bank CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE chequing_accounts CASCADE CONSTRAINTS;
DROP TABLE savings_accounts CASCADE CONSTRAINTS;
DROP TABLE credit_card_accounts CASCADE CONSTRAINTS;
