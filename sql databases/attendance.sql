CREATE TABLE attendance (
    id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT NOT NULL,
    check_time DATETIME NOT NULL,
    check_type NVARCHAR(10) CHECK (check_type IN ('IN', 'OUT')),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
-- Insert Attendance Data for all 29 employees
INSERT INTO attendance (employee_id,check_time,check_type)
VALUES 
-- Akshay Lodhi (ID: 1)
(1, '2025-03-31 09:00:00', 'IN'),
(1, '2025-03-31 13:00:00', 'OUT'),
(1, '2025-03-31 14:00:00', 'IN'),
(1, '2025-03-31 18:00:00', 'OUT'),

-- Sumeet Chandwani (ID: 2)
(2, '2025-03-31 09:15:00', 'IN'),
(2, '2025-03-31 12:45:00', 'OUT'),
(2, '2025-03-31 13:45:00', 'IN'),
(2, '2025-03-31 18:15:00', 'OUT'),

-- Dewashish Prabhakar Dhoke (ID: 3)
(3, '2025-03-31 09:30:00', 'IN'),
(3, '2025-03-31 13:00:00', 'OUT'),
(3, '2025-03-31 14:00:00', 'IN'),
(3, '2025-03-31 17:45:00', 'OUT'),

-- Nitesh Mishra (ID: 4)
(4, '2025-03-31 09:00:00', 'IN'),
(4, '2025-03-31 12:30:00', 'OUT'),
(4, '2025-03-31 13:30:00', 'IN'),
(4, '2025-03-31 17:30:00', 'OUT'),

-- Satyam Wagh (ID: 5)
(5, '2025-03-31 09:15:00', 'IN'),
(5, '2025-03-31 12:45:00', 'OUT'),
(5, '2025-03-31 13:30:00', 'IN'),
(5, '2025-03-31 17:00:00', 'OUT'),

-- Karan Jani (ID: 6)
(6, '2025-03-31 10:00:00', 'IN'),
(6, '2025-03-31 13:30:00', 'OUT'),
(6, '2025-03-31 14:30:00', 'IN'),
(6, '2025-03-31 17:30:00', 'OUT'),

-- Mohammad Abdul Hameed (ID: 7)
(7, '2025-03-31 09:30:00', 'IN'),
(7, '2025-03-31 12:00:00', 'OUT'),
(7, '2025-03-31 13:00:00', 'IN'),
(7, '2025-03-31 16:30:00', 'OUT'),

-- Sarthak Manalwar (ID: 8)
(8, '2025-03-31 09:00:00', 'IN'),
(8, '2025-03-31 12:30:00', 'OUT'),
(8, '2025-03-31 13:00:00', 'IN'),
(8, '2025-03-31 16:45:00', 'OUT'),

-- Prathmesh Urkude (ID: 9)
(9, '2025-03-31 10:30:00', 'IN'),
(9, '2025-03-31 13:30:00', 'OUT'),
(9, '2025-03-31 14:30:00', 'IN'),
(9, '2025-03-31 17:30:00', 'OUT'),

-- Mohammad Arsalan Adil (ID: 10)
(10, '2025-03-31 09:00:00', 'IN'),
(10, '2025-03-31 12:00:00', 'OUT'),
(10, '2025-03-31 13:00:00', 'IN'),
(10, '2025-03-31 17:30:00', 'OUT'),

-- Adarsh Soni (ID: 11)
(11, '2025-03-31 08:45:00', 'IN'),
(11, '2025-03-31 12:15:00', 'OUT'),
(11, '2025-03-31 13:15:00', 'IN'),
(11, '2025-03-31 17:00:00', 'OUT'),

-- Aasima Sheikh (ID: 12)
(12, '2025-03-31 09:00:00', 'IN'),
(12, '2025-03-31 12:30:00', 'OUT'),
(12, '2025-03-31 13:00:00', 'IN'),
(12, '2025-03-31 17:30:00', 'OUT'),

-- Rushikesh Bhagwatkar (ID: 13)
(13, '2025-03-31 09:30:00', 'IN'),
(13, '2025-03-31 12:30:00', 'OUT'),
(13, '2025-03-31 13:30:00', 'IN'),
(13, '2025-03-31 17:15:00', 'OUT'),

-- Kunal Borole (ID: 14)
(14, '2025-03-31 10:00:00', 'IN'),
(14, '2025-03-31 13:00:00', 'OUT'),
(14, '2025-03-31 14:00:00', 'IN'),
(14, '2025-03-31 17:30:00', 'OUT'),

-- Yashashwi Wahie (ID: 15)
(15, '2025-03-31 09:00:00', 'IN'),
(15, '2025-03-31 12:30:00', 'OUT'),
(15, '2025-03-31 13:30:00', 'IN'),
(15, '2025-03-31 16:45:00', 'OUT'),

-- Karan Tiwari (ID: 16)
(16, '2025-03-31 09:15:00', 'IN'),
(16, '2025-03-31 12:45:00', 'OUT'),
(16, '2025-03-31 13:45:00', 'IN'),
(16, '2025-03-31 17:00:00', 'OUT'),

-- Tanmay Chauhan (ID: 17)
(17, '2025-03-31 09:00:00', 'IN'),
(17, '2025-03-31 12:00:00', 'OUT'),
(17, '2025-03-31 13:00:00', 'IN'),
(17, '2025-03-31 17:30:00', 'OUT'),

-- Anurag Katre (ID: 18)
(18, '2025-03-31 09:30:00', 'IN'),
(18, '2025-03-31 12:30:00', 'OUT'),
(18, '2025-03-31 13:30:00', 'IN'),
(18, '2025-03-31 17:00:00', 'OUT'),

-- Divya Kanwar (ID: 19)
(19, '2025-03-31 09:15:00', 'IN'),
(19, '2025-03-31 12:30:00', 'OUT'),
(19, '2025-03-31 13:30:00', 'IN'),
(19, '2025-03-31 17:15:00', 'OUT'),

-- Divya Dubey (ID: 20)
(20, '2025-03-31 09:00:00', 'IN'),
(20, '2025-03-31 12:00:00', 'OUT'),
(20, '2025-03-31 13:00:00', 'IN'),
(20, '2025-03-31 17:45:00', 'OUT'),

-- Sanyukta Thombre (ID: 21)
(21, '2025-03-31 09:00:00', 'IN'),
(21, '2025-03-31 12:30:00', 'OUT'),
(21, '2025-03-31 13:30:00', 'IN'),
(21, '2025-03-31 17:30:00', 'OUT'),

-- Chataparthi Sai Viswanadh (ID: 22)
(22, '2025-03-31 09:30:00', 'IN'),
(22, '2025-03-31 12:30:00', 'OUT'),
(22, '2025-03-31 13:30:00', 'IN'),
(22, '2025-03-31 17:30:00', 'OUT'),

-- Rupal Kapse (ID: 23)
(23, '2025-03-31 09:00:00', 'IN'),
(23, '2025-03-31 12:00:00', 'OUT'),
(23, '2025-03-31 13:00:00', 'IN'),
(23, '2025-03-31 17:30:00', 'OUT'),

-- Pravin Pardhi (ID: 24)
(24, '2025-03-31 09:30:00', 'IN'),
(24, '2025-03-31 12:30:00', 'OUT'),
(24, '2025-03-31 13:30:00', 'IN'),
(24, '2025-03-31 17:00:00', 'OUT'),

-- Manmeet Singh Oberoi (ID: 25)
(25, '2025-03-31 09:15:00', 'IN'),
(25, '2025-03-31 12:30:00', 'OUT'),
(25, '2025-03-31 13:30:00', 'IN'),
(25, '2025-03-31 17:30:00', 'OUT'),

-- Nandini Bharadwaj (ID: 26)
(26, '2025-03-31 09:00:00', 'IN'),
(26, '2025-03-31 12:00:00', 'OUT'),
(26, '2025-03-31 13:00:00', 'IN'),
(26, '2025-03-31 17:30:00', 'OUT'),

-- Akshay Kawale (ID: 27)
(27, '2025-03-31 09:30:00', 'IN'),
(27, '2025-03-31 12:30:00', 'OUT'),
(27, '2025-03-31 13:30:00', 'IN'),
(27, '2025-03-31 17:00:00', 'OUT'),

-- Darshan Rawal (ID: 28)
(28, '2025-03-31 09:00:00', 'IN'),
(28, '2025-03-31 12:30:00', 'OUT'),
(28, '2025-03-31 13:30:00', 'IN'),
(28, '2025-03-31 17:15:00', 'OUT'),

-- Samhita Moghe (ID: 29)
(29, '2025-03-31 09:15:00', 'IN'),
(29, '2025-03-31 12:45:00', 'OUT'),
(29, '2025-03-31 13:45:00', 'IN'),
(29, '2025-03-31 17:00:00', 'OUT');
select* from attendance;
drop table attendance_summary;
-- Step 4: Create the Attendance Summary Table (if not already created)
CREATE TABLE attendance_summary (
    id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    total_working_hours FLOAT NOT NULL,
    total_break_hours FLOAT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Step 5: Calculate and Insert Attendance Summary (Working hours and Break hours)
WITH AttendancePairs AS (
    SELECT 
        a.employee_id,
        a.check_time AS in_time,
        LEAD(a.check_time) OVER (PARTITION BY a.employee_id ORDER BY a.check_time) AS out_time
    FROM attendance a
    WHERE a.check_type = 'IN'
)
-- Insert summary into attendance_summary table
INSERT INTO attendance_summary (employee_id, attendance_date, total_working_hours, total_break_hours)
SELECT 
    A.employee_id,
    CAST(A.in_time AS DATE) AS attendance_date,
    SUM(DATEDIFF(MINUTE, A.in_time, A.out_time)) / 60.0 AS total_working_hours,
    -- Breaks are calculated by checking the time between OUT and the next IN
    9.0 - (SUM(DATEDIFF(MINUTE, A.in_time, A.out_time)) / 60.0) AS total_break_hours
FROM AttendancePairs A
GROUP BY A.employee_id, CAST(A.in_time AS DATE);

-- Step 6: Select the Attendance Summary
SELECT * FROM attendance_summary;

