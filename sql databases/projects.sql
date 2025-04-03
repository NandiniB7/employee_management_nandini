CREATE TABLE projects (
    project_id INT IDENTITY PRIMARY KEY,
    project_name VARCHAR(255),
    client_name VARCHAR(255),
    project_cost DECIMAL(10,2),
    profit_earned DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20) CHECK (status IN ('Available', 'Assigned')),
    assigned_to VARCHAR(255) NULL  -- Stores assigned employee IDs as a comma-separated string
);

INSERT INTO projects (project_name, client_name, project_cost, profit_earned, start_date, end_date, status, assigned_to)
VALUES
    -- Assigned Projects
    ('Employee Management System', 'ABC Corp', 50000.00, 10000.00, '2024-01-10', '2024-06-30', 'Assigned', '1,2,3'),
    ('E-Commerce Web App', 'XYZ Retail', 75000.00, 15000.00, '2024-02-01', '2024-08-15', 'Assigned', '4,5,6'),
    ('Inventory Tracking System', 'SupplyChain Inc.', 60000.00, 12000.00, '2024-03-10', '2024-09-30', 'Assigned', '7,8'),
    ('HR Automation Tool', 'Global HR Solutions', 90000.00, 18000.00, '2024-04-15', '2024-11-30', 'Assigned', '9,10,11'),
    ('AI Chatbot', 'Tech Innovators', 45000.00, 9000.00, '2024-05-01', '2024-10-20', 'Assigned', '12,13'),
    ('Healthcare Management System', 'HealthPlus', 85000.00, 17000.00, '2024-06-05', '2024-12-31', 'Assigned', '14,15,16'),
    ('Online Learning Platform', 'EduTech Solutions', 100000.00, 25000.00, '2024-07-01', '2025-01-31', 'Assigned', '17,18,19'),
	-- Additional Assigned Projects
    ('AI-Powered Search Engine', 'NextGen AI', 120000.00, 30000.00, '2024-08-01', '2025-02-28', 'Assigned', '20,21,22'),
    ('Automated Fraud Detection', 'FinSecure', 95000.00, 22000.00, '2024-09-01', '2025-03-31', 'Assigned', '23,24'),
    ('Customer Sentiment Analysis', 'Market Trends', 68000.00, 14000.00, '2024-10-01', '2025-04-30', 'Assigned', '25,26,27'),
    ('Smart Traffic Management', 'CityGov', 78000.00, 16000.00, '2024-11-01', '2025-05-31', 'Assigned', '28,29'),
    -- Available Projects (Not yet assigned)
    ('Cybersecurity Audit Tool', 'Security Experts', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('Data Analytics Dashboard', 'Analytics Hub', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('Automated Resume Screener', 'RecruitAI', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('Smart Attendance System', 'FaceRec Systems', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('IoT-Based Smart Home System', 'Smart Living', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('Blockchain-Based Voting System', 'GovTech', NULL, NULL, NULL, NULL, 'Available', NULL),
    ('Task Management Software', 'TeamWork Inc.', NULL, NULL, NULL, NULL, 'Available', NULL);




select* from projects;