
---------------------------------------------------------------------------------------------------------------------------------
-- Total Transactions vs Fraud
SELECT
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_transactions,
COUNT(*) - SUM(Class) AS normal_transactions,
ROUND(SUM(Class)/COUNT(*) * 100,2) AS fraud_percentage
FROM fraudset;

-- Fraud percentage is 0.17% with Normal Transactions been 283253 and Fraud Transactions been 473
---------------------------------------------------------------------------------------------------------------------------------

-- Fraud by Transaction Amount Range
SELECT
CASE
WHEN Amount < 50 THEN '0-50'
WHEN Amount < 100 THEN '50-100'
WHEN Amount < 500 THEN '100-500'
ELSE '500+'
END AS amount_range,
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_transactions
FROM fraudset
GROUP BY amount_range
ORDER BY amount_range;

-- Out of 473, 292 fraud transactions are between amount range 0 to 50 and 91 fraud transactions are between amount range 100-500
----------------------------------------------------------------------------------------------------------------------------------
-- Fraud Trend Over Time
SELECT
ROUND(Time/3600) AS hour,
COUNT(*) AS total_transactions,
SUM(Class) AS fraud_transactions
FROM fraudset
GROUP BY hour
ORDER BY fraud_transactions desc;

-- Fraud is not evenly distributed over time.
-- Highest fraud hours:
-- hour 11
-- hour 26
-- hour 2
-- hour 12
---------------------------------------------------------------------------------------------------------------------------------
-- Average Transaction Amount
SELECT
Class,
AVG(Amount) AS avg_transaction_amount,
MAX(Amount) AS max_transaction,
MIN(Amount) AS min_transaction
FROM fraudset
GROUP BY Class;

-- Average fraudulent transaction amount is 124, with maximum transaction amount been 25691
-- and aaverage non fraudulent transaction amount is 88, with maximum transaction amount been 2125
---------------------------------------------------------------------------------------------------------------------------------
-- Fraud Rate by Amount
SELECT
ROUND(Amount,0) AS amount,
COUNT(*) total_transactions,
SUM(Class) fraud_transactions,
ROUND(SUM(Class)/COUNT(*)*100,2) fraud_rate
FROM fraudset
GROUP BY amount
HAVING total_transactions > 10 AND fraud_transactions > 0
ORDER BY fraud_rate DESC;

-- Certain transaction amounts show disproportionately high fraud rates, indicating potential patterns in fraudulent transaction strategies or automated attack behavior.
-------------------------------------------------------------------------------------------------------------------------------------
-- Top Suspicious Transactions
SELECT
ROUND(Time/3600,0),
Amount,
Class
FROM fraudset
WHERE Class = 1
ORDER BY Amount DESC
-- The largest fraudulent transactions significantly exceed typical transaction amounts, suggesting that attackers may escalate to larger purchases after successfully validating stolen card details.
----------------------------------------------------------------------------------------------------------------------------------------