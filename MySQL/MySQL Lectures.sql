
# TO SHOW DATABASE
show databases;

# CREATE DATABASE
create database CLASS0607;

# USE DATABASE
use CLASS0607;

# TO SEE CURRENT DATABASE
SELECT database ();

# TO SHOW TABLES IN DATABASE
show TABLES;

# TO CREATE TABLE 
create table WORKER(
WORKER_ID INT(3),
FIRST_NAME VARCHAR(10),
LAST_NAME VARCHAR(10),
SALARY INT(10),
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(8));

show TABLES;

# TO SHOW ALL INFORMATION OF THE TABLE
select * from WORKER;

# INSERT VALUES IN WORKER TABLE

insert into Worker(WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)values
(001,"Monika","Arora",100000,"2014-02-20 09:00:00","HR"),
(002,"Niharika","Verma",80000,"2014-06-11 09:00:00","Admin"),
(003,"Vishal","Singhal",300000,"2014-02-20 09:00:00","HR"),
(004,"Amitabh","Singh",500000,"2014-02-20 09:00:00","Admin"),
(005,"Vivek","Bhati",500000,"2014-06-11 09:00:00","Admin"),
(006,"Vipul","Diwan",200000,"2014-06-11 09:00:00","Account"),
(007,"Satish","Kumar",75000,"2014-01-20 09:00:00","Account"),
(008,"Geetika","Chauhan",9000,"2014-04-11 09:00:00","Admin");

select * from WORKER;

select first_name as worker_name from worker; 

select first_name worker_name from worker;

select upper(first_name) as upper_case from worker;
select lower(first_name) as lower_case from worker;

select first_name,last_name,salary from worker where first_name="vipul";

select first_name,last_name,salary from worker where first_name="vipul" ;

select * from worker;

# to remove all records from the table 
truncate table worker;

select * from worker;


select distinct department from worker;
select distinct upper(first_name) from worker;
select distinct SALARY from worker;

select substring(first_name,1,4) from worker;
select substr(first_name,1,4) from worker;

select instr(first_name,binary'A') from worker where first_name = 'Amitabh' ;
select instr(first_name,binary'a') from worker where first_name = 'Amitabh' ;

select instr(first_name,'a') from worker where first_name = 'Amitabh' ;

# TO REMOVE SIDE SPACES IN OUR RECORDS

-- select rtrim(first_name) from worker2;
-- select ltrim(first_name) from worker2;


select distinct length(department) from worker;
select length(FIRST_NAME) from worker;

select replace(first_name,'a','@') from worker;
select replace(first_name,'a',' ') from worker;

select concat(first_name," ",last_name) as full_name from worker;

select * from worker order by FIRST_NAME asc;
select * from worker order by FIRST_NAME desc;
select * from worker order by SALARY  ;

select * from worker order by DEPARTMENT asc , SALARY desc;
select department,salary from worker order by DEPARTMENT,SALARY desc;

# TO FIND MULTIPLE RECORDES AT A TIME WE USE IN KEYWORD
select * from worker where FIRST_NAME in ('vipul','satish');

select * from worker where FIRST_NAME not in ('vipul','satish');

select * from WORKER where FIRST_NAME like "V%";
select * from WORKER where DEPARTMENT like "%MIN";

# CREATE A NEW TABLE IN OUR DATABASE

show databases;

select DATABASE();

show TABLES;

create table Bonus(
Worker_REF_ID int(1),
Bonus_Date DATETIME,
Bonus_Amount int(4)
);


select * from Bonus;

insert into Bonus(Worker_REF_ID,Bonus_Date,Bonus_Amount)values
(1,"2016-02-20 00:00:00",5000),
(2, "2016-06-11 00:00:00",3000),
(3, "2016-02-20 00:00:00",4000),
(1,"2016-02-20 00:00:00",4500),
(2,"2016-06-11 00:00:00",3500);

select * from bonus;

# CREATE 3RD TABLE

