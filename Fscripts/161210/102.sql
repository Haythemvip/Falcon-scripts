 
 
ALTER PROCEDURE [dbo].[UpdateEmpID_Save]
    @ID BIGINT ,
    @UpdateEmpID_DT UpdateEmpID_DT READONLY ,
    @ErrorNumber INT OUTPUT ,
    @ErrorMessage NVARCHAR(500) OUTPUT ,
    @Year INT
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
	      
            


            INSERT  INTO dbo.EmpCosts
                    ( EmpCode ,
                      CostNotes ,
                      CostName ,
                      Cost ,
                      CostType ,
                      Year ,
                      StartDate ,
                      State ,
                      Selected
			        )
                    SELECT  EmpCode ,
                            N'' , -- CostNotes - nvarchar(max)
                            N'رسوم الجوازات' , -- CostName - nvarchar(max)
                            ID_Renewual_Value , -- Cost - float
                            N'الهوية' , -- CostType - nvarchar(50)
                            @Year , -- Year - int
                            GETDATE() , -- StartDate - date
                            0 , -- State - bit
                            0  -- Selected - bit
                    FROM    @UpdateEmpID_DT
                    WHERE   ID_Renewual_Value > 0;
			




            INSERT  INTO dbo.EmpCosts
                    ( EmpCode ,
                      CostNotes ,
                      CostName ,
                      Cost ,
                      CostType ,
                      Year ,
                      StartDate ,
                      State ,
                      Selected
			        )
                    SELECT  EmpCode ,
                            N'' , -- CostNotes - nvarchar(max)
                            N'رخصة العمل' , -- CostName - nvarchar(max)
                            Work_Lic_Value , -- Cost - float
                            N'رخصة العمل' , -- CostType - nvarchar(50)
                            @Year , -- Year - int
                            GETDATE() , -- StartDate - date
                            0 , -- State - bit
                            0  -- Selected - bit
                    FROM    @UpdateEmpID_DT
                    WHERE   Work_Lic_Value > 0;










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
    

 