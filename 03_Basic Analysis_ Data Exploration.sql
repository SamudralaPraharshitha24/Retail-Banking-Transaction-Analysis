use retail_banking;
-- 11. What is the total number of customers?
SELECT COUNT(*) AS Total_Customers
FROM customers;
-- 12. What is the total number of accounts?
SELECT COUNT(*) AS Total_Accounts
FROM accounts;
-- 13. What are the different account types available?
SELECT DISTINCT Account_Type
FROM accounts;
-- 14. How many customers are currently active?
SELECT COUNT(*) AS Active_Customers
FROM customers
WHERE is_active = 'Yes';
-- 15. What are the different transaction types available?
SELECT DISTINCT Transaction_Type
FROM transactions;
-- 16. What is the total amount of completed transactions?
SELECT SUM(amount) AS Total_Completed_Transaction_Amount
FROM transactions
WHERE status = 'Completed';
-- 17. What are the different loan types available?
SELECT DISTINCT Loan_Type
FROM loans;
-- 18. What is the total number of loans?
SELECT COUNT(*) AS Total_Loans
FROM loans;
-- 19. What are the different card types available?
SELECT DISTINCT Card_Type
FROM cards;
-- 20. What is the total outstanding loan balance?
SELECT SUM(Outstanding_Balance) AS Total_Outstanding_Loan_Balance
FROM loans;