create table Title(
Worker_REF_ID int(1),
Worker_Title Varchar(15),
Affected_From DATETIME
);

select * from Title;

insert into Title(Worker_REF_ID,Worker_Title,Affected_From)values
(1,"Manager","2016-02-20 00:00:00"),
(2, "Executive","2016-06-11 00:00:00"),
(8,"Executive","2016-06-11 00:00:00"),
(5,"Manager","2016-06-11 00:00:00"),
(4,"Asst.Manager","2016-06-11 00:00:00"),
(7,"Executive","2016-06-11 00:00:00"),
(6, "Lead","2016-06-11 00:00:00"),
(3, "Lead","2016-06-11 00:00:00");

select * from Title;

select * from WORKER where FIRST_NAME like "%a%";
select * from WORKER where FIRST_NAME like "%a";
select * from WORKER where FIRST_NAME like "a%";

select * from WORKER where FIRST_NAME like "____a%";
select * from WORKER where FIRST_NAME like "___t___";
select * from WORKER where SALARY like "8____";

select * from worker where salary between 100000 and 300000;

# WRITE AN SQL QUERY TO PRINT DATAILS OF THE WORKERS WHO HAVE JOINED IN FEB'2014

select * from worker;
select * from worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
select * from worker where JOINING_DATE > '2014-01-01';
select * from worker where JOINING_DATE between '2014-01-01' and '2014-06-01';

select count(FIRST_NAME) from worker where DEPARTMENT = 'admin';
select count(distinct department) from worker;
select count(*) from worker where DEPARTMENT ='admin';
select * from worker;

# SUBQUERY

select concat(first_name,' ',last_name) as worker_name, salary from worker
where WORKER_ID in (select WORKER_ID from worker where SALARY between 50000 and 100000);

-- OR

select WORKER_ID from worker where SALARY between 50000 and 100000;

select concat(first_name,' ',last_name) as worker_name, salary from worker
where WORKER_ID in (1,2,7);

# GROUP BY

select DEPARTMENT , count(WORKER_ID) as NO_OF_WORKER from worker
group by DEPARTMENT
order by NO_OF_WORKER;

select DEPARTMENT , SUM(SALARY) as TOTAL_SALARY from worker
group by DEPARTMENT  
order by TOTAL_SALARY DESC;

select * from title;

select * from bonus;

select * from worker;

# Write An SQL Query To Print Details of the Workers who are also Managers

select worker.FIRST_NAME , title.Worker_Title 
from worker
inner join title on worker.WORKER_ID = title.Worker_REF_ID
and title.Worker_Title  = 'manager';

select worker.FIRST_NAME , title.Worker_Title 
from title 
inner join worker on worker.WORKER_ID = title.Worker_REF_ID
and title.Worker_Title  = 'manager';

select worker.FIRST_NAME , title.Worker_Title , worker.SALARY , title.Affected_From
from worker
inner join title on worker.WORKER_ID = title.Worker_REF_ID;

select worker.FIRST_NAME , worker.LAST_NAME , worker.SALARY , bonus.Bonus_Date ,bonus.Bonus_Amount 
from worker
inner join bonus
on worker.WORKER_ID = bonus.Worker_REF_ID ;

# LEFT JOIN

select worker.FIRST_NAME , worker.LAST_NAME , worker.SALARY , bonus.Bonus_Date ,bonus.Bonus_Amount 
from worker
left join bonus
on worker.WORKER_ID = bonus.Worker_REF_ID ;

# RIGHT JOIN

select worker.FIRST_NAME , worker.LAST_NAME , worker.SALARY , bonus.Bonus_Date ,bonus.Bonus_Amount 
from worker
right join bonus
on worker.WORKER_ID = bonus.Worker_REF_ID ;

# FULL JOIN

-- select worker.FIRST_NAME , worker.LAST_NAME , worker.SALARY , bonus.Bonus_Date ,bonus.Bonus_Amount 
-- from worker
-- full join bonus
-- on worker.WORKER_ID = bonus.Worker_REF_ID ;

