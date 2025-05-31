use groupby;
show tables;

select * from departments;
select * from employees;
#1. List all employees with their department names.
select e.name,d.department_name from departments d inner join employees e on d.department_id=e.department_id;

#2. Show employee name, department name, and salary using INNER JOIN.
select e.name,d.department_name,e.salary from departments d inner join employees e on d.department_id=e.department_id;

#3. Find all departments even if they have no employees (LEFT JOIN).
select * from departments d left join employees e on d.department_id=e.department_id;

#4. List departments and employee count (including 0 for empty departments).
select d.department_name,count(employee_id) as total_employee from 
departments d inner join employees e on d.department_id=e.department_id group by department_name having total_employee>=0;

#5 show departments without any employees
select d.department_name from departments d inner join employees e on d.department_id=e.department_id where employee_id=0;

#6 list employees whose department is sales
select e.name,d.department_name from departments d inner join employees e
 on d.department_id=e.department_id where department_name="sales";
 
 #7 show all employees hired after 2020 with department name
 select e.name,d.department_name,year(hire_date) from departments d inner join 
 employees e on d.department_id=e.department_id where year(hire_date)>"2020";
 
 #8 count employees in each department
 select  d.department_name, count(employee_id) as total_employee from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name;
 
 #9 show average salary per department
 select  d.department_name, avg(salary) as average_salary from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name;
 
 #10 find total salary paid in each department
  select  d.department_name, sum(salary) as total_salary from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name;
 
 #11 list departments where avg salary is over 60,000
 select  d.department_name, avg(salary) as avg_salary from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name having avg_salary>60000;
 
 #12 list hieghest and lowest salary in each department
 select  d.department_name, max(salary) as high_salary , min(salary) as low_salary from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name ;
 
 
 #13 show no of employees hired each year?????
 select e.name, d.department_name,e.hire_date, count(employee_id) as total_employee ,year(hire_date) from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name ,year(hire_date)="year"+1;
 
 #14 count employess grouped by departments and hiredate??
 select  d.department_name,e.hire_date, count(employee_id) as total_employee  from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name, e.hire_date ;
 
 #15 show all employees sorted by salry ascending
 select  e.name,d.department_name,e.salary  from departments d inner join 
 employees e on d.department_id=e.department_id  order by salary asc ;
 
 #16 list top highest paid employees
 select *  from departments d inner join 
 employees e on d.department_id=e.department_id order by salary desc limit 5;
 
 #17 show departments sorted by number of employees(desc)
 select d.department_name,count(employee_id) as total_employee  from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name order by total_employee desc ;
 
 #18 list employees sorted by hire date(oldest first)
 select e.name,d.department_name,hire_date  from departments d inner join 
 employees e on d.department_id=e.department_id  order by hire_date asc ;
 
 #19 show departments ordered by average salary
 select d.department_name,avg(salary) as average_salary  from departments d inner join 
 employees e on d.department_id=e.department_id group by department_name order by average_salary asc ;
 
 #20 show first 3 employees by salary
 select e.name,d.department_name ,e.salary from departments d inner join 
 employees e on d.department_id=e.department_id  order by salary  limit 3 ;
 
 #21 show next 3 after skipping first 3
 select e.name,d.department_name ,e.salary from departments d inner join 
 employees e on d.department_id=e.department_id  order by salary  limit 3 offset 3 ;
 
 #22 display 5 most recently hired employees
 select e.name,d.department_name ,e.salary,e.hire_date from departments d inner join 
 employees e on d.department_id=e.department_id  order by hire_date desc  limit 5 ;
 
 #23 skip the first 5 and show next 5 employees by hire date
 select e.name,d.department_name ,e.salary,e.hire_date from departments d inner join 
 employees e on d.department_id=e.department_id  order by hire_date desc  limit 5 offset 5;
 
 #24 show 2 nd and 3 rd highest paid employees
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  order by salary desc  limit 2 offset 1 ;
 
 #25 list employees in departments 1,2,3
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  where d.department_id in (1,2,3) ;
 
 #26 list employees not in department 1 or 2
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  where d.department_id  not in (1,2) ;
 
 #27 show employees names working in department named sales and finnance
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  where d.department_name in ("sales","finance") ;
 
 #28 list employees whose department is not hr or it
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  where d.department_name not in ("HR","IT") ;
 
 
 #29 show employees not in the department with the highest total salary
 
 
 #30 display employees who joined in 2020 or 2021 using in
 select * from departments d inner join 
 employees e on d.department_id=e.department_id  where year(hire_date) in ("2020","2021");
 