
CREATE PROCEDURE Inset_Ghyab
    @Emp_Code BIGINT ,
    @From_date DATE ,
    @ToDate DATE
AS
    BEGIN

        WHILE @From_date <= @ToDate
            BEGIN

			DELETE FROM dbo.emp_ghyab_bezn WHERE Emp_Code = @Emp_Code AND ghyab_date = @From_date 


                INSERT  INTO dbo.emp_ghyab_bezn
                        ( Emp_Code ,
                          ghyab_date ,
                          ProunchID ,
                          COMP_ID
                        )
                VALUES  ( @Emp_Code , -- Emp_Code - bigint
                          @From_date , -- ghyab_date - date
                          1 , -- ProunchID - int
                          1  -- COMP_ID - int
                        )

                SET @From_date = ( DATEADD(DAY, 1, @From_date) )

            END
				
				UPDATE  Emp_Comming
        SET     ghyab_bezn = 0
        WHERE   emp_datecomming BETWEEN @From_date AND @ToDate
                AND Emp_Code = @Emp_Code

 
 
        UPDATE  Emp_Comming
        SET     ghyab_bezn = 1
        WHERE   emp_datecomming BETWEEN @From_date AND @ToDate
                AND Emp_Code = @Emp_Code


    END
GO
