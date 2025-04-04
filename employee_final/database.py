import pyodbc

def get_db_connection():
    conn = pyodbc.connect(
        "DRIVER={SQL Server};"
        "SERVER=NICESS-LP236;"
        "DATABASE=EmployeeManagement;"
        "UID=sa;"
        "PWD=training@123;"
    )
    return conn
