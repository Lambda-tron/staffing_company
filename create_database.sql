show databases;

CREATE DATABASE staffing_company;

USE staffing_company;

#Creating Tables
CREATE TABLE employees(
    employee_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    field VARCHAR(60) NOT NULL,
    DOB DATE NOT NULL
);

CREATE TABLE companies(
    company_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL,
    industry varchar(60) NOT NULL
);

CREATE TABLE contracts(
    contract_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    company_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    hourly_pay INT NOT NULL,
    city varchar(30)
);

CREATE TABLE recommendations(
    employee_id INT NOT NULL,
    company_id INT NOT NULL,
    score INT NOT NULL,
    comment varchar(200),
    PRIMARY KEY (employee_id, company_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);


INSERT INTO employees (employee_id, name, field, DOB) VALUES
(1, 'Adrian Williams', 'Software Engineering', '1979-09-04'),
(2, 'Keith Jordan', 'Software Engineering', '1986-08-21'),
(3, 'Kimberly Smith', 'Sales', '1988-05-08'),
(4, 'Kevin Wolfe', 'Marketing', '1975-04-18'),
(5, 'Stacy Tran', 'Human Resources', '1994-05-05'),
(6, 'Laura Arnold', 'Finance', '1994-02-20'),
(7, 'Kathy Huerta', 'Sales', '1984-07-20'),
(8, 'Melinda Young', 'Finance', '1989-01-14'),
(9, 'Timothy Morris', 'Finance', '1991-07-14'),
(10, 'William Davis', 'Finance', '1996-04-29'),
(11, 'Ronald Hudson', 'IT Support', '1980-04-19'),
(12, 'Denise Valdez', 'Finance', '1984-09-06'),
(13, 'Christopher Jackson', 'IT Support', '1975-05-28'),
(14, 'Spencer Smith', 'Marketing', '1985-02-19'),
(15, 'Jillian Allen', 'IT Support', '1994-12-24'),
(16, 'Bradley Alvarez', 'Sales', '1980-09-08'),
(17, 'Michael Solomon', 'Sales', '1973-12-22'),
(18, 'Randall Smith', 'Finance', '1975-04-06'),
(19, 'Marcus Wagner', 'Human Resources', '1973-05-29'),
(20, 'Donna Moody', 'Data Analysis', '1990-09-28'),
(21, 'Johnny Mcgrath', 'Marketing', '1985-12-18'),
(22, 'Dennis Bush', 'Data Analysis', '1983-02-26'),
(23, 'Larry Clark', 'Software Engineering', '1998-02-11'),
(24, 'Angel Lopez', 'Marketing', '1978-10-26'),
(25, 'Andrea Baker', 'IT Support', '1972-06-10'),
(26, 'Gregory Roth', 'Sales', '1973-09-15'),
(27, 'Sara Scott', 'Finance', '1973-04-18'),
(28, 'Steven Wolf', 'Software Engineering', '1987-03-16'),
(29, 'Wendy Boyd', 'Human Resources', '1979-11-25'),
(30, 'Jeffrey Burns', 'Data Analysis', '1974-07-04'),
(31, 'Theresa Mitchell', 'Human Resources', '1982-06-02'),
(32, 'Frank Coleman', 'Software Engineering', '1990-11-15'),
(33, 'Julie Chen', 'Marketing', '1985-10-24'),
(34, 'Cameron Fisher', 'IT Support', '1992-01-14'),
(35, 'Gina Gray', 'Sales', '1993-12-22'),
(36, 'Nicholas Bell', 'Finance', '1988-09-18'),
(37, 'Patrick Lane', 'Marketing', '1976-03-12'),
(38, 'Brittany Sims', 'Data Analysis', '1991-05-17'),
(39, 'Courtney West', 'Software Engineering', '1984-06-08'),
(40, 'Nathan Howard', 'IT Support', '1989-10-02'),
(41, 'Diane Hall', 'Human Resources', '1978-04-11'),
(42, 'Ryan Alexander', 'Marketing', '1983-08-28'),
(43, 'Olivia Brooks', 'Sales', '1992-11-05'),
(44, 'Cody Rogers', 'Data Analysis', '1986-05-30'),
(45, 'Jessica Flores', 'Finance', '1981-03-16'),
(46, 'Samuel James', 'Software Engineering', '1977-12-19'),
(47, 'Sharon Cox', 'Human Resources', '1980-04-22'),
(48, 'Louis Butler', 'IT Support', '1993-07-14'),
(49, 'Catherine Bailey', 'Finance', '1987-10-18'),
(50, 'Anthony Perry', 'Sales', '1982-01-25');

INSERT INTO companies (company_id, name, industry) VALUES
(1, 'Griffith-Kelly', 'Construction'),
(2, 'Jones Inc', 'Construction'),
(3, 'Brown-Leon', 'Construction'),
(4, 'Mcclure, Bridges and Stein', 'Construction'),
(5, 'Henry PLC', 'Retail'),
(6, 'Knapp, Munoz and Soto', 'Finance'),
(7, 'Hughes and Sons', 'Healthcare'),
(8, 'Avila, Kennedy and Flowers', 'Healthcare'),
(9, 'Jackson Inc', 'Retail'),
(10, 'Hutchinson-Nichols', 'Healthcare'),
(11, 'Patterson LLC', 'Technology'),
(12, 'Miller and Associates', 'Manufacturing'),
(13, 'Walters Group', 'Finance'),
(14, 'Fisher, Stewart and Barnes', 'Consulting'),
(15, 'Young Enterprises', 'Energy'),
(16, 'Evans and Partners', 'Education'),
(17, 'Reed Technologies', 'Technology'),
(18, 'Scott and Sons', 'Logistics'),
(19, 'Carter Holdings', 'Real Estate'),
(20, 'Perez Industries', 'Automotive');

INSERT INTO contracts (contract_id, employee_id, company_id, start_date, end_date, hourly_pay, city) VALUES
(1, 3, 7, '2024-12-17', '2025-03-30', 48, 'Reginahaven'),
(2, 3, 6, '2023-03-24', '2023-11-23', 83, 'South Robertstad'),
(3, 15, 9, '2023-03-17', '2023-11-28', 21, 'Rodriguezfurt'),
(4, 20, 7, '2023-12-19', '2024-04-22', 28, 'Port Sierraland'),
(5, 14, 1, '2024-11-15', '2025-10-04', 90, 'Jasonhaven'),
(6, 4, 7, '2023-10-20', '2024-02-02', 59, 'Martinezport'),
(7, 4, 1, '2023-02-25', '2023-06-20', 71, 'Robertport'),
(8, 30, 8, '2023-04-20', '2023-06-13', 30, 'Lake Veronicachester'),
(9, 26, 1, '2023-02-28', '2023-11-17', 88, 'Jaredport'),
(10, 1, 6, '2023-09-30', '2024-07-30', 15, 'North John'),
(11, 27, 4, '2024-09-14', '2025-04-29', 27, 'Jeffreyport'),
(12, 6, 6, '2024-02-04', '2024-06-30', 60, 'North Alec'),
(13, 1, 1, '2023-02-26', '2023-06-16', 51, 'Ruizberg'),
(14, 26, 4, '2024-10-13', '2025-03-05', 93, 'Port Jameston'),
(15, 6, 7, '2023-01-21', '2023-10-22', 61, 'North Veronicatown'),
(16, 30, 8, '2023-08-08', '2023-12-23', 93, 'West Deannaville'),
(17, 2, 5, '2024-10-23', '2025-05-01', 89, 'Chavezville'),
(18, 4, 4, '2024-09-05', '2025-06-10', 26, 'Emilybury'),
(19, 10, 2, '2024-05-05', '2025-04-07', 63, 'Stantonton'),
(20, 19, 9, '2023-10-28', '2023-12-28', 67, 'East Jared'),
(21, 28, 8, '2023-09-14', '2024-05-24', 74, 'East Andrew'),
(22, 4, 10, '2024-04-29', '2024-06-06', 83, 'Lake Thomasfort'),
(23, 4, 3, '2024-07-02', '2024-08-27', 28, 'Ericchester'),
(24, 4, 4, '2023-06-28', '2023-07-31', 40, 'Laurenview'),
(25, 25, 10, '2024-06-30', '2025-04-14', 79, 'Sarahview'),
(26, 10, 3, '2023-08-28', '2024-02-20', 66, 'Everettbury'),
(27, 2, 10, '2023-12-26', '2024-06-03', 37, 'Lake Seth'),
(28, 7, 10, '2024-03-17', '2024-11-28', 42, 'Lake Margaret'),
(29, 9, 9, '2023-11-12', '2024-06-03', 32, 'Lake Robert'),
(30, 19, 2, '2024-04-05', '2024-05-24', 20, 'Stricklandside'),
(31, 5, 1, '2024-01-15', '2025-06-12', 55, 'Brooklyn'),
(32, 7, 2, '2024-03-20', '2025-09-14', 60, 'Manhattan'),
(33, 8, 3, '2023-11-05', '2025-04-20', 48, 'Queens'),
(34, 11, 4, '2024-05-01', '2025-08-15', 75, 'Bronx'),
(35, 12, 5, '2023-06-10', '2025-12-31', 50, 'Jersey City'),
(36, 13, 6, '2024-02-22', '2025-11-11', 62, 'Hoboken'),
(37, 14, 7, '2023-08-14', '2025-03-19', 67, 'Staten Island'),
(38, 16, 8, '2024-09-12', '2025-07-25', 80, 'Newark'),
(39, 17, 9, '2023-05-22', '2025-10-13', 45, 'Paterson'),
(40, 18, 10, '2024-07-15', '2025-08-30', 55, 'Elizabeth'),
(41, 19, 2, '2024-03-08', '2025-05-22', 70, 'Yonkers'),
(42, 20, 3, '2024-02-17', '2025-06-18', 66, 'White Plains'),
(43, 21, 4, '2024-05-21', '2025-07-16', 54, 'Trenton'),
(44, 22, 5, '2024-04-14', '2025-12-05', 78, 'Princeton'),
(45, 23, 6, '2023-09-19', '2025-10-20', 47, 'Camden'),
(46, 24, 7, '2024-08-11', '2025-06-15', 68, 'Atlantic City'),
(47, 25, 8, '2024-01-07', '2025-04-10', 73, 'Hackensack'),
(48, 26, 9, '2023-12-23', '2025-09-14', 82, 'Mount Vernon'),
(49, 27, 10, '2024-03-15', '2025-08-18', 60, 'Albany'),
(50, 28, 1, '2024-05-22', '2025-07-28', 69, 'Syracuse');
INSERT INTO contracts (contract_id, employee_id, company_id, start_date, end_date, hourly_pay, city) VALUES
(101, 1, 8, '2025-12-27', '2026-12-02', 66, 'Lake Robert'),
(102, 2, 7, '2025-04-22', '2026-02-28', 31, 'East Jared'),
(103, 3, 2, '2025-01-11', '2025-08-30', 60, 'Jasonhaven'),
(104, 4, 3, '2025-01-25', '2025-11-08', 47, 'North John'),
(105, 6, 10, '2025-06-19', '2026-01-28', 66, 'Jasonhaven'),
(106, 7, 4, '2025-07-21', '2026-02-11', 89, 'East Andrew'),
(107, 8, 5, '2025-05-12', '2026-02-06', 57, 'Queens'),
(108, 9, 9, '2025-03-04', '2025-12-15', 64, 'Hoboken'),
(109, 10, 3, '2025-04-09', '2026-03-12', 52, 'North John'),
(110, 15, 7, '2025-01-16', '2025-11-23', 73, 'Laurenview'),
(111, 19, 6, '2025-06-14', '2026-05-17', 84, 'Emilybury'),
(112, 20, 2, '2025-02-28', '2025-12-04', 79, 'White Plains'),
(113, 25, 1, '2025-05-19', '2026-03-08', 55, 'Reginahaven'),
(114, 26, 9, '2025-08-22', '2026-06-18', 49, 'Bronx'),
(115, 27, 8, '2025-04-25', '2026-03-30', 68, 'South Robertstad'),
(116, 28, 4, '2025-11-09', '2026-08-20', 41, 'Syracuse'),
(117, 29, 5, '2025-07-30', '2026-05-27', 77, 'Staten Island'),
(118, 30, 7, '2025-10-04', '2026-09-08', 66, 'Paterson'),
(119, 31, 3, '2025-03-17', '2026-01-01', 51, 'Jeffreyport'),
(120, 32, 10, '2025-06-08', '2026-05-14', 60, 'Manhattan'),
(121, 33, 4, '2025-09-13', '2026-08-16', 64, 'Laurenview'),
(122, 34, 1, '2025-02-27', '2025-12-09', 79, 'Trenton'),
(123, 35, 2, '2025-08-05', '2026-06-10', 45, 'Port Sierraland'),
(124, 36, 5, '2025-12-18', '2026-09-25', 69, 'Lake Margaret'),
(125, 37, 7, '2025-03-21', '2026-01-17', 57, 'Lake Thomasfort'),
(126, 38, 3, '2025-07-19', '2026-06-01', 53, 'Albany'),
(127, 39, 6, '2025-11-02', '2026-10-10', 82, 'Stantonton'),
(128, 40, 8, '2025-09-06', '2026-08-03', 66, 'Mount Vernon'),
(129, 41, 9, '2025-06-16', '2026-05-22', 74, 'Lake Seth'),
(130, 42, 5, '2025-08-24', '2026-06-11', 58, 'Port Jameston'),
(131, 43, 7, '2025-10-13', '2026-09-15', 67, 'Chavezville'),
(132, 44, 1, '2025-05-01', '2026-04-07', 63, 'Port Jameston'),
(133, 45, 10, '2025-02-11', '2025-12-22', 70, 'Jasonhaven'),
(134, 46, 8, '2025-03-29', '2026-02-28', 54, 'Hackensack'),
(135, 47, 3, '2025-04-17', '2026-03-10', 76, 'Lake Veronicachester'),
(136, 48, 9, '2025-09-08', '2026-08-25', 48, 'Ericchester'),
(137, 49, 4, '2025-07-15', '2026-06-13', 59, 'Camden'),
(138, 50, 2, '2025-10-21', '2026-09-27', 68, 'Hackensack');
INSERT INTO recommendations (employee_id, company_id, score, comment) VALUES
(3, 7, 49, 'Consistently delivered high-quality work on time.'),
(3, 6, 202, 'Consistently delivered high-quality work on time.'),
(15, 9, 53, 'Consistently delivered high-quality work on time.'),
(20, 7, 35, 'Consistently delivered high-quality work on time.'),
(4, 7, 61, 'Needs improvement in time management and punctuality.'),
(4, 1, 81, 'Needs improvement in time management and punctuality.'),
(30, 8, 16, 'Should work on enhancing communication skills.'),
(26, 1, 230, 'Demonstrated strong work ethic and professionalism.'),
(1, 6, 45, 'Consistently delivered high-quality work on time.');


#Creating Functions
DELIMITER //
CREATE FUNCTION checkIfEmployeeAvailable(
    emp_id INT,
    s_date DATE,
    e_date DATE
)
RETURNS BOOL
DETERMINISTIC
BEGIN
    DECLARE result INT DEFAULT 0;
    SELECT COUNT(*) INTO result FROM employees
    INNER JOIN contracts ON contracts.employee_id = employees.employee_id
    WHERE  end_date > s_date AND start_date < e_date
    AND contracts.employee_id = emp_id;
    return result = 0;
end//
DELIMITER ;

#Creating Procedures
DELIMITER //
CREATE PROCEDURE WriteContract(
    IN emp_id INT,
    IN comp_id INT,
    IN start_date DATE,
    IN end_date DATE,
    IN hourly_pay DECIMAL(10, 2),
    IN city_name VARCHAR(100),
    OUT success_message VARCHAR(255)
)
BEGIN
    DECLARE available BOOLEAN DEFAULT 0;

    -- Check if the employee is available
    SELECT checkIfEmployeeAvailable(emp_id, start_date, end_date) INTO available;

    -- If the employee is available, insert the contract
    IF available THEN
        INSERT INTO contracts (employee_id, company_id, start_date, end_date, hourly_pay, city)
        VALUES (emp_id, comp_id, start_date, end_date, hourly_pay, city_name);

        SET success_message = "Contract written successfully!";
    ELSE
        SET success_message = "Employee is NOT available, check his schedule.";
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getEmployeeSchedual(IN emp_id INT)
BEGIN
    SELECT contract_id,start_date,end_date,hourly_pay,city,company_id FROM employees INNER JOIN contracts on contracts.employee_id = employees.employee_id WHERE contracts.employee_id = emp_id;
END //
DELIMITER ;

#creating Views
CREATE VIEW getEmployees as
SELECT
    employees.employee_id,
    employees.name,
    employees.field,
    employees.DOB,
    IF(
        contracts.start_date <= CURDATE() AND contracts.end_date >= CURDATE(),
        'Yes',
        'No'
    ) AS currently_working,

    IF(
        contracts.start_date <= CURDATE() AND contracts.end_date >= CURDATE(),
        companies.name,
        ''
    ) AS working_at
FROM
    employees
LEFT JOIN
    contracts
ON
    contracts.employee_id = employees.employee_id
LEFT JOIN
        companies
ON
    contracts.company_id = companies.company_id
GROUP BY
    employees.employee_id,
    employees.name,
    employees.field,
    employees.DOB;

CREATE VIEW getCompanies as
SELECT companies.company_id,name,industry, COUNT(
        CASE
            WHEN contracts.start_date < CURDATE() AND contracts.end_date > CURDATE()
            THEN 1
            ELSE NULL
        END
    ) AS active_contracts FROM companies LEFT JOIN contracts ON companies.company_id = contracts.company_id GROUP BY companies.company_id, companies.name;


#get total active employees
SELECT count(*) FROM getEmployees WHERE currently_working = "Yes";
#get total inactive
SELECT count(*) FROM getEmployees WHERE currently_working = "No";
#get total companies working with
SELECT count(*) FROM companies;

#get available worker based on field
SELECT field,count(*) FROM getEmployees WHERE currently_working = "No" GROUP BY field;

#avarage paycheck from each sector
SELECT field, CAST(AVG(CAST(hourly_pay AS INT)) AS INT) AS average_paycheck FROM employees INNER JOIN contracts c ON employees.employee_id = c.employee_id GROUP BY field;

#average length of working contract
SELECT CAST(AVG(DATEDIFF(end_date, start_date)) AS INT) AS average_duration_days FROM contracts;

#msot popular working location
SELECT city  FROM contracts GROUP BY city ORDER BY count(city) DESC LIMIT 1;

#see current scored employees
SELECT r.employee_id,name,score,comment FROM employees JOIN recommendations r on employees.employee_id = r.employee_id;


SELECT * FROM getEmployees;
SELECT * FROM contracts;
SELECT * FROM companies;
SELECT * FROM employees;


