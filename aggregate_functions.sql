USE EMPLOYEE_DB;

#Count the total number of employees.
select count(*) from employees AS TOTAL_NUMBER_OF_EMPLOYEES;

#Calculate the average employee salary.
SELECT AVG(SALARY) FROM EMPLOYEES;

#Find the maximum employee salary.
SELECT MAX(SALARY) FROM EMPLOYEES;

#Find the minimum employee salary.
SELECT MIN(SALARY) FROM EMPLOYEES;

#Calculate the total salary expense.
SELECT SUM(SALARY) FROM EMPLOYEES;

#Count the number of customers.
USE ECOMMERCE_DB;
SELECT COUNT(*) FROM CUSTOMERS;

#Calculate total revenue from all order items.
SELECT SUM(P.PRICE * OI.QUANTITY) AS TOTAL_REVENUE FROM PRODUCTS P
 JOIN ORDER_ITEMS OI
 ON P.PRODUCT_ID=OI.PRODUCT_ID;
 
 
 
 