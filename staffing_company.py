import mysql.connector
from datetime import datetime
import time
from tabulate import tabulate
from datetime import datetime

#CHANGE TO YOUR CREDENTIALS!!
connection = mysql.connector.connect(
    host='localhost',
    user='fajer',
    password='0000',
    database='staffing_company',
)

db = connection.cursor()

#INPUT VALIDATION#
def get_valid_dob(prompt):
    while True:
        user_input = input(prompt).strip()
        try:
            # Try to parse the input as a date
            dob = datetime.strptime(user_input, "%Y-%m-%d")

            # Check if date is in the past
            if dob >= datetime.now():
                print("Date of birth must be in the past.")
                continue

            return user_input  # Valid format, return as string

        except ValueError:
            print("Invalid format or invalid characters. Please use the format YYYY-MM-DD.")

def get_valid_varchar(prompt, max_length=20, allow_spaces=True):
    while True:
        user_input = input(prompt).strip()

        # Allow spaces if configured
        if allow_spaces:
            valid_input = len(user_input) > 0 and len(user_input) <= max_length
        else:
            valid_input = len(user_input) > 0 and len(user_input) <= max_length and ' ' not in user_input

        # Final check
        if valid_input:
            return user_input

        # Error message
        if allow_spaces:
            print(f"Invalid input. Please enter a string of max {max_length} characters.")
        else:
            print(f"Invalid input. No spaces allowed, and max {max_length} characters.")

def get_valid_int(prompt, min_value=None, max_value=None):
    while True:
        user_input = input(prompt).strip()
        if not user_input.isdigit():
            print("Invalid input. Please enter a valid integer.")
            continue
        value = int(user_input)
        if min_value is not None and value < min_value:
            print(f"Invalid input. Value must be at least {min_value}.")
            continue
        if max_value is not None and value > max_value:
            print(f"Invalid input. Value must be at most {max_value}.")
            continue
        return value

def get_valid_date(prompt):
    while True:
        user_input = input(prompt).strip()
        try:
            entered_date = datetime.strptime(user_input, "%Y-%m-%d")
            today = datetime.now().date()

            if entered_date.date() < today:
                print(f"The date {user_input} is in the past. Please enter a future or current date.")
            else:
                return user_input
        except ValueError:
            print("Invalid date format. Please use the format YYYY-MM-DD (e.g., 2025-12-31).")
#INPUT VALIDATION#

def addEmployee():
    try:
        name = get_valid_varchar("Please enter the employee name: ")
        field = get_valid_varchar("Please enter the employee field: ")
        dob = get_valid_dob("Please enter the employee's date of birth (YYYY-MM-DD): ")
        db.execute("INSERT INTO employees (name, field, DOB) VALUES (%s, %s, %s)", (name, field, dob))
        connection.commit()
        print(f"Employee added successfully with ID: {db.lastrowid}")
    except Exception as e:
        print("Error:",e)

def addCompany():
    try:
        name = get_valid_varchar("Please enter the company name: ")
        industry = get_valid_varchar("Please enter the industry: ")
        db.execute("INSERT INTO companies (name, industry) VALUES (%s, %s)", (name, industry))
        connection.commit()
        print(f"Company added successfully with ID: {db.lastrowid}")
    except Exception as e:
        print("Error:",e)

def writeContract():
    emp_id = get_valid_int("Enter Employee ID: ")
    comp_id = get_valid_int("Enter Company ID: ")
    start_date = get_valid_date("Enter Start Working Date: ")
    end_date = get_valid_date("Enter End Working Date: ")
    hourly_pay = get_valid_int("Enter the hourly pay: ")
    city_name = get_valid_varchar("Enter the working location [eg. Stockholm]: ")

    # Call the stored procedure using execute
    db.execute("CALL WriteContract(%s, %s, %s, %s, %s, %s, @success_message)",
               (emp_id, comp_id, start_date, end_date, hourly_pay, city_name))

    # Commit the transaction
    connection.commit()

    # Fetch the output parameter
    db.execute("SELECT @success_message")
    result = db.fetchone()
    print(result[0])
    time.sleep(2)

