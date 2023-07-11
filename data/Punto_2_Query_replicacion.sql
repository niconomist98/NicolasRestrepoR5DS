-------------------Query de replicacion----------------------
WITH totals AS (
  SELECT
    monthh,
    weekofmonth,
    dayofweek,
    COUNT(*) AS total_transactions,
    COUNT(*) FILTER (WHERE FraudFound_P = 1) AS total_fraudulent
  FROM fraudes
  GROUP BY monthh, weekofmonth, dayofweek
),
fraud_month AS (
  SELECT
    monthh,
    COUNT(*) AS total_transactions_month,
    COUNT(*) FILTER (WHERE FraudFound_P = 1) AS total_fraudulent_month
  FROM fraudes
  GROUP BY monthh
),
fraud_week AS (
  SELECT
    monthh,
    weekofmonth,
    COUNT(*) AS total_transactions_week,
    COUNT(*) FILTER (WHERE FraudFound_P = 1) AS total_fraudulent_week
  FROM fraudes
  GROUP BY monthh, weekofmonth
)
SELECT
  t.monthh,
  t.weekofmonth,
  t.dayofweek,
  CAST(fm.total_fraudulent_month::numeric / fm.total_transactions_month::numeric * 100.0 AS numeric(10,2) )AS percentage_fraud_month,
  CAST(fw.total_fraudulent_week::numeric / fw.total_transactions_week::numeric * 100.0 AS numeric(10, 2)) AS percentage_fraud_month_week,
  CAST(t.total_fraudulent::numeric / t.total_transactions::numeric * 100.0 AS numeric(10, 2)) AS percentage_fraud_month_week_day
FROM totals t
JOIN fraud_month fm ON t.monthh = fm.monthh
JOIN fraud_week fw ON t.monthh = fw.monthh AND t.weekofmonth = fw.weekofmonth
ORDER BY t.monthh, t.weekofmonth;


