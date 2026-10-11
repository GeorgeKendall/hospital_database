# Hospital Database in MySQL - Pseudocode & Planning

#### Proposed relationships and cardinality:
|Relationship|Cardinality|Description|
|---|---|---|
|Hospitals &rarr; Doctors|One-to-Many|One hospital has many doctors, each doctor belongs to one hospital|
|Doctors &rarr; Patients|One-to-Many|One doctor has many patients, each patient has one assigned doctor|
|Patients &rarr; Prescriptions|One-To-Many|One patient can be given many prescriptions, in theory each prescription should be unique|
|Doctors &rarr; Prescriptions|One-To-Many|One doctor can issue many prescriptions|

>It's worth noting that 'Doctors &rarr; Patients' is a self-referencing relationship with the doctor's ID as a foreign key

## Entity Relationship Diagram (ERD)
![Entity Relationship Diagram](/docs/hospital_database_ERD_Diagram.png)
> #### Relationship key:
> $\color{#ff6347}\textsf{The RED relationship}$ refers to *Doctors &rarr; Prescriptions* <br> 
> $\color{#43ff18}\textsf{The GREEN relationship}$ refers to *Patients &rarr; Prescriptions* <br>
> $\color{#ffa500}\textsf{The ORANGE relationship}$ refers to *Doctors &rarr; Patients* <br>
> $\color{black}\textsf{The BLACK relationship}$ refers to *Hospitals &rarr; Doctors*
> #### Data type notes: 
> - All primary Keys will be `AUTO INCREMENT INT PRIMARY KEY`. Even though the csv files have id's set up, this is important as it'll allow for new records to be added without manual key assignment.
> - Most attributes will be `VARCHAR(255)` (or more appropriate size limit). Such as names, addresses, medication, etc.
> - `prescription_date` will be of type `DATE`, maybe with a specified format (dependant on csv format)
> - Almost all of the attributes will be specified as `NOT NULL`, with the sole exceptions of `hospital_id` and `doctor_id` as self-referencing foreign keys inside `doctors_and_patients`

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
- `SHOW TABLES` and `DESCRIBE` all tables for visual checks
- Ensure all code is appropriately commented
- Once all correct, export database into a `.sql` file via `mysqldump`



## Query tasks

#### 1. Print a list of all doctors based at a particular hospital
> Select all records from `doctors_and_patients` where role is doctor and the hospital id matches the selected hospital<br>
> Could join in order to get the name of doctors instead of just an id. Join with `hospitals`.
#### 2. Print a list of all prescriptions for a particular patient, ordered by the prescription date.
> Select all records from `prescriptions` with a specific patient id then use `ORDER BY prescription_date`
#### 3. Print a list of all prescriptions that a particular doctor has prescribed
> Select all records with a specific doctor id
> Or... join `prescriptions` with `doctors_and_patients` in order to search based on doctors name, not just their id 
#### 4. Add a new patient to the database, including being registered with one of the doctors
> `INSERT INTO` should be plenty, then specify values
> Assuming `AUTO_INCREMENT` and `NULL // NOT NULL` used corretnly, `person_id` and `hospital_id` don't need to be entered
> Test with selecting all where name equals the one just inserted
#### 5. Identify which doctor has made the most prescriptions
> Show records by doctors name (feels like a better convention)<br>
> Join `prescriptions` and `doctors_and_patients`<br>
> `ORDER BY [...] DESC`
#### 6. Print a list of all doctors at the hospital with the biggest size (number of beds)
> Embedded query?<br>
> Select all doctors from `doctors_and_patients` (role='Doctor') `AND` take the top 'size' hospital using `ORDER BY [...] DESC` again and `LIMIT 1`
> Queries should be as plaintext or bash script
---

## Read Me
From assignment doc:
>"Your GitHub repo should have a Readme page which describes your database project as a short summary. For example, this could includ describing what the main files are, description of the database, tables, queries and how to use the files. Also describe the purpose of each SQL query"
