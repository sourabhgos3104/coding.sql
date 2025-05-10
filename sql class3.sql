create database db1;
create table department(dep_id int primary key,dep_name varchar(30) unique not null);
describe department;


create table employee(empl_id int  primary key,empl_name varchar(30));
describe employee;
drop table depatment;

create table employee1(empl_id int primary key, empl_name varchar(30),dep_id int,foreign key(dep_id) references department(dep_id));
describe employee1;

#to drop the foreign key
alter table employee1 drop foreign key employee1_ibfk_1;
alter table employee1 drop key dep_id;
describe employee1;
