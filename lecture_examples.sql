---------------------------------------------------------------
-- DATABASE SETUP
---------------------------------------------------------------

-- Get the current version of the SQL database server
SELECT VERSION();

-- List all available databases on the server
SHOW
DATABASES;

-- Switch to the "world" database (you must have this database to use it)
USE
world;

-- Show all tables within the currently selected database
SHOW
TABLES;

---------------------------------------------------------------
-- DATABASE & SCHEMA EXPLANATION
---------------------------------------------------------------

-- Create a new database named "lecture_db" to store lecture-related information
CREATE
DATABASE lecture_db;

---------------------------------------------------------------
-- SELECTING A DATABASE
---------------------------------------------------------------

-- The USE statement in MySQL is used to select a specific database to work with.
-- This command sets "lecture_db" as the active database.
-- Any SQL commands executed after this will apply to "lecture_db".
USE
lecture_db;

---------------------------------------------------------------
-- CREATING A TABLE: "address"
---------------------------------------------------------------

-- Creating the "address" table to store city names and ZIP codes.
CREATE TABLE address
(
    id       INT        NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each address
    city     VARCHAR(255),                                   -- Name of the city
    zip_code VARCHAR(6) NOT NULL,                            -- Postal ZIP code (required field)
    UNIQUE (city, zip_code)
);


---------------------------------------------------------------
-- MODIFYING TABLE STRUCTURE (ALTER TABLE)
---------------------------------------------------------------

-- Change the data type of the "city" column to VARCHAR(40).
ALTER TABLE address MODIFY city VARCHAR (40);

-- Add a new column "country" with a default value of 'TEST'.
ALTER TABLE address
    ADD country VARCHAR(80) DEFAULT 'TEST';

-- Remove the "country" column from the table.
ALTER TABLE address DROP COLUMN country;

-- Rename the "city" column to "town" and change its data type to VARCHAR(40).
ALTER TABLE address CHANGE city town VARCHAR (40);

---------------------------------------------------------------
-- INSERT DATA INTO THE TABLE
---------------------------------------------------------------

-- Insert individual rows into the "address" table.
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Växjö', '35264');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Växjö', '35252');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Stockholm', '12345');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Jönköping', '55318');

INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Gothenburg', '41106');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Malmö', '21119');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Uppsala', '75220');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Lund', '22363');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Helsingborg', '25221');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Örebro', '70361');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Linköping', '58222');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Norrköping', '60222');
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Borås', '50334');


-- Insert multiple rows in a single statement for efficiency.
INSERT INTO address (CITY, ZIP_CODE)
VALUES ('Växjö', '35264'),
       ('Växjö', '35252'),
       ('Stockholm', '12345'),
       ('Jönköping', '55318'),
       ('Gothenburg', '41106'),
       ('Malmö', '21119'),
       ('Uppsala', '75220'),
       ('Lund', '22363'),
       ('Helsingborg', '25221'),
       ('Örebro', '70361'),
       ('Linköping', '58222'),
       ('Norrköping', '60222'),
       ('Borås', '50334');



---------------------------------------------------------------
-- RETRIEVE DATA (READ)
---------------------------------------------------------------

-- Retrieve all columns and rows from the "address" table and sort them by id.
SELECT *
FROM address
order by id asc; -- desc
SELECT *
FROM address
order by city, zip_code;

-- Retrieve only specific columns: id and zip_code.
SELECT id, zip_code
FROM address;

--  Find cities that start with 'S'
SELECT *
FROM address
WHERE city LIKE 'S%';

-- Find cities that end with 'g'
SELECT *
FROM address
WHERE city LIKE '%g';

--  Find cities containing 'o' anywhere
SELECT *
FROM address
WHERE city LIKE '%o%';

-- Find cities where the second letter is 'o'
SELECT *
FROM address
WHERE city LIKE '_o%';

-- Find addresses with id greater than 5
SELECT *
FROM address
WHERE id > 5;

--  Find addresses where id is between 3 and 8
SELECT *
FROM address
WHERE id BETWEEN 3 AND 8;


---------------------------------------------------------------
-- UPDATE AND DELETE EXISTING RECORDS
---------------------------------------------------------------

-- Update the ZIP code of the address with id = 3.
UPDATE address
SET zip_code = '35222'
WHERE id = 3;

-- Delete the row where id = 3.
DELETE
FROM address
WHERE id = 3;