# JOIN ALL 3 TABLES

select * 
from worker 
inner join title on worker.WORKER_ID = title.Worker_REF_ID 
inner join bonus on worker.WORKER_ID = bonus.Worker_REF_ID ;


# Write an SQL Query To Fetch Duplicate Records Having Matching Data In Some Fields Of A Table.


select worker_title , affected_from , count(*)
from title;

select worker_title , affected_from , count(*)
from title
group by Worker_Title , Affected_From 
having count(*)>1;

#

select DEPARTMENT , avg(salary) from worker group by DEPARTMENT ;

select department ,avg(salary) from worker group by DEPARTMENT 
having avg(SALARY) > 200000;

select department ,sum(salary) from worker group by DEPARTMENT  order by sum(salary) desc;

# write an sql query to show only Odd & Even rows from A Table.

select * from worker where mod (WORKER_ID,2) <> 0;

select * from worker where mod (WORKER_ID,2) = 0;

# WRITE AN SQL QUERY TO CLONE(COPY) A NEW TABLE FROM ANOTHER TABLE

create table worker3 select * from worker;

select * from worker3;

show tables;

drop table worker3;

show tables;

#  Write An SQL Query To Fetch Intersecting Records Of Two Tables

-- INTERSECT HELPS TO COMPARE TWO TABLES DATA WHEATHER THEY ARE MATCING OR NOT
-- select * from worker
-- intersect 
-- select * from WORKER3;

# Write An SQL Query To Fetch Records which are not available in other table

-- select * from worker
-- MINUS
-- select * from TITLE;


# Write An SQL Query To Show The Current Date And Time

select curdate();  # Only GIVE DATE 

select NOW(); # GIVE DATE with TIME

#  Write An SQL Query To Show The Top N (Say 5) Records Of A Table

select * from worker limit 5;

select * from worker order by WORKER_ID desc limit 5;

# Write An SQL Query To Determine The Nth (Say N=5) Highest Salary From A Table.

select salary from worker order by SALARY desc limit 4,1; # IT WILL return 5TH HIGHEST SALARY

select * from worker order by SALARY desc limit 4,1;

# SELECT FIRST 3 RECORDS WHERE DEPARTMENT = ADMIN AND order BY FIRST_NAME 

select * from WORKER where DEPARTMENT ='ADMIN' order by FIRST_NAME ASC limit 3; 


# SELECT 4 RECORDS WHICH START FROM 4....

select * from WORKER limit 3,4;

# SELECT 2 RECORDS OF ADMIN DEPARTMENT WHICH STARTS FROM 1

select * from WORKER where DEPARTMENT='ADMIN' limit 0,2;


# CREATE ANOTHER TABLE FOR FURTHER QUERIES..

create table bonus1 select * from bonus;

select * from bonus1;

# Write An SQL Query To rename the column name WORKER_REF_ID to WORKER_RID in bonus table

alter table bonus1 change worker_ref_id worker_id int;

select * from bonus1;

# Write An SQL Query To Fetch The List Of Employees With The Same Salary.

select distinct  w.worker_id , w.first_name , w.salary
from worker w , worker w1
where w.salary = w1.SALARY
and w.WORKER_ID <> w1.WORKER_ID ; 


# Write an SQL Query to Show the Second Highest AND LOWEST Salary from A Table.

select SALARY from WORKER order by SALARY;

select max(salary) from worker
where salary <> (select max(salary) from worker); 

select min(salary) from worker
where salary <> (select MIN(salary) from worker); 

select distinct salary from worker order by salary ASC limit 1,1;

select salary from worker order by salary desc limit 1,1;  # Not ACCURATE
select distinct salary from worker order by salary desc limit 1,1; # MOST ACCURATE

# Write An SQL Query To Show One Row Twice In Results From A Table
# Union only returns unique records

select * from worker
union
select * from worker3;

select * from worker
union ALL
select * from worker3;

select Worker_ID,First_Name,Salary from worker
union
select Worker_ID,First_Name,Salary from worker3;

