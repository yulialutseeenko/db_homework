SELECT u.id,u.username,ARRAY_AGG(DISTINCT m.movie_id) AS "favorite_movie_ids" 
FROM users u 
JOIN Favorites_Movies m ON m.user_id=u.id 
GROUP BY u.id, u.username;
