create database data;
use data;
create table new(id int auto_increment primary key ,name varchar(50) not null,age int not null,phone bigint, 
city varchar(30) not null  default "bhopal");
insert into new(id,name,age,phone,city)
values(1,"AA",25,123456,"indore");

select * from new;
insert into new(name,age,phone,city)
values("AA",25,123456,"indore");

insert into new(name,age,phone)
values("aa",26,1456456);