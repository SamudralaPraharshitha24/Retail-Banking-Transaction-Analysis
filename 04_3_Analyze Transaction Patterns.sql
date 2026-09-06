use retail_banking;
-- Q1. Which transaction types are most common?
SELECT transaction_type,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;
-- Q2. Which transaction channels are used most frequently?
SELECT channel,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY channel
ORDER BY transaction_count DESC;
-- Q3. What is the average transaction amount for each transaction type?
SELECT transaction_type,
       ROUND(AVG(amount), 2) AS average_transaction_amount
FROM transactions
GROUP BY transaction_type
ORDER BY average_transaction_amount DESC;
-- Q4. Which months had the highest number of transactions?
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY transaction_count DESC
LIMIT 5;
-- Q5. Which accounts have the highest number of transactions?
SELECT account_id,
       COUNT(*) AS transaction_count
FROM transactions
GROUP BY account_id
ORDER BY transaction_count DESC
LIMIT 5;