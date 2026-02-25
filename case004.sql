/** 
    Case # 004: The Midnight Masquerade Murder
    
    On October 31, 1987, at a Coconut Grove mansion masked ball, Leonard Pierce was found dead in the garden. Can you piece together all the clues to expose the true murderer?

    Objective: Reveal the true murderer of this complex case.
**/

/* 
    obtain crime id and crime description from crime_scene where location is Coconut Grave Mansion
*/
SELECT * FROM crime_scene
WHERE location like '%Coconut Grove%'

-- crime id: 75
-- description: witnesses mentioned hotel booking & suspicious phone activity

/* 
    find witnesses & clues related to 
    crime id 75
*/
SELECT * FROM crime_scene c
JOIN witness_statements w
ON c.id = w.crime_scene_id
JOIN person p
ON w.witness_id = p.id
WHERE c.id = 75
-- witness 1: Steven Nelson
-- clue 1: I overheard a booking at The Grand Regency.
-- witness 2: Sharon Phillips
-- clue 2: I noticed someone at the front desk discussing Room 707 for a reservation made yesterday.

/* 
    based on clues, look through hotel checkins and
    surveillance records for anything suspicious
*/
SELECT p.id, name, note FROM person p
JOIN hotel_checkins h
ON p.id = h.person_id
JOIN surveillance_records r
ON h.id = r.hotel_checkin_id
WHERE hotel_name = 'The Grand Regency' and room_number = 707 and check_in_date = 19871030
-- note on Antonio Rossi (id: 11)
-- Subject was overheard yelling on a phone: "Did you kill him?"

/*
    check to see who antonio rossi was talking to
*/
SELECT ph.id, ph.caller_id, ph.recipient_id, note, p.name, p.id FROM phone_records ph
JOIN person p
ON ph.recipient_id = p.id
WHERE caller_id = 11 or recipient_id = 11
-- recipient id: 58
-- recipient name: Victor Dimarco

/*
    check victor's confession
*/
SELECT * FROM final_interviews
where person_id = 58
-- confession: I didn’t kill Leo per se. I was just a middleman.

/* 
    check to see who could be the mystery carpenter
*/
SELECT * FROM person
WHERE occupation = 'Carpenter'
-- ids: 51, 90, 97, 134, 176