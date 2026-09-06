use retail_banking;
-- Q1. How many customers are there in each customer segment?
SELECT segment,
       COUNT(*) AS customer_count
FROM customers
GROUP BY segment
ORDER BY customer_count DESC;
-- Q2. Which cities have the highest number of customers?
SELECT city,
       COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;
-- Q3. How does average annual income differ across customer segments?
SELECT segment,
       ROUND(AVG(annual_income), 2) AS average_annual_income
FROM customers
GROUP BY segment
ORDER BY average_annual_income DESC;
-- Q4. How does the average credit score differ across customer segments?
SELECT segment,
       ROUND(AVG(credit_score), 2) AS average_credit_score
FROM customers
GROUP BY segment
ORDER BY average_credit_score DESC;
-- Q5. How many active and inactive customers are there by KYC status?
SELECT kyc_status,
       is_active,
       COUNT(*) AS customer_count
FROM customers
GROUP BY kyc_status, is_active
ORDER BY kyc_status, is_active;