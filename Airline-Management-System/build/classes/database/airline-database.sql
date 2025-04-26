-- Drop the database if it exists
DROP DATABASE IF EXISTS airline_management_system;

-- Create the database
CREATE DATABASE airline_management_system;
USE airline_management_system;

-- Drop user if exists
DROP USER IF EXISTS 'airms'@'localhost';

-- Create user with standard authentication plugin
CREATE USER 'airms'@'localhost' IDENTIFIED WITH mysql_native_password BY 'raysdebuggers';

-- Grant privileges
GRANT ALL PRIVILEGES ON airline_management_system.* TO 'airms'@'localhost';
FLUSH PRIVILEGES;

-- Drop tables if they exist
DROP TABLE IF EXISTS cancellation;
DROP TABLE IF EXISTS flight;
DROP TABLE IF EXISTS login;
DROP TABLE IF EXISTS passenger;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS sector;

-- Create cancellation table
CREATE TABLE cancellation (
    pnr_no VARCHAR(255) PRIMARY KEY,
    cancellation_no VARCHAR(255),
    cancellation_date VARCHAR(255),  -- Fixed the typo
    fli_code VARCHAR(255)
);

-- Create flight table
CREATE TABLE flight (
    f_code VARCHAR(255) PRIMARY KEY,
    f_name VARCHAR(255),
    src VARCHAR(255),
    dst VARCHAR(255)
);

-- Create login table
CREATE TABLE login (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255)
);

-- Create passenger table
CREATE TABLE passenger (
    pnr_no VARCHAR(255),
    address VARCHAR(255),
    nationality VARCHAR(255),
    name VARCHAR(255),
    gender VARCHAR(255),
    ph_no VARCHAR(255),
    passport_no VARCHAR(255),
    fl_code VARCHAR(255),
    PRIMARY KEY (pnr_no)  -- Added primary key constraint for pnr_no
);

-- Create payment table
CREATE TABLE payment (
    pnr_no VARCHAR(255),
    ph_no VARCHAR(255),
    cheque_no VARCHAR(255),
    card_no VARCHAR(255),
    paid_amt VARCHAR(255),
    pay_date VARCHAR(255),
    PRIMARY KEY (pnr_no, cheque_no)  -- Added a composite primary key
);

-- Create reservation table
CREATE TABLE reservation (
    pnr_no VARCHAR(255),
    ticket_id VARCHAR(255) PRIMARY KEY,
    f_code VARCHAR(255),
    jny_date VARCHAR(255),
    jny_time VARCHAR(255),
    src VARCHAR(255),
    dst VARCHAR(255)
);

-- Create sector table
CREATE TABLE sector (
    flight_code VARCHAR(255),
    capacity VARCHAR(255),
    class_code VARCHAR(255),
    class_name VARCHAR(255),
    PRIMARY KEY (flight_code, class_code)  -- Added composite primary key for uniqueness
);

START TRANSACTION;
-- Insert values into login table 

INSERT INTO login (username, password) 
VALUES ('admin', 'raysdebuggers');

-- Insert sample data into flight table
INSERT INTO flight (f_code, f_name, src, dst)
VALUES 
('AI101', 'Air India Flight 101', 'New York', 'Mumbai'),
('BA202', 'British Airways Flight 202', 'London', 'Los Angeles'),
('UA303', 'United Airlines Flight 303', 'Chicago', 'San Francisco'),
('EK404', 'Emirates Flight 404', 'Dubai', 'Sydney'),
('DL505', 'Delta Airlines Flight 505', 'Atlanta', 'Paris'),
('AF606', 'Air France Flight 606', 'Paris', 'New York'),
('QF707', 'Qantas Airways Flight 707', 'Sydney', 'London'),
('LH808', 'Lufthansa Flight 808', 'Frankfurt', 'Tokyo'),
('CX909', 'Cathay Pacific Flight 909', 'Hong Kong', 'Singapore'),
('SQ1010', 'Singapore Airlines Flight 1010', 'Singapore', 'San Francisco');

-- Insert sample data into cancellation table
INSERT INTO cancellation (pnr_no, cancellation_no, cancellation_date, fli_code)
VALUES
('PNR12345', 'CNL001', '2025-04-10', 'AI101'),
('PNR12346', 'CNL002', '2025-04-11', 'BA202'),
('PNR12347', 'CNL003', '2025-04-12', 'UA303'),
('PNR12348', 'CNL004', '2025-04-13', 'EK404'),
('PNR12349', 'CNL005', '2025-04-14', 'DL505');

-- Insert sample data into passenger table
INSERT INTO passenger (pnr_no, address, nationality, name, gender, ph_no, passport_no, fl_code)
VALUES
('PNR12345', '123 Main St, New York, NY', 'USA', 'John Doe', 'Male', '555-1234', 'A12345678', 'AI101'),
('PNR12346', '456 Elm St, London, UK', 'British', 'Jane Smith', 'Female', '555-5678', 'B98765432', 'BA202'),
('PNR12347', '789 Oak St, Chicago, IL', 'USA', 'Mike Johnson', 'Male', '555-2345', 'C23456789', 'UA303'),
('PNR12348', '101 Pine St, Dubai, UAE', 'UAE', 'Fatima Al-Farsi', 'Female', '555-6789', 'D34567890', 'EK404'),
('PNR12349', '202 Maple St, Atlanta, GA', 'USA', 'David Lee', 'Male', '555-8901', 'E45678901', 'DL505');

-- Insert sample data into payment table
INSERT INTO payment (pnr_no, ph_no, cheque_no, card_no, paid_amt, pay_date)
VALUES
('PNR12345', '555-1234', 'CHEQ001', '4111-1234-5678-9010', '1500', '2025-04-05'),
('PNR12346', '555-5678', 'CHEQ002', '5111-2345-6789-0123', '2000', '2025-04-06'),
('PNR12347', '555-2345', 'CHEQ003', '6111-3456-7890-1234', '2500', '2025-04-07'),
('PNR12348', '555-6789', 'CHEQ004', '7111-4567-8901-2345', '3000', '2025-04-08'),
('PNR12349', '555-8901', 'CHEQ005', '8111-5678-9012-3456', '3500', '2025-04-09');

-- Insert sample data into reservation table
INSERT INTO reservation (pnr_no, ticket_id, f_code, jny_date, jny_time, src, dst)
VALUES
('PNR12345', 'TICKET001', 'AI101', '2025-04-10', '10:00 AM', 'New York', 'Mumbai'),
('PNR12346', 'TICKET002', 'BA202', '2025-04-11', '12:00 PM', 'London', 'Los Angeles'),
('PNR12347', 'TICKET003', 'UA303', '2025-04-12', '2:00 PM', 'Chicago', 'San Francisco'),
('PNR12348', 'TICKET004', 'EK404', '2025-04-13', '4:00 PM', 'Dubai', 'Sydney'),
('PNR12349', 'TICKET005', 'DL505', '2025-04-14', '6:00 PM', 'Atlanta', 'Paris');

-- Insert sample data into sector table
INSERT INTO sector (flight_code, capacity, class_code, class_name)
VALUES
('AI101', '300', 'Y', 'Economy'),
('AI101', '50', 'B', 'Business'),
('BA202', '250', 'Y', 'Economy'),
('BA202', '40', 'B', 'Business'),
('UA303', '200', 'Y', 'Economy'),
('UA303', '30', 'B', 'Business'),
('EK404', '350', 'Y', 'Economy'),
('EK404', '60', 'B', 'Business'),
('DL505', '220', 'Y', 'Economy'),
('DL505', '50', 'B', 'Business');

COMMIT;