-- TRUNCATE removes all rows from the table but keeps the table structure intact.
TRUNCATE TABLE address;

-- DROP deletes table fro database.
DROP TABLE address;
---------------------------------------------------------------
-- CREATING A NEW TABLE: "person"
---------------------------------------------------------------

-- Creating the "person" table to store individual details.
CREATE TABLE person
(
    id         INT          NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each person
    first_name VARCHAR(255) NOT NULL,                            -- First name (required)
    last_name  VARCHAR(255) NOT NULL,                            -- Last name (required)
    email      VARCHAR(255) NOT NULL UNIQUE,                     -- Unique email address (required)
    birth_date DATE         NOT NULL,                            -- Date of birth (required)
    reg_date   DATETIME DEFAULT NOW(),                           -- Registration timestamp (defaults to current date/time)
    _active TINYINT     DEFAULT FALSE                            -- Active status (0 = inactive, 1 = active)
);

---------------------------------------------------------------
-- INSERTING DATA INTO "person"
---------------------------------------------------------------

-- Insert individual records into the "person" table
INSERT INTO person (first_name, last_name, email, birth_date, reg_date, _active)
VALUES ('John', 'Doe', 'john.doe@example.com', '1990-03-15', NOW(), TRUE),
       ('Jane', 'Smith', 'jane.smith@example.com', '1988-07-24', NOW(), FALSE),
       ('Robert', 'Brown', 'robert.brown@example.com', '1992-11-05', NOW(), TRUE),
       ('Alice', 'Johnson', 'alice.johnson@example.com', '1995-09-14', NOW(), TRUE),
       ('David', 'Williams', 'david.williams@example.com', '1991-04-22', NOW(), FALSE),
       ('Emma', 'Taylor', 'emma.taylor@example.com', '1987-06-30', NOW(), TRUE),
       ('Michael', 'Anderson', 'michael.anderson@example.com', '1993-08-19', NOW(), TRUE),
       ('Sophia', 'Martinez', 'sophia.martinez@example.com', '1989-12-10', NOW(), FALSE),
       ('James', 'Clark', 'james.clark@example.com', '1994-02-03', NOW(), TRUE),
       ('Olivia', 'Lewis', 'olivia.lewis@example.com', '1990-10-28', NOW(), TRUE),
       ('Daniel', 'Walker', 'daniel.walker@example.com', '1986-05-18', NOW(), FALSE),
       ('Ava', 'Hall', 'ava.hall@example.com', '1996-07-22', NOW(), TRUE),
       ('William', 'Allen', 'william.allen@example.com', '1985-01-12', NOW(), TRUE),
       ('Mia', 'Young', 'mia.young@example.com', '1997-09-03', NOW(), FALSE),
       ('Alexander', 'Hernandez', 'alexander.hernandez@example.com', '1988-11-27', NOW(), TRUE),
       ('Charlotte', 'King', 'charlotte.king@example.com', '1991-03-09', NOW(), TRUE),
       ('Benjamin', 'Wright', 'benjamin.wright@example.com', '1993-05-05', NOW(), FALSE),
       ('Amelia', 'Lopez', 'amelia.lopez@example.com', '1987-02-14', NOW(), TRUE),
       ('Henry', 'Scott', 'henry.scott@example.com', '1995-06-01', NOW(), TRUE),
       ('Lucas', 'Green', 'lucas.green@example.com', '1984-12-30', NOW(), FALSE);

INSERT INTO person (first_name, last_name, email, birth_date, _active)
VALUES ('Test', 'Test', 'test@example.com', '1990-03-15', TRUE);

---------------------------------------------------------------
-- One-to-One Relationship
---------------------------------------------------------------

-- Creating the "address" table with a foreign key linking to "person"
CREATE TABLE address
(
    id        INT        NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each address
    city      VARCHAR(255),                                   -- Name of the city
    zip_code  VARCHAR(6) NOT NULL,                            -- Postal ZIP code (required field)
    person_id INT        NOT NULL UNIQUE,                     -- Ensures a one-to-one relationship (one person has one address)
    FOREIGN KEY (person_id) REFERENCES person (id)
);

---------------------------------------------------------------
-- INSERTING DATA INTO "address"
---------------------------------------------------------------

