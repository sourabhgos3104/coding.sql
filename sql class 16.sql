use dummy;
select * from customers;
select * from orders;
select * from customers inner join orders;

select c.customernumber,c.customername,c.city,o.status 
from customers as c inner join orders as o on c.customernumber=o.customernumber;

select * from orders o left join customers c on  c.customernumber=o.customernumber;

#find the customer whose ordernumber is null
select * from customers c left join orders o on  c.customernumber=o.customernumber  where ordernumber is null;

#find customer who placed order where country=usa
select * from customers c inner join orders o on  c.customernumber=o.customernumber  where country="usa";

#find customer who placed 1 order between dates
select * from customers c inner join orders o on  c.customernumber=o.customernumber  where orderdate between "2003-01-01" and "2003-05-01";

