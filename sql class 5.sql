use dummy;
show tables;
select * from customers;

select customername,city,phone,state from customers;

#clauases to qurify th specific result set
select * from customers where city="las vegas";

# to querify the specific set with s[pecific column
select customername,city,phone,state from customers
where country="france","usa","australia";

select customername,city,phone,state from customers
where country in ("france","usa","australia");


select * from customers where country not in("france","usa","australia");

select * from customers order by creditlimit desc;

select * from customers where creditlimit >50000;
select * from customers where creditlimit <50000;
select * from customers where creditlimit >=50000;
select * from customers where creditlimit <=50000;
select * from customers where creditlimit <>50000;

describe customers;
desc customers;