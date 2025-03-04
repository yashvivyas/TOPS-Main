-- ASSIGNMENT PART 2 --

use hrdb;

-- 1) Display the maximum, minimum and average salary and commission earned.
SELECT MAX(salary), MIN(salary), AVG(salary), MAX(commission_pct), MIN(commission_pct), AVG(commission_pct)
FROM employees;

-- 2) Display the department number, total salary payout and total commission payout for each department.
SELECT department_id, SUM(salary), COUNT(commission_pct)
FROM employees
GROUP BY department_id;

-- 3) Display the department number and number of employees in each department.
SELECT department_id, COUNT(employee_id)
FROM employees
GROUP BY department_id;

-- 4) Display the department number and total salary of employees in each department.
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT first_name
FROM employees
WHERE commission_pct IS NULL;

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
SELECT first_name, department_id,commission_pct,
CASE
WHEN commission_pct IS NULL THEN 'No Commission'
ELSE commission_pct
END AS 'Commission status'
FROM employees;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately
SELECT first_name, department_id,commission_pct*2 AS 'Double commission',
CASE
WHEN commission_pct IS NULL THEN 'No Commission'
ELSE commission_pct
END AS 'Commission status'
FROM employees;

-- 8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT first_name, department_id
FROM employees
GROUP BY first_name, department_id;

-- 9) Display the sum of salaries of the employees working under each Manager.
SELECT SUM(salary), manager_id
FROM employees
GROUP BY manager_id;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager.
SELECT manager_id, COUNT(employee_id)
FROM employees
GROUP BY manager_id;
-- no column given for manager's deparment

-- 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT CONCAT(first_name,' ',last_name), department_id, salary
FROM employees
WHERE last_name LIKE '_a%'
GROUP BY manager_id;
-- DOUBT --

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
SELECT AVG(SUM(salary)) AS 'Average of sum of salary', department_id
FROM employees
GROUP BY department_id;
-- DOUBT- NO OUTPUT

-- 13) Select the maximum salary of each department along with the department id
SELECT MAX(salary), department_id
FROM employees
GROUP BY department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT commission_pct,
CASE
WHEN commission_pct IS NOT NULL THEN salary*0.1
ELSE 1
END AS "Commission status"
FROM employees;

