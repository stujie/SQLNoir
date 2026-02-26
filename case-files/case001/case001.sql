-- Objective 1
SELECT * FROM crime_scene 
WHERE location like '%Blue Note%'
-- Objectives 2 & 3
SELECT * FROM interviews 
JOIN suspects
ON interviews.suspect_id = suspects.id
WHERE attire = 'trench coat' and scar = 'left cheek'


