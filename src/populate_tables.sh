#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "g29dhali/02242484@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Prudence Egdal', 'pegdal0@shareasale.com', '19737 Kinsman Street', '527-170-8707', '138-93-0308', 'China', 65, 'Genderfluid', 'Good standing', 5);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Didi Prover', 'dprover1@exblog.jp', '9 Clarendon Lane', '730-933-0605', '441-08-0840', 'China', 9, 'Female', 'Good standing', 5);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Morry Feifer', 'mfeifer2@nasa.gov', '0 Bunting Crossing', '949-639-8327', '258-22-4751', 'Peru', 3, 'Male', 'Bad Standing', 4);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Flint Grzegorecki', 'fgrzegorecki3@printfriendly.com', '1665 Farmco Parkway', '285-474-0468', '197-92-8267', 'Indonesia', 63, 'Male', 'Bad Standing', 4);
insert into customers (customer_name, email, address, phone_number, social_insurance_number, nationality, age, gender, account_status, PIN) values ('Valeria Gulliman', 'vgulliman4@trellian.com', '946 Pepper Wood Trail', '605-660-1832', '758-88-9683', 'Thailand', 28, 'Female', 'Bad Standing', 4);
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website,  Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '100 King St W, Toronto, ON','00001','www.tmubank.ca','support@tmubank.ca','416-555-1000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website,  Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '200 Bay St, Toronto, ON','00002','www.tmubank.ca', 'support@tmubank.ca', '416-555-2000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '300 Queen St W, Toronto, ON', '00003', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-3000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '400 Front St W, Toronto, ON', '00004', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-4000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('Toronto Metropolitan Bank', '500 Bloor St W, Toronto, ON', '00005', 'www.tmubank.ca', 'support@tmubank.ca', '416-555-5000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('New York Metropolitan Bank', '100 Market St, New York, NY, USA', '00006', 'www.tmubank.ca', 'support@tmubank.ca', '212-555-6000');
INSERT INTO Bank (Bank_Name, Branch_Location, Transit_No, Website, Email, Contact_Number) VALUES ('London Metropolitan Bank', '200 Oxford St, London, UK', '00007', 'www.tmubank.ca', 'support@tmubank.ca', '+44-20-555-7000');
INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Kale Smooth', 'kale.smooth@tmuBank.com', '123 Cherry St, Toronto, ON', '123-456-7890', 30, 'Male', 'Canadian');
INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Rose Mary', 'rose.mary@tmuBank.com', '456 Derry Rd,  Mississauaga, CA', '987-654-3210', 28, 'Female', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Robert Johnson', 'robert.johnson@tmuBank.com', '789 WoodPine Rd,  Oakville, London', '555-123-4567', 35, 'Male', 'American');
INSERT INTO Employee ( Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Jolly Maez', 'jolly.maez@tmuBank.com', '321 Holiday Blvd,  North York, ON', '444-987-6543', 26, 'Female', 'Mexican');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Casey Jordan', 'casey.jordan@tmuBank.com', '909 Maple Leaf Rd, Toronto, ON', '444-987-6544', 25, 'Non-Binary', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Avery Taylor', 'avery.taylor@tmuBank.com', '121 King St, New York, NY,', '187-654-3214', 31, 'Genderfluid', 'Canadian');
INSERT INTO Employee (Employee_Name, Email, Address, Phone_Number, Age, Gender, Nationality) VALUES ('Robin Knight', 'robin.knight@tmuBank.com', '99 Oxford Ave, London, UK', '787-654-3445', 28, 'Agender', 'Canadian');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(1, 0, 'Student Account');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(2, 0, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(3, 2000, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(4, 50000, 'RBC Banking');
INSERT INTO chequing_accounts (customer_id, balance, account_type) VALUES(5, 100000, 'RBC Banking Supreme');
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(1, 0, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(3, 1000, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(4, 5.92, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(5, 6, 'Student Account', 0.25);
INSERT INTO savings_accounts (customer_id, balance, account_type, interest_rate) VALUES(2, 0, 'Economy Account', 0.75);
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (1, 123456789, 0, 2500, 10, TO_DATE('17/12/2015', 'DD/MM/YYYY'), TO_DATE('17/12/2020', 'DD/MM/YYYY'));
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (2, 987654321, 0, 2500, 10, TO_DATE('17/12/2017', 'DD/MM/YYYY'), TO_DATE('17/12/2023', 'DD/MM/YYYY'));
INSERT INTO credit_card_accounts (customer_id, card_number, balance, credit_limit, minimum_payment, expiration_date, payment_due_date) VALUES (3, 287654321, 1000, 10000, 10, TO_DATE('17/12/2027', 'DD/MM/YYYY'), TO_DATE('20/12/2023', 'DD/MM/YYYY'));
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (1, 50000.00, 5.25, 1200.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (2, 15000.00, 3.20, 450.00, 'active');
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), SYSTIMESTAMP, 1001, 1025, 1500.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (2, TO_DATE('2024-09-15', 'YYYY-MM-DD'), SYSTIMESTAMP, 1011, 1003, 3000.00);

--Additional data into transactions table--
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (2, TO_DATE('2024-09-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1012, 1023, 5000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (1, TO_DATE('2024-05-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1022, 1028, 2000.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (1, 1, 1011, 'CHEQUEING', 'JAN 2024', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-31', 'YYYY-MM-DD'), 5000.00, 4300.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (2, 2, 1025, 'SAVINGS', 'MARCH 2024', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), 10000.00, 6000.00);
--Additional data insertion--
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (3, 90000.00, 5.25, 4500.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (4, 45500.00, 3.42, 1000.00, 'active');
INSERT INTO loan (customer_id, principal, interest, payment_amount, status) VALUES (5, 8000.00, 2.67, 500.00, 'active');

INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (3, TO_DATE('2022-09-20', 'YYYY-MM-DD'), SYSTIMESTAMP, 1007, 1003, 2000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (4, TO_DATE('2024-05-02', 'YYYY-MM-DD'), SYSTIMESTAMP, 1033, 1051, 1000.00);
INSERT INTO transactions (customer_id, transaction_date, transaction_time, account_from, account_to, transaction_amount) VALUES (5, TO_DATE('2023-04-15', 'YYYY-MM-DD'), SYSTIMESTAMP, 1001, 1041, 250.00);

INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (3, 5, 1007, 'SAVINGS', 'SEP 2022', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'), 10000.00, 8000.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (4, 6, 1033, 'SAVINGS', 'MAY 2024', TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), 5000.00, 4000.00);
INSERT INTO monthly_statements (customer_id, transaction_id, account_id, account_type, statement_period, start_date, end_date, opening_balance, closing_balance) VALUES (5, 7, 1001, 'SAVINGS', 'APRIL 2023', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-30', 'YYYY-MM-DD'), 50000.00, 48000.00);

