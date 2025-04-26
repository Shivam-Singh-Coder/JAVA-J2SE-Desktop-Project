-- Drop the database if it exists
DROP DATABASE IF EXISTS travel_information_guide;

-- Create the database
CREATE DATABASE travel_information_guide;
USE travel_information_guide;

-- Drop user if exists
DROP USER IF EXISTS 'travel'@'localhost';

-- Create user with password
CREATE USER 'travel'@'localhost' IDENTIFIED WITH mysql_native_password BY 'raysdebuggers';

-- Grant privileges
GRANT ALL PRIVILEGES ON travel_information_guide.* TO 'travel'@'localhost';
FLUSH PRIVILEGES;

-- Drop tables if they exist
DROP TABLE IF EXISTS bookHotel;
DROP TABLE IF EXISTS bookPackage;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS package;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS account;

-- Create users table
CREATE TABLE users (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Create account table
CREATE TABLE account(
    username VARCHAR(20),
    name VARCHAR(20),
    password VARCHAR(100),
    answer VARCHAR(50),
    question VARCHAR(100)
);

-- Create customer table
CREATE TABLE customer ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(255) NOT NULL,
    id_type VARCHAR(50),
    number VARCHAR(255),
    name VARCHAR(255),
    gender VARCHAR(10),
    country VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    FOREIGN KEY (username) REFERENCES users(username)
);

-- Create package table
CREATE TABLE package (
    packageId VARCHAR(50) NOT NULL PRIMARY KEY,
    packageName VARCHAR(100),
    date DATE,
    cost DECIMAL(10,2)
);

-- Create bookPackage table
CREATE TABLE bookPackage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    package VARCHAR(255),
    persons INT NOT NULL,
    totalPrice VARCHAR(20) NOT NULL,
    bookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create bookHotel table
CREATE TABLE bookHotel (
    username VARCHAR(50) NOT NULL,
    name VARCHAR(100),
    numPersons INT,
    numDays INT,
    acNonAc VARCHAR(10),
    foodIncluded VARCHAR(10),
    id VARCHAR(20),
    number VARCHAR(20),
    phone VARCHAR(15),
    cost DECIMAL(10, 2),
    PRIMARY KEY (username)
);
-- Insert default admin login
START TRANSACTION;

INSERT INTO users (username, password,email,phone)
VALUES ('admin', 'raysdebuggers','admin@raysonline.in','9308654075');

INSERT INTO account (username, password,name,answer, question)
VALUES ('admin', 'raysdebuggers','Admin','rays','Your NickName?');

COMMIT;




-- CREATE DATABASE test;
-- USE test;
-- 
-- CREATE TABLE customer ( username VARCHAR(50) NOT NULL PRIMARY KEY, id_type VARCHAR(20), number VARCHAR(15), name VARCHAR(100), gender VARCHAR(20), country VARCHAR(50), address VARCHAR(255), phone VARCHAR(15), email VARCHAR(100) );
-- 
-- CREATE TABLE package ( packageId VARCHAR(50) NOT NULL PRIMARY KEY, packageName VARCHAR(100), date DATE, cost DECIMAL(10,2) );
-- 
-- MY SQL Queries:
-- 
-- create database tourismmanagementsystem;
-- 
-- use tourismmanagementsystem;
-- 
-- create table account(username varchar(20),name varchar(20), password varchar(100), answer varchar(50));
-- 
-- ALTER TABLE account ADD question VARCHAR(100);
-- 
-- CREATE TABLE customer ( id INT AUTO_INCREMENT PRIMARY KEY, -- Auto-incremented customer ID username VARCHAR(255) NOT NULL, -- Username (from login) id_type VARCHAR(50), -- ID Type (Passport, Aadhar Card, etc.) number VARCHAR(255), -- ID Number name VARCHAR(255), -- Customer Name gender VARCHAR(10), -- Gender (Male/Female) country VARCHAR(255), -- Country address VARCHAR(255), -- Address phone VARCHAR(20), -- Phone Number email VARCHAR(255), -- Email Address FOREIGN KEY (username) REFERENCES users(username) -- Assuming there's a users table with username as PK );
-- 
-- CREATE TABLE users ( username VARCHAR(255) PRIMARY KEY, password VARCHAR(255) NOT NULL, -- Example for storing user password email VARCHAR(255), phone VARCHAR(20) );
-- 
-- ALTER TABLE customer ADD COLUMN id_type VARCHAR(50); ALTER TABLE customer ADD COLUMN number VARCHAR(255); ALTER TABLE customer ADD COLUMN gender VARCHAR(10); ALTER TABLE customer ADD COLUMN country VARCHAR(255); ALTER TABLE customer ADD COLUMN username VARCHAR(255) NOT NULL;
-- 
-- UPDATE customer SET id_type = ?, number = ?, name = ?, gender = ?, country = ?, address = ?, phone = ?, email = ? WHERE username = ?;
-- 
-- CREATE TABLE bookPackage ( id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255), package VARCHAR(255), persons INT NOT NULL, totalPrice VARCHAR(20) NOT NULL, bookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
-- 
-- CREATE TABLE bookHotel ( username VARCHAR(50) NOT NULL, name VARCHAR(100), numPersons INT, numDays INT, acNonAc VARCHAR(10), foodIncluded VARCHAR(10), id VARCHAR(20), number VARCHAR(20), phone VARCHAR(15), cost DECIMAL(10, 2), PRIMARY KEY (username) );