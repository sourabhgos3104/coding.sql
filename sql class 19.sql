create database groupby;
use groupby;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Finance'),
(4, 'HR'),
(5, 'IT');
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees VALUES
(101, 'Alice', 1, 55000, '2021-01-15'),
(102, 'Bob', 2, 60000, '2020-03-10'),
(103, 'Charlie', 1, 52000, '2019-07-23'),
(104, 'David', 3, 75000, '2018-11-12'),
(105, 'Eva', 4, 48000, '2022-06-01'),
(106, 'Frank', 1, 57000, '2021-08-19'),
(107, 'Grace', 2, 62000, '2023-01-05'),
(108, 'Helen', 3, 77000, '2019-02-17'),
(109, 'Ian', 5, 69000, '2020-09-09'),
(110, 'Jane', 5, 72000, '2021-12-12');


select * from employees;
select * from departments;


select * from departments d inner join employees e on d.department_id=e.department_id;
select * from  departments d inner join employees e using(department_id);


select count(employee_id) as empl_count ,department_name from departments d inner join employees 
e using(department_id) group by department_name having empl_count>2;
#q5
select sum(salary) as salary_total ,department_name from departments d inner join employees e
 using(department_id) group by department_name  having salary_total >100000;
 
 select sum(salary) as salary_total ,department_name from departments d inner join employees e
 using(department_id) group by department_name  having salary_total >100000 order by salary_total desc limit 1;
#q1 Show the total number of employees in each department.
select sum(employee_id) as total_employee ,department_name from departments d inner join 
employees e using(department_id) group by department_name;



#q2 Display the average salary of employees in each department.
select avg(salary) as average_salary ,department_name from departments d inner join 
employees e using(department_id) group by department_name;

#q3 List departments and their highest salary.
select department_name,salary from departments d inner join 
employees e using(department_id) order by salary desc;

#q4 Show the lowest salary in each department.
select department_name,salary from departments d inner join 
employees e using(department_id) order by salary;

#q6 List each department and count of employees hired after '2020-01-01'.
select d.department_name,count(e.employee_id) as recent_hires from departments d join employees e using(department_id) where e.hire_date>"2020-01-01"
group by department_name;


#q7 Show department names and the number of employees whose salary is more than 60000
select department_name,count(e.employee_id) as employee_total from departments d join employees e using(department_id) where e.salary>60000 group by department_name ;

#q8 Display departments where the average salary is greater than 60000
select department_name,avg(salary) as salary_average from departments d  inner join employees e
 using(department_id) where e.salary>60000 group by department_name ;

#q9 Find the total number of departments that have more than 2 employees.
select department_name ,count(employee_id) as total_employees from departments d  inner join employees e 
using(department_id) where employee_id>3 group by department_name  ;

#q10 Show the name of each department along with the sum of salary for employees hired in 2021
select department_name,sum(salary) as total_salary from departments d  inner join employees e 
using(department_id) where e.hire_date>"2021-01-01" group by department_name  ;

#q11 List departments and the earliest hire date among their employees.
select department_name,hire_date from departments d  inner join employees e 
using(department_id)  order by hire_date ;

#q12 For each department, display the latest hire date and total number of employees????.
select department_name,hire_date,sum(employee_id) as total_employees from departments d inner join employees e 
using(department_id) group by department_name having total_employees>=1 order by hire_date desc ;

#q13 Show departments having total salary greater than 150000?????.
select department_name,sum(salary) as total_salary from departments d  inner join employees e 
using(department_id)   where e.salary>100000  group by department_name ;

#q14 Show department names and average salary of employees whose name starts with 'A' to 'M'????.
select department_name,avg(salary) as average_salary from departments d  inner join employees e 
using(department_id)   where e.name like "a%"  group by department_name ;

