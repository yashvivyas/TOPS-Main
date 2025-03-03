-- ASSIGNMENT PART 1 --

use hrdb;

-- 1. Display all information in the tables EMP and DEPT.
select * from employee_details;
select * from departments;

-- 2. Display only the hire date and employee name for each employee.
SELECT CONCAT(first_name, ' ', last_name) AS 'Name', hire_date
FROM employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title
SELECT CONCAT(first_name, ' ', last_name, ',', job_id) AS 'Employee and Title'
FROM employees;

-- 4. Display the hire date, name and department number for all clerks.
SELECT CONCAT(first_name, ' ', last_name) AS 'Name',hire_date, department_id
FROM employees;

-- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT
SELECT CONCAT(employee_id, ',', first_name, ',',last_name, ',',email, ',',phone_number, ',',hire_date, ',',job_id, ',',salary, ',',commission_pct, ',',manager_id, ',',department_id) AS 'THE OUTPUT'
FROM employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000.
SELECT first_name,salary 
FROM employees
WHERE salary > 2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date"
SELECT first_name AS 'Name', hire_date AS 'Start Date'
FROM employees;

-- 8. Display the names and hire dates of all employees in the order they were hired.
SELECT first_name, hire_date
FROM employees
ORDER BY hire_date ASC;

-- 9. 9. Display the names and salaries of all employees in reverse salary order.
SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
SELECT first_name, department_id, commission_pct, salary
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

-- 11. Display the last name and job title of all employees who do not have a manager
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('ST_CLERK', 'SA_REP') 
AND salary NOT IN (2500,3500,5000);
