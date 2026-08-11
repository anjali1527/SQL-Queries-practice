USE employee_db;
USE ecommerce_db;

#display all employees
SELECT * FROM employees;

DESCRIBE EMPLOYEES;

#Display employee first name, last name, email, and salary.
SELECT first_name,last_name,email,salary FROM EMPLOYEES;

#Display all departments.
SELECT * FROM DEPARTMENTS;

#. Display all products.
SELECT * FROM PRODUCTS;

#Find employees earning more than 60,000.
SELECT * FROM employees WHERE SALARY>60000;

#Find employees earning between 50,000 and 80,000.
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 50000 AND 80000;

#Find employees hired after 1 January 2021.
SELECT * FROM employees WHERE hire_date > '2021-01-01';

#Find employees whose first name starts with 'R'.
SELECT * FROM EMPLOYEES WHERE first_name LIKE'R%';

#Find employees whose first name contains the letter 'a'.
SELECT * FROM EMPLOYEES WHERE first_name LIKE'%a%';

#Find employees who do not have a manager.
SELECT * FROM EMPLOYEES WHERE manager_id IS NULL;

#Find employees who have a manager.
SELECT * FROM EMPLOYEES WHERE manager_id IS NOT NULL;

#Find employees belonging to IT or Finance.
SELECT * FROM EMPLOYEES 
join DEPARTMENTS 
ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
WHERE DEPARTMENT_NAME IN ('IT', 'FINANCE');
