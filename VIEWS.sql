USE employee_db;

#Create a view containing employee name, department name, and salary.
CREATE VIEW EMP_DETAILS AS 
     SELECT EMPLOYEES.FIRST_NAME, EMPLOYEES.SALARY,DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
     ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID;

SELECT * FROM EMP_DETAILS;

#Query the employee view to return employees earning more than 70,000.
CREATE VIEW EMP_SALARY AS
SELECT * FROM EMPLOYEES
WHERE SALARY> 70000;

SELECT * FROM EMP_SALARY;

#Create a view containing customer order totals.
USE ECOMMERCE_DB;
CREATE VIEW customer_order_totals AS
SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_order_amount
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.customer_id;

SELECT * FROM CUSTOMER_ORDER_TOTALS;