---user define functions with Jonathan Ndambuki


SElECT SQUARE(21) as Square
SELECT GETDATE()


CREATE OR ALTER FUNCTION customSquare(@num INT)
RETURNS INT
AS
BEGIN
    RETURN @num * @num
END

SELECT dbo.customSquare(34)


SELECT @Age AS Age


CREATE OR ALTER FUNCTION ageCalculator(@dob DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
    SET @Age = DATEDIFF(YEAR , @dob , GETDATE()) -
CASE
WHEN (
(MONTH(@dob) > MONTH(GETDATE())) OR
        (MONTH(@dob) = MONTH(GETDATE()) AND DAY(@dob) > DAY(GETDATE())))
THEN 1
ELSE 0
END
    RETURN @AGE

END

SELECT dbo.ageCalculator('1990-12-17') as Age


CREATE TABLE TrainingTable
(
    id INT IDENTITY,
    name VARCHAR(50),
    gender VARCHAR(50),
    dob DATE
)

INSERT  INTO TrainingTable
    (name, dob,gender)
VALUES
    ('Erica' , '1999-12-17' , 'Female')
INSERT  INTO TrainingTable
    (name, dob,gender)
VALUES
    ('John' , '2002-12-17' , 'Male')
INSERT  INTO TrainingTable
    (name, dob,gender)
VALUES
    ('Yvonne' , '2004-12-17' , 'Female')
INSERT  INTO TrainingTable
    (name, dob,gender)
VALUES
    ('Simiyu' , '2000-12-17' , 'Male')



sp_helpText ageCalculator

CREATE   PROC calculateAge1(@dob DATE)
AS
BEGIN
    DECLARE @Age INT
    SET @Age = DATEDIFF(YEAR , @dob , GETDATE()) -  CASE   WHEN (  (MONTH(@dob) > MONTH(GETDATE())) OR (MONTH(@dob) = MONTH(GETDATE()) AND DAY(@dob) > DAY(GETDATE())))  THEN 1  ELSE 0  END
    SELECT @AGE  AS AGE
END

EXEC calculateAge1 '1990-12-12'

SELECT name , dbo.ageCalculator(dob) as Age
FROM TrainingTable
Where gender='Female'


CREATE OR ALTER FUNCTION getTraineeBasedonGender(@gender VARCHAR(50))
RETURNS TABLE
AS
RETURN (SELECT *
FROM TrainingTable
Where gender=@gender)

SELECT *
FROM getTraineeBasedonGender('Male')


CREATE OR ALTER FUNCTION getTraineeBasedonGender1()RETURNS  @Table TABLE(id INT,
    Fullname VARCHAR(50) ,
    TraineeAge INT)
AS
BEGIN
    INSERT INTO @Table
    SELECT id, name , dbo.ageCalculator(dob)
    FROM TrainingTable
    RETURN
END


UPDATE getTraineeBasedonGender('Male') SET name ='John Katua' where id =2

SELECT *
FROM TrainingTable
UPDATE getTraineeBasedonGender1() SET name ='John Katua' where id =2


