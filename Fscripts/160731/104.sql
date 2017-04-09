

CREATE  PROCEDURE [dbo].[SP_SAVE_Cartraffic]

@ID INT,
@Date VARCHAR(50),
@DriverName VARCHAR(255),
@Exittime VARCHAR(255),
@Returntime VARCHAR(50),
@Destination VARCHAR(50),
@CounterET VARCHAR(50),
@CounterRT VARCHAR(50),
@Purpose VARCHAR(50),
@Note text

AS IF EXISTS(SELECT * FROM Cartraffic WHERE ID=@ID)
BEGIN
UPDATE Cartraffic
SET

Date=@Date,
DriverName=@DriverName,
Exittime=@Exittime,
Returntime=@Returntime,
Destination=@Destination,
CounterET=@CounterET,
CounterRT=@CounterRT,
Purpose=@Purpose,
Note=@Note


WHERE ID=@ID

END
ELSE
BEGIN

INSERT INTO Cartraffic

(

ID,
Date,
DriverName,
Exittime,
Returntime,
Destination,
CounterET,
CounterRT,
Purpose,
Note

)

VALUES

(

@ID,
@Date,
@DriverName,
@Exittime,
@Returntime,
@Destination,
@CounterET,
@CounterRT,
@Purpose,
@Note
)

END


GO


