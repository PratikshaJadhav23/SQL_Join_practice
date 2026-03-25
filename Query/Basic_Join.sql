-- -- -- -- -- Basic Join -- -- -- -- 
use join_part;
-- Show employee name with department name
select e.name , d.dept_name 
from employees as e 
join  departments d
on e.dept_id = d.dept_id;

-- Show all employees with department (include NULL)
select e.name , d.dept_name
from employees as e
left join  departments d
on e.dept_id = d.dept_id;

-- Show all departments with employees
select d.dept_name , e.name
from departments as d
left join employees as e
on d.dept_id = e.dept_id;

-- Show employee name and salary with department name
select e.name , e.salary , d.dept_name 
from employees as e
join  departments d
on e.dept_id = d.dept_id;

-- Show employees working in IT department
select e.name , d.dept_name
from employees as e
join  departments d
on d.dept_id = e.dept_id
where dept_name = 'IT';

-- Show employees with salary > 60000 and department name
select e.name , e.salary , d.dept_name
from employees as e
join  departments d
on d.dept_id = e.dept_id
where salary >60000;

-- Show employees from Pune with their department
select e.name , e.city , d.dept_name
from employees as e
join departments d
on d.dept_id = e.dept_id
where city = 'Pune';
-- Show all employees and their project names
select e.name , p.project_name
from employees as e
join projects as p
on p.emp_id = e.emp_id;
-- Show employees who have projects
select distinct e.name
from employees as e
join  projects as p
on e.emp_id = p.emp_id;
-- Show employees without any project
select e.name 
from employees as e
left join projects as p
on p.emp_id = e.emp_id
where p.emp_id is null; 
-- Show all projects with employee names
select p.project_name , e.name
from projects as p
join employees  as e
on e.emp_id = p.emp_id;
-- Show employees with their order amounts
select e.name , o.order_amount
from employees as e
join orders as o
on o.emp_id = e.emp_id;
-- Show employees who have placed orders
select distinct e.name
from employees as e
join orders as o
on o.emp_id = e.emp_id;
-- Show employees who have NOT placed orders
select e.name 
from employees as e
left join orders as o
on o.emp_id = e.emp_id
where o.emp_id is null;
-- Show employee name, department, and project name
select e.name , d.dept_name , p.project_name
from employees as e
left join  departments d
on d.dept_id = e.dept_id
left join  projects as p
on p.emp_id = e.emp_id;
-- Show employee name and total orders (just count rows for now)
select e.name , count(o.order_id)
from employees as e
join orders as o
on o.emp_id = e.emp_id
group by e.emp_id;

-- Show employee names with city and department
select e.name , e.city ,d.dept_name
from employees as e
join  departments d
on d.dept_id = e.dept_id;
-- Show all departments even if no employee exists
select distinct dept_name 
from departments as d
left join employees as e
on e.dept_id = d.dept_id;
-- Show all employees even if no department exists
select name 
from employees as e
left join  departments d
on d.dept_id = e.dept_id; 
-- Show employee name and project name (only matching)
select name ,project_name
from employees as e
join projects as p
on p.emp_id = e.emp_id;