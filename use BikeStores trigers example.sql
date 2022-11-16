use BikeStores
GO 

-- select *
--   from production.products;
    
    
-- select TOP (50) *
--   from sales.customers;


-- create trigger test2 on sales.customers
-- after
-- insert,
--     update as raiserror('Notify me test 2', );
-- GO


-- UPDATE sales.customers set  first_name='kamau2' where customer_id= 5;



-- CREATE TABLE [sales].[updated_customers](
-- 	[customer_id] [int] IDENTITY(1,1) NOT NULL,
-- 	[first_name] [varchar](255) NOT NULL,
-- 	[last_name] [varchar](255) NOT NULL,
-- 	[phone] [varchar](25) NULL,
-- 	[email] [varchar](255) NOT NULL,
-- 	[street] [varchar](255) NULL,
-- 	[city] [varchar](50) NULL,
-- 	[state] [varchar](25) NULL,
-- 	[zip_code] [varchar](5) NULL,
-- )

-- GO

-- drop table sales.updated_customers;

-- create table sales.updated_customers (
--     change_id int identity primary key,
--     customer_id int,
--     first_name varchar(255),
--     phone varchar(25),
-- );

-- drop trigger sales.trg_updated_customers;

-- create trigger trg_updated_customers on sales.customers
-- after insert, update
-- as 
--     begin
--     set nocount on;
--     insert into sales.updated_customers(
--         customer_id,
--         first_name,
--         phone
--     )
-- select customer_id, first_name, phone from sales.customers;
-- end;

-- SELECT * FROM sales.updated_customers;
-- SELECT * FROM sales.updated_customers;
-- messagetbl sales.messagetbl;



-- create table sales.messagetbl(
--     id int,
--     message_id int ,
--     message varchar(300) not null,
--     primary key (id,message_id)
-- );



-- create trigger check_null_phone
-- on sales.updated_customers
-- after insert
-- as
-- begin
-- if sales.updated_customers.phone is null then
-- insert into sales.messagetbl(message_id, message)
-- values(sales.updated_customers.customer_id, concat('Hello ', sales.updated_customers.first_name, ', Please enter your phone number' ));
-- end if;
-- end


-- drop table sales.updated_customers


-- select * from sales.customers;


-- drop trigger sales.trg_updated_customer;

-- drop trigger sales.test1;


-- EXAMLE 2 WORKED
-- -- -- -- -- -- -- -- -- -- -- 
-- create table sales.updated_customers(
--     customer_id int,
--     first_name varchar(255),
--     customer_mod_date datetime
-- );

-- CREATE trigger trg_updated_customer on sales.customers
-- for update
-- as
-- begin
--     insert into sales.updated_customers
--     select customer_id, first_name, getdate()
--     from inserted
-- end;



-- update sales.customers set first_name='kamau4' where customer_id=5;
-- update sales.customers set first_name='kamau mike' where customer_id=7; 


-- select * from sales.updated_customers;




-- select TOP (50) *
--   from sales.customers;


-- create trigger test2 on sales.customers
-- after
-- insert,
--     update as raiserror('Notify me test 2', );
-- GO


-- UPDATE sales.customers set  first_name='kamau2' where customer_id= 5;