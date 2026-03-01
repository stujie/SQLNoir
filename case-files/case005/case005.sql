-- find correct incident report 
SELECT * 
FROM incident_reports
WHERE location like '%QuantumTech%'
/*
    id: 74
    date: 19890421
    location: QuantumTech HQ
    Description: Prototype destroyed; data erased from servers.
*/

-- find witnesses based on incident id
SELECT incident_id, employee_id, employee_name, statement
FROM incident_reports i
JOIN witness_statements w
ON i.id = w.incident_id
JOIN employee_records e
ON w.employee_id = e.id
WHERE i.id = 74 
/*
    employee_id: 134
    name: Tina Ruiz
    statement: I saw someone holding a keycard marked QX- succeeded by a two-digit odd number.

    employee_id: 145
    name: Carl Jenkins
    statement: I heard someone mention a server in Helsinki. 
*/

-- based on statements, find a suspect
SELECT c.employee_id, employee_name, department, occupation, 
home_address, server_location, keycard_code  
FROM employee_records e
JOIN computer_access_logs c
ON e.id = c.employee_id
JOIN keycard_access_logs k
ON e.id = k.employee_id
WHERE keycard_code like '%QX-035%'
AND server_location = 'Helsinki'
/*
    employee id: 99
    employee name: Elizabeth Gordon
    department: Engineering
    occupation: Solutions Architect
    server_location: Helsinki
    keycard_code: QX-035
*/

-- based on employee id, check email logs
SELECT * 
FROM email_logs
WHERE sender_employee_id = 99 or recipient_employee_id = 99
-- one email: sender_employee_id = 263
-- check email logs and identity of id 263
SELECT *
FROM email_logs el
JOIN employee_records er
ON el.recipient_employee_id = er.id
WHERE sender_employee_id = 263 or recipient_employee_id = 263
/*
    employer id: Norman Owens
    sender employee id: NULL
    email content to note: F18 before 9, "He" access right after L (Elizabeth) leaves
*/

-- check who enters facility 18 right after Elizabeth
SELECT employee_id, access_time, employee_name
FROM facility_access_logs f
JOIN employee_records e
ON f.employee_id = e.id
WHERE facility_name = 'Facility 18'
-- employee id: 297
-- employee name: Hristo Bogoev

