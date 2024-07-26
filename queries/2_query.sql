SELECT m.id,m.title,COUNT(mc.actor_id) AS "actors count" 
FROM movies m
JOIN Movies_Cast mc ON m.id=mc.movie_id 
WHERE m.release_date >= CURRENT_DATE - INTERVAL '5 years' 
GROUP BY m.id,m.title
ORDER BY "actors count" DESC;
