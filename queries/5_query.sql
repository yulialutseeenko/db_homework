SELECT m.id,m.title,m.release_date,m.duration,m.description, 
json_build_object('id', f.id,'file_name', f.file_name,'mime_type', f.mime_type,'url', f.url) 
AS "Poster", 
json_build_object('id',p.id,'first_name', p.first_name,'last_name', p.last_name) 
AS "Director" 
FROM Movies m 
JOIN Movies_Genres mg ON mg.movie_id = m.id 
JOIN Genres g ON g.id=mg.genre_id 
JOIN Files f ON f.id=m.poster_id 
JOIN Persons p ON p.id=m.director_id 
WHERE m.country_id=1 
AND m.release_date >= '2022-01-01' 
AND m.duration>135 
AND (g.name='Action' OR g.name='Drama')
GROUP BY 
    m.id, f.id, p.id;
