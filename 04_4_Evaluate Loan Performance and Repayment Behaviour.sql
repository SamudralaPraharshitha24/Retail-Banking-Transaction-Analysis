use retail_banking;
-- Q1. How many loans are there for each loan type?
SELECT loan_type,
       COUNT(*) AS loan_count
FROM loans
GROUP BY loan_type
ORDER BY loan_count DESC;
-- Q2. What is the average outstanding balance for each loan type?
SELECT loan_type,
       ROUND(AVG(outstanding_balance), 2) AS average_outstanding_balance
FROM loans
GROUP BY loan_type
ORDER BY average_outstanding_balance DESC;
-- Q3. What is the distribution of loans across different loan statuses?
SELECT loan_status,
       COUNT(*) AS loan_count
FROM loans
GROUP BY loan_status
ORDER BY loan_count DESC;
-- Q4. Which payment methods are used most frequently by customers?
SELECT payment_method,
       COUNT(*) AS payment_count
FROM loan_payments
GROUP BY payment_method
ORDER BY payment_count DESC;
-- Q5. Which loans show the highest average repayment delays?
SELECT loan_id,
       ROUND(AVG(days_late), 2) AS average_days_late,
       ROUND(SUM(penalty), 2) AS total_penalty
FROM loan_payments
GROUP BY loan_id
HAVING AVG(days_late) > 0
ORDER BY average_days_late DESC
LIMIT 5;