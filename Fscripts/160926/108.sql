 
 
 
ALTER  PROCEDURE [dbo].[Religion]
    @CustomerID1 BIGINT ,
    @CustomerID2 BIGINT ,
    @FromDate DATE ,
    @FinancialYear CHAR(4)
AS
    CREATE TABLE #Religions
        (
          Customer_ID BIGINT NULL ,
          Customer_Name NVARCHAR(150) NULL ,
          Greater_0 DECIMAL(18, 2) NULL ,
          Greater_30 DECIMAL(18, 2) NULL ,
          Greater_60 DECIMAL(18, 2) NULL ,
          Greater_90 DECIMAL(18, 2) NULL ,
          Greater_120 DECIMAL(18, 2) NULL ,
          Greater_150 DECIMAL(18, 2) NULL ,
          Greater_180 DECIMAL(18, 2) NULL ,
          Balance DECIMAL(18, 2) NULL ,
          TotalMaden DECIMAL(18, 2) NULL ,
          TotalDaen DECIMAL(18, 2) NULL ,
          Greater_02 DECIMAL(18, 2) NULL ,
          Greater_302 DECIMAL(18, 2) NULL ,
          Greater_602 DECIMAL(18, 2) NULL ,
          Greater_902 DECIMAL(18, 2) NULL ,
          Greater_1202 DECIMAL(18, 2) NULL ,
          Greater_1502 DECIMAL(18, 2) NULL ,
          Greater_1802 DECIMAL(18, 2) NULL
        )
 
 
    INSERT  INTO #Religions
            SELECT  Customer_id ,
                    customer_name ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0
            FROM    dbo.customers
            WHERE   Customer_id BETWEEN @CustomerID1 AND @CustomerID2 

 

--------------------------------------------------------------------
--------------------------------------------------------------------

     --الرصيد
    UPDATE  #Religions
    SET     Balance = ( SELECT  ISNULL(SUM(maden), 0) - ISNULL(SUM(daen), 0)
                        FROM    customer_account
                        WHERE   #Religions.Customer_ID = venderid
                                AND movedate <= @FromDate
                                AND year = @FinancialYear
                      )
                       
	 
    UPDATE  #Religions
    SET     TotalDaen = ( SELECT    ISNULL(SUM(daen), 0.000)
                          FROM      customer_account
                          WHERE     venderid = #Religions.Customer_ID
                                    AND year = @FinancialYear
                        )

--------------------------------------------------------------------
--------------------------------------------------------------------


    DECLARE @CalcDate DATE  

    SET @CalcDate = DATEADD(MONTH, -6, @FromDate)

    UPDATE  #Religions
    SET     Greater_180 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          )  

    UPDATE  #Religions
    SET     Greater_1802 = ( SELECT ISNULL(SUM(maden), 0.000)
                             FROM   customer_account
                             WHERE  venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                           )  
---------------------------------------------------------                         


    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_150 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - Greater_180
              
    
    UPDATE  #Religions
    SET     Greater_1502 = ( SELECT ISNULL(SUM(maden), 0.000)
                             FROM   customer_account
                             WHERE  venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                           ) - Greater_180
              
   
----------------------------------------------------




    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_120 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - Greater_180 - Greater_150
              

    UPDATE  #Religions
    SET     Greater_1202 = ( SELECT ISNULL(SUM(maden), 0.000)
                             FROM   customer_account
                             WHERE  venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                           ) - Greater_180 - Greater_150
              


---------------------------------------------------------


    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_90 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - Greater_180 - Greater_150 - Greater_120
              
    UPDATE  #Religions
    SET     Greater_902 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - Greater_180 - Greater_150 - Greater_120
              

	 
----------------------------------------------------------




    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_60 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90
              

    UPDATE  #Religions
    SET     Greater_602 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90
 



-----------------------------------------------------------    

    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_30 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90 - Greater_60

			 				                    
 

    UPDATE  #Religions
    SET     Greater_302 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90 - Greater_60

---------------------------------------------------------------   

    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_0 = ( SELECT    ISNULL(SUM(maden), 0.000)
                          FROM      customer_account
                          WHERE     venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                                    AND year = @FinancialYear
                        ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90 - Greater_60 - Greater_30 


    UPDATE  #Religions
    SET     Greater_02 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                                    AND year = @FinancialYear
                         ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90 - Greater_60 - Greater_30 



----------------------------------------------------------                      
----------------------------------------------------------

    UPDATE  #Religions
    SET     Greater_180 = CASE WHEN Greater_180 <= TotalDaen THEN ( 0 )
                               ELSE Greater_180 - TotalDaen
                          END  
    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_1802 <= TotalDaen
                             THEN ( TotalDaen - Greater_1802 )
                             ELSE 0
                        END



    UPDATE  #Religions
    SET     Greater_150 = CASE WHEN Greater_150 <= TotalDaen THEN 0
                               ELSE Greater_150 - TotalDaen
                          END  					    
    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_1502 <= TotalDaen
                             THEN ( TotalDaen - Greater_1502 )
                             ELSE 0
                        END

						  
    UPDATE  #Religions
    SET     Greater_120 = CASE WHEN Greater_120 <= TotalDaen THEN 0
                               ELSE Greater_120 - TotalDaen
                          END  
    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_1202 <= TotalDaen
                             THEN ( TotalDaen - Greater_1202 )
                             ELSE 0
                        END


					  
    UPDATE  #Religions
    SET     Greater_90 = CASE WHEN Greater_90 <= TotalDaen THEN 0
                              ELSE Greater_90 - TotalDaen
                         END  

    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_902 <= TotalDaen
                             THEN ( TotalDaen - Greater_902 )
                             ELSE 0
                        END
						 
						 
						  				  
    UPDATE  #Religions
    SET     Greater_60 = CASE WHEN Greater_60 <= TotalDaen THEN 0
                              ELSE Greater_60 - TotalDaen
                         END  

    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_602 <= TotalDaen
                             THEN ( TotalDaen - Greater_602 )
                             ELSE 0
                        END

						  					  				  
    UPDATE  #Religions
    SET     Greater_30 = CASE WHEN Greater_30 <= TotalDaen THEN 0
                              ELSE Greater_30 - TotalDaen
                         END 
    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_302 <= TotalDaen
                             THEN ( TotalDaen - Greater_302 )
                             ELSE 0
                        END


						  					  					  				  
    UPDATE  #Religions
    SET     Greater_0 = CASE WHEN Greater_0 < TotalDaen THEN 0
                             ELSE Greater_0 - TotalDaen
                        END 

    UPDATE  #Religions
    SET     TotalDaen = CASE WHEN Greater_02 <= TotalDaen
                             THEN ( TotalDaen - Greater_02 )
                             ELSE 0
                        END



    SELECT  *
    FROM    #Religions
    WHERE   Balance <> 0
    ORDER BY Customer_ID
