-- Query 5
-- Identify which doctor has made the most prescriptions

-- I used a join because I wanted doctor's name, instead of only their id number

SELECT doc.name, COUNT(*) AS total_prescriptions
FROM prescriptions p
JOIN doctors_and_patients doc
	ON p.doctor_id = doc.person_id
WHERE doc.role = 'Doctor'
GROUP BY doc.person_id, doc.name
ORDER BY total_prescriptions DESC
LIMIT 1;
