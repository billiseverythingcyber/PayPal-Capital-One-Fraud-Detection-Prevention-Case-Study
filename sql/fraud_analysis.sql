-- 1. Overall fraud rate
SELECT
    COUNT(*) AS total_transactions,
    SUM(label) AS total_fraud,
    (SUM(label) * 1.0 / COUNT(*)) AS fraud_rate
FROM transactions;


-- 2. Fraud rate by location
SELECT
    location,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_transactions,
    (SUM(label) * 1.0 / COUNT(*)) AS fraud_rate
FROM transactions
GROUP BY location
ORDER BY fraud_rate DESC;


-- 3. Fraud rate by hour of the day
SELECT
    EXTRACT(HOUR FROM timestamp) AS hour_of_day,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_transactions,
    (SUM(label) * 1.0 / COUNT(*)) AS fraud_rate
FROM transactions
GROUP BY hour_of_day
ORDER BY hour_of_day;


-- 4. Fraud rate for large vs normal transactions
SELECT
    CASE WHEN transaction_amount > 500 THEN 'large' ELSE 'normal' END AS amount_bucket,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_transactions,
    (SUM(label) * 1.0 / COUNT(*)) AS fraud_rate
FROM transactions
GROUP BY amount_bucket
ORDER BY fraud_rate DESC;


-- 5. High-risk merchants (merchant IDs appearing in fraud frequently)
SELECT
    merchant_id,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_transactions,
    (SUM(label) * 1.0 / COUNT(*)) AS fraud_rate
FROM transactions
GROUP BY merchant_id
HAVING COUNT(*) > 1     -- adjust this threshold as needed
ORDER BY fraud_rate DESC;
