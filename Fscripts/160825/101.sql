 
 
ALTER PROCEDURE [dbo].[Appointmet]
    @UserID INTEGER ,
    @ErrorMessage NVARCHAR(500) = 0 OUTPUT
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              AppID INT ,
              AppDesc NVARCHAR(150) ,
              CaseType NVARCHAR(50)
            )
	 


        DELETE  FROM #Result 
		--DECLARE  @ErrorMessage NVARCHAR(500)  
        
        BEGIN TRY
    
            INSERT  INTO #Result
                    SELECT  AppID ,
                            AppDesc ,
                            'APP' AS CaseType
                    FROM    Appointment
                    WHERE   UserID = @UserID
                            AND isdone = 0
                            AND DATEDIFF(MINUTE,
                                         ( CONVERT(DATETIME, GETDATE()) ),
                                         ( CONVERT(DATETIME, AppDate)
                                           + AppTime )) <= 0

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END CATCH                 

        BEGIN TRY

            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 1
               ) > 0
                BEGIN 
                    INSERT  INTO #Result
                            SELECT  emp_code AS AppID ,
                                    ( IqamaID + ' - ' + emp_name + ' -'
                                      + BarCode + ' - '
                                      + CAST(emp_code AS VARCHAR(50)) ) AS AppDesc ,
                                    'الاقامة - EMP ID' AS CaseType
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( emp_lwork_enddate )) < = 0
                                    AND flag = 1
    
                END
	
        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 


        BEGIN TRY

            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 2
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  emp_code AS AppID ,
                                    ( PassportID + ' - ' + emp_name + ' - '
                                      + BarCode + ' - '
                                      + CAST(emp_code AS VARCHAR(50)) ) AS AppDesc ,
                                    'الجواز - EMP Passport' AS CaseType
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(datein AS DATE) )) < = 0
                                    AND flag = 1

                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += 'Gawazat' + ERROR_MESSAGE()

        END  CATCH 
		 

        BEGIN TRY
            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 3
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  FileID AS AppID ,
                                    ( FileName ) AS AppDesc ,
                                    'DOC' AS CaseType
                            FROM    dbo.Files
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(Wenddate AS DATE) )) < = 0
                                    AND emp_code = 0     

                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 

        BEGIN TRY

            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 4
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  carno AS AppID ,
                                    ( carname ) AS AppDesc ,
                                    'Cars' AS CaseType
                            FROM    dbo.cars
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(newdate AS DATE) )) < = 0
                    
                END
        END TRY 

        BEGIN CATCH 
            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 

        BEGIN TRY
            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 5
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  FileID AS AppID ,
                                    ( FileName ) AS AppDesc ,
                                    'Staff DOC' AS CaseType
                            FROM    dbo.Files
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(Wenddate AS DATE) )) < = 0
                                    AND emp_code > 0   
                     
                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 

        BEGIN TRY


            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 6
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  performa_id AS AppID ,
                                    ( CAST(performa_id AS NVARCHAR(50)) + '-'
                                      + PO_NO ) AS AppDesc ,
                                    'PO' AS CaseType
                            FROM    dbo.Amr_Sheraa
                            WHERE   Signed = 0

                END
                     
      
        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE() 

        END  CATCH 



		
		
        BEGIN TRY

            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 7
               ) > 0
                BEGIN 

		 
  
                    INSERT  INTO #Result
                            SELECT  Emp_ID AS AppID ,
                                    ( Request_Type + ' - ' + emp_name + ' - '
                                      + CAST(emp.emp_code AS VARCHAR(50)) ) AS AppDesc,
                                    'طلبات الموظفين - Emp Request' AS CaseType
                            FROM    dbo.Emp_Requests
                                    INNER JOIN dbo.emp ON emp_code = Emp_ID
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(Request_Date AS DATE) )) < = 0
                                    AND flag = 1

                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += 'Emp Request' + ERROR_MESSAGE()

        END  CATCH 

  


		--SELECT  @ErrorMessage

        SELECT  *
        FROM    #Result

    END

 