 
CREATE PROCEDURE EmpForm_Extradition_Save
    @ID BIGINT = 0 ,
    @EmpCode BIGINT ,
    @Detail NVARCHAR(MAX) ,
    @Custody_Status NVARCHAR(50) ,
    @Notes NVARCHAR(MAX) ,
    @date DATE
AS
    BEGIN
	
        IF NOT EXISTS ( SELECT  ID
                        FROM    EmpForm_Extradition
                        WHERE   ID = @ID )
            BEGIN

                INSERT  INTO dbo.EmpForm_Extradition
                        ( EmpCode ,
                          Date ,
                          Detail ,
                          Custody_Status ,
                          Notes
                        )
                VALUES  ( @EmpCode , -- EmpCode - bigint
                          @date , -- Date - date
                          @Detail , -- Detail - nvarchar(max)
                          @Custody_Status , -- State - varchar(50)
                          @Notes  -- Notes - nvarchar(200)
	                    );

            END;
    
     
	 
        IF EXISTS ( SELECT  ID
                    FROM    EmpForm_Extradition
                    WHERE   ID = @ID )
            BEGIN

                UPDATE  EmpForm_Extradition
                SET     EmpCode = @EmpCode ,
                        Date = @date ,
                        Detail = @Detail ,
                        Custody_Status = @Custody_Status ,
                        Notes = @Notes
                WHERE   ID = @ID; 

            END;


    END;
GO