-- Assigning addresses to persons based on their IDs
INSERT INTO address (CITY, ZIP_CODE, person_id)
VALUES ('Växjö', '35264', 1),
       ('Växjö', '35252', 2),
       ('Stockholm', '12345', 3),
       ('Jönköping', '55318', 4),
       ('Gothenburg', '41106', 5),
       ('Malmö', '21119', 6),
       ('Uppsala', '75220', 7),
       ('Lund', '22363', 8),
       ('Helsingborg', '25221', 9),
       ('Örebro', '70361', 10),
       ('Linköping', '58222', 11),
       ('Norrköping', '60222', 12),
       ('Borås', '50334', 13),
       ('Umeå', '90110', 14),
       ('Västerås', '72132', 15),
       ('Gävle', '80320', 16),
       ('Karlstad', '65224', 17),
       ('Sundsvall', '85121', 18),
       ('Luleå', '97231', 19),
       ('Halmstad', '30240', 20);


SELECT *
FROM address;
SELECT *
FROM person;

---------------------------------------------------------------
-- LEFT JOIN
---------------------------------------------------------------

-- To retrieve a list of all students(people), including their address (if assigned).
SELECT *
FROM person
         LEFT JOIN address ON person.id = address.person_id;

SELECT p.id AS person_id, -- Retrieves id from the person table and renames it to person_id for clarity.
       p.first_name,
       p.last_name,
       a.city,
       a.zip_code
FROM person p
         LEFT JOIN address a ON p.id = a.person_id;


---------------------------------------------------------------
-- CREATING ONE-TO-MANY RELATIONSHIP (TASK ↔ PERSON)
---------------------------------------------------------------
CREATE TABLE task
(
    id        INT          NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each task
    title     VARCHAR(255) NOT NULL,                            -- Task title (required)
    _description TEXT,                                          -- Task details (optional, replaced `_description`)
    person_id INT,                                              -- The person assigned to the task
    FOREIGN KEY (person_id) REFERENCES person (id)
);

---------------------------------------------------------------
-- INSERTING DATA INTO "task"
---------------------------------------------------------------

-- Assigning tasks to persons (person_id must match an existing person)
INSERT INTO task(title, _description, person_id)
VALUES ('SQL Workshop', 'Conduct a workshop on advanced SQL queries.', 1);

INSERT INTO task(title, _description, person_id)
VALUES ('Database Maintenance', 'Perform routine maintenance on the database systems.', 2);

INSERT INTO task(title, _description, person_id)
VALUES ('Data Migration', 'Migrate data from the old CRM system to the new platform.', 1);

INSERT INTO task(title, _description, person_id)
VALUES ('Performance Tuning', 'Optimize the database performance for the reporting module.', 3);

INSERT INTO task(title, _description)
VALUES ('Backup and Recovery', 'Implement and test the backup and recovery procedures.');



---------------------------------------------------------------
-- MANY-TO-MANY RELATIONSHIP (PERSON ↔ GROUP)
---------------------------------------------------------------
CREATE TABLE _group
(
    id         INT          NOT NULL PRIMARY KEY AUTO_INCREMENT,
    group_name VARCHAR(255) NOT NULL
);

-- Insert sample groups
INSERT INTO _group (group_name)
VALUES ('Java'),
       ('C#'),
       ('Python'),
       ('Database');

select *
from _group;

-- Create a junction table for Many-to-Many relationship
CREATE TABLE persons_groups
(
    person_id INT NOT NULL,
    group_id  INT NOT NULL,
    PRIMARY KEY (person_id, group_id), -- Composite Primary Key (Ensures uniqueness)
    FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES _group (id) ON DELETE CASCADE
);

select *
from person;

-- Insert data (Link persons with groups)
INSERT INTO persons_groups (person_id, group_id)
VALUES (1, 1), -- John -> Java
       (1, 2), -- John -> C#
       (2, 1), -- Jane -> Java
       (2, 3), -- Jane -> Python
       (3, 2), -- Robert -> C#
       (3, 4);
-- Robert -> Database


---------------------------------------------------------------
-- AGGREGATE FUNCTIONS
---------------------------------------------------------------

-- Count the total number of persons in the "person" table
SELECT COUNT(*)
FROM person;

-- Sum the values in the "id" column of the "person" table
SELECT SUM(id)
FROM person;

-- Calculate the average value of the "id" column
SELECT AVG(id)
FROM person;

-- Concatenate "id" and "zip_code" to form a combined address info
SELECT CONCAT(id, '-', zip_code) AS addressInfo
FROM address;

-- Retrieve unique city names from the "address" table
SELECT DISTINCT city
FROM address;
