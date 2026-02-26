-- Step 1: Determine Crime Scene Information

SELECT * FROM crime_scene
WHERE location = 'Coral Bay Marina' and date = '19860814'

/* clues acquired:
    id: 43
    date: 19860814
    description:
    victim: dead man, found at docks
    witnesses:
        1: address: 300ish ocean drive
        2: name: __ul __ezSELECT * FROM interviews i
        JOIN person p
        ON i.person_id = p.id
        WHERE p.id = 101 or p.id = 102
*/

-- Step 2: Determine Witnesses
SELECT * FROM person
WHERE address LIKE '%Ocean Drive%'
-- witness 1: id (101) - Carlos Mendex - Los Ojos - Fisherman - 369 Ocean Drive
SELECT * FROM person
WHERE name like '%ul%' and name like '%ez'
-- witness 2: id (102) - Raul Gutierrez - The Cobra - Nightclub Owner - 45 Sunset Ave

-- Step 3: Check witness interviews
SELECT * FROM interviews i
JOIN person p
ON i.person_id = p.id
WHERE p.id = 101 or p.id = 102

/*
    clues acquired:
    hotel chek in: august 13
    hotel name: includes sunset
*/

-- Step 4: filter hotel checkins & surveillance records for suspicious activity
SELECT * FROM hotel_checkins h
JOIN surveillance_records s
ON h.id = s.hotel_checkin_id
WHERE check_in_date = 19860813 AND hotel_name LIKE '%Sunset%'

/* 
    clues acquired:
    suspicious_activity - left suddenly at 3 am
*/

-- Step 5: Check information about whoever left suddenly at 3 am
SELECT p.id, name, occupation, hotel_checkin_id, suspicious_activity,
confession, check_in_date
FROM person p
JOIN surveillance_records s
ON p.id = s.person_id
JOIN confessions c
ON p.id = c.person_id
JOIN hotel_checkins h
ON s.hotel_checkin_id = h.id
WHERE suspicious_activity like '%3 AM%'

/* 
    facts acquired:
    name: thomas brown
    occupation: dock worker
    check in date: 19860813
    suspicious activity: Left suddenly at 3 AM
    confession: Alright! I did it. I was paid to make sure he never left the marina alive.
*/


