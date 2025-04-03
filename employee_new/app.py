from flask import Flask,jsonify, render_template, request, redirect, url_for, flash, session
from werkzeug.utils import secure_filename
import pandas as pd
import os
import datetime
from functools import lru_cache


# Import database functions
from database import get_db_connection
from models import get_all_employees, get_all_attendance, get_all_projects, insert_attendance

app = Flask(__name__)
app.secret_key = '1234'  # Needed for session management

# Uploads folder
UPLOAD_FOLDER = "uploads"
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/',methods=['GET','POST'])
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch user details
        cursor.execute("SELECT * FROM employees WHERE email = ?", (email,))
        user = cursor.fetchone()

        if user and user[7] == password:  # Assuming password is in column 7
            session['user_id'] = user[0]  # Employee ID
            session['user'] = user[1]  # Name
            session['role'] = user[9]  # Role column (Admin/Manager/Employee)

            if session['role'] == 'Admin':
                return redirect(url_for('admin_dashboard'))
            elif session['role'] == 'Manager':
                return redirect(url_for('manager_dashboard'))
            else:
                return redirect(url_for('employee_dashboard'))
        else:
            return 'Invalid email or password', 401  # Invalid credentials response

    return render_template('login.html')

'''# Home Page
@app.route('/')
def index():
    return render_template('index.html')'''

# Admin Dashboard
'''@app.route('/admin/dashboard')
def admin_dashboard():
    employees = get_all_employees()
    projects = get_all_projects()
    
    total_employees = len(employees)
    active_employees = len([e for e in employees if e.status == 'Active'])
    total_projects = len(projects)
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM attendance WHERE check_type = 'Check-In' AND check_time < '22:00:00'")
    pending_logouts = cursor.fetchone()[0]
    conn.close()

    return render_template('admin_dashboard.html', 
                           total_employees=total_employees, 
                           active_employees=active_employees, 
                           total_projects=total_projects, 
                           pending_logouts=pending_logouts, 
                           projects=projects)'''

# Employee Routes
@app.route('/employees')
def employees():
    employee_list = get_all_employees()
    print(employee_list)
    return render_template('employees.html', employees=employee_list)

# Attendance Routes
@app.route('/attendance')
def attendance():
    attendance_list = get_all_attendance()
    return render_template('attendance.html', attendance=attendance_list)

# Upload Attendance Data (Excel)
@app.route('/upload_attendance', methods=['POST'])
def upload_attendance():
    if 'file' not in request.files:
        flash("No file selected!", "danger")
        return redirect(request.url)

    file = request.files['file']
    if file.filename == '':
        flash("No file selected!", "danger")
        return redirect(request.url)

    if file:
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        # Process the Excel file
        df = pd.read_excel(filepath)
        for _, row in df.iterrows():
            insert_attendance(row['Employee_ID'], row['Check_Time'], row['Check_Type'])

        flash("Attendance data uploaded successfully!", "success")

    return redirect(url_for('attendance'))


# Project Routes
@app.route('/projects')
def projects():
    project_list = get_all_projects()
    return render_template('projects.html', projects=project_list)

# Configure Flask-Mail for Email Notifications
from flask_mail import Mail, Message

app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'your_email@gmail.com'
app.config['MAIL_PASSWORD'] = 'your_email_password'

mail = Mail(app)

