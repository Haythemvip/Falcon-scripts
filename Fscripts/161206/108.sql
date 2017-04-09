

 
CREATE PROCEDURE EmpCosts_Save
    @EmpCode BIGINT ,
    @CostNotes NVARCHAR(MAX) ,
    @CostName NVARCHAR(MAX) ,
    @Cost FLOAT ,
    @CostType NVARCHAR(50) ,
    @Year INT ,
    @StartDate DATE ,
    @ID BIGINT
AS
    BEGIN
	
     
        IF NOT EXISTS ( SELECT  ID
                        FROM    dbo.EmpCosts
                        WHERE   ID = @ID )
            BEGIN

                INSERT  INTO dbo.EmpCosts
                        ( EmpCode ,
                          CostNotes ,
                          CostName ,
                          Cost ,
                          CostType ,
                          Year ,
                          StartDate
	                    )
                VALUES  ( @EmpCode ,
                          @CostNotes ,
                          @CostName ,
                          @Cost ,
                          @CostType ,
                          @Year ,
                          @StartDate 
	                    );

            END;


        IF EXISTS ( SELECT  ID
                    FROM    dbo.EmpCosts
                    WHERE   ID = @ID )
            BEGIN

                UPDATE  dbo.EmpCosts
                SET     EmpCode = @EmpCode ,
                        CostNotes = @CostNotes ,
                        CostName = @CostName ,
                        Cost = @Cost ,
                        CostType = @CostType ,
                        Year = @Year ,
                        StartDate = @StartDate
                WHERE   ID = @ID;
	            
       

            END;
     

    END;
GO
