use cybrom1;
show tables;

select * from student_info;
insert into student_info(id,name,age,dob,gender,percent)
values
(102,"sourav",26,"2001-01-31","male",81.55);

rename table student_info to info;
select * from info;

alter table info rename column percent to precent;
alter table info add column country varchar(30) not null;

update  info set country="india" where id=2;
update  info set country="china" where id=101;
update  info set country="usa" where id=102;

select * from info where country="india";







