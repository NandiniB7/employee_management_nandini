CREATE TABLE notifications (
    id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT NOT NULL,
    message NVARCHAR(255),
    is_read BIT DEFAULT 0,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
-- Notifications for Managers about available projects
INSERT INTO notifications (employee_id, message, is_read)
VALUES
(1, 'New project available: Cybersecurity Audit Tool. Assign as needed.', 0),
(1, 'New project available: Data Analytics Dashboard. Assign as needed.', 0),
(2, 'New project available: Automated Resume Screener. Assign as needed.', 0),
(10, 'New project available: Smart Attendance System. Assign as needed.', 0),
(16, 'New project available: Blockchain-Based Voting System. Assign as needed.', 0);

-- Notifications for Employees about assigned projects
INSERT INTO notifications (employee_id, message, is_read)
VALUES
(1, 'You have been assigned to the Employee Management System project.', 0),
(2, 'You have been assigned to the E-Commerce Web App project.', 0),
(3, 'You have been assigned to the Inventory Tracking System project.', 0),
(10, 'You have been assigned to the HR Automation Tool project.', 0),
(16, 'You have been assigned to the AI Chatbot project.', 0),
(20, 'You have been assigned to the Healthcare Management System project.', 0),
(22, 'You have been assigned to the Online Learning Platform project.', 0);

-- Notifications for Employees who forgot to log out at 10 PM
INSERT INTO notifications (employee_id, message, is_read)
VALUES
(5, 'Reminder: You forgot to log out at 22:00. Please log out to maintain accurate attendance records.', 0),
(8, 'Reminder: You forgot to log out at 22:00. Please log out to maintain accurate attendance records.', 0),
(12, 'Reminder: You forgot to log out at 22:00. Please log out to maintain accurate attendance records.', 0),
(18, 'Reminder: You forgot to log out at 22:00. Please log out to maintain accurate attendance records.', 0);
select * from notifications;