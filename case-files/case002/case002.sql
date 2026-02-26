-- Objectives 1&2
SELECT * FROM crime_scene c
JOIN witnesses w
ON c.id = w.crime_scene_id
WHERE location like '%record%'
-- Objectives 3&4
SELECT * FROM suspects s
JOIN interviews i
ON s.id = i.suspect_id
WHERE bandana_color = 'red' and accessory = 'gold watch'