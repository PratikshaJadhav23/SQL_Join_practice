create database join_part;
use join_part;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    dept_id INT,
    city VARCHAR(50),
    salary INT,
    experience_years INT
);
INSERT INTO employees VALUES
(1,'Amit',28,101,'Pune',50000,3),
(2,'Neha',32,102,'Mumbai',65000,6),
(3,'Raj',26,101,'Delhi',48000,2),
(4,'Priya',35,103,'Pune',72000,8),
(5,'Karan',30,NULL,'Mumbai',40000,5),
(6,'Sneha',27,104,'Bangalore',55000,3),
(7,'Arjun',40,102,'Delhi',90000,12),
(8,'Meera',29,103,'Pune',60000,4),
(9,'Ravi',31,101,'Mumbai',58000,6),
(10,'Anjali',33,104,'Delhi',67000,7);


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance'),
(104,'Marketing'),
(105,'Sales');


CREATE TABLE projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);
INSERT INTO projects VALUES
(1,1,'Website'),
(2,2,'Mobile App'),
(3,1,'Dashboard'),
(4,3,'API'),
(5,6,'Marketing Campaign'),
(6,7,'AI Model'),
(7,2,'Cloud Migration'),
(8,4,'Audit System'),
(9,9,'HR Tool'),
(10,10,'SEO Project');


CREATE TABLE orders (
    order_id INT,
    emp_id INT,
    order_amount INT,
    order_date DATE
);
INSERT INTO orders VALUES
(1,1,5000,'2024-01-10'),
(2,2,7000,'2024-01-11'),
(3,1,3000,'2024-01-12'),
(4,3,4000,'2024-01-15'),
(5,7,10000,'2024-01-20'),
(6,2,6000,'2024-01-25'),
(7,4,8000,'2024-02-01'),
(8,6,2000,'2024-02-05'),
(9,9,4500,'2024-02-10'),
(10,10,9000,'2024-02-15');


CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO customers VALUES
(1,'Rahul','Pune'),
(2,'Simran','Mumbai'),
(3,'Aakash','Delhi'),
(4,'Pooja','Bangalore'),
(5,'Vikas','Pune');


