SELECT page_id 
FROM pages 
WHERE page_id NOT IN(SELECT DISTINCT page_id FROM page_likes);
