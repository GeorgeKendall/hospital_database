# HPDM206Z Assignment 1 - Developing a hospital database

This project is designed to model relationships between hospitals, doctors, patients and prescriptions. Included are SQL scripts to create the database schema, load in data from `.csv` files and run queries that mimic useful questions for these relationships. Several of the queries were made more complex than necessary with joins and aliases.
### Repository structure
---
[/data](/data) : contains the `.csv` files given in order to populate a database
> *hospitals.csv, doctors.csv, patients.csv, prescriptions.csv*

[/docs](/docs) : contains a very simple Entity Relationship Diagram and a planning markdown document
> *Details and further explanation of relationships can be found in [the markdown document](docs/planning_and_pseudocode.md). Also included are:*
> - *Notes on DataTypes*
> - *Create Table and Load Data pseudocode*
> - *A list of queries listed in the assignment*

[/query](/query) : contains `.txt` files containing SQL scripts for example queries<br>
[/sql_files](/sql_files) : contains the SQL script to create the database (*see below*) and copies of the same queries in .sql documents

### How to use files
---
[create_database.sql](sql_files/create_database.sql) : this SQL script can be executed to do the following tasks:
> - Create database and create tables
> - Populate tables with data from the 4 `.csv` files in /docs
> - Finally three 'checks' will run:
>   - `SHOW TABLES;`
>   - `DESCRIBE [...];` *(on all 3 tables)*
>   - `SELECT COUNT(*) FROM [...];` *(on all 3 tables, to check all records have been input into the table successfully)*

[/query](/query) and [/sql_files](/sql_files) for the six queries outlined in the assignment:
> Both `.txt` and `.sql` versions are provided<br>
> **Please note** query3 and query6 have two variations of query: a simpler and a more complex using a join. The simpler is commented out in both locations for clarity

The database exported by use of `mysqldump` command can be found in [hospital_database.sql](hospital_database.sql)
