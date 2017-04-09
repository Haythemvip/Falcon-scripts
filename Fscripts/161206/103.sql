
 
CREATE PROCEDURE UpdateEmpID_Save
    @ID BIGINT ,
    @UpdateEmpID_DT UpdateEmpID_DT READONLY ,
    @ErrorNumber INT OUTPUT ,
    @ErrorMessage NVARCHAR(500) OUTPUT
AS
    BEGIN

        BEGIN TRANSACTION;
        BEGIN TRY	
            IF EXISTS ( SELECT  ID
                        FROM    dbo.UpdateEmpID )
                BEGIN 

                
                    DELETE  FROM dbo.UpdateEmpID
                    WHERE   ID = @ID; 
	        
                END;

			 

            INSERT  INTO dbo.UpdateEmpID
                    ( ID ,
                      DateFrom ,
                      DateTo ,
                      DateHijriFrom ,
                      DateHigriTo ,
                      EmpCode ,
                      IqamaDate ,
                      IqamaHijri ,
                      WorK_Lic_NO ,
                      Work_Lic_Value ,
                      ID_Renewual_Value
	                )
                    SELECT  @ID ,
                            DateFrom ,
                            DateTo ,
                            DateHijriFrom ,
                            DateHigriTo ,
                            EmpCode ,
                            IqamaDate ,
                            IqamaHijri ,
                            WorK_Lic_NO ,
                            Work_Lic_Value ,
                            ID_Renewual_Value
                    FROM    @UpdateEmpID_DT;
	        
            
			
            SET @ErrorMessage = 'Done ';
            SET @ErrorNumber = 0;
            COMMIT TRANSACTION;  

        END TRY 

        BEGIN CATCH 

            SET @ErrorNumber = ERROR_NUMBER();    
            SET @ErrorMessage = ERROR_MESSAGE();  
            ROLLBACK TRANSACTION;

        END CATCH;

    END;
    

 