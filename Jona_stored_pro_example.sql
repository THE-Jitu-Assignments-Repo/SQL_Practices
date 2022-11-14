[10:43] Jonathan Ndambuki

CREATE TABLE traineestable(
id INT IDENTITY ,
name VARCHAR(50),
email VARCHAR(255),
)


CREATE PROCEDURE uspgetTrainees
AS
BEGIN

SELECT * FROM traineestable

END



CREATE PROCEDURE uspInsertTrainee(@name VARCHAR(50) , @email VARCHAR(300))
AS
BEGIN

INSERT INTO traineestable (name, email) VALUES (@name,@email)

END

EXEC uspInsertTrainee  'John Doe' , 'johndoe@gmail.com'


CREATE PROCEDURE uspUpdateTrainee(@id INT , @updatedName VARCHAR(50) , @updatedEmail VARCHAR(300))
AS

BEGIN

UPDATE  traineestable SET name=@updatedName , email=@updatedEmail WHERE id=@id

END

EXEC dbo.uspUpdateTrainee @id=1, @updatedName='Updated John ', @updatedEmail='updatedjohndoe@gmail.com'


CREATE OR ALTER PROCEDURE uspDeleteTrainee(@id INT )

AS
BEGIN

DELETE  FROM traineestable WHERE id=@id
END

EXEC uspDeleteTrainee 2

EXECUTE uspgetTrainees


DROP PROCEDURE uspDeleteTrainee

