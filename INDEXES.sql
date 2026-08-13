USE EMPLOYEE_DB;
#Create an index on employees.email.
CREATE INDEX EMP_EMAIL
ON EMPLOYEES (EMAIL);

#Create an index on employees.department_id.
CREATE INDEX EMP_DEPT_ID
ON EMPLOYEES(DEPARTMENT_ID);

#Create an index on orders.order_date.
USE ECOMMERCE_DB;

CREATE INDEX IDX_ORDER_DATE
ON ORDERS(ORDER_DATE);

#Use EXPLAIN to inspect a query filtering employees by department_id.
EXPLAIN
SELECT *
FROM employees
WHERE department_id = 2;

#. Rewrite a query that uses YEAR(order_date) so an index on order_date can be used effectively.
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
  AND order_date < '2026-01-01';
