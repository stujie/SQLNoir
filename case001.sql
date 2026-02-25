/** 
    Case #001: The Vanishing Briefcase
    
    Description: Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal the culprit.
**/

-- Objective 1: Retrieve the correct crime scene details to gather the key clue.
SELECT * FROM crime_scene 
WHERE location like '%Blue Note%'


-- Objectives 2 & 3: Identify the suspect whose profile matches the witness description & verify the suspect using their interview transcript.
SELECT * FROM interviews 
JOIN suspects
ON interviews.suspect_id = suspects.id
WHERE attire = 'trench coat' and scar = 'left cheek'


