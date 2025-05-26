use dummy;
show tables;

select country from customers where country ="usa";
select country from customers where country <> "usa" group by country order by country;
select country from customers where country <> "usa" group by country order by country limit 1  offset 2;
#find thr customer who placed order order count must be greater than 3
select * from customers c inner join orders o on c.customernumber=o.customernumber  group by customername;

select count(ordernumber)as order_count,customername from customers c inner join orders o on c.customernumber=o.customernumber  group by customername
having order_count>3;