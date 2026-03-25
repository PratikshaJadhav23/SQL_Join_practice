-- 🔵 LEVEL 3: JOIN + CONDITIONS 
use join_part;

-- Employees earning more than department average
select name ,salary , dept_id
from employees as e
where salary > 
(select avg(salary)
from employees
where dept_id = e.dept_id);

-- Employees with salary greater than 60000 and have projects
select name , salary ,project_name
from employees as e
join projects as p
on p.emp_id = e.emp_id
where salary > 60000 ;

-- Employees who worked on more than 1 project
select name , count(*) as project_count
from employees as e
join projects as p
on p.emp_id = e.emp_id
group by e.name;

-- Employees who handled more than 2 orders
select name , count(*) as project_count
from employees as e
join orders as o
on o.emp_id = e.emp_id
group by e.name
having project_count > 2;

-- Employees in departments where avg salary > 60000
select e.name ,e.salary , e.dept_id
from employees as e
join (
select dept_id , avg(salary) as avg_salary
from employees 
group by dept_id
having avg_salary > 60000) as dept_avg
on e.dept_id = dept_avg.dept_id;

-- Employees whose salary is highest in their department
select e.name , e.salary 
from employees as e
join (
select dept_id , max(salary) as max_salary
from employees 
group by dept_id 
) as dept_max
on dept_max.dept_id = e.dept_id and e.salary = dept_max.max_salary ;

-- method 2
select name , salary , dept_id
from employees as e
where salary = (select max(salary) as max_salary 
from employees 
where dept_id = e.dept_id );
-- Employees whose salary is lowest in their department
select name , salary , dept_id 
from employees as e
join (
select min(salary) as min_salary 
from employees 
group by dept_id) as dept_min
on e.dept_id = dept_id and
e.salary = dept_min.min_salary;

-- method 2
select name , salary , dept_id 
from employees as e
where salary = (select min(salary) as min_salary
from employees 
where e.dept_id = dept_id); 


-- Departments with no employees
select  d.dept_name , d.dept_id
from departments as d
left join employees as e
on e.dept_id = d.dept_id 
where e.dept_id is null;

-- Employees without department but have projects
select e.name 
from employees as e
left join departments as d
 on d.dept_id = e.dept_id
 join projects as p
 on p.emp_id = e.emp_id
 where d.dept_id is null ;
 
-- Employees without project but have orders
select name 
from employees as e
left join projects as p
on p.emp_id = e.emp_id 
join orders as o
on o.emp_id = e.emp_id
where p.emp_id is null;

-- Employees who worked in multiple departments (if data allows)


-- Employees who have both project and orders
select distinct name 
from employees as e
join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id ;

-- Employees with no project and no orders
select name 
from employees as e
left join projects as p
on p.emp_id = e.emp_id
left join orders as o
on o.emp_id = e.emp_id 
where o.emp_id is null AND p.emp_id is null;

-- Employees whose total order amount > 10000
select name , sum(order_amount) as total_orders
from employees as e
join orders as o
on e.emp_id = o.emp_id
group by e.name
having total_orders > 10000;

-- Departments with total salary > 100000
select d.dept_name , sum(salary) as total_salary
from employees as e
join departments as d
on d.dept_id = e.dept_id
group by d.dept_name
having total_salary > 100000;

-- Employees with salary above company average
select e.name , e.salary
from employees as e
join (select avg(salary) as avg_salary
from employees) as avg_amount
on avg_amount.avg_salary < e.salary;

-- mathod 2
select name , salary
from employees as e
where salary > (select avg(salary)
from employees );

-- Employees with highest salary in company
select name , salary
from employees as e
join (select max(salary) as max_salary
from employees 
)as max_amt
on max_amt.max_salary = e.salary;

-- method2
select name ,salary
from employees as e
where salary = (select max(salary) as max_salary
from employees );

-- Employees whose department name starts with 'M'
select name , dept_name
from employees as e
join departments as d
on d.dept_id = e.dept_id
where d.dept_name like "M%";

-- Employees working on 'Website' project
select e.name , p.project_name
from employees as e
join projects as p
on p.emp_id = e.emp_id
where p.project_name like "%Website%";

-- Employees with no matching department record-- 
select name
from employees as e
left join departments as d
on d.dept_id = e.dept_id
where d.dept_id is null;

-- method 2
-- it can fail if null exists -> less preferred
select name 
from employees 
where dept_id not in (
select dept_id 
from departments );