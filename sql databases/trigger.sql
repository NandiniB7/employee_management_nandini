-- Trigger to notify employees who forget to log out by 10 PM
CREATE TRIGGER trg_CheckOutReminder
ON attendance
AFTER INSERT
AS
BEGIN
    DECLARE @employee_id INT;
    DECLARE @check_in_time DATETIME;

    SELECT @employee_id = i.employee_id, @check_in_time = i.check_in
    FROM inserted i;

    IF @check_in_time IS NOT NULL AND DATEPART(HOUR, @check_in_time) = 22
    BEGIN
        INSERT INTO notifications (employee_id, message)
        VALUES (@employee_id, 'Reminder: You forgot to log out at 10 PM.');
    END
END;

CREATE TRIGGER trg_CheckMissingLogout
ON attendance
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert alert for employees who checked in but did not check out by 22:00
    INSERT INTO attendance_alerts (employee_id, alert_message, alert_time)
    SELECT DISTINCT a.employee_id, 
        'Employee has not logged out by 22:00', 
        GETDATE()
    FROM attendance a
    WHERE a.check_type = 'IN'
    AND NOT EXISTS (
        SELECT 1 FROM attendance a2 
        WHERE a2.employee_id = a.employee_id 
        AND a2.check_type = 'OUT'
        AND CONVERT(TIME, a2.check_time) <= '22:00:00'
    )
    AND CONVERT(TIME, a.check_time) <= '22:00:00';
END;
INSERT INTO attendance (employee_id, check_time, check_type)
VALUES (101, '2025-04-02 09:00:00', 'IN');

-- No OUT entry till 22:00, so an alert should be generated.
SELECT * FROM attendance_alerts;
