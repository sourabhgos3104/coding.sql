use cybrom;
create table if not exists employee(employee_id serial primary key,first_name varchar(30) not null, last_name varchar(30) not null,department varchar(30),
salary decimal(10,2) check (salary>0), joining_date date not null,age int check(age>=18));
drop table employee;
select * from employee;

insert into employee(first_name,last_name,department,salary,joining_date,age)values("amit","sharma","IT",60000.00,"2022-05-01",29),
("neha","patel","HR",55000.00,"2021-08-15",32),("ravi","kumar","FINANCE",70000.00,"2020-03-10",35),("anjali","verma","IT",65000.00,"2019-11-22",28),
("suresh","reddy","OPERATIONS",50000.00,"2023-01-10",26);

alter table employee rename column lat_name to last_name;
alter table employee rename column depaertment to department;

select first_name ,last_name,department from employee;

update employee set salary=salary + (salary*0.1) where department='IT';
delete from employee where age>34;

alter table employee add column email varchar(100) not null;

alter table employee rename column department to dept_name;

select first_name,last_name,joining_date from employee where joining_date>"2021-01-01";

alter table employee modify column salary int;

select * from employee;

select first_name ,salary ,age  from employee order by salary desc;

update employee  set age=age+1;
SET SQL_SAFE_UPDATES=0;
