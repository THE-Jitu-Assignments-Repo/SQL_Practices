SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [BikeStores].[sales].[customers]


-- My 1st stored Procedure


create procedure pro_customer
as
begin
  select * from sales.customers
end;


exec pro_customer


-- Using a single parameter

create procedure pro_para_customer @first_name varchar(30)
as
begin
    select * from sales.customers where first_name=@first_name
end;

exec pro_para_customer @first_name = 'kamau'


-- Using multiple paramaters example for insert

create or alter procedure pro_mult_para_customer(@first_name varchar(30),@last_name varchar(30), @email varchar(30))
as
begin
    insert into sales.customers(first_name,last_name,email) values (@first_name,@last_name,@email)
end;

exec pro_mult_para_customer 'kungu', 'fred', 'kungu@gmail.com'
