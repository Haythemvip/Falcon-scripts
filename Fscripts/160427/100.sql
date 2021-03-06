
 
 
ALTER  PROCEDURE [dbo].[Religion]
    @CustomerID1 BIGINT ,
    @CustomerID2 BIGINT,
	@FromDate DATE ,
	@FinancialYear CHAR(4)

AS
    CREATE TABLE #Religions
        (
          Customer_ID BIGINT NULL ,
          Customer_Name NVARCHAR(150) NULL ,
          Greater_0 DECIMAL(18,2) NULL ,
          Greater_30 DECIMAL(18,2) NULL ,
          Greater_60 DECIMAL(18,2) NULL ,
          Greater_90 DECIMAL(18,2) NULL ,
          Greater_120 DECIMAL(18,2) NULL ,
          Greater_150 DECIMAL(18,2) NULL ,
          Greater_180 DECIMAL(18,2) NULL ,
          Balance DECIMAL(18,2) NULL ,
          TotalMaden DECIMAL(18,2) NULL ,
          TotalDaen DECIMAL(18,2) NULL,


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
                    0
            FROM    dbo.customers
           WHERE   Customer_id BETWEEN @CustomerID1 AND @CustomerID2 



    DECLARE @CalcDate DATE  

 


    SET @CalcDate = DATEADD(MONTH, -6, @FromDate)

    UPDATE  #Religions
    SET     Greater_180 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - ( SELECT  ISNULL(SUM(daen), 0.000)
                                FROM    customer_account
                                WHERE   venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                              )


 UPDATE  #Religions
    SET     Greater_180 = CASE WHEN Greater_180 < 0 THEN (0)
                               ELSE (Greater_180)
                          END	
   
---------------------------------------------------------                         


    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_150 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - ( SELECT  ISNULL(SUM(daen), 0.000)
                                FROM    customer_account
                                WHERE   venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                              )  - Greater_180
              
    
				UPDATE  #Religions
    SET     Greater_150 = CASE WHEN Greater_150 < 0 THEN (0)
                               ELSE (Greater_150)
                          END			   
   
								
   
----------------------------------------------------




    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_120 = ( SELECT  ISNULL(SUM(maden), 0.000)
                            FROM    customer_account
                            WHERE   venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                          ) - ( SELECT  ISNULL(SUM(daen), 0.000)
                                FROM    customer_account
                                WHERE   venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                              ) - Greater_180 - Greater_150
              

	UPDATE  #Religions
    SET     Greater_120 = CASE WHEN Greater_120 < 0 THEN (0)
                               ELSE (Greater_120)
                          END	



---------------------------------------------------------


    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_90 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - ( SELECT   ISNULL(SUM(daen), 0.000)
                               FROM     customer_account
                               WHERE    venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                             ) - Greater_180 - Greater_150 - Greater_120
              


			   			                  
   UPDATE  #Religions
    SET     Greater_90 = CASE WHEN Greater_90 < 0 THEN (0)
                               ELSE (Greater_90)
                          END	

----------------------------------------------------------




    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_60 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - ( SELECT   ISNULL(SUM(daen), 0.000)
                               FROM     customer_account
                               WHERE    venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                             ) - Greater_180 - Greater_150 - Greater_120 - Greater_90
              



				 			                   
  UPDATE  #Religions
    SET     Greater_60 = CASE WHEN Greater_60 < 0 THEN (0)
                               ELSE (Greater_60)
                          END	



-----------------------------------------------------------    

    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_30 = ( SELECT   ISNULL(SUM(maden), 0.000)
                           FROM     customer_account
                           WHERE    venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate
                         ) - ( SELECT   ISNULL(SUM(daen), 0.000)
                               FROM     customer_account
                               WHERE    venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate
                             ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90  -Greater_60

			 				                    
     UPDATE  #Religions
    SET     Greater_30 = CASE WHEN Greater_30 < 0 THEN (0)
                               ELSE (Greater_30)
                          END	

---------------------------------------------------------------   

    SET @CalcDate = DATEADD(MONTH, 1, @CalcDate)

    UPDATE  #Religions
    SET     Greater_0 = ( SELECT    ISNULL(SUM(maden), 0.000)
                          FROM      customer_account
                          WHERE     venderid = #Religions.Customer_ID
                                    AND movedate < = @CalcDate AND year = @FinancialYear
                        ) - ( SELECT    ISNULL(SUM(daen), 0.000)
                              FROM      customer_account
                              WHERE     venderid = #Religions.Customer_ID
                                        AND movedate < = @CalcDate AND year = @FinancialYear
                            ) - Greater_180 - Greater_150 - Greater_120
            - Greater_90 - Greater_60  - Greater_30 





----------------------------------------------------------


    --الرصيد
    UPDATE  #Religions
    SET     Balance = ( SELECT  ISNULL(SUM(maden), 0) - ISNULL(SUM(daen), 0)
                        FROM    customer_account
                        WHERE  #Religions.Customer_ID = venderid  AND movedate <= @FromDate AND year = @FinancialYear)
                       
	 

		 

		 
	--0                  
    UPDATE  #Religions
    SET     Greater_30 = CASE WHEN Greater_0 < 0 
                              THEN Greater_30 + Greater_0
                              ELSE Greater_30
                         END    
    UPDATE  #Religions
    SET     Greater_0 = CASE WHEN Greater_0 < 0 THEN 0
                             ELSE Greater_0
                        END	
									 
	--30				                  
    UPDATE  #Religions
    SET     Greater_60 = CASE WHEN Greater_30 < 0
                              THEN Greater_60 + Greater_30
                              ELSE Greater_60
                         END   
    UPDATE  #Religions
    SET     Greater_30 = CASE WHEN Greater_30 < 0 THEN 0
                              ELSE Greater_30
                         END
						 			 
    --60				                  
    UPDATE  #Religions
    SET     Greater_90 = CASE WHEN Greater_60 < 0
                              THEN Greater_90 + Greater_60 
                              ELSE Greater_90
                         END   
    UPDATE  #Religions
    SET     Greater_60 = CASE WHEN Greater_60 < 0 THEN ( 0 )
                              ELSE Greater_60
                         END	
						 		 
	--90				                   
    UPDATE  #Religions
    SET     Greater_120 = CASE WHEN Greater_90 < 0
                               THEN Greater_120 + Greater_90
                               ELSE Greater_120
                          END  
    UPDATE  #Religions
    SET     Greater_90 = CASE WHEN Greater_90 < 0 THEN 0
                              ELSE Greater_90
                         END
						 			 
	--120				                    
    UPDATE  #Religions
    SET     Greater_150 = CASE WHEN Greater_120 < 0
                               THEN Greater_150 + Greater_120
                               ELSE Greater_150
                          END  					    

    UPDATE  #Religions
    SET     Greater_120 = CASE WHEN Greater_120 < 0 THEN 0
                               ELSE Greater_120
                          END

  --150				                   
    UPDATE  #Religions
    SET     Greater_180 = CASE WHEN Greater_150 < 0
                               THEN Greater_180 + Greater_150
                               ELSE Greater_180
                          END  

    UPDATE  #Religions
    SET     Greater_150 = CASE WHEN Greater_150 < 0 THEN ( 0 )
                               ELSE Greater_150
                          END









    SELECT  *
    FROM    #Religions
    WHERE   Balance <> 0
    ORDER BY Customer_ID
