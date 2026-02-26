/** 
    Case # 002: The Stolen Sound
    
    Description: In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.
**/

-- Objectives 1&2: Retrieve the crime scene report for the record theft using the known date and location and retrieve witness records linked to that crime scene to obtain their clues
SELECT * FROM crime_scene c
JOIN witnesses w
ON c.id = w.crime_scene_id
WHERE location like '%record%'

-- Objectives 3&4: Use the clues from the witnesses to find the suspect in the suspects table and retrieve the suspect's interview transcript to confirm the confession
SELECT * FROM suspects s
JOIN interviews i
ON s.id = i.suspect_id
WHERE bandana_color = 'red' and accessory = 'gold watch'