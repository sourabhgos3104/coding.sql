use dummy;
select * from customers;

#to arrange the data in sequencial manner
select * from customers order by city asc;

# to querify(short) the data
select * from customers where creditlimit>=25000 and creditlimit<=50000;
select * from customers where creditlimit between 25000 and 60000;
select * from customers where creditlimit not between 25000 and 60000;
