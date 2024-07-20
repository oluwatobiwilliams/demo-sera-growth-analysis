/* Data Analysis in SQL */

-- Q1. How many transactions occurred?
SELECT COUNT(*) FROM sera.sales;

-- Q3. Show the transaction count by status along with percentage of total
SELECT status,
COUNT(*) AS count,
ROUND((COUNT(*)*1.0/MAX(total_transactions))*100,2) AS perc_total
FROM (
	SELECT transaction_id,
	status,
	COUNT(transaction_id) OVER () AS total_transactions
	FROM sera.sales
)
GROUP BY status;

-- Q6. How many subscribers are there in total? 
SELECT COUNT(DISTINCT user_id) 
FROM sera.sales
WHERE status = 'success'; 