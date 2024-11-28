Create table employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department_id INT,
salary DECIMAL(10,2),
commission_pct DECIMAl(4,2)
);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(1,'John','Doe',101,5000.00,0.10);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(2,'Jane','Smith', 102, 6000.00, 0.12);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(3,'Robert','Johnson',103,5500.00,0.15);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(4,'Emily','Davis',101,4500.00,0.08);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(5,'Michael','Brown',102,7000.00,0.05);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(6,'Sarah','Taylor',104, 4800.00, NULL);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(7,'David','Martinez',105, 6200.00, 0.13);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(8,'Laura','Garcia',101,5300.00,0.09);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(9,'James','Miller', 103, 7500.00, NULL);

INSERT INTO employees 
(employee_id, first_name,last_name,department_id,salary,commission_pct)
values
(10,'Anna','Wltson',104,5900,  0.07);

Create table department_jobs(
department_id INT,
job_title VARCHAR(50),
PRIMARY KEY(department_id,job_title)
);

INSERT ALL
INTO department_jobs (department_id,job_title) values (10,'Software ENgineer')
INTO department_jobs (department_id,job_title) values (10,'Project Manager')
INTO department_jobs (department_id,job_title) values (20,'Data Analysis')
INTO department_jobs (department_id,job_title) values (20,'Business Analyst')
INTO department_jobs (department_id,job_title) values (30,'HR Manager')
INTO department_jobs (department_id,job_title) values (30, 'Recruiter')
INTO department_jobs (department_id,job_title) values (40,'Marketing Specialist')
INTO department_jobs (department_id,job_title) values (40,'Sales Associate')
INTO department_jobs (department_id,job_title) values (50,'NetWork Administrator')
INTO department_jobs (department_id,job_title) values  (50,'System Architect')
SELECT * FROM dual;

INSERT ALL
INTO department_jobs (department_id,job_title) values (101,'Software ENgineer')
INTO department_jobs (department_id,job_title) values (101,'Project Manager')
INTO department_jobs (department_id,job_title) values (102,'Data Analysis')
INTO department_jobs (department_id,job_title) values (102,'Business Analyst')
SELECT * FROM dual;

--LabTask-1

SELECT first_name || ' ' || last_name AS full_name, department_id
FROM employees;

SELECT DISTINCT job_title
FROM department_jobs
WHERE department_id = 30;

--no location in my table😊

SELECT first_name || ' ' || last_name AS full_name, employee_id
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT first_name || ' ' || last_name AS full_name, department_id
FROM employees
WHERE UPPER(first_name) LIKE '%A%';


--LabTask-2

SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE salary > 2850;

SELECT first_name || ' ' || last_name AS full_name, department_id
FROM employees
WHERE employee_id = 7;

ALTER TABLE employees 
ADD hire_date DATE;

UPDATE employees SET hire_date = TO_DATE('15-JAN-2020', 'DD-MON-YYYY') WHERE employee_id = 1;
UPDATE employees SET hire_date = TO_DATE('10-FEB-2021', 'DD-MON-YYYY') WHERE employee_id = 2;
UPDATE employees SET hire_date = TO_DATE('05-MAR-2019', 'DD-MON-YYYY') WHERE employee_id = 3;
UPDATE employees SET hire_date = TO_DATE('20-APR-2022', 'DD-MON-YYYY') WHERE employee_id = 4;
UPDATE employees SET hire_date = TO_DATE('01-JUN-2018', 'DD-MON-YYYY') WHERE employee_id = 5;
UPDATE employees SET hire_date = TO_DATE('25-DEC-2020', 'DD-MON-YYYY') WHERE employee_id = 6;
UPDATE employees SET hire_date = TO_DATE('10-OCT-2017', 'DD-MON-YYYY') WHERE employee_id = 7;
UPDATE employees SET hire_date = TO_DATE('18-NOV-2021', 'DD-MON-YYYY') WHERE employee_id = 8;
UPDATE employees SET hire_date = TO_DATE('22-MAY-2016', 'DD-MON-YYYY') WHERE employee_id = 9;
UPDATE employees SET hire_date = TO_DATE('30-AUG-2019', 'DD-MON-YYYY') WHERE employee_id = 10;

SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('20-FEB-2020', 'DD-MON-YYYY') AND TO_DATE('01-MAY-2021', 'DD-MON-YYYY')
ORDER BY hire_date ASC;

SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY-MM-DD') BETWEEN '2020-02-20' AND '2021-05-01'
ORDER BY hire_date ASC;

SELECT first_name || ' ' || last_name AS full_name, department_id
FROM employees
WHERE department_id IN (10, 30)
ORDER BY full_name ASC;

SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2020;

SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2021';

SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE commission_pct IS NULL;

SELECT first_name || ' ' || last_name AS full_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;


-------Lab task- 3-----------

--Write a query to display the current date. Label the columnDate.
SELECT SYSDATE as "date"
FROM DUAL;

--Display the employee number, name, salary, and salary increase by 15% expressed as a whole number. Label the column New Salary
SELECT employee_id,
       first_name||' '||last_name as "FULL NAME",
       salary,
       ROUND(salary*1.15) as New_Salary
FROM employees;

--Modify your previous query to add a column that will subtract the old salary from the new salary. Label the column Increase. Rerun your query.
SELECT employee_id,
       first_name||' '||last_name as "FULL NAME",
       salary,
       ROUND(salary*1.15) as New_Salary,
       ROUND(salary*0.15) as increase
FROM employees;

--Display the employee’s name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the formatsimilar to “Sunday, the Seventh of September, 1981.
SELECT first_name || ' ' || last_name AS full_name,
       hire_date,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday'), 
              'FMday,"the"  FMddspTh "of" MONTH, YYYY')  AS Review
FROM employees;

-- For each employee display the employee name and calculate the number of months between today and the date the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.
SELECT first_name || ' ' || last_name AS employee_name,
       CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED
FROM employees
ORDER BY MONTHS_WORKED;

--Write a query that produces the following for each employee: <employee name> earns <salary> monthly but wants <3 times salary>. Label the column Dream Salaries.
SELECT first_name || ' ' || last_name || ' earns ' || TO_CHAR(salary, '999,999.99') || ' monthly but wants ' || TO_CHAR(salary * 3, '999,999.99') AS "Dream Salaries"
FROM employees;

--Write a query that will display the employee’s name with the first letter capitalized and all other letters lowercase and the length of their name, for all employees whose name starts with J, A, orM. Give each column an appropriate label.
SELECT INITCAP(first_name) || ' ' || INITCAP(last_name) AS "Employee Name",
       LENGTH(first_name || ' ' || last_name) AS "Name Length"
FROM employees
WHERE first_name LIKE 'J%' OR first_name LIKE 'A%' OR first_name LIKE 'M%';

--Create a query that will display the employee name and commission amount. If the employee does not earn commission, put “No Commission.” Label the column COMM.
SELECT first_name || ' ' || last_name AS "Employee Name",
       NVL(TO_CHAR(commission_pct), 'No Commission') AS "COMM"
FROM employees;

-- Create a query that displays the employees’ names and indicates the amounts of their salaries through asterisks. Each asterisk signifies a hundred dollars. Sort the data in descending order of salary. Label the column EMPLOYEE_AND_THEIR_SALARIES.
SELECT first_name || ' ' || last_name AS "Employee Name",
       RPAD('*', LEAST(salary / 100, 50), '*') AS "EMPLOYEE_AND_THEIR_SALARIES"
FROM employees
ORDER BY salary DESC;

-----Lab Task-4

SELECT 
    AVG(salary) AS "Average Salary", 
    MAX(salary) AS "Maximum Salary", 
    MIN(salary) AS "Minimum Salary"
FROM employees;

SELECT 
    department_id,
    AVG(salary) AS "Average Salary",
    MAX(salary) AS "Maximum Salary",
    MIN(salary) AS "Minimum Salary"
FROM employees
GROUP BY department_id;

SELECT 
    dj.job_title,
    AVG(e.salary) AS "Average Salary",
    MAX(e.salary) AS "Maximum Salary",
    MIN(e.salary) AS "Minimum Salary"
FROM employees e
JOIN department_jobs dj 
    ON e.department_id = dj.department_id
GROUP BY dj.job_title;

SELECT e.first_name || ' ' || e.last_name AS "Manager Name", 
       e.salary
FROM employees e
JOIN department_jobs dj 
    ON e.department_id = dj.department_id
WHERE dj.job_title LIKE '%Manager%' 
ORDER BY e.salary ASC;

SELECT dj.job_title,
       SUM(e.salary + NVL(e.commission_pct, 0) * e.salary) AS total_salary
FROM employees e
JOIN department_jobs dj
    ON e.department_id = dj.department_id
GROUP BY dj.job_title
ORDER BY total_salary DESC;

SELECT first_name || ' ' || last_name AS full_name, department_id
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);


-------Task 5-----
CREATE TABLE department (
    Deptid NUMBER(3) PRIMARY KEY,
    dept_name VARCHAR2(6) CHECK (dept_name IN ('CSE', 'EEE', 'BBA', 'Eng', 'Ach')),
    Budget NUMBER(6) DEFAULT 0
);
DROP TABLE course;

CREATE TABLE course (
    crs_id NUMBER(4) PRIMARY KEY,
    crs_name VARCHAR2(20) NOT NULL,
    dept_id NUMBER(3),
    FOREIGN KEY (dept_id) REFERENCES department(Deptid)
);

CREATE TABLE student (
    s_id NUMBER PRIMARY KEY,
    s_name VARCHAR2(20) NOT NULL,
    Phone NUMBER,
    Address VARCHAR2(50),
    Email VARCHAR2(30) UNIQUE,
    credit_completed NUMBER(3),
    course_completed NUMBER(2),
    Cgpa NUMBER,
    Deptno NUMBER(5),
    Gender VARCHAR2(6) CHECK (Gender IN ('M', 'F')),
    FOREIGN KEY (Deptno) REFERENCES department(Deptid)
);






