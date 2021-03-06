 
 
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
                                      + CAST(emp.emp_code AS VARCHAR(50)) ) AS AppDesc ,
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

  




        BEGIN TRY

            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 8
               ) > 0
                BEGIN 

                    INSERT  INTO #Result
                            SELECT  PO_Payments.performa_id AS AppID ,
                                    CAST(PO_Payments.performa_id AS NVARCHAR(50))
                                    + ' - '
                                    + CAST(PO_Payments.ID AS NVARCHAR(50))
                                    + ' - ' + Amr_Sheraa.customername + ' - '
                                    + Amr_Sheraa.Customer_id + ' - '
                                    + CAST(PO_Payments.Amount
                                    - CASE WHEN ( SELECT    SUM(Value)
                                                  FROM      Po_Pyment_Journal
                                                  WHERE     PO_Payments_ID = PO_Payments.ID
                                                ) > 0
                                           THEN ( SELECT    SUM(Value)
                                                  FROM      Po_Pyment_Journal
                                                  WHERE     PO_Payments_ID = PO_Payments.ID
                                                )
                                           ELSE ( 0 )
                                      END AS NVARCHAR(50)) + ' - '
                                    + CAST(PO_Payments.AmountDate AS NVARCHAR(10)) AS AppDesc ,
                                    'دفعات امر الشراء - PO Payment' AS CaseType
                            FROM    Amr_Sheraa
                                    INNER JOIN PO_Payments ON Amr_Sheraa.performa_id = PO_Payments.performa_id
                                    LEFT OUTER JOIN Po_Pyment_Journal ON PO_Payments.ID = Po_Pyment_Journal.PO_Payments_ID
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(dbo.PO_Payments.AmountDate AS DATE) )) <= 0
                                    AND ( PO_Payments.Amount
                                          - CASE WHEN ( SELECT
                                                              SUM(Value)
                                                        FROM  Po_Pyment_Journal
                                                        WHERE PO_Payments_ID = PO_Payments.ID
                                                      ) > 0
                                                 THEN ( SELECT
                                                              SUM(Value)
                                                        FROM  Po_Pyment_Journal
                                                        WHERE PO_Payments_ID = PO_Payments.ID
                                                      )
                                                 ELSE ( 0 )
                                            END ) > 0
                            GROUP BY ID ,
                                    PO_Payments.performa_id ,
                                    Customer_id ,
                                    customername ,
                                    Amount ,
                                    AmountDate
									ORDER BY PO_Payments.performa_id 
                                  

                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += 'Emp Request' + ERROR_MESSAGE()

        END  CATCH 




		--SELECT  @ErrorMessage

        SELECT  *
        FROM    #Result

    END

 