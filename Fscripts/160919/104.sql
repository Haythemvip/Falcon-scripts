 
 
ALTER PROCEDURE [dbo].[Appointmet]
    @UserID INTEGER ,
    @ErrorMessage NVARCHAR(500) = 0 OUTPUT
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              AppID INT ,
              AppDesc NVARCHAR(150) ,
              CaseType NVARCHAR(50) ,
              DM_Signature BIT ,
              GM_Signature BIT ,
              HR_Signature BIT
            )
	 


        DELETE  FROM #Result 

		--DECLARE  @ErrorMessage NVARCHAR(500)  
        
        BEGIN TRY
    
            INSERT  INTO #Result
                    SELECT  AppID ,
                            AppDesc ,
                            'APP' AS CaseType ,
                            0 ,
                            0 ,
                            0
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
                                    'الاقامة - EMP ID' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( emp_lwork_enddate )) < = 0
                                    AND flag = 1 
									--خاص بالحبيب
                                    --AND NationalityID <> 1 
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
                                    'الجواز - EMP Passport' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(datein AS DATE) )) < = 0
                                    AND flag = 1
									--خاص بالحبيب
                                    --AND NationalityID <> 1 
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
                                    'DOC' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
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
                                    'Cars' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
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
                                    'Staff DOC' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
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
                                    'PO' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
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
                                      + CAST(emp.emp_code AS VARCHAR(50))
                                      + ' --- '
                                      + CAST(Request_Date AS VARCHAR(12)) ) AS AppDesc ,
                                    'طلبات الموظفين - Emp Request' AS CaseType ,
                                    DM_Signature ,
                                    GM_Signature ,
                                    HR_Signature
                            FROM    dbo.Emp_Requests
                                    INNER JOIN dbo.emp ON emp_code = Emp_ID
                            WHERE   flag = 1

                    DELETE  FROM #Result
                    WHERE   AppDesc LIKE '%طلب سلفة%'
                            AND DM_Signature = 1
                            AND GM_Signature = 1
                            AND HR_Signature = 1

                    DELETE  FROM #Result
                    WHERE   AppDesc NOT LIKE '%طلب سلفة%'
                            AND DM_Signature = 1
                            AND HR_Signature = 1
 
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
                                    + suppliers.Short_Name_EN + ' - '
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
                                    'دفعات امر الشراء - PO Payment' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    Amr_Sheraa
                                    INNER JOIN PO_Payments ON Amr_Sheraa.performa_id = PO_Payments.performa_id
                                    INNER JOIN dbo.suppliers ON Amr_Sheraa.Customer_id = suppliers.suppliers_id
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
                                    AmountDate ,
                                    suppliers.Short_Name_EN
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

 