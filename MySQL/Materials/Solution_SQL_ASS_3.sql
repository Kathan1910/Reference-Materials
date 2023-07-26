#1 
select first_name, last_name, employee_no from assign3 
where hire_date <= '1991-5-21'  
order by last_name;

#2
select department_no, last_name, annual_salary from assign3 
where hire_date between '1987-09-16' and '1996-05-12'
order by department_no, last_name asc;

#3 use annual salary
select * from assign3
where annual_salary > 15000
order by annual_salary desc;

#4
select last_name, first_name, job_id, annual_salary*commission_percent as commission
from assign3 
having commission > 0 
order by first_name;

#5
select distinct job_title,department_name from assign3
where department_name in ('IT','Sales');

#6
select last_name, round(annual_salary/12,2) as monthly_salary from assign3 
where department_no in (10,40)
order by last_name asc;

#7
select round(annual_salary) as absoluteSalary from assign3;

#8
select count(distinct employee_no) as total_no_of_employees from assign3;

#9
select department_no, department_name, count(distinct employee_no) as no_of_employees
from assign3 
group by department_no, department_name
having no_of_employees > 2;

#10
select department_no, department_name, count(distinct employee_no) as no_of_employees
from assign3
group by department_name 
having no_of_employees = (select count(*) from assign3 group by department_no order by count(*) desc limit 1);

#11
select distinct department_no, department_name from assign3
where job_title != 'Programmer';


#12
create table assign3copy select * from assign3;
update assign3copy 
set annual_salary = annual_salary + 1000;

#13
select * from assign3 order by job_id;

#14
delete from assign3copy
where employee_no = '102';
select * from assign3copy;

#15
create view personal_table as select employee_no, 
IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0)) percentage_raise,
annual_salary old_annual_salary,
round(annual_salary*(1+(IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0))*0.01)),2) new_annual_salary
from assign3copy2;
select * from personal_table;

#15-1
select employee_no, 
IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0)) percentage_raise,
annual_salary as old_annual_salary,
round(annual_salary*(1+(IF(department_no in (20,10),5,If(department_no in (50,90,30),10,0))*0.01)),2) as new_annual_salary
from assign3;


show tables;

#16
create view manager_table as select * from assign3 where job_title like 'Manager%';
select * from manager_table;

#17
select * from manager_table order by employee_no asc;
