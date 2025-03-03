use hrdb;

-- Question of SubQueries->HRDB -- 

-- 1. write a SQL query to find those employees who do not work in the departments where managers’ IDs are between 100 and 200 (Begin and end values are included.). Return all the fields of the employeess --
SELECT *
FROM employees
WHERE department_id NOT IN (
SELECT department_id, manager_id
FROM employees 
WHERE manager_id BETWEEN 100 AND 200
);
-- DOUBT --

-- 2. write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees. --
SELECT * 
FROM employees
WHERE salary = (
SELECT MAX(salary)
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees) 
);


-- 3. , write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date. --
SELECT first_name, last_name, hire_date
FROM employees 
WHERE department_id IN (
SELECT department_id
FROM employees
WHERE first_name = 'Clara'
)
AND first_name != 'Clara' ;

-- 4. write a SQL query to find those employees who work in a department where the employee’s first name contains the letter 'T'. Return employee ID, first name and last name. --
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id IN (
SELECT department_id
FROM employees 
WHERE first_name LIKE '%T%'
);

-- 5. write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose first name contains the letter 'J'. Return employee ID, first name and salary -- 
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
AND department_id IN ( SELECT department_id FROM employees WHERE first_name = '%J%');

-- 6. write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID. --
 -- SELECT first_name, last_name, employee_id, job_id
 -- FROM employees
 -- WHERE department_id IN (
 -- SELECT department_id
 -- FROM employees
 -- WHERE 
 -- ) 
-- DOUBT : NO LOCATION COLUMN GIVEN --

-- 7. write a SQL query to find those employees whose salary is lower than that of employees whose job title is ‘MK_MAN’. Return employee ID, first name, last name, job ID. --
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < (
SELECT salary
FROM employees
WHERE job_id = 'MK_MAN'
);

-- 8. write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of Job title ‘MK_MAN’. Return employee ID, first name, last name, job ID. --
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary < (
SELECT salary
FROM employees
WHERE job_id = 'MK_MAN'
)
AND NOT job_id= 'MK_MAN';

-- 9. write a SQL query to find those employees whose salary exceeds the salary of all those employees whose job title is "PU_MAN". Exclude job title ‘PU_MAN’. Return employee ID, first name, last name, job ID. --
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary > (
SELECT salary
FROM employees
WHERE job_id = 'PU_MAN'
)
AND NOT job_id= 'PU_MAN';

-- 10. write a SQL query to find those employees whose salaries are higher than the average for all departments. Return employee ID, first name, last name, job ID. --
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 11. write a SQL query to check whether there are any employees with salaries exceeding 3700. Return first name, last name and department ID. --
SELECT first_name, last_name, department_id
FROM employees
WHERE salary > 3700;

-- 12. write a SQL query to calculate total salary of the departments where at least one employee works. Return department ID, total salary. --
SELECT department_id, SUM(salary)
FROM employees
WHERE department_id IN (
SELECT department_id 
FROM employees 
WHERE NOT employee_id IS NULL
)
GROUP BY department_id;

-- 13. Write a query to display the employee id, name ( first name and last name ) and the job id column with a modified title SALESMAN for those employees whose job title is ST_MAN and DEVELOPER for whose job title is IT_PROG. --
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS Name,
CASE job_id
WHEN job_id= 'ST_MAN' THEN 'SALESMAN'
WHEN job_id= 'IT_PROG' THEN 'DEVELOPER'
ELSE job_id
END AS JOBtitle
FROM employees
;

-- DOUBT --

-- 14. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS 'Name', salary, 
CASE
WHEN salary >= (SELECT AVG(salary) FROM employees) THEN 'HIGH'
ELSE 'LOW'
END AS SALARYSTATUS
FROM employees;

-- 15. Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS 'Name', salary, 
ROUND(salary - (SELECT AVG(salary) FROM employees)) AS AVGcompare,
CASE
WHEN salary >= (SELECT AVG(salary) FROM employees) THEN 'HIGH'
ELSE 'LOW'
END AS SALARYSTATUS
FROM employees;

-- ------------------------------------- --