use BikeStores
GO




-- my 1st pagination query

-- select * from sales.customers
-- order by customer_id
-- offset 0 rows
-- fetch next 10 rows only


-- To use with pages

-- select * from sales.customers
-- order by customer_id
-- offset (3 - 1) * 10 rows
-- fetch next 10 rows only


-- use with Functions

-- create or alter function getPegData(
--     @Pagenumber int,
--     @Pagesize int
-- )
-- returns table
-- as
-- return(
--     select * from sales.customers
--     order by customer_id
--     offset (@Pagenumber - 1) * @Pagesize rows
--     fetch next @Pagesize rows only
-- )

-- to use the function above

-- select * from getPegData(8, 5);


--OFFSETS pagination vs Cursor pagination

-- CURSOR PAGINATION Cursor value is customer_id

-- SELECT TOP(3) * FROM sales.customers
-- WHERE customer_id > 10
-- ORDER BY customer_id

-- SELECT  * FROM sales.customers
-- WHERE customer_id > 10 AND customer_id < 20
-- ORDER BY customer_id


-- cursor function

-- CREATE OR ALTER FUNCTION cursorPagData(
--     @PageSize int,
--     @StartValue int,
--     @EndValue int
-- )
-- RETURNS TABLE
-- AS
-- RETURN  (
--     SELECT TOP(@PageSize) * FROM sales.customers
--     WHERE customer_id > @StartValue AND customer_id > @EndValue
--     ORDER BY customer_id
-- )


-- To use the function
SELECT * FROM cursorPagData(5, 10, 11)

