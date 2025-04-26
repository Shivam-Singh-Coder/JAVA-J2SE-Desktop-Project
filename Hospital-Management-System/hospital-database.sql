-- Drop the database if it exists
DROP DATABASE IF EXISTS hospital_management_system;

-- Create the database
CREATE DATABASE hospital_management_system;
USE hospital_management_system;

-- Drop user if exists
DROP USER IF EXISTS 'hms'@'localhost';

-- Create user with standard authentication plugin
CREATE USER 'hms'@'localhost' IDENTIFIED WITH mysql_native_password BY 'raysdebuggers';

-- Grant privileges
GRANT ALL PRIVILEGES ON hospital_management_system.* TO 'hms'@'localhost';
FLUSH PRIVILEGES;

-- Drop tables if they exist
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS drugs;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS pharmacists;
DROP TABLE IF EXISTS users;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'raysdebuggers');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `age` int(100) NOT NULL,
  `weight` int(100) NOT NULL,
  `height` int(100) NOT NULL,
  `blood` varchar(100) NOT NULL,
  `services` varchar(100) NOT NULL,
  `total` int(100) NOT NULL,
  `des` varchar(500) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `appointmentNo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `fname`, `lname`, `age`, `weight`, `height`, `blood`, `services`, `total`, `des`, `date`, `time`, `address`, `gender`, `appointmentNo`) VALUES
(1, 'user', 'name', 21, 160, 179, 'B+', 'Eye Center', 70, 'Past year I have had eye issues. \nFirst of all i do not wear glasses contacts. \nI had great vision until a year ago.\n My eyes started getting red first is was one eye my right. \nStarted with being red foreign object sensitive to light blurry vision pain then as time went I was prescribed every kind of...', '26-Sep-2017', '11 - 12 Noon', 'Has-2d asd2 alka, asd192', 'Male', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `recovery` varchar(200) NOT NULL,
  `ans` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `fname`, `lname`, `gender`, `email`, `phone`, `address`, `username`, `password`, `recovery`, `ans`) VALUES
(1, 'doctor', 'me', 'Male', 'doctor@gmail.com', 1234567890, 'patna', 'doctor', 'raysdebuggers', 'Your NickName?', 'rays');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `Drug Name` varchar(100) NOT NULL,
  `Company` varchar(100) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Price/Item` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `Drug Name`, `Company`, `Quantity`, `Price/Item`) VALUES
(1, 'amino', 'on', 199, 5),
(2, 'protein', 'on', 213, 40),
(3, 'shakes', 'muscleblaze', 9, 33),
(5, 'sulphuric acid', 'orgezo', 11, 10),
(8, 'creatine', 'un', 94, 11);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `blood` varchar(100) NOT NULL,
  `weight` int(100) NOT NULL,
  `height` int(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `nextAppointmentDate` varchar(100) NOT NULL,
  `Illness` varchar(500) NOT NULL,
  `doc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `fname`, `lname`, `email`, `phone`, `address`, `gender`, `blood`, `weight`, `height`, `birthday`, `nextAppointmentDate`, `Illness`, `doc`) VALUES
(1, 'patient', 'me', 'patient@gmail.com', 1234567890, 'patna', 'Male', 'B+', 150, 179, '19-Sep-17', '15-Aug-17', 'I seem fine!', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacists`
--

CREATE TABLE `pharmacists` (
  `id` int(100) NOT NULL,
  `fname` varchar(500) NOT NULL,
  `lname` varchar(500) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `recovery` varchar(500) NOT NULL,
  `ans` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacists`
--

INSERT INTO `pharmacists` (`id`, `fname`, `lname`, `gender`, `email`, `phone`, `address`, `username`, `password`, `recovery`, `ans`) VALUES
(1, 'pharmacists', 'me', 'Male', 'pharmacists@gmail.com', 1234567890, 'Patna', 'pharmacists', 'raysdebuggers', 'Your NickName?', 'rays');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `recovery` varchar(499) NOT NULL,
  `ans` varchar(100) NOT NULL,
  `weight` int(100) NOT NULL,
  `age` int(100) NOT NULL,
  `blood` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `gender`, `email`, `phone`, `address`, `username`, `password`, `recovery`, `ans`, `weight`, `age`, `blood`, `height`) VALUES
(1, 'patient', 'me', 'Male', 'patient@email.com', 1234567890, 'Patna', 'patient', 'raysdebuggers', 'Favorite pet?', 'dog', 160, 21, 'B+', '179');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacists`
--
ALTER TABLE `pharmacists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pharmacists`
--
ALTER TABLE `pharmacists`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

COMMIT;
