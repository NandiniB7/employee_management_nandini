from database import get_db_connection
from functools import lru_cache

@lru_cache(maxsize=10)
def get_all_employees():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, name, email, domain, status,role,manager_id FROM employees")
    employees = cursor.fetchall()
    conn.close()
    return employees

def get_all_attendance():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, employee_id, check_time, check_type FROM attendance")
    attendance = cursor.fetchall()
    conn.close()
    return attendance

def get_all_projects():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT project_id, project_name, client_name, project_cost, profit_earned, start_date, end_date, status, assigned_to FROM projects")
    projects = cursor.fetchall()
    conn.close()
    return projects


def insert_attendance(employee_id, check_time, check_type):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO attendance (employee_id, check_time, check_type) VALUES (?, ?, ?)",
                   (employee_id, check_time, check_type))
    conn.commit()
    conn.close()