# Where clause
select Worker_ID,First_Name,Salary,DEPARTMENT  from worker where Department="Admin"
union 
select Worker_ID,First_Name,Salary,DEPARTMENT  from worker3 where 
Department="HR";

#  Write An SQL Query To Fetch The Names Of Workers Who Earn The Highest Salary.

select MAX(SALARY) from worker;

select first_NAME , SALARY from WORKER where SALARY = (select MAX(SALARY) from worker);

select FIRST_NAME , SALARY from WORKER order by SALARY DESC limit 0,2; 

# Write an SQL Query to Fetch the First 50% Records from A Table.

select COUNT(WORKER_ID)/2 from worker 

select * from WORKER 
where WORKER_ID <= (select COUNT(WORKER_ID)/2 from worker); 

# Write an SQL Query to Fetch The Departments That Have Less Than Five People In It.

select DEPARTMENT , COUNT(WORKER_ID) as NO_OF_WORKER 
from WORKER group by DEPARTMENT having COUNT(WORKER_ID) < 5 ;

# Write an SQL Query to Show All Departments Along with The Number of People in There.

select DEPARTMENT , COUNT(WORKER_ID) as NO_OF_PEOPLE 
from WORKER group by DEPARTMENT 
order by COUNT(WORKER_ID) desc ;

# RENAME TABLE NAME

-- alter old_tble_name rename new_table_name

# Write an SQL Query to Show the Last Record from A Table.

Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from 
Worker);

Select * from Worker order by Worker_ID DESC limit 1;

# Write an SQL Query to Fetch the First Row of a Table.

select MIN(WORKER_ID) from worker

select * from WORKER 
where WORKER_ID = (select MIN(WORKER_ID) from worker);

select * from worker order by WORKER_ID limit 1;

# Write an SQL Query To remove joining date from table.

-- ALTER TABLE Worker DROP COLUMN JOINING_DATE;

# Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.

select MAX(FIRST_NAME) ,MAX(SALARY) from WORKER 
group by DEPARTMENT order by MAX(SALARY) DESC ;

select MAX(FIRST_NAME) from worker;


select * from WORKER 
where SALARY in (select MAX(SALARY) from worker group by DEPARTMENT);

# Write an SQL Query To change the LAST_NAME as Bhatt of worker_id=005.

update worker 
set LAST_NAME = "BHATT"
where WORKER_ID = '005';

select * from worker; 

# Write an SQL Query To change the salary to 100000 where worker name is Satish

update worker 
set SALARY = '100000'
where FIRST_NAME = 'SATISH';

select * from worker;

# UPDATE department OF THE WORKERS

update worker 
set DEPARTMENT ='Mkting'
where FIRST_NAME in ("vipul","satish");
 
# Write an SQL Query To delete the employee details where id is 003

delete from WORKER 
where workER_ID = '003'

# Write an SQL Query to Fetch Departments Along with The Total Salaries Paid for Each of Them.

select department , sum(salary) from worker
group by DEPARTMENT ;

# Write An SQL Query To Add Newcolumn (int) in to worker table.

alter table worker 
add column temp_col int;

select * from worker;

alter table worker 
drop column temp_col;

select * from worker3;

# EXAMPLE OF delete SOMETHING USING JOINS
-- delete worker3 from worker3 
-- join bonus 
-- on worker3.WORKER_ID =bonus.Worker_REF_ID 
-- where Bonus_Amount = 3000;

# Write an SQL Query To Add A class for 100000+ salary and B for others.

select *, if (SALARY > 100000, "A","B") as class 
from worker;

# VIEW EXAMPLE

create view HR_DATA as
select * from WORKER where DEPARTMENT = 'HR';

select * from HR_DATA;

# Write an SQL Query To View a Virtual Table based on the results of an SQL Statement.

create view HR_Department AS
select First_Name, Last_Name,Salary, Department
from Worker
where Department="HR";
select * from HR_Department;

show TABLES;

drop view hr_department;

show tables;

