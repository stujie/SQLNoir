-- find correct incident report 
SELECT *
FROM incident_reports
WHERE location like '%Miami%'
AND description like '%research%'
/*
    id: 27
    date: 19871030
    location: Miami Science Museum
    description: Valuable exhibits were tampered with after closing. Staff discovered missing research materials.
*/

-- find witness statements using incident id
