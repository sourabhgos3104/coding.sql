use dummy;
show tables;
select * from orderdetails;
select * from orders;

select * from customers;
#q1
select c.customername,c.creditlimit,o.status,od.ordernumber,od.productcode ,(quantityordered*priceeach) as total_amount
 from customers c inner join orders o on c.customernumber=o.customernumber
 inner join  orderdetails od on o.ordernumber=od.ordernumber; 
 
 #q2??????
 select c.customername,c.creditlimit,o.status,od.ordernumber,od.productcode ,sum(quantityordered*priceeach) as total_amount
 from customers c inner join orders o on c.customernumber=o.customernumber 
 inner join  orderdetails od on o.ordernumber=od.ordernumber group by ordernumber; 
 
 select status,count(*) from orders group by status;
 
 select status,sum(quantityordered*priceeach) as total_amount 
 from orders o inner join orderdetails od on o.ordernumber=od.ordernumber group by status;
 
  select status,sum(quantityordered*priceeach) as total_amount 
 from orders o inner join orderdetails od on o.ordernumber=od.ordernumber 
 group by status having total_amount >100000 order by total_amount desc limit 1;