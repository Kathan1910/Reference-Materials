
-- SQL PRACTICE ASSIGNMENT - 3

show databases;

use class0607;

show tables;

select * from ass_3;

-- Q.1 List the last name, first name and employee number of all programmers who were hired on or before 21 May 1991 sorted in ascending order of last name.

select FIRST_NAME ,LAST_NAME , EMPLOYEE_NO from ass_3 
where HIRE_DATE <= '1991-05-21' order by LAST_NAME ;

-- Q.2 List the department number, last name and salary of all employees who were hired between 16/09/87 and 12/05/96 sorted in ascending order of last name within department number.

select DEPARTMENT_NO , LAST_NAME , ANNUAL_SALARY from ass_3
where HIRE_DATE between '1987-09-16' AND '1996-05-12'
order by LAST_NAME and DEPARTMENT_NO ;

-- Q.3 List all the data for each job where the average salary is greater than 15000 sorted in descending order of the average salary.

select AVG(ANNUAL_SALARY) from ass_3;

select * from ass_3 where 
ANNUAL_SALARY > (select AVG(ANNUAL_SALARY) from ass_3
order by AVG(ANNUAL_SALARY) desc);

-- Q.4 List the last name, first name, job id and commission of employees who earn commission sorted in ascending order of first name. (Commision=Annual_Salary* Commission_Percent)

select FIRST_NAME ,LAST_NAME , JOB_ID , ANNUAL_SALARY*COMMISSION_PERCENT as COMMISION
from ass_3 where ANNUAL_SALARY*COMMISSION_PERCENT > 0
order by FIRST_NAME; 

-- Q.5 Which Job Title are found in the IT and Sales departments?

select JOB_TITLE from ass_3 
where DEPARTMENT_NAME in ("IT","SALES");

-- Q.6 List the last name of all employees in department no 10 and 40 together with their monthly salaries (rounded to 2 decimal places), sorted in ascending order of last name.

select last_NAME , round(ANNUAL_SALARY/12,2) as MONTHLY_SALARY
from ass_3 
where DEPARTMENT_NO in ('10','40')
order by last_NAME ;

-- Q.7 Show the Annual Salary salaries displayed with no decimal places.

select FIRST_NAME,ROUND(ANNUAL_SALARY) from ass_3 ;

-- Q.8 Show the total number of employees.

select COUNT(distinct EMPLOYEE_NO) from ASS_3;

-- Q.9 List the department number, department name and the number of employees for each department that has more than 2 employees grouping by department number and department name.

select DEPARTMENT_NO,DEPARTMENT_NAME,COUNT(distinct EMPLOYEE_NO)
from ass_3 
group by DEPARTMENT_NO , DEPARTMENT_NAME
having COUNT(distinct EMPLOYEE_NO)>2;

-- Q.10 List the department number, department name and the number of employees for the department that has the highest number of employees using appropriate grouping.

select DEPARTMENT_NO,DEPARTMENT_NAME, COUNT(distinct EMPLOYEE_NO)
from ass_3
group by DEPARTMENT_NAME 
order by COUNT(distinct EMPLOYEE_NO) desc limit 1 ;

-- OR

select department_no, department_name, count(distinct employee_no) as no_of_employees
from ass_3
group by department_name 
having no_of_employees = (select count(*) from ass_3 group by department_no order by count(*) desc limit 1);

-- Q.11 List the department number and name for all departments where no programmers work.
 
select distinct DEPARTMENT_NO , DEPARTMENT_NAME 
from ass_3 
where JOB_TITLE <> "PROGRAMMER"; 

-- OR

select distinct department_no, department_name from ass_3
where job_title != 'Programmer';

-- Q.12 Update all the Annual salaries for jobs with an increase of 1000.

create TABLE ASS_3_COPY select * FROM ass_3; 

show TABLES;

update ass_3_copy set
ANNUAL_SALARY = ANNUAL_SALARY + 1000;

-- Q.13 List all the data for jobs sorted in ascending order of job id.

select JOB_ID ,JOB_TITLE from ass_3 
order by JOB_ID;

-- Q.14 The job history for employee number 102 is no longer required. Delete this record.

delete from ass_3_copy 
where EMPLOYEE_NO = '102';

select * from ass_3_copy ;

-- Q.15 Prepare a table with percentage raises, employee numbers and old and new salaries. Employees in departments 20 and 10 are given a 5% rise, employees in departments 50, 90 and 30 are given a 10% rise and employees in other departments are not given a rise.

select employee_no, 
IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0)) percentage_raise,
annual_salary as old_annual_salary,
round(annual_salary*(1+(IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0))*0.01)),2) as new_annual_salary
from ass_3;

-- Q.16 Create a new view for manager’s details only using all the fields from the employee table. 

create view manager_table as select * from ass_3 
where job_title like 'Manager%';

select * from manager_table;

-- Q.17 Show all the fields and all the managers using the view for managers sorted in ascending order of employee number.

select * from manager_table order by employee_no asc ;

-- END --
