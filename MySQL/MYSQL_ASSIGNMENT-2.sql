
show databases;

use CLASS0607;

show TABLES;

# CREATE DEPARTMENT TABLE

create table Department(
Code int not null primary key auto_increment,
Name character(30),
Budget int(10));


insert into Department(Code,Name,Budget)
values(14,"IT",6500),
(37,"Accounting",15000),
(59,"Human Resources",240000),
(77,"Research",55000);


select * from Department;

# CREATE EMPLOYEE TABLE 

create table Employee(
Id int not null primary key auto_increment,
Name character(15),
Last_Name character(15),
Department int(3)
);


insert into Employee(Id,Name,Last_Name,Department)
values(123234877,"Michael","Rogers",14),
(152934485,"Anand","Manikutty",14),
(222364883,"Carol","Smith",37),
(326587417,"Joe","Stevens",37),
(332154719,"Mary-Anne","Foster",14),
(332569843,"George","ODonnell",77),
(546523478,"John","Doe",59),
(631231482,"Devid","Smith",77),
(654873219,"Zacary","Efron",59),
(745685214,"Eric","Goldsmith",59),
(845657245,"Elizabeth","Doe",14),
(845657246,"Kumar","Swamy",14);

select * from Employee;

-- Q.1 Select the last name of all employees, without duplicates.

select distinct LAST_NAME from employee ;

-- Q.2 Select all the data of employees whose last name is "Smith".

select * from employee where Last_Name = 'Smith';

-- Q.3 Select all the data of employees whose last name is "Smith" or "Doe".

select * from employee where Last_Name = 'Smith' OR Last_Name = 'DOE';

-- Q.4 Select all the data of employees that work in department 14.

select * from employee where Department = '14';

-- Q.5 Select all the data of employees that work in department 37 or department 77.

select * from employee where Department = '37' or Department ='77';

-- Q.6 Select all the data of employees whose last name begins with an "S".

select * from employee where Last_Name like "S%";

-- Q.7 Select the sum of all the departments' budgets.

select SUM(BUDGET) from department; 

-- Q.8 Select the number of employees in each department (you only need to show the department code and the number of employees).

select DEPARTMENT as DEPARTMENT_CODE , COUNT(NAME) from employee
group by Department ;

-- Q.9 Select all the data of employees, including each employee's department's data.

select EMPLOYEE.*,Department.* from employee
inner join department
on EMPLOYEE.Department = Department.Code;

-- OR

select * from employee
inner join department
on EMPLOYEE.Department = Department.Code;

-- Q.10 Select the name and last name of each employee, along with the name and budget of the employee's department.


select E.NAME , E.LAST_NAME , D.NAME , D.BUDGET 
from employee e 
inner join department d 
on e.Department = d.Code;

-- Q.11 Select the name and last name of employees working for departments with a budget greater than $60,000.

select E.NAME , E.LAST_NAME , D.NAME , D.BUDGET
from employee E
inner join department D
on E.Department = D.Code
WHERE D.BUDGET > 60000;

-- Q.12 Select the departments with a budget larger than the average budget of all the departments.

select AVG(BUDGET) from department;


select NAME , BUDGET from department
where Budget > (select AVG(BUDGET) from department);

-- Q.13 Select the names of departments with more than two employees.

select Department from employee
group by Department 
having COUNT(*)>2 

select NAME from department where CODE IN (select Department from employee group by Department having COUNT(*)>2);

-- Q.14 Very Important - Select the name and last name of employees working for departments with second lowest budget.

select employee.Name as Emo_Name,employee.Last_Name,min(department.Budget) 
from employee
join department 
on Department.Code = employee.Department 
where department.Budget not in (select min(Budget) from Department)
order by Budget desc;


-- Q.15 Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.

insert into department (CODE, NAME , BUDGET) values
(11,"Quality Assurance",40000);

select * from department;

-- Q.16 And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.

insert into employee (ID,NAME,Last_Name,Department)
values(847219811,"Mary","Moore",11);

select * from Employee;

-- Q.17 Reduce the budget of all departments by 10%.

select concat(employee.Name," ",employee.Last_Name) as full_Name,
Department.Name as Department_Name,
Department.Budget,
Budget*10/100 as Discount,
Budget-Budget*10/100 as Actual_Budget
from Employee 
join department 
on department.Code=employee.Department;

--  OR

select *,Budget*10/100 as Red_Budget,Budget-Budget*10/100 as Act_Budget 
from Department;

-- Q.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).

update EMPLOYEE set DEPARTMENT=14 where department = 77;

select * from employee ;

-- Q.19 Delete from the table all employees in the IT department (code 14).

delete from employee where Department = '14';

select * from employee;

-- Q.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.

select code from department where budget>=60000;

delete from employee where Department in (select code from department where budget>=60000);

select * from employee ;

-- Q.21 Delete from the table all employees.

TRUNCATE table employee;

-- OR
 
delete from employee; 

-- END --