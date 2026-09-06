use retail_banking;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    customer_since DATE,
    kyc_status VARCHAR(20),
    segment VARCHAR(30),
    annual_income DECIMAL(15,2),
    credit_score INT,
    is_active BOOLEAN
);
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    opening_date DATE,
    employee_count INT
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(30),
    open_date DATE,
    close_date DATE,
    current_balance DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    overdraft_limit DECIMAL(15,2),
    status VARCHAR(20),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    loan_type VARCHAR(30),
    principal_amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    tenure_months INT,
    disbursement_date DATE,
    maturity_date DATE,
    emi_amount DECIMAL(15,2),
    outstanding_balance DECIMAL(15,2),
    loan_status VARCHAR(30),
    purpose VARCHAR(50),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_time TIME,
    transaction_type VARCHAR(30),
    amount DECIMAL(15,2),
    channel VARCHAR(30),
    description VARCHAR(50),
    balance_after DECIMAL(15,2),
    status VARCHAR(20),

    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    account_id INT,
    card_type VARCHAR(20),
    issue_date DATE,
    expiry_date DATE,
    credit_limit DECIMAL(12,2),
    outstanding_balance DECIMAL(12,2),
    reward_points INT,
    is_active VARCHAR(3),
    network VARCHAR(20),

    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
CREATE TABLE loan_payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    scheduled_amount DECIMAL(15,2),
    paid_amount DECIMAL(15,2),
    principal_paid DECIMAL(15,2),
    interest_paid DECIMAL(15,2),
    penalty DECIMAL(15,2),
    days_late INT,
    payment_method VARCHAR(30),
    status VARCHAR(20),

    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
ALTER TABLE customers
MODIFY customer_id VARCHAR(20) NOT NULL,
ADD PRIMARY KEY (customer_id);

ALTER TABLE branches
MODIFY branch_id VARCHAR(10) NOT NULL,
ADD PRIMARY KEY (branch_id);

SET SQL_SAFE_UPDATES = 0;
UPDATE accounts
SET close_date = NULL
WHERE close_date = '';
UPDATE accounts
SET open_date = NULL
WHERE open_date = '';
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE accounts
MODIFY account_id VARCHAR(20) NOT NULL,
MODIFY customer_id VARCHAR(20),
MODIFY branch_id VARCHAR(10),
MODIFY account_type VARCHAR(30),
MODIFY open_date DATE,
MODIFY close_date DATE,
MODIFY current_balance DECIMAL(15,2),
MODIFY interest_rate DECIMAL(5,2),
MODIFY overdraft_limit DECIMAL(15,2),
MODIFY status VARCHAR(20),
ADD PRIMARY KEY (account_id);

ALTER TABLE loans
MODIFY loan_id VARCHAR(20) NOT NULL,
MODIFY customer_id VARCHAR(20),
MODIFY branch_id VARCHAR(10),
MODIFY loan_type VARCHAR(30),
MODIFY principal_amount DECIMAL(15,2),
MODIFY interest_rate DECIMAL(5,2),
MODIFY tenure_months INT,
MODIFY disbursement_date DATE,
MODIFY maturity_date DATE,
MODIFY emi_amount DECIMAL(15,2),
MODIFY outstanding_balance DECIMAL(15,2),
MODIFY loan_status VARCHAR(30),
MODIFY purpose VARCHAR(50),
ADD PRIMARY KEY (loan_id);

SET SQL_SAFE_UPDATES = 0;
UPDATE transactions
SET transaction_date = NULL
WHERE transaction_date = '';
UPDATE transactions
SET transaction_time = NULL
WHERE transaction_time = '';
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE transactions
MODIFY transaction_id VARCHAR(20) NOT NULL,
MODIFY account_id VARCHAR(20),
MODIFY transaction_date DATE,
MODIFY transaction_time TIME,
MODIFY transaction_type VARCHAR(30),
MODIFY amount DECIMAL(15,2),
MODIFY channel VARCHAR(30),
MODIFY description VARCHAR(50),
MODIFY balance_after DECIMAL(15,2),
MODIFY status VARCHAR(20),
ADD PRIMARY KEY (transaction_id);

ALTER TABLE cards
MODIFY card_id VARCHAR(20) NOT NULL,
MODIFY account_id VARCHAR(20),
MODIFY card_type VARCHAR(20),
MODIFY issue_date DATE,
MODIFY expiry_date DATE,
MODIFY credit_limit DECIMAL(12,2),
MODIFY outstanding_balance DECIMAL(12,2),
MODIFY reward_points INT,
MODIFY is_active VARCHAR(3),
MODIFY network VARCHAR(20),
ADD PRIMARY KEY (card_id);

ALTER TABLE loan_payments
MODIFY payment_id VARCHAR(20) NOT NULL,
MODIFY loan_id VARCHAR(20),
MODIFY payment_date DATE,
MODIFY scheduled_amount DECIMAL(15,2),
MODIFY paid_amount DECIMAL(15,2),
MODIFY principal_paid DECIMAL(15,2),
MODIFY interest_paid DECIMAL(15,2),
MODIFY penalty DECIMAL(15,2),
MODIFY days_late INT,
MODIFY payment_method VARCHAR(30),
MODIFY status VARCHAR(20),
ADD PRIMARY KEY (payment_id);

ALTER TABLE accounts
ADD CONSTRAINT fk_accounts_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE accounts
ADD CONSTRAINT fk_accounts_branches
FOREIGN KEY (branch_id) REFERENCES branches(branch_id);

ALTER TABLE loans
ADD CONSTRAINT fk_loans_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE loans
ADD CONSTRAINT fk_loans_branches
FOREIGN KEY (branch_id) REFERENCES branches(branch_id);

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_accounts
FOREIGN KEY (account_id) REFERENCES accounts(account_id);

ALTER TABLE cards
ADD CONSTRAINT fk_cards_accounts
FOREIGN KEY (account_id) REFERENCES accounts(account_id);

ALTER TABLE loan_payments
ADD CONSTRAINT fk_loan_payments_loans
FOREIGN KEY (loan_id) REFERENCES loans(loan_id);

ALTER TABLE customers
MODIFY first_name VARCHAR(50),
MODIFY last_name VARCHAR(50),
MODIFY date_of_birth DATE,
MODIFY gender VARCHAR(20),
MODIFY city VARCHAR(50),
MODIFY state VARCHAR(50),
MODIFY customer_since DATE,
MODIFY kyc_status VARCHAR(20),
MODIFY segment VARCHAR(30),
MODIFY annual_income DECIMAL(15,2),
MODIFY credit_score INT,
MODIFY is_active VARCHAR(3);

ALTER TABLE branches
MODIFY branch_name VARCHAR(100),
MODIFY city VARCHAR(50),
MODIFY state VARCHAR(50),
MODIFY region VARCHAR(50),
MODIFY opening_date DATE,
MODIFY employee_count INT;

SHOW TABLES;
SELECT COUNT(*)  FROM customers;
SELECT COUNT(*) FROM accounts;
SELECT COUNT(*) FROM branches;
SELECT COUNT(*)  FROM loans;
SELECT COUNT(*) FROM cards;
SELECT COUNT(*) FROM loan_payments;
SELECT COUNT(*) FROM transactions;