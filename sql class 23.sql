create database subquery;
use subquery;
create table employees(emp_id INT PRIMARY KEY,
emp_name VARCHAR(100),
dept_id INT,
salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100)
);

CREATE TABLE Projects (
project_id INT PRIMARY KEY,
project_name VARCHAR(100),
dept_id INT
);

CREATE TABLE Timesheets (
timesheet_id INT PRIMARY KEY,
emp_id INT,
project_id INT,
hours_worked INT
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');


INSERT INTO Employees (emp_id, emp_name, dept_id, salary) VALUES
(101, 'Alice', 1, 50000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 3, 75000),
(104, 'David', 3, 70000),
(105, 'Eve', 2, 55000),
(106, 'Frank', 4, 45000),
(107, 'Grace', 3, 80000),
(108, 'Heidi', 4, 47000),
(109, 'Ivan', 3, 72000),
(110, 'John', 1, 49000);


INSERT INTO Projects (project_id, project_name, dept_id) VALUES
(201, 'Payroll System', 2),
(202, 'Website Redesign', 4),
(203, 'AI Model', 3),
(204, 'HR Onboarding', 1),
(205, 'Marketing Analytics', 4);



INSERT INTO Timesheets (timesheet_id, emp_id, project_id, hours_worked) VALUES
(1, 101, 204, 10),
(2, 102, 201, 15),
(3, 103, 203, 25),
(4, 104, 203, 20),
(5, 105, 201, 30),
(6, 106, 202, 12),
(7, 108, 205, 18),
(8, 109, 203, 22),
(9, 107, 203, 28),
(10, 101, 204, 5),
(11, 104, 201, 8),
(12, 102, 203, 12);


#Q1 1.	Find the names of employees who earn more than the average salary of all employees.

select emp_name,salary from employees where salary>(select avg(salary) as avg_salary from employees);

#Q2 2.	List departments whose average employee salary is more than 50,000.
select dept_name, avg(salary) as avg_salary from employees e inner join departments d group by dept_name having avg_salary>50000 ;

#Q3 3.	Display the employee(s) with the highest salary.
SELECT * from employees  order by salary desc;

#Q4 4.	Show names of employees who work in the same department as ‘John’.
select emp_name from employees where dept_id=(select dept_id from employees where emp_name="john");

#Q5 5.	Find all employees who earn less than the maximum salary in their department.???????
select emp_name from employees where salary<(select max(salary) as max_salary from employees e inner join
 departments d  using(dept_id) group by dept_name );
 
 #Q6 6.	Show department names where no employee has a salary above 60,000.
select dept_name,emp_name ,salary from employees e inner join departments d using(dept_id) where salary<60000;

#Q7 7.	Display employee names who work on the same project(s) as employee ID 101.
select emp_name from employees e inner join projects p using(dept_id) where project_id= 
( select project_id from projects p inner join employees e using(dept_id) where emp_id=101);

#Q8 8.	Find the department name of the employee who earns the minimum salary.
select emp_name,dept_name from employees e inner join departments d using(dept_id) where salary=(SELECT MIN(salary) as min_salary from employees);

#Q9 9.	Show the name of the project with the most hours worked (by all employees).
SELECT project_name ,hours_worked from projects p inner join timesheets ts using(project_id)  order by hours_worked desc limit 1;


#Q10 10.	List employees who did not log any hours in the Timesheets table.?????

#q11 11.	Display departments and their average salaries, but only for departments having more than 2 employees.
SELECT d.dept_name, AVG(e.salary) AS avg_salary FROM employees e JOIN departments d ON e.dept_id = d.dept_id
GROUP BY dept_name HAVING COUNT(e.emp_id) > 2;

#Q12	Show each department and the total hours worked by its employees on all projects.
select d.dept_name,e.emp_name,ts.hours_worked,p.project_name from departments d inner join employees e using(dept_id) inner join projects p using(dept_id) 
inner join timesheets ts using(project_id);

#Q13 13.	List all employees who are not assigned to any project (i.e., not in Timesheets table).
SELECT emp_name,project_name from employees e inner join projects p using(dept_id) where project_id="none"; 


#Q14 14.	Find departments where at least one employee has worked more than 40 hours on any project.?????
select d.dept_name,ts.hours_worked from departments d inner join employees e using(dept_id) inner join timesheets ts
 using(emp_id) inner join projects p using(project_id)  having ts.hours_worked>40;
 
 #Q15 15.	Show all projects that have never been worked on (no hours logged in Timesheets).
select project_name from projects p inner join timesheets ts using(project_id) where hours_worked=0;

#Q16 16.	Display employees who work in departments that do not have any assigned projects.
select emp_name,dept_name from departments d inner join employees e using(dept_id) inner join  projects p using(dept_id) where project_id=0;

#Q17 17.	List employees who are the only person in their department.?????
select e.emp_name,e.name  from employees e  
where total_employee=(select count(emp_id) as total_employee from employees group by dept_id);

#q18 	Show employees who have worked on all projects (use NOT EXISTS with anti-join logic).

#Q19 	List employees whose salary is above the average salary of their respective department.?????????
select emp_name from employees e inner join departments d using(dept_id)  where 
salary>(SELECT AVG(salary) as avg_salary from employees group by dept_id); 

#Q20 Find projects where the total hours worked by all employees is more than the average total hours worked across all projects.
select project_name from projects p inner join timesheets ts using(project_id)
 where hours_worked>(select avg(hours_worked) as avg_hour from timesheets);
