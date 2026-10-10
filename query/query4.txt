-- Query 4
-- Add a new patient to the database, including being registered with one of the doctors


-- insert patient: this has a doctor_id but not hospital_id

INSERT INTO doctors_and_patients
(name, date_of_birth, address, role, doctor_id)
VALUES
('John Doe', '1997-03-08', '1 Herbert Road, Gillingham, Kent, ME89DA', 'Patient', 5);
-- test for PK and NULL hospital_id
SELECT * FROM doctors_and_patients WHERE name = 'John Doe';
