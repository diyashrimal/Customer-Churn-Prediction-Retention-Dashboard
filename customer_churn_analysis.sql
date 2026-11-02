
-- 1. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Overall churn count and percentage
SELECT
    Churn,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY Churn;

-- 3. Churn by contract
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 4. Churn by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- 5. Churn by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- 6. Average tenure and monthly charges by churn
SELECT
    Churn,
    COUNT(*) AS total_customers,
    ROUND(AVG(tenure), 2) AS average_tenure,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customers
GROUP BY Churn;

-- 7. Churn by contract and payment method
SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Contract, PaymentMethod
HAVING COUNT(*) >= 50
ORDER BY churn_rate DESC;
