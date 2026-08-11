
CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50)

);

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(10) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    salary FLOAT ,
    department_id INT,
    FOREIGN KEY(department_id)
        REFERENCES departments(department_id),
    manager_id INT,
    FOREIGN KEY(manager_id)
        REFERENCES employees(employee_id),
    CONSTRAINT chk_phno
        CHECK (phone REGEXP'^[0-9]{10}$'),
    CONSTRAINT chk_salary
        CHECK (salary>=0)
);

CREATE TABLE projects(
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget FLOAT
);

CREATE TABLE employee_projects(
    project_id INT,
    assigned_date DATE,
    employee_id INT,
    PRIMARY KEY(employee_id,project_id) ,
    FOREIGN KEY(employee_id)
        REFERENCES employees(employee_id),
    
    FOREIGN KEY(project_id)
        REFERENCES projects(project_id)
      
);

INSERT INTO departments
(department_id, department_name, location)
VALUES
(1, 'IT', 'Delhi'),
(2, 'Human Resources', 'Gurugram'),
(3, 'Finance', 'Noida'),
(4, 'Marketing', 'Faridabad'),
(5, 'Operations', 'Delhi');

INSERT INTO employees
(employee_id, first_name, last_name, email, phone, hire_date, salary, department_id, manager_id)
VALUES
(101, 'Rahul', 'Sharma', 'rahul.sharma@company.com', '9876543210',
 '2018-04-10', 150000.00, 1, NULL),

(102, 'Priya', 'Verma', 'priya.verma@company.com', '9876543211',
 '2019-06-15', 95000.00, 1, 101),

(103, 'Amit', 'Kumar', 'amit.kumar@company.com', '9876543212',
 '2020-02-20', 85000.00, 1, 101),

(104, 'Neha', 'Singh', 'neha.singh@company.com', '9876543213',
 '2021-08-05', 72000.00, 2, 101),

(105, 'Rohan', 'Mehta', 'rohan.mehta@company.com', '9876543214',
 '2022-01-12', 60000.00, 3, 101),

(106, 'Ananya', 'Gupta', 'ananya.gupta@company.com', '9876543215',
 '2023-03-18', 70000.00, 3, 105),

(107, 'Karan', 'Malhotra', 'karan.malhotra@company.com', '9876543216',
 '2022-09-25', 65000.00, 5, 101),

(108, 'Sneha', 'Kapoor', 'sneha.kapoor@company.com', '9876543217',
 '2024-01-10', 55000.00, 5, 107);


INSERT INTO projects
(project_id, project_name, start_date, end_date, budget)
VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 250000.00),

(202, 'Mobile Banking App', '2024-02-01', '2024-12-31', 500000.00),

(203, 'Employee Management System', '2024-03-10', '2024-08-31', 180000.00),

(204, 'Financial Analytics Platform', '2024-04-01', '2025-01-31', 400000.00),

(205, 'Cloud Migration', '2024-05-15', '2025-03-31', 600000.00);

INSERT INTO employee_projects
(employee_id, project_id, assigned_date)
VALUES
(101, 201, '2024-01-15'),
(102, 201, '2024-01-20'),
(103, 201, '2024-02-01'),

(101, 202, '2024-02-01'),
(103, 202, '2024-02-10'),
(107, 202, '2024-03-01'),

(104, 203, '2024-03-10'),
(102, 203, '2024-03-15'),

(105, 204, '2024-04-01'),
(106, 204, '2024-04-10'),

(101, 205, '2024-05-15'),
(107, 205, '2024-05-20'),
(108, 205, '2024-06-01');