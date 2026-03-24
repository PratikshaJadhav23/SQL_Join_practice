-- -- -- -- JOIN + GROUP BY -- -- -- --
-- Count employees in each department
select dept_name , count(e.emp_id)
from departments as d
left join employees as e
on d.dept_id = e.dept_id
group by d.dept_name;

-- Count projects per employee
select name , count(p.project_id) as proj_count
from employees as e
left join projects as p
on e.emp_id = p.emp_id
group by e.name;
-- Count orders per employee
select name , count(e.emp_id)
from orders as o
left join employees as e
on o.emp_id - e.emp_id
group by name; 
-- Total salary per department
select dept_name , sum(e.salary) as total_salary
from departments as d
left join employees as e
on e.dept_id = d.dept_id
group by d.dept_id;

-- Average salary per department
select dept_name , avg(e.salary)
from departments as d
left join employees as e
on e.dept_id = d.dept_id
group by d.dept_id;
-- Maximum salary per department
select dept_name , max(salary) as max_salary
from departments as d
left join employees as e
on e.dept_id = d.dept_id
group by d.dept_id;
  
-- Minimum salary per department
select dept_name , min(salary)
from departments as d
left join  employees as e
on e.dept_id = d.dept_id
group by d.dept_id;

-- Total order amount per employee
select name , sum(order_amount) as total_amount
from employees as e
left join orders as o
on e.emp_id = o.emp_id
group by e.name;

-- Total order amount per department
select dept_name , sum(order_amount) as total_amount
from orders as o
left join employees  as e
on e.emp_id = o.emp_id
left join departments as d
on d.dept_id = e.dept_id
group by dept_name;

-- Count employees in each city per department
select dept_name , count(city)
from departments as d
left join employees as e
on e.dept_id = d.dept_id
group by dept_name;
-- Count employees without department
select count(name) 
from employees as e
left join departments as d
on d.dept_id = e.dept_id
where d.dept_id is null
group by e.name;

-- Count employees without projects
select count(name)
from employees as e
left join projects as p
on p.emp_id = e.emp_id
where p.emp_id is null
group by project_id;

-- Count employees without orders
select count(name)
from employees as e
left join orders as o
on e.emp_id = o.emp_id
where o.emp_id is null
group by order_id;

-- Total projects per department
select dept_name , count(project_name)
from departments as d
left join employees as e
on d.dept_id = e.dept_id
left join projects as p
on p.emp_id = e.emp_id
group by d.dept_name;

-- Average order amount per employee
select name , avg(order_amount)
from employees as e
left join orders as o
on o.emp_id = e.emp_id
group by e.name;

-- Find department with highest number of employees
select dept_name , max(e.emp_id) as max_emp
from departments as d
left join employees as e
on e.dept_id = d.dept_id
group by d.dept_name
order by max_emp desc 
limit 1;

-- Find employee with highest number of projects
select name , count(p.project_id) as proj_count
from employees as e
left join projects as p
on p.emp_id = e.emp_id
group by e.name
order by proj_count desc 
limit 2;

-- Find employee with maximum orders
select name , count(order_id) as order_count
from employees as e
left join orders as o
on o.emp_id = e.emp_id
group by e.name
order by order_count desc
limit 2;

-- Count employees who have both project and orders
select distinct name 
from employees as e
join orders as o 
on o.emp_id = e.emp_id
join departments as d
on d.dept_id = e.dept_id;

-- Count employees who have neither project nor orders
select count(*) 
from employees as e
left join orders as o
on o.emp_id = e.emp_id 
left join projects as p
on p.emp_id = e.emp_id
where o.emp_id is null AND p.emp_id is null;
