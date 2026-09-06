use retail_banking;
-- 1. What are the different card types and how many cards are available for each type?
SELECT card_type, COUNT(*) AS card_count
FROM cards
GROUP BY card_type
ORDER BY card_count DESC;

-- 2.What is the average credit limit and outstanding balance for each card type?
SELECT
    card_type,
    AVG(credit_limit) AS avg_credit_limit,
    AVG(outstanding_balance) AS avg_outstanding_balance
FROM cards
GROUP BY card_type;

-- 3.How many active and inactive cards are there?
SELECT
    is_active,
    COUNT(*) AS card_count
FROM cards
GROUP BY is_active;

-- 4.What is the average reward points for each card type?
SELECT
    card_type,
    AVG(reward_points) AS avg_reward_points
FROM cards
GROUP BY card_type
ORDER BY avg_reward_points DESC;

-- 5.How many cards are linked to each account?
SELECT
    account_id,
    COUNT(*) AS card_count
FROM cards
GROUP BY account_id
ORDER BY card_count DESC;