/* 
    obtain crime id and crime description from crime_scene where location is Coconut Grave Mansion
*/
SELECT * FROM crime_scene
WHERE location like '%Coconut Grove%'

-- crime id: 75
-- description: witnesses mentioned hotel booking & suspicious phone activity

/* 
    find witnesses & clues related to 
    crime scene id = 75 
*/
SELECT date, crime_scene_id, witness_id, name, clue
FROM witness_statements w
JOIN person p
ON w.witness_id = p.id
JOIN crime_scene c
ON w.crime_scene_id = c.id
WHERE w.crime_scene_id = 75
-- witness 1: Steven Nelson
-- clue 1: I overheard a booking at The Grand Regency.
-- witness 2: Sharon Phillips
-- clue 2: I noticed someone at the front desk discussing Room 707 for a reservation made yesterday.

/* 
    based on clues, look through hotel checkins and
    surveillance records for anything suspicious
*/
SELECT person_id, name, note, hotel_name, check_in_date, room_number 
FROM person p
JOIN hotel_checkins h
ON p.id = h.person_id
JOIN surveillance_records s
ON h.id = s.hotel_checkin_id
WHERE hotel_name =  'The Grand Regency'
AND check_in_date = 19871030
AND room_number = 707
AND note IS NOT NULL
-- note on Antonio Rossi (id: 11)
-- Subject was overheard yelling on a phone: "Did you kill him?"

/*
    check to see who antonio rossi was talking to
*/
SELECT caller_id, recipient_id, note, call_date 
FROM phone_records
WHERE (call_date = 19871030 OR call_date = 19871031)
AND (caller_id = 11 OR recipient_id = 11)
-- recipient id: 58
-- recipient name: Victor Dimarco
-- note: Why did you kill him, bro? You should have left the carpenter do it himself!

/*
    check victor's confession
*/
SELECT * FROM final_interviews
where person_id = 58
-- confession: I didn’t kill Leo per se. I was just a middleman.

/* 
    check to see if anyone else called Victor
*/
SELECT caller_id, recipient_id, note, call_date 
FROM phone_records
WHERE recipient_id = 58
-- caller id: 133 
-- note: "I will do it. Only if you give me that nice Lambo of yours."
SELECT caller_id, name
FROM phone_records r
JOIN person p
ON r.caller_id = p.id
WHERE recipient_id = 58
-- caller id: 133
-- name: unknown

/*
    check to see who all is a carpenter
    and ownes a lamborghini
*/
SELECT person_id, name, occupation, car_make 
FROM person p
JOIN vehicle_registry v
ON p.id = v.person_id
WHERE occupation = 'Carpenter'
AND car_make = 'Lamborghini'
-- person id: 97
-- name: marco santos

/*
    check Marco's final interview
*/
SELECT person_id, name, confession
FROM final_interviews f
JOIN person p
ON f.person_id = p.id
WHERE person_id = 97
-- person id: 97
-- confession: "I ordered the hit. It was me. You caught me."
