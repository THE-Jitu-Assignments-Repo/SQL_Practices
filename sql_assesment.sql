-- Create two tables, employees
-- and sales. Get a list of all employees who did not make any sales.  

create table employees (employees_id int primary key, employees_name varchar(255));
create table sales (sales_id int primary key, sales_col varchar(255))

select E.employees_name as employees from employees E 
    left join sales S on S.sales_id = E.employee_id
         where S.sales_col is null

-- Write one procedure that can
-- insert or
-- update the employee 

create or alter procedure InsertEmployee(@Empname varchar(255))
 as
 begin
   insert into employees (employees_name)
   values (@Empname)
 end;

exec InsertEmployee('Michael')

-- Group By, Having Clause – Assuming you have Customers table;
-- with columns CustomerID, CustomerName, ContactName, Address, City, 
-- PostalCode and Country. Write a query to list the number of customers in each country; only include countries
-- with more than 3 customers   ,
-- use ORDER BY too. 

select Country from Customers
    group by Customers
        having count(distinct Customers) >= 3;

-- Write an SQL query to
-- fetch only odd
-- rows from the table
-- (
-- create dummy data to
-- use) 

select * from employees 
    where employees_id in(select employees_id from employees employees_id%2=1)


-- Write an SQL query
-- to
-- fetch duplicate records
-- from EmployeeDetails
-- (without considering the primary key – EmpId)
-- (
-- create dummy data to
-- use) 

 select EmployeeDetails, count(*) from employees
    group by EmployeeDetails
    having count(EmployeeDetails) > 1;