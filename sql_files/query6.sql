-- Query 6
-- Print a list of all doctors at the hospital with the biggest size (number of beds)

SELECT * FROM doctors_and_patients
WHERE role = 'Doctor'
AND hospital_id = (
	SELECT hospital_id
	FROM hospitals
	ORDER BY size DESC
	LIMIT 1
);
-- embedded query returns a single hospital id and nothing else, so no joins necessary
