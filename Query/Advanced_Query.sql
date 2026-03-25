--  ADVANCED / INTERVIEW 

-- Top 3 employees by salary
select name , salary
from employees 
order by salary desc 
limit 3;

-- Top 3 employees by revenue
select e.name , sum(o.order_amount) as total_amount
from employees as e
join orders as o
on o.emp_id =e.emp_id
group by e.name
order by total_amount desc
limit 3;

-- Top employee per department (salary)
select d.dept_name ,e.name , e.salary
from employees as e
join departments as d
on d.dept_id = e.dept_id
where e.salary = (
select max(salary)
from employees as e2
where e2.dept_id = e.dept_id);

-- Top employee per department (revenue)

-- Second highest salary per department
select e.name , max(salary) as max_salary
from employees as e
join departments as d
on d.dept_id = e.dept_id
where max_salary < (
select max(salary)
from employees as e2
where e2.dept+id = e.dept_id);
-- Employees whose salary > dept average AND have projects
-- Employees whose revenue > dept revenue average
-- Rank employees by salary within department
-- Rank employees by order amount
-- Running total of order amount per employee
-- Department with highest avg salary
-- Department with lowest avg salary
-- Employees contributing more than 50% of department revenue
-- Employees with no activity (no project + no order)
-- Find duplicate employees based on name + department
-- Employees with highest experience in each department
-- Employees whose project count > avg project count
-- Departments where employee count < 2
-- Employees working in departments with no revenue
-- Full dashboard query: employee + dept + total revenue + project count + ranking