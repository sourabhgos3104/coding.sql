use dummy;
select * from customers;
select * from customers order by creditlimit desc;
select * from customers order by creditlimit desc limit 3;
select * from customers order by creditlimit desc limit 1 offset 3;

select * from customers where country="usa" and country="australia";
select * from customers where country="usa" or country="australia";