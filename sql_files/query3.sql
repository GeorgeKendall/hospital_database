-- Query 3
-- Print a list of all prescriptions that a particular doctor has prescribed

-- SELECT * FROM prescriptions WHERE doctor_id = 12;

-- different version based on doctor's name (person_id = 12 : 'Dr. Corey Garcia')

SELECT p.* FROM prescriptions p
JOIN doctors_and_patients doc
ON p.doctor_id = doc.person_id
WHERE doc.name = 'Dr. Corey Garcia'
AND doc.role = 'Doctor';
