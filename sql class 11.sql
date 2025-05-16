use dummy;
select * from customers;

select * from customers where creditlimit <>50000;
select * from customers where country="usa";
select * from customers where country="usa" order by customername;
select * from customers where country="usa" order by customername desc;
select * from customers where country="usa" order by creditlimit desc;
select * from customers where country="usa" order by customername asc;
select * from customers where customername like "%a";
select * from customers where customername like "a%";
select * from customers where customername like "%a%";
select * from customers where customername like "_a%";
select * from customers where customername like "%T_M%";
select * from customers where customername like "__a%";

select * from customers order by creditlimit;
select * from customers order by creditlimit desc limit 5;

select * from customers order by creditlimit desc limit 1;

select * from customers order by creditlimit desc limit 1 offset 2;
select * from customers order by creditlimit desc limit 3 offset 4;
