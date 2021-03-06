 
 
ALTER PROCEDURE [dbo].[EmpCosts_Save]
    @EmpCode BIGINT ,
    @CostNotes NVARCHAR(MAX) ,
    @CostName NVARCHAR(MAX) ,
    @Cost FLOAT ,
    @CostType NVARCHAR(50) ,
    @Year INT ,
    @StartDate DATE ,
    @ID BIGINT ,
    @State BIT
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
                          StartDate ,
                          State
	                    )
                VALUES  ( @EmpCode ,
                          @CostNotes ,
                          @CostName ,
                          @Cost ,
                          @CostType ,
                          @Year ,
                          @StartDate ,
                          @State
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
                        StartDate = @StartDate ,
                        State = @State
                WHERE   ID = @ID;
	            
       

            END;
     

    END;
