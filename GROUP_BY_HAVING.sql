USE EMPLOYEE_DB;

#Find the number of employees in each department.
SELECT department_id, 
COUNT(*) as employee_count 
FROM employees group by department_id;

#. Find the average salary in each department.
SELECT DEPARTMENT_ID ,
AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

#Find the maximum salary in each department.
SELECT DEPARTMENT_ID ,
MAX(SALARY) AS MAX_SALARY 
FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

# Find the minimum salary in each department.
SELECT DEPARTMENT_ID ,
MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

#Find departments having more than one employee.
SELECT DEPARTMENT_ID 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING count(*)>1;

#Find departments where average salary is greater than 60,000.
SELECT DEPARTMENT_ID 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) > 60000;

#Find the number of products in each category.

USE ECOMMERCE_DB;
SELECT CATEGORY_ID ,
COUNT(*) AS NUMBER_OF_PRODUCTS
FROM PRODUCTS
GROUP BY CATEGORY_ID ;

#Find customers with more than two orders.
SELECT CUSTOMER_ID,
COUNT(ORDER_ID) AS ORDER_COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID)>2;