@app.route('/send_attendance_notifications')
def send_attendance_notifications():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        SELECT employees.name, employees.email 
        FROM employees 
        JOIN attendance ON employees.id = attendance.employee_id
        WHERE attendance.check_type = 'Check-In' AND attendance.check_time < '22:00:00'
    """)
    
    pending_logouts = cursor.fetchall()
    conn.close()

    for employee in pending_logouts:
        send_email(
            subject="Reminder: Log Out Your Time",
            recipient=employee.email,
            body=f"Hello {employee.name},\n\nYou haven't logged out yet! Please do so before 22:00."
        )

    flash("Attendance notifications sent successfully!", "success")
    return redirect(url_for('admin_dashboard'))

def send_email(subject, recipient, body):
    msg = Message(subject, sender="your_email@gmail.com", recipients=[recipient])
    msg.body = body
    mail.send(msg)


# new routes for login 

'''@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch user details
        cursor.execute("SELECT * FROM employees WHERE email = ?", (email,))
        user = cursor.fetchone()

        if user and user[7] == password:  # Assuming password is in column 7
            session['user_id'] = user[0]  # Employee ID
            session['user'] = user[1]  # Name
            session['role'] = user[9]  # Role column (Admin/Manager/Employee)

            if session['role'] == 'Admin':
                return redirect(url_for('admin_dashboard'))
            elif session['role'] == 'Manager':
                return redirect(url_for('manager_dashboard'))
            else:
                return redirect(url_for('employee_dashboard'))
        else:
            return 'Invalid email or password', 401  # Invalid credentials response

    return render_template('login.html')'''

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

# Admin Dashboard: Can view all employees
@app.route('/admin_dashboard')
def admin_dashboard():
    if 'user' not in session or session['role'] != 'Admin':
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch employee data
    cursor.execute("SELECT id, name, email, domain, status, role, manager_id FROM employees")
    employees = cursor.fetchall()

    # Dynamic news items
    news_items = [
        {"date": "2025-04-01", "content": "SQL Database Optimization Techniques Workshop Announced"},
        {"date": "2025-04-02", "content": "Power BI Dashboarding Tips Shared in New Blog Post"},
        {"date": "2025-04-03", "content": "AI/ML Conference Scheduled for Next Month"},
        {"date": "2025-04-04", "content": "Employee John Doe's Birthday Celebration on Friday"},
        {"date": "2025-04-05", "content": "Power BI Integration with Python Webinar Announced"},
        {"date": "2025-03-31", "content": "AI-Powered Chatbots: Future of Customer Service"},
        {"date": "2025-03-30", "content": "SQL Performance Tuning Best Practices Released"},
        {"date": "2025-03-29", "content": "AI-Driven Data Analytics for Business Growth"},
        {"date": "2025-03-28", "content": "Employee Jane Smith's Work Anniversary Celebration"},
        {"date": "2025-03-27", "content": "Power BI Security Features Explained in New Video"},
    ]

    conn.close()  # Close the database connection

    return render_template(
        'admin_dashboard.html',
        employees=employees,
        news=news_items  # Pass news data to the template
    )
@app.route('/notifications')
def get_notifications():
    cursor = conn.cursor()
    cursor.execute("SELECT id, message FROM notifications WHERE employee_id = 1 AND is_read = 0")
    notifications = [{"id": row.id, "message": row.message} for row in cursor.fetchall()]
    return jsonify(notifications)

@app.route('/mark_read/<int:notif_id>', methods=['POST'])
def mark_as_read(notif_id):
    cursor = conn.cursor()
    cursor.execute("UPDATE notifications SET is_read = 1 WHERE id = ?", notif_id)
    conn.commit()
    return '', 204

# Manager Dashboard: Can view only their subordinates
@app.route('/manager_dashboard')
def manager_dashboard():
    if 'user' not in session or session['role'] != 'Manager':
        return redirect(url_for('login'))

    user_id = session['user_id']

    conn = get_db_connection()
    cursor = conn.cursor()

    # Recursive Query to Fetch Employees under the Manager
    cursor.execute("""
    WITH RecursiveEmployees AS (
        SELECT id, name, email, domain, status, role, manager_id
        FROM employees
        WHERE manager_id = ?

        UNION ALL

        SELECT e.id, e.name, e.email, e.domain, e.status, e.role, e.manager_id
        FROM employees e
        INNER JOIN RecursiveEmployees re ON e.manager_id = re.id
    )
    SELECT * FROM RecursiveEmployees;
    """, user_id)

    employees = cursor.fetchall()

    return render_template('manager_dashboard.html', employees=employees)

# Employee Dashboard: Can only view ID, Email, and Role of all employees
@app.route('/employee_dashboard')
def employee_dashboard():
    if 'user' not in session or session['role'] != 'Employee':
        return redirect(url_for('login'))

    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, email, role FROM employees")
    employees = cursor.fetchall()

    return render_template('employee_dashboard.html', employees=employees)




if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0')

