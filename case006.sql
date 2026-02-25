/** 
    Case # 006: The Vanishing Diamond
    
    At Miami’s prestigious Fontainebleau Hotel charity gala, the famous “Heart of Atlantis” diamond necklace suddenly disappeared from its display.

    Objective: Find who stole the diamond.
**/

/*  check crime_scene for crime description 
    based on location provided
    clues acquired: 2 valuable witnesses
*/
SELECT * FROM crime_scene
WHERE location like '%Fontainebleau%'

/*  determined witness 1 & clue
    Witness: Clint Eastwood
    Clue: "Meet me at the marina, dock 3.
*/
SELECT * FROM guest g
JOIN witness_statements w
ON g.id = w.guest_id
WHERE occupation like '%actor%'

/*  determined witness 1 & clue
    Witness: Vivian Nair
    Clues: invitation ending with "-R", 
    wearing a navy suit and a white tie.
*/
SELECT * FROM guest g
JOIN witness_statements w
ON g.id = w.guest_id
WHERE occupation LIKE '%consultant%' AND name like '%an%'

/*
    determined suspect
    Guest_id = 105
    Name: Mike Manning
*/
SELECT * FROM guest g
JOIN attire_registry a
ON g.id = a.guest_id
WHERE invitation_code like '%-R' and note = 'navy suit, white tie'

/*  check suspect confession
    guest_id of Mike Manning 
    shows a confession to taking the crystal
*/
SELECT * FROM final_interviews
WHERE guest_id = 105

/*  check suspects boat dock
    renter_guest_id of Mike Manning 
    shows a boat docked in dock #3
    just like witness 1, clint eastwood, said
*/

SELECT * FROM marina_rentals
WHERE renter_guest_id = 105