def getEmployeeSchedual():
    emp_id = get_valid_int("Enter Employee ID: ")
    db.execute("CALL getEmployeeSchedual(%s)", [emp_id])
    result = db.fetchall()

    if result:
        headers = ["Contract ID", "Start Date", "End Date", "Hours", "City","Company ID"]
        print(tabulate(result, headers=headers, tablefmt="fancy_grid"))
    else:
        print("No schedule found for this employee.")

def getEmployees():
    query = "SELECT * FROM getEmployees;"
    db.execute(query)
    result = db.fetchall()
    headers = ["employee ID", "Name", "Field", "Date Of Birth", "Currently Working", "Working At"]
    print(tabulate(result, headers=headers, tablefmt="fancy_grid"))

def getCompanies():
    query = "SELECT * FROM getCompanies"
    db.execute(query)
    result = db.fetchall()
    headers = ["Company ID", "Name", "Industry", "Current Active Contracts"]
    print(tabulate(result, headers=headers, tablefmt="fancy_grid"))

def show_stat():
    queries = {
        "Total Active Employees": "SELECT count(*) FROM getEmployees WHERE currently_working = 'Yes' COLLATE utf8mb4_unicode_ci;",
        "Total Inactive Employees": "SELECT count(*) FROM getEmployees WHERE currently_working = 'No' COLLATE utf8mb4_unicode_ci;",
        "Total Companies Working With": "SELECT count(*) FROM companies;",
        "Available Workers by Field": "SELECT field, count(*) FROM getEmployees WHERE currently_working = 'No' COLLATE utf8mb4_unicode_ci GROUP BY field;",
        "Average Paycheck from Each Sector": "SELECT field, CAST(AVG(CAST(hourly_pay AS INT)) AS INT) AS average_paycheck FROM employees INNER JOIN contracts c ON employees.employee_id = c.employee_id GROUP BY field;",
        "Average Contract Length (Days)": "SELECT CAST(AVG(DATEDIFF(end_date, start_date)) AS INT) AS average_duration_days FROM contracts;",
        "Most Popular Working Location": "SELECT city FROM contracts GROUP BY city ORDER BY count(city) DESC LIMIT 1;"
    }

    print("\n====== COMPANY STATISTICS ======")
    print(f"Report generated at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("=" * 40)

    for title, query in queries.items():
        db.execute(query)
        result = db.fetchall()

        print(f"\n{title}:")
        if len(result) > 1 or isinstance(result[0], tuple):
            print(tabulate(result, headers=[title], tablefmt="grid"))
        else:
            print(f"→ {result[0][0]}")

    print("\n"*2)

def getEmployeeRecommendations():
    query = "SELECT r.employee_id, name, score, comment FROM employees JOIN recommendations r ON employees.employee_id = r.employee_id;"
    db.execute(query)
    result = db.fetchall()
    headers = ["Employee ID", "Name", "Score", "Comment"]
    if result:
        print(tabulate(result, headers=headers, tablefmt="fancy_grid"))
    else:
        print("No recommendations found.")




choices = [
    "Add an employee",
    "Add a company",
    "Write a contract for an employee",
    "See specific employee schedule",
    "See all employees",
    "See all companies",
    "See Statistics",
    "See Employee Recommendations"
]


def main():
    print("Welcome to the staff management application!")
    today = datetime.now()

    # Print the date
    print("Todays Date:",today.strftime("%Y-%m-%d"))
    while True:
        index=1
        #print the available options
        for item in choices:
            print(index,"-",item)
            index =  index + 1

        #take user input
        userInput = input(f"Pick from 1 to {len(choices)}: ")
       #check if the input is valid
        if not userInput.isdigit() or not (1 <= int(userInput) <= len(choices)):
            print("Please select a valid option")
        else:
            intInput = int(userInput)
            if(intInput ==  1):
                addEmployee()
            elif(intInput == 2):
                addCompany()
            elif(intInput == 3):
                writeContract()
            elif(intInput == 4):
                getEmployeeSchedual()
            elif(intInput == 5):
                getEmployees()
            elif(intInput == 6):
                getCompanies()
            elif(intInput == 7):
                show_stat()
            elif(intInput == 8):
                getEmployeeRecommendations()

    time.sleep(2)



main()
