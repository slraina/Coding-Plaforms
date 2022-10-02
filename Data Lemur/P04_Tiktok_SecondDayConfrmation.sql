-- Link = https://datalemur.com/questions/second-day-confirmation

SELECT e.user_id
FROM emails e
JOIN texts t
  ON e.email_id = t.email_id AND 
    (DATE_PART('day',action_date::timestamp-signup_date::timestamp)= 1 
    AND signup_action = 'Confirmed');
