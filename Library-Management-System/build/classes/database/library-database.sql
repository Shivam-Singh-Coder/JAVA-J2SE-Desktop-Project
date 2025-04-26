-- Drop the database if it exists
DROP DATABASE IF EXISTS library_management_system;

-- Create the database
CREATE DATABASE library_management_system;
USE library_management_system;

-- Drop user if exists
DROP USER IF EXISTS 'libms'@'localhost';

-- Create user with standard authentication plugin
CREATE USER 'libms'@'localhost' IDENTIFIED WITH mysql_native_password BY 'raysdebuggers';

-- Grant privileges
GRANT ALL PRIVILEGES ON library_management_system.* TO 'libms'@'localhost';
FLUSH PRIVILEGES;

-- Drop tables if they exist
DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS book;

-- Create login table
CREATE TABLE login (
    userid VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create student table
CREATE TABLE student (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    semester VARCHAR(255) NOT NULL
);

-- Create book table
CREATE TABLE book (
    id VARCHAR(255) PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    price VARCHAR(255) NOT NULL,
    year VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    ISSUE_DATE VARCHAR(255),
    DUE_DATE VARCHAR(255),
    STUDENT_ID VARCHAR(255)
);

-- Insert default admin login
START TRANSACTION;

INSERT INTO login (userid, password)
VALUES ('admin', 'raysdebuggers');

COMMIT;