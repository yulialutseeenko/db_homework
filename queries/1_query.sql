SELECT p.id,p.first_name,p.last_name,SUM(m.budget) as "total movies budget"
FROM Persons p 
JOIN Movies_Cast mc ON mc.actor_id=p.id
JOIN Movies m ON m.id=mc.movie_id
GROUP BY p.id, p.first_name, p.last_name
ORDER BY "general budget of films" Desc;
