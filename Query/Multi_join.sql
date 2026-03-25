-- 🔴 LEVEL 4: MULTI-JOIN

-- Employee + department + project name
select * 
from employees as  e
left join departments as d
on d.dept_id = e.dept_id
left join projects as p
on p.emp_id = e.emp_id;

-- Employee + department + order amount
select e.name , d.dept_name , o.order_amount
from employees as e
left join departments as d
on d.dept_id = e.dept_id
left join orders as o
on o.emp_id = e.emp_id;

-- Employee + project + order details
select e.name , p.project_name , o.*
from employees as e
join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id;

-- Employee + department + project + order
select e.name , d.dept_name , p.project_name , o.*
from employees as e
join departments as d
on d.dept_id = e.dept_id
join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id;

-- Show employee full details with all related data
select distinct e.*
from employees as e
left join departments as d
on d.dept_id = e.dept_id
left join orders as o
on o.emp_id = e.emp_id
left join projects as p
on p.emp_id = e.emp_id;

-- Department-wise total revenue (orders)
select d.dept_name , sum(order_amount) as total_amount
from departments as d
left join employees as e
on e.dept_id = d.dept_id
left join orders as o
on o.emp_id = e.emp_id
group by d.dept_name;

-- Employee name + dept + total orders + total projects
select e.name , d.dept_name , 
count(distinct o.order_id) as total_order , 
count(distinct project_id) as project_count
from employees as e
join departments as d
on d.dept_id = e.dept_id
join orders as o
on o.emp_id = e.emp_id
join projects as p
on p.emp_id = e.emp_id
group by e.name,e.emp_id;

-- Show employees who worked on projects AND placed orders
select distinct name 
from employees as e
join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id;

-- Show employees who worked on project but no orders
select name 
from employees as e
join projects as p
on p.emp_id = e.emp_id
left join orders as o
on o.emp_id = e.emp_id
where o.emp_id is null;

-- Show employees who placed orders but no project
select distinct name 
from employees as e
left join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id
where p.emp_id is null;

-- Show department with highest revenue
select d.dept_name , sum(o.order_amount) as total_amount
from employees as e
join departments as d
on d.dept_id = e.dept_id
join orders as o
on o.emp_id = o.emp_id
group by d.dept_name;

-- Show employee contributing highest revenue per department
select e.name, d.dept_name, sum(o.order_amount) as total_amount
from employees e
join departments d
on d.dept_id = e.dept_id
join orders o
on o.emp_id = e.emp_id
group by e.emp_id, e.name, d.dept_name
having sum(o.order_amount) = (
    select max(total_amount)
    from (
        select sum(o2.order_amount) as total_amount
        from employees e2
        join orders o2
        on o2.emp_id = e2.emp_id
        where e2.dept_id = e.dept_id
        group by e2.emp_id
    ) as t
);

-- Show project count per department
select  d.dept_name ,count(p.project_name) as proj_count
from employees as e
join departments as d
on d.dept_id = e.dept_id
join projects as p
on p.emp_id = e.emp_id
group by d.dept_name;

-- Show order count per department
select distinct d.dept_name , count(o.order_id)
from employees as e
join departments as d
on d.dept_id = e.dept_id
join orders as o
on o.emp_id = e.emp_id
group by d.dept_name;

-- Show average order amount per department
select d.dept_name , round(avg(o.order_amount))
from employees as e
join departments as d
on d.dept_id = e.dept_id
join orders as o
on o.emp_id = e.emp_id
group by d.dept_name;

-- Show employees in departments with no orders
select distinct e.name 
from employees as e
join departments as d
on d.dept_id = e.dept_id
left join orders as o
on o.emp_id = e.emp_id
where o.emp_id is null;

-- Show departments where no projects exist
select d.dept_name 
from employees as e
left join projects as p
on p.emp_id = e.emp_id
join departments as d
on d.dept_id = e.dept_id
where p.emp_id is null;

-- Show employees in city 'Pune' with projects and orders
select e.name ,  p.project_name , o.order_id
from employees as e
join projects as p
on p.emp_id = e.emp_id 
join orders as o
on o.emp_id = e.emp_id
where e.city like "%Pune%"; 

-- Show all data for employees in IT department
select e.* 
from employees as e
join departments as d
on d.dept_id = e.dept_id
where d.dept_name like "%IT%";

-- Show employee name, dept, project count, order sum
select e.name , d.dept_name , 
count(distinct p.project_id) as proj_count, 
sum(distinct o.order_amount) as total_amount
from employees as e
join departments as d
on d.dept_id = e.dept_id
join projects as p
on p.emp_id = e.emp_id
join orders as o
on o.emp_id = e.emp_id
group by e.emp_id;

