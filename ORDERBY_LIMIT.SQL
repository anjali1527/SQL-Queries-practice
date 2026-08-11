USE EMPLOYEE_DB;
#List employees ordered by salary from lowest to highest.
SELECT * FROM EMPLOYEES ORDER BY SALARY ASC;

#. List employees ordered by salary from highest to lowest.
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

#List employees ordered by hire date from oldest to newest.
SELECT * FROM EMPLOYEES order by HIRE_DATE ASC;

#. Find the highest-paid employee.
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 1;

#. Find the top 3 highest-paid employees.
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 3;

#Find the 3 most expensive products.
USE ECOMMERCE_DB;
SELECT * FROM PRODUCTS ORDER BY PRICE DESC LIMIT 3;


