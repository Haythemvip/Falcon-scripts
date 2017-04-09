 
 
 
ALTER PROCEDURE [dbo].[Appointmet]
    @UserID INTEGER ,
    @ErrorMessage NVARCHAR(500) = 0 OUTPUT
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              AppID BIGINT ,
              AppDesc NVARCHAR(250) ,
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
                                    '«·«ﬁ«„… - EMP ID' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( emp_lwork_enddate )) < = 0
                                    AND flag = 1 
									--Œ«’ »«·Õ»Ì»
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
                                    '«·ÃÊ«“ - EMP Passport' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    dbo.emp
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(datein AS DATE) )) < = 0
                                    AND flag = 1
									--Œ«’ »«·Õ»Ì»
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
                                    'ÿ·»«  «·„ÊŸ›Ì‰ - Emp Request' AS CaseType ,
                                    DM_Signature ,
                                    GM_Signature ,
                                    HR_Signature
                            FROM    dbo.Emp_Requests
                                    INNER JOIN dbo.emp ON emp_code = Emp_ID
                            WHERE   flag = 1

                    DELETE  FROM #Result
                    WHERE   AppDesc LIKE '%ÿ·» ”·›…%'
                            AND DM_Signature = 1
                            AND GM_Signature = 1
                            AND HR_Signature = 1

                    DELETE  FROM #Result
                    WHERE   AppDesc NOT LIKE '%ÿ·» ”·›…%'
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
                                    'œ›⁄«  «„— «·‘—«¡ - PO Payment' AS CaseType ,
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

            SET @ErrorMessage += 'PO' + ERROR_MESSAGE()

        END  CATCH 


        BEGIN TRY
            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 9
               ) > 0
                BEGIN 
  
                    INSERT  INTO #Result
                            SELECT  Contract_Home_Allaw.Emp_Code AS AppID ,
                                    ( CAST(Contract_Home_Allaw.Emp_Code AS NVARCHAR(50))
                                      + ' --- '
                                      + CAST(emp.emp_name AS NVARCHAR(250))
                                      + ' --- '
                                      + CAST(Paid_Value AS NVARCHAR(20))
                                      + ' --- '
                                      + CAST(due_date AS NVARCHAR(10)) ) AS AppDesc ,
                                    'œ›⁄… »œ· ”ﬂ‰' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    dbo.Contract_Home_Allaw
                                    INNER JOIN emp ON Contract_Home_Allaw.Emp_Code = emp.emp_code
                            WHERE   DATEDIFF(DAY,
                                             ( DATEADD(DAY, 30, GETDATE()) ),
                                             ( CAST(due_date AS DATE) )) < = 0
                                    AND Contract_Home_Allaw.Flag = 0
                                    
                     
                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 













		
        BEGIN TRY
            IF ( SELECT ISNULL(AppointCase, 0)
                 FROM   Appointmet_Seurity
                 WHERE  UserID = @UserID
                        AND AppointCase = 10
               ) > 0
                BEGIN 
 
                    INSERT  INTO #Result
                            SELECT  V_Item_Card.Item_Id AS AppID ,
                                    CAST(V_Item_Card.Item_Id AS NVARCHAR(20))
                                    + '__'
                                    + CAST(V_Item_Card.Item_Name AS NVARCHAR(20))
                                    + '__' + '«·—’Ìœ' + '( '
                                    + CAST(( SUM(V_Item_Card.QCome)
                                             - SUM(V_Item_Card.Qout) ) AS NVARCHAR(20))
                                    + ' )' + '__' + 'Õœ ≈⁄«œ… «·ÿ·»'
                                    + '( ' + CAST(Items.MINQ AS NVARCHAR(10))
                                    + ' )' + '__' + store_name AS AppDesc ,
                                    '«’‰«›  Ã«Ê“  Õœ «·ÿ·»' AS CaseType ,
                                    0 ,
                                    0 ,
                                    0
                            FROM    V_Item_Card
                                    INNER JOIN Items ON V_Item_Card.Item_Id = Items.Item_Id
                            GROUP BY V_Item_Card.Item_Id ,
                                    V_Item_Card.Item_Name ,
                                    MINQ ,
                                    store_id ,
                                    store_name
                            HAVING  ( SUM(QCome) - SUM(Qout) ) < MINQ
                            ORDER BY V_Item_Card.Item_Id 
  
                END

        END TRY 

        BEGIN CATCH 

            SET @ErrorMessage += ERROR_MESSAGE()

        END  CATCH 








		--SELECT  @ErrorMessage

        SELECT  *
        FROM    #Result

    END

 