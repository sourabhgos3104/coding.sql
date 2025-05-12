create database company;
create table employee(empl_id int primary key,name varchar(30) not null,postiion varchar(30) not null,depatrment varchar(30) not null,salary int  
,hiredate  date not null);

insert into employee(empl_id,name,postiion,depatrment,salary,hiredate)values(1,"sourabh","datascience","ds",28000,"2025-05-12");

select * from employee;


rename table employee to employee1;
select * from employee1;

alter table employee1 add column country varchar(50) not null;
alter table employee1 drop column country;

update employee1 set country="India" where empl_id=1;

alter table employee1 rename column  postiion to position;

alter table employee1 rename column depatrment to department;



insert into employee1(empl_id,name,position,department,salary,hiredate,country)values(2,"gorav","science","da",29000,"2024-04-12","usa");

insert into employee1(empl_id,name,position,department,salary,hiredate,country)values(3,"ajay","science","da",29000,"2024-04-12","russia");

select * from employee1 where salary=29000;
describe employee1;

select * from employee1 where country="india","usa";
select * from employee1 where country in("india", "usa");

select * from employee1 order by salary asc;
select * from employee1 order by salary desc;
select * from employee1 order by name ;

#to create copy of structure
create table employee15 as select * from employee1;
select * from employee15;

# by drop all data incuding table will be deleted
drop table employee15;

#by truncate all iner data deleted except table(column)
truncate table employee15;

select * from employee1;

#to delete particular row data
delete from employee1 where empl_id=3;

#to change datatype of column
alter table employee1 modify column name varchar(80);
alter table employee1 modify column empl_id bigint;





 