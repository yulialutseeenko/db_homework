WITH Actor_Details AS (
    SELECT 
        mc.movie_id,
        json_agg(json_build_object(
            'ID', p.id,
            'First name', p.first_name,
            'Last name', p.last_name,
            'Photo', json_build_object('file_name', f.file_name, 'mime_type', f.mime_type, 'key', f.key, 'url', f.url)
        )) AS "Actors"
    FROM 
        Movies_Cast mc
    JOIN 
        Persons p ON mc.actor_id = p.id
    LEFT JOIN 
        Files f ON p.id = f.person_id AND f.is_main = TRUE
    GROUP BY 
        mc.movie_id
),
Genre_Details AS (
    SELECT 
        mg.movie_id,
        json_agg(json_build_object(
            'ID', g.id,
            'Name', g.name
        )) AS "Genres"
    FROM 
        Movies_Genres mg
    JOIN 
        Genres g ON mg.genre_id = g.id
    GROUP BY 
        mg.movie_id
)
SELECT 
    m.id ,
    m.title,
    m.release_date, 
    m.duration,
    m.description,
    json_build_object('file_name', f.file_name, 'mime_type', f.mime_type, 'key', f.key, 'url', f.url) AS "Poster",
    json_build_object('ID', d.id, 'First name', d.first_name, 'Last name', d.last_name, 'Photo', json_build_object('file_name', df.file_name, 'mime_type', df.mime_type, 'key', df.key, 'url', df.url)) AS "Director",
    ad."Actors",
    gd."Genres"
FROM 
    Movies m
LEFT JOIN 
    Files f ON m.poster_id = f.id
JOIN 
    Persons d ON m.director_id = d.id
LEFT JOIN 
    Files df ON d.id = df.person_id AND df.is_main = TRUE
LEFT JOIN 
    Actor_Details ad ON m.id = ad.movie_id
LEFT JOIN 
    Genre_Details gd ON m.id = gd.movie_id
WHERE 
    m.id = 1;
