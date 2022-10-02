-- Link = https://datalemur.com/questions/sql-third-transaction

WITH atn AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) as txns
FROM transactions
)SELECT user_id,	spend,	transaction_date
FROM atn 
WHERE txns = 3
;
