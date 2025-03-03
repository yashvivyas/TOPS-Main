-- 31/01/24--

use hrdb;
-- 1.From the following table, write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT * 
FROM Customer
WHERE grade > 100;


-- 2. From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT * 
FROM customer
WHERE grade > 100 AND city= 'Ney York';

-- 3. From the following table, write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id. --
SELECT * 
FROM customer
WHERE grade > 100 OR city= 'Ney York';

-- 4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id --
SELECT * 
FROM customer
WHERE grade <= 100 OR city= 'Ney York';

-- 5. From the following table, write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.--
SELECT * 
FROM customer
WHERE grade <= 100 OR city != 'Ney York';

-- 6. From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id. --
SELECT *
FROM orders
WHERE ord_date != '2012-09-10' AND salesman_id <=5005 OR purch_amt <1000;

-- 7. From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission.  --
SELECT *
FROM salesman
WHERE commission >= 0.10 AND commission <=0.12 ;

-- 8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id. --
SELECT *
FROM orders
WHERE purch_amt <200 OR (ord_date < '2012-02-10' AND customer_id>=3009);

-- 9. From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000. --
SELECT *
FROM orders
WHERE ord_date != '2012-08-17' OR (customer_id<=3005 AND purch_amt>1000) ;

-- 10. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000. --
-- DOUBT--


-- 11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept. --
SELECT *
FROM employee_details
WHERE EMP_LNAME = 'Dosni' OR EMP_LNAME = 'Mardy';

-- 12. From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept. --
SELECT *
FROM employee_details
WHERE EMP_DEPT = 47 OR EMP_DEPT = 63;

-- ------------------------------------ --
-- 31/01/2025 AGGREGATION FUNCTION --
use hrdb;

-- 1. From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount. --
SELECT SUM(purch_amt)
FROM orders;

-- 2. From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. --
SELECT AVG(purch_amt)
FROM orders;

-- 3. From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople. --
SELECT COUNT(salesman_id)
from salesman;

-- 4. From the following table, write a SQL query to count the number of customers. Return number of customers. --
SELECT COUNT(customer_id)
FROM customer;

-- 5. From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity. --
SELECT COUNT(customer_id)
FROM customer
WHERE NOT grade = NULL;

-- 6. From the following table, write a SQL query to find the maximum purchase amount. --
SELECT MAX(purch_amt)
FROM orders;

-- 7. From the following table, write a SQL query to find the minimum purchase amount --
SELECT MIN(purch_amt)
FROM orders;

-- 8. From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade. --
SELECT city, MAX(grade)
from customer
GROUP BY city;

-- 9. From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. --
SELECT customer_id, MAX(purch_amt)
from orders
GROUP BY customer_id;

-- 10. From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
GROUP BY customer_id, ord_date;

-- 11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount --
SELECT salesman_id, MAX(purch_amt)
FROM orders
WHERE ord_date= '2012-08-17'
GROUP BY salesman_id;

-- 12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
WHERE purch_amt > 2000
GROUP BY customer_id, ord_date;

-- 13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
WHERE purch_amt >= 2000 AND purch_amt <=6000
GROUP BY customer_id, ord_date;

-- 14. From the following table, write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
WHERE purch_amt IN (2000,3000, 5760, 6000)
GROUP BY customer_id, ord_date;

-- 15. From the following table, write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
WHERE customer_id>=3002 AND customer_id<=3007
GROUP BY customer_id, ord_date;

-- 16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount. --
SELECT customer_id, ord_date, MAX(purch_amt)
from orders
WHERE customer_id>=3002 AND customer_id<=3007 AND purch_amt> 1000
GROUP BY customer_id, ord_date;

-- 17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). Return salesperson id and maximum purchase amount --
SELECT salesman_id, MAX(purch_amt)
FROM orders
WHERE salesman_id>= 5003 AND salesman_id <= 5008
GROUP BY salesman_id;

-- 18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders. --
SELECT COUNT(ord_no)
FROM orders
WHERE ord_date= '2012-08-17';

-- 19. From the following table, write a SQL query to count the number of salespeople in a city. Return number of salespeople. --
SELECT city, COUNT(salesman_id)
FROM customer
GROUP BY city;

-- 20. From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id. --
SELECT ord_date, salesman_id, COUNT(ord_no)
FROM orders
GROUP BY ord_date, salesman_id;

-- 21-25 --
-- DOUBT : WHICH DATA TABLE? --

-- ------------------------------------- --
