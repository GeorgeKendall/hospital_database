-- Query 1
-- Print a list of all doctors based at a particular hospital

-- SELECT * FROM doctors_and_patients WHERE role = 'Doctor' AND hospital_id = 5;

-- alternate version allowing specific hospital name for selection

SELECT doc.* FROM doctors_and_patients doc
JOIN hospitals h
	ON doc.hospital_id = h.hospital_id
WHERE doc.role = 'Doctor'
AND h.name = 'Riley, Porter and Woods Hospital';
