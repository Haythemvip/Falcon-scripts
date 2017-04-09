
CREATE PROCEDURE CashFlowa
    @DateFrom DATE ,
    @DateTo DATE ,
    @year INT ,
    @CompanyID INT ,
    @ProunchID INT ,
    @CurnsID INT
AS
    BEGIN
	

        CREATE TABLE #Resust
            (
              InNote NVARCHAR(MAX) ,
              InAmount FLOAT ,
              InDate DATE ,
              OutNote NVARCHAR(MAX) ,
              OutAmount FLOAT ,
              OutDate DATE
            )





        DELETE  FROM #Resust

        INSERT  INTO #Resust
                SELECT  
                        Box.BoxName ,
                        SUM(Box_Moves.Price_Elwared)
                        - SUM(Box_Moves.Price_ElMonsaref) AS InAmount , GETDATE(),NULL,NULL ,null
                FROM    Box
                        INNER JOIN Box_Moves ON Box.BoxID = Box_Moves.BoxID
                WHERE   ( Box.flag = 1 )
                        AND ( Box_Moves.Year = @year )
                        AND ( Box.COMP_ID = @CompanyID
                              AND ( Box.ProunchID = @ProunchID )
                              AND Box_Moves.CurID = @CurnsID
                            )
                GROUP BY Box.BoxID ,
                        Box.BoxName


        SELECT  *
        FROM    #Resust 




	
    END
GO
