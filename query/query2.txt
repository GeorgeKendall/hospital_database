-- Query 2
-- Print a list of all prescriptions for a particular patient, ordered by the prescription date.
-- patient_id 115 used as example 

SELECT * FROM prescriptions
WHERE patient_id = 115
ORDER BY prescription_date;
