CREATE DATABASE EmployeeManagement;

USE EmployeeManagement;

-- Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    work_experience NVARCHAR(50),
    domain NVARCHAR(50),
    status NVARCHAR(20),
    manager_id INT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    photo VARBINARY(MAX) NULL,  -- To store employee photos
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);
INSERT INTO employees (name, work_experience, domain, status, manager_id, email, password, photo)
VALUES 
('Akshay Lodhi', '6 years 4 months', 'Technology', 'On Project', NULL, 'akshay.lodhi@nicesoftwaresolutions.com', 'Akshay@11', NULL),
('Sumeet Dayalchand Chandwani', '3 years 4 months', 'Lead Consultant', 'On Project', 1, 'sumeet.chandwani@nicesoftwaresolutions.com', 'Sumeet@12', NULL),
('Dewashish Prabhakar Dhoke', '3 years 4 months', 'Consultant', 'On Project', 2, 'dewashish.dhoke@nicesoftwaresolutions.com', 'Dewashish@13', NULL),
('Nitesh Mishra', '2 years 4 months', 'Consultant', 'On Project', 2, 'nitesh.mishra@nicesoftwaresolutions.com', 'Nitesh@14', NULL),
('Satyam Wagh', '1 year 1 month', 'Associate', 'Bench', 2, 'satyam.wagh@nicesoftwaresolutions.com', 'Satyam@15', NULL),
('Karan Jani', '1 year 0 months', 'Associate', 'Bench', 2, 'karan.jani@nicesoftwaresolutions.com', 'Karan@16', NULL),
('Mohammad Abdul Hameed', '0 years 5 months', 'Associate', 'Bench', 2, 'mohammad.hameed@nicesoftwaresolutions.com', 'Hameed@17', NULL),
('Sarthak Manalwar', '0 years 6 months', 'Associate', 'Bench', 2, 'sarthak.manalwar@nicesoftwaresolutions.com', 'Sarthak@18', NULL),
('Prathmesh Urkude', '0 years 0 months', 'Associate', 'Bench', 2, 'prathmesh.urkude@nicesoftwaresolutions.com', 'Prathmesh@19', NULL),
('Mohammad Arsalan Adil', '3 years 3 months', 'Consultant', 'On Project', 1, 'arsalan.adil@nicesoftwaresolutions.com', 'Arsalan@21', NULL),
('Adarsh Soni', '1 year 5 months', 'Associate', 'On Project', 10, 'adarsh.soni@nicesoftwaresolutions.com', 'Adarsh@22', NULL),
('Aasima Sheikh', '0 years 8 months', 'Associate', 'Bench', 10, 'aasima.sheikh@nicesoftwaresolutions.com', 'Aasima@23', NULL),
('Rushikesh Bhagwatkar', '0 years 6 months', 'Associate', 'Bench', 10, 'rushikesh.bhagwatkar@nicesoftwaresolutions.com', 'Rushikesh@24', NULL),
('Kunal Borole', '0 years 6 months', 'Associate', 'Bench', 10, 'kunal.borole@nicesoftwaresolutions.com', 'Kunal@25', NULL),
('Yashashwi Wahie', '0 years 0 months', 'Associate', 'Bench', 10, 'yashashwi.wahie@nicesoftwaresolutions.com', 'Yashashwi@26', NULL),
('Karan Tiwari', '3 years 0 months', 'Consultant', 'On Project', 1, 'karan.tiwari@nicesoftwaresolutions.com', 'Karan@27', NULL),
('Tanmay Chauhan', '3 years 0 months', 'Associate', 'On Project', 1, 'tanmay.chauhan@nicesoftwaresolutions.com', 'Tanmay@28', NULL),
('Anurag Katre', '0 years 8 months', 'Associate', 'Bench', 17, 'anurag.katre@nicesoftwaresolutions.com', 'Anurag@29', NULL),
('Divya Kanwar', '0 years 0 months', 'Intern', 'Bench', 17, 'divya.kanwar@nicesoftwaresolutions.com', 'Divya@31', NULL),
('Divya Dubey', '2 years 4 months', 'Associate', 'On Project', 1, 'divya.dubey@nicesoftwaresolutions.com', 'Divyad@32', NULL),
('Sanyukta Thombre', '0 years 6 months', 'Associate', 'Bench', 20, 'sanyukta.thombre@nicesoftwaresolutions.com', 'Sanyukta@33', NULL),
('Chataparthi Sai Viswanadh', '1 year 5 months', 'Consultant', 'On Project', 1, 'chataparthi.viswanadh@nicesoftwaresolutions.com', 'Chataparthi@34', NULL),
('Rupal Kapse', '1 year 5 months', 'Associate', 'Bench', 1, 'rupal.kapse@nicesoftwaresolutions.com', 'Rupal@35', NULL),
('Pravin Pardhi', '1 year 5 months', 'Associate', 'Bench', 1, 'pravin.pardhi@nicesoftwaresolutions.com', 'Pravin@36', NULL),
('Manmeet Singh Oberoi', '0 years 2 months', 'Intern', 'Bench', 1, 'manmeet.oberoi@nicesoftwaresolutions.com', 'Manmeet@37', NULL),
('Nandini Bharadwaj', '0 years 1 month', 'Intern', 'Bench', 1, 'nandini.bharadwaj@nicesoftwaresolutions.com', 'Nandini@38', NULL),
('Akshay Kawale', '0 years 1 month', 'Intern', 'Bench', 1, 'akshay.kawale@nicesoftwaresolutions.com', 'Akshayk@39', NULL),
('Darshan Rawal', '0 years 1 month', 'Intern', 'Bench', 1, 'darshan.rawal@nicesoftwaresolutions.com', 'Darshan@41', NULL),
('Samhita Moghe', '0 years 1 month', 'Intern', 'Bench', 1, 'samhita.moghe@nicesoftwaresolutions.com', 'Samhita@42', NULL);
select*from employees;

UPDATE employees 
SET role = 'Admin' 
WHERE email = 'akshay.lodhi@nicesoftwaresolutions.com';
UPDATE employees 
WHERE email IN ('sumeet.chandwani@nicesoftwaresolutions.com', 'arsalan.adil@nicesoftwaresolutions.com', 'tanmay.chauhan@nicesoftwaresolutions.com', 'divya.dubey@nicesoftwaresolutions.com');








