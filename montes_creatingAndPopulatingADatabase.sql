-- 1) Creating the database (#1 is auto-generated from PGAdmin)
CREATE DATABASE "Department"
    WITH
    OWNER = bryan
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "Department"
    IS 'Creating and Populating a database
Due: Fri Mar 27, 2026 11:59pm';

GRANT ALL ON DATABASE "Department" TO bryan;
-- 2) Create the tables, Student, Course, and Enroll
-- create Student table
CREATE TABLE Student (
SID integer PRIMARY KEY,
name varchar(30),
email varchar(30),
age integer,
GPA float
);
-- create Course table
CREATE TABLE Course (
CID char(10) PRIMARY KEY,
title varchar(100)
);
-- create Enroll table
CREATE TABLE Enroll (
SID integer REFERENCES Student(SID),
CID char(10) REFERENCES Course(CID),
PRIMARY KEY (SID, CID)
);
-- 3) Use the Data Manipulation Language to Populate the tables with data. INSERT INTO command is used for this, please refer to the lecture notes SQL or https://www.sqltutorial.org/sql-insert/ Links to an external site.
-- 3a) Intert data in all three tables
    -- Inserting data into Student table
INSERT INTO Student (SID, name, email, age, GPA)
VALUES
(101, 'John Doe', 'john@doe.com', 32, 3.1),
(102, 'Jane Smith', 'jane@smith.com', 23, 3.5),
(103, 'Sam Wilson', 'sam@wilson.com', 19, 3.9);
    -- Inserting data into Course table
INSERT INTO Course (CID, title)
VALUES
('LIS300', 'Introduction to Information Science'),
('IST300', 'Human Information Behavior'),
('IST465', 'Disinformation and Misinformation');
    -- Inserting data into Enroll table
INSERT INTO Enroll (SID, CID)
VALUES
(101, 'LIS300'),
(102, 'IST300'),
(103, 'IST465');
-- 3b) Use the SELECT command to verofy that your data has been inserted, remember Enroll is abridge table and hence should be populated after the two main tables have been filled.
-- Selects all records from Student table
SELECT * FROM Student;
-- Selects all records from Course table
SELECT * FROM Course;
-- Selects all records from Enroll table
SELECT * FROM Enroll;
-- Join Student and Enroll tables using foreign key relationship
SELECT S.SID, S.name, S.email, E.CID, S.GPA
FROM Student S
JOIN Enroll E ON S.SID = E.SID;
