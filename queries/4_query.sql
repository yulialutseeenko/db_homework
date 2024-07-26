SELECT m.director_id,CONCAT(p.first_name, ' ', p.last_name) AS "Director name",Round(AVG(m.budget),2) AS "Average budget" 
FROM Movies m 
JOIN Persons p ON p.id=m.director_id 
GROUP BY m.director_id,p.last_name,p.first_name
ORDER BY "Average budget" DESC;
