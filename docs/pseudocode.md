# Hospital Database in MySQL - Pseudocode & Planning
---
#### Proposed relationships and cardinality:
|Relationship|Cardinality|Description|
|---|---|---|
|Hospitals &rarr; Doctors|One-to-Many|One hospital has many doctors|
|Doctors &rarr; Patients|One-to-Many|One doctor has many patients|
|Patients &rarr; Prescriptions|One-To-Many|One patient can be given many prescriptions|
|Doctors &rarr; Prescriptions|One-To-Many|One doctor can give out many prescriptions|

>*It's worth noting that 'Doctors &rarr; Patients' is a self-referencing relationship with the doctor's ID as a foreign key*

## ERD Diagram 

*insert ERD here (maybe new folder to keep old versions?) Refer to csv files for relevant attribute names, data types, etc.*

> Add info on diagram, colour coding and explanations of chosen relationships ALSO THE TYPES*

## Create Tables & Load Data
- Create database
  - Using `IF NOT EXISTS` as needed
- Create tables in MySQL
  - In `doctors_and_patients` the `doctor_id` and `hospital_id` will need to have `NULL`
  - patients will not have `hospital_id` and doctors will not have `doctor_id` populated, respectively.
- Import .csv files
- Insert into tables
  - If the person's role is `Doctor` then `doctor_id = NULL`
  - If the person's role is `Patient` then `hospital_id = NULL`
- Validate [ check all data has loaded correctly and in correct format ]
  - Potentially use 'test' queries.. E.g. Do patients assigned doctors actually have the role 'doctor'?
  - Check all records have inserted (total count). Use `SELECT COUNT(*)` and match to csv line count
 
- Once all correct, export database into a `.sql` file via `mysqldump`

*NOTES: Specify foreign keys and COMMENT EVERYTHING GEORGE...*


## Queries

#### Print a list of all doctors based at a particular hospital

#### Print a list of all prescriptions for a particular patient, ordered by the prescription date.

#### Print a list of all prescriptions that a particular doctor has prescribed

#### Add a new patient to the database, including being registered with one of the doctors

#### Identify which doctor has made the most prescriptions

#### Print a list of all doctors at the hospital with the biggest size (number of beds)

---

## Read Me
From assignment doc:
>"Your GitHub repo should have a Readme page which describes your database project as a short summary. For example, this could includ describing what the main files are, description of the database, tables, queries and how to use the files. Also describe the purpose of each SQL query"
