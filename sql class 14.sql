create database new_join;
use new_join;

create table table1(id int);
create table table2(id int);

insert into table1(id) value (1),(1),(2),(3),(3),(4),(null);
insert into table2(id) value (1),(1),(1),(2),(2),(null),(null),(null);

select * from table1 inner join table2 on table1.id=table2.id ;
select * from table1 cross join table2 ;
select * from table1 left join table2  on table1.id=table2.id;
select * from table1 right join table2 on table1.id=table2.id;