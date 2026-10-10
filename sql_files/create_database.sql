-- This file creates the database, creates tables and populates the tables

-- create and use database
CREATE DATABASE IF NOT EXISTS hospital_database;
USE hospital_database;

-- create hospital table
CREATE TABLE hospitals(
	hospital_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	address VARCHAR(255) NOT NULL,
	size INT NOT NULL CHECK (size>0),
	type VARCHAR(255) NOT NULL,
	accreditation_status VARCHAR(50) NOT NULL
);

-- create doctors_and_patients table
-- add constraints to define key references
CREATE TABLE doctors_and_patients(
	person_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	date_of_birth DATE NOT NULL,
	address VARCHAR(255) NOT NULL,
	role VARCHAR(10) NOT NULL,
	hospital_id INT NULL,
	doctor_id INT NULL,

	CONSTRAINT fk_patient_doctor
		FOREIGN KEY (doctor_id)
		REFERENCES doctors_and_patients(person_id),
	CONSTRAINT fk_doctor_hospital
		FOREIGN KEY (hospital_id)
		REFERENCES hospitals (hospital_id)
);

-- create prescriptions table
CREATE TABLE prescriptions(
	prescription_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	patient_id INT NOT NULL,
	doctor_id INT NOT NULL,
	medication VARCHAR(255) NOT NULL,
	prescription_date DATE NOT NULL
);

-- display tables
-- SHOW TABLES;
-- DESCRIBE hospitals;
-- DESCRIBE prescriptions;
-- DESCRIBE doctors_and_patients;

-- load data from csv files with some extra arguments for clarity
-- hospitals
LOAD DATA LOCAL INFILE '/home/ubuntu/hospital_database/data/hospitals.csv'
INTO TABLE hospitals
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
(hospital_id, name, address, size, type, accreditation_status);

-- check table has 40 entries
-- SELECT COUNT(*) FROM hospitals;

-- prescriptions
LOAD DATA LOCAL INFILE '/home/ubuntu/hospital_database/data/prescriptions.csv'
INTO TABLE prescriptions
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
(prescription_id, patient_id, doctor_id, medication, prescription_date);

-- check table has 500 entries
-- SHOW WARNINGS;
-- SELECT COUNT(*) FROM prescriptions;

-- doctors_and_patients
-- load doctors (100 entries)
LOAD DATA LOCAL INFILE '/home/ubuntu/hospital_database/data/doctors.csv'
INTO TABLE doctors_and_patients
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
(person_id, name, date_of_birth, address, role, hospital_id);

-- load patients (700 entries)
LOAD DATA LOCAL INFILE '/home/ubuntu/hospital_database/data/patients.csv'
INTO TABLE doctors_and_patients
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
(person_id, name, date_of_birth, address, role, doctor_id);

-- expecting 800 entries
-- SELECT COUNT(*) FROM doctors_and_patients;

-- final check
SHOW TABLES;
DESCRIBE doctors_and_patients;
DESCRIBE hospitals;
DESCRIBE prescriptions;
SELECT COUNT(*) FROM doctors_and_patients;
SELECT COUNT(*) FROM hospitals;
SELECT COUNT(*) FROM prescriptions;
