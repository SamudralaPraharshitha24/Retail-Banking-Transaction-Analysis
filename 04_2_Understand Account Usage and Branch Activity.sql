use retail_banking;
-- Q1. How many accounts are there for each account type?
SELECT account_type,
       COUNT(*) AS account_count
FROM accounts
GROUP BY account_type
ORDER BY account_count DESC;
-- Q2. What is the average current balance for each account type?
SELECT account_type,
       ROUND(AVG(current_balance), 2) AS average_balance
FROM accounts
GROUP BY account_type
ORDER BY average_balance DESC;
-- Q3. Which branches have the highest number of accounts?
SELECT b.branch_id,
       b.branch_name,
       b.city,
       COUNT(a.account_id) AS account_count
FROM accounts a
JOIN branches b
    ON a.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name, b.city
ORDER BY account_count DESC
LIMIT 5;
-- Q4. How does the average interest rate differ across account types?
SELECT account_type,
       ROUND(AVG(interest_rate), 2) AS average_interest_rate
FROM accounts
GROUP BY account_type
ORDER BY average_interest_rate DESC;
-- Q5. How many active and closed accounts are there?
SELECT status,
       COUNT(*) AS account_count
FROM accounts
GROUP BY status
ORDER BY account_count DESC;