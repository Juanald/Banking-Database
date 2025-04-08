#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "g29dhali/02242484@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
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

--BANK TABLE--
CREATE TABLE Bank (
    Bank_Name VARCHAR(100) NOT NULL,
    Branch_Location VARCHAR(100) NOT NULL,
    Transit_No CHAR(5) PRIMARY KEY NOT NULL,
    Website VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL
);
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
-- CHEQUINGG ACCOUNT TABLE --
CREATE TABLE chequing_accounts (
    customer_id INT, -- Foreign key from customer owning acc
    account_id INT GENERATED ALWAYS AS IDENTITY,
    balance DECIMAL(25, 2) DEFAULT 0,
    account_type VARCHAR2(255),
    PRIMARY KEY (customer_id, account_id), -- Composite key
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
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

--CREDIT CARD ACCOUNT TABLE
CREATE TABLE credit_card_accounts (
    customer_id INT,
    card_number INT UNIQUE NOT NULL, -- Ideally encrypted but this is a school project
    balance DECIMAL(25, 2) DEFAULT 0,
    credit_limit INT DEFAULT 2500,
    minimum_payment DECIMAL(25, 2) DEFAULT 10,
    expiration_date DATE NOT NULL,
    payment_due_date DATE NOT NULL,
    PRIMARY KEY (customer_id, card_number),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
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
exit;
EOF

