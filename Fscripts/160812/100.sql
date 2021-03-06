
 
ALTER PROCEDURE [dbo].[Account_Summary]
    @DateFrom DATE ,
    @DateTo DATE ,
    @Lang NVARCHAR(2) ,
    @MainCode BIGINT ,
    @CurID INT = 1 ,
    @zero INT ,
    @FinancialYear NVARCHAR(50) ,
    @FromAcc BIGINT = 0 ,
    @ToAcc BIGINT = 0
AS
    BEGIN
	


        CREATE TABLE #Render
            (
              [ISmain] BIT ,
              [AccCode] [BIGINT] NULL ,
              [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai
                                        NULL ,
              [balanceMaden] [DECIMAL](18, 2) NOT NULL ,
              [BalanceDaen] [DECIMAL](18, 2) NOT NULL ,
              [SumMaden] [DECIMAL](38, 2) NOT NULL ,
              [SumDaen] [DECIMAL](38, 2) NOT NULL ,
              [totalMaden] [DECIMAL](38, 2) NOT NULL ,
              [totalDaen] [DECIMAL](38, 2) NOT NULL ,
              [StartMaden] [DECIMAL](38, 2) NOT NULL ,
              [StartDaen] [DECIMAL](38, 2) NOT NULL ,
              [BeforMaden] [DECIMAL](38, 2) NOT NULL ,
              [BeforDaen] [DECIMAL](38, 2) NOT NULL ,
              [SortID] BIGINT
            )
        ON  [PRIMARY]



		

        
    
        IF @MainCode > 0
            BEGIN 
 
                IF @ToAcc = 0
                    BEGIN 

                        SET @ToAcc = ( SELECT   MAX(AccCode)
                                       FROM     dbo.tblAccTree
                                     )
                    END
        

                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.AccCode ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.AccName )
                                       ELSE ( Acc.AccName_En )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen ,
                                0.00 AS BeforMaden ,
                                0.00 AS BeforDaen ,
                                0.00 AS SortID
                        FROM    dbo.tblAccTree Acc
                        WHERE   Acc.AccCode BETWEEN @FromAcc AND @ToAcc
                                AND Acc.ISmain = 0
                        ORDER BY Acc.AccCode



                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(VEl_Koyod_El_Yawmia.Maden)
                                            FROM    VEl_Koyod_El_Yawmia
                                            WHERE   F1 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F2 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F3 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F4 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F5 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F6 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F7 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F8 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F9 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F10 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(VEl_Koyod_El_Yawmia.Daen)
                                           FROM     VEl_Koyod_El_Yawmia
                                           WHERE    F1 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F2 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F3 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F4 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F5 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F6 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F7 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F8 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F9 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                                    OR F10 = @MainCode
                                                    AND aDate BETWEEN @DateFrom AND @DateTo
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND IsStartedBalance = 0
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(VEl_Koyod_El_Yawmia.Maden)
                                              FROM      VEl_Koyod_El_Yawmia
                                              WHERE     F1 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F2 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F3 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F4 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F5 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F6 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F7 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F8 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F9 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F10 = @MainCode
                                                        AND aDate <= @Dateto
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(VEl_Koyod_El_Yawmia.Daen)
                                             FROM   VEl_Koyod_El_Yawmia
                                             WHERE  F1 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F2 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F3 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F4 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F5 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F6 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F7 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F8 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F9 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F10 = @MainCode
                                                    AND aDate <= @Dateto
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(VEl_Koyod_El_Yawmia.Maden)
                                              FROM      VEl_Koyod_El_Yawmia
                                              WHERE     F1 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F2 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F3 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F4 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F5 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F6 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F7 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F8 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F9 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F10 = @MainCode
                                                        AND IsStartedBalance = 1
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(VEl_Koyod_El_Yawmia.Daen)
                                             FROM   VEl_Koyod_El_Yawmia
                                             WHERE  F1 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F2 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F3 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F4 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F5 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F6 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F7 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F8 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F9 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F10 = @MainCode
                                                    AND IsStartedBalance = 1
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                           ), 0) ,
                        BeforMaden = ISNULL(( SELECT    SUM(VEl_Koyod_El_Yawmia.Maden)
                                              FROM      VEl_Koyod_El_Yawmia
                                              WHERE     F1 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F2 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F3 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F4 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F5 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F6 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F7 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F8 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F9 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                                        OR F10 = @MainCode
                                                        AND aDate < @DateFrom
                                                        AND IsStartedBalance = 0
                                                        AND CurID = @CurID
                                                        AND AccID = #Render.AccCode
                                                        AND year = @FinancialYear
                                            ), 0) ,
                        BeforDaen = ISNULL(( SELECT SUM(VEl_Koyod_El_Yawmia.Daen)
                                             FROM   VEl_Koyod_El_Yawmia
                                             WHERE  F1 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F2 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F3 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F4 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F5 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F6 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F7 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F8 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F9 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                                    OR F10 = @MainCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND CurID = @CurID
                                                    AND AccID = #Render.AccCode
                                                    AND year = @FinancialYear
                                           ), 0)



            END


 

-- العملاء 
        IF @MainCode = -1
            BEGIN 
 
                IF @ToAcc = 0
                    BEGIN 

                        SET @ToAcc = ( SELECT   MAX(Customer_id)
                                       FROM     dbo.customers
                                     )
                    END
        


                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Customer_id ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.customer_name )
                                       ELSE ( Acc.Customer_Name_EN )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen ,
                                0.00 AS BeforMaden ,
                                0.00 AS BeforDaen ,
                                0.00 AS SortID
                        FROM    customers Acc
                        WHERE   Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                        ORDER BY Customer_id












                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(customer_account.maden)
                                            FROM    customer_account
                                            WHERE   customer_account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND customer_account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND customer_account.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(customer_account.daen) AS SumDaen
                                           FROM     customer_account
                                           WHERE    customer_account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND customer_account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND customer_account.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(customer_account.maden) AS totalMaden
                                              FROM      customer_account
                                              WHERE     customer_account.CurID = @CurID
                                                        AND customer_account.movedate <= @DateTo
                                                        AND year = @FinancialYear
                                                        AND customer_account.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(customer_account.daen) AS totalDaen
                                             FROM   customer_account
                                             WHERE  customer_account.CurID = @CurID
                                                    AND customer_account.movedate <= @DateTo
                                                    AND year = @FinancialYear
                                                    AND customer_account.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(customer_account.maden) AS SumMaden
                                              FROM      customer_account
                                              WHERE     ( customer_account.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND customer_account.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                             FROM   customer_account
                                             WHERE  ( customer_account.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND customer_account.venderid = AccCode
                                           ), 0) ,
                        BeforMaden = ISNULL(( SELECT    SUM(customer_account.maden) AS SumMaden
                                              FROM      customer_account
                                              WHERE     ( customer_account.CurID = @CurID )
                                                        AND customer_account.movedate < @DateFrom
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 0
                                                        AND customer_account.venderid = AccCode
                                            ), 0) ,
                        BeforDaen = ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                             FROM   customer_account
                                             WHERE  ( customer_account.CurID = @CurID )
                                                    AND customer_account.movedate < @DateFrom
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 0
                                                    AND customer_account.venderid = AccCode
                                           ), 0)
                
                  


            END
 
      --Acc.suppliers_name ,
      -- Acc.Supplier_Name_EN  

 -- الموردين 
        IF @MainCode = -2
            BEGIN 
          
                IF @ToAcc = 0
                    BEGIN 

                        SET @ToAcc = ( SELECT   MAX(suppliers_id)
                                       FROM     dbo.suppliers
                                     )
                    END












                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.suppliers_id ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.suppliers_name )
                                       ELSE ( Acc.Supplier_Name_EN )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen ,
                                0.00 AS BeforMaden ,
                                0.00 AS BeforDaen ,
                                0.00 AS SortID
                        FROM    suppliers Acc
                        WHERE   Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                        ORDER BY suppliers_id




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(venderaccount.maden)
                                            FROM    venderaccount
                                            WHERE   venderaccount.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND venderaccount.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND venderaccount.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(venderaccount.daen) AS SumDaen
                                           FROM     venderaccount
                                           WHERE    venderaccount.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND venderaccount.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND venderaccount.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(venderaccount.maden) AS totalMaden
                                              FROM      venderaccount
                                              WHERE     venderaccount.CurID = @CurID
                                                        AND venderaccount.movedate <= @DateTo
                                                        AND year = @FinancialYear
                                                        AND venderaccount.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(venderaccount.daen) AS totalDaen
                                             FROM   venderaccount
                                             WHERE  venderaccount.CurID = @CurID
                                                    AND venderaccount.movedate <= @DateTo
                                                    AND year = @FinancialYear
                                                    AND venderaccount.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(venderaccount.maden) AS SumMaden
                                              FROM      venderaccount
                                              WHERE     ( venderaccount.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND venderaccount.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                             FROM   venderaccount
                                             WHERE  ( venderaccount.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND venderaccount.venderid = AccCode
                                           ), 0) ,
                        BeforMaden = ISNULL(( SELECT    SUM(venderaccount.maden) AS SumMaden
                                              FROM      venderaccount
                                              WHERE     ( venderaccount.CurID = @CurID )
                                                        AND venderaccount.movedate < @DateFrom
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 0
                                                        AND venderaccount.venderid = AccCode
                                            ), 0) ,
                        BeforDaen = ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                             FROM   venderaccount
                                             WHERE  ( venderaccount.CurID = @CurID )
                                                    AND venderaccount.movedate < @DateFrom
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 0
                                                    AND venderaccount.venderid = AccCode
                                           ), 0)
                


              

            END


	 -- الموظفين 
        IF @MainCode = -3
            BEGIN 


                IF @ToAcc = 0
                    BEGIN 

                        SET @ToAcc = ( SELECT   MAX(emp_code)
                                       FROM     dbo.emp
                                     )
                    END











                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.emp_code ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.emp_name )
                                       ELSE ( Acc.SecondName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen ,
                                0.00 AS BeforMaden ,
                                0.00 AS BeforDaen ,
                                0.00 AS SortID
                        FROM    dbo.emp Acc
                        WHERE   Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                        ORDER BY Acc.emp_code




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(dbo.Emp_Account.maden)
                                            FROM    Emp_Account
                                            WHERE   Emp_Account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND Emp_Account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Emp_Account.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(Emp_Account.daen) AS SumDaen
                                           FROM     Emp_Account
                                           WHERE    Emp_Account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND Emp_Account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Emp_Account.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(Emp_Account.maden) AS totalMaden
                                              FROM      Emp_Account
                                              WHERE     Emp_Account.CurID = @CurID
                                                        AND Emp_Account.movedate <= @DateTo
                                                        AND year = @FinancialYear
                                                        AND Emp_Account.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(Emp_Account.daen) AS totalDaen
                                             FROM   Emp_Account
                                             WHERE  Emp_Account.CurID = @CurID
                                                    AND Emp_Account.movedate <= @DateTo
                                                    AND year = @FinancialYear
                                                    AND Emp_Account.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(Emp_Account.maden) AS SumMaden
                                              FROM      Emp_Account
                                              WHERE     ( Emp_Account.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND Emp_Account.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                             FROM   Emp_Account
                                             WHERE  ( Emp_Account.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND Emp_Account.venderid = AccCode
                                           ), 0) ,
                        BeforMaden = ISNULL(( SELECT    SUM(Emp_Account.maden) AS SumMaden
                                              FROM      Emp_Account
                                              WHERE     ( Emp_Account.CurID = @CurID )
                                                        AND Emp_Account.movedate < @DateFrom
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 0
                                                        AND Emp_Account.venderid = AccCode
                                            ), 0) ,
                        BeforDaen = ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                             FROM   Emp_Account
                                             WHERE  ( Emp_Account.CurID = @CurID )
                                                    AND Emp_Account.movedate < @DateFrom
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 0
                                                    AND Emp_Account.venderid = AccCode
                                           ), 0)
                



 

            END
 	   

 -- البنوك 
        IF @MainCode = -4
            BEGIN 
            
                IF @ToAcc = 0
                    BEGIN 

                        SET @ToAcc = ( SELECT   MAX(AccountID)
                                       FROM     dbo.BankAccountName
                                     )
                    END









                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.AccountID ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.AccountName )
                                       ELSE ( Acc.AccountName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen ,
                                0.00 AS BeforMaden ,
                                0.00 AS BeforDaen ,
                                0.00 AS SortID
                        FROM    dbo.BankAccountName Acc
                        WHERE   Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                        ORDER BY Acc.AccountID




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(dbo.Bank_Accounts.maden)
                                            FROM    Bank_Accounts
                                            WHERE   Bank_Accounts.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND Bank_Accounts.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Bank_Accounts.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(Bank_Accounts.daen) AS SumDaen
                                           FROM     Bank_Accounts
                                           WHERE    Bank_Accounts.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                    AND Bank_Accounts.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Bank_Accounts.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(Bank_Accounts.maden) AS totalMaden
                                              FROM      Bank_Accounts
                                              WHERE     Bank_Accounts.CurID = @CurID
                                                        AND Bank_Accounts.movedate <= @DateTo
                                                        AND year = @FinancialYear
                                                        AND Bank_Accounts.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(Bank_Accounts.daen) AS totalDaen
                                             FROM   Bank_Accounts
                                             WHERE  Bank_Accounts.CurID = @CurID
                                                    AND Bank_Accounts.movedate <= @DateTo
                                                    AND year = @FinancialYear
                                                    AND Bank_Accounts.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(Bank_Accounts.maden) AS SumMaden
                                              FROM      Bank_Accounts
                                              WHERE     ( Bank_Accounts.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND Bank_Accounts.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                             FROM   Bank_Accounts
                                             WHERE  ( Bank_Accounts.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND Bank_Accounts.venderid = AccCode
                                           ), 0) ,
                        BeforMaden = ISNULL(( SELECT    SUM(Bank_Accounts.maden) AS SumMaden
                                              FROM      Bank_Accounts
                                              WHERE     ( Bank_Accounts.CurID = @CurID )
                                                        AND Bank_Accounts.movedate < @DateFrom
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 0
                                                        AND Bank_Accounts.venderid = AccCode
                                            ), 0) ,
                        BeforDaen = ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                             FROM   Bank_Accounts
                                             WHERE  ( Bank_Accounts.CurID = @CurID )
                                                    AND Bank_Accounts.movedate < @DateFrom
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 0
                                                    AND Bank_Accounts.venderid = AccCode
                                           ), 0)
               




 

            END


        UPDATE  #Render
        SET     balanceMaden = ( CASE WHEN ( #Render.totalMaden > #Render.totalDaen )
                                      THEN ( totalMaden - totalDaen )
                                      ELSE ( 0 )
                                 END )


        UPDATE  #Render
        SET     BalanceDaen = ( CASE WHEN ( #Render.totalMaden < #Render.totalDaen )
                                     THEN ( totalDaen - totalMaden )
                                     ELSE ( 0 )
                                END )



        IF @zero = 1
            BEGIN

                SELECT  *
                FROM    #Render
                ORDER BY SortID ,
                        AccCode 
            END
	 
        IF @zero = 0
            BEGIN

                SELECT  *
                FROM    #Render
                WHERE   #Render.balanceMaden <> #Render.BalanceDaen
                ORDER BY SortID ,
                        AccCode
            END

	 

        DELETE  FROM RptTrailbalanceFromTo


        IF @zero = 1
            BEGIN

                INSERT  INTO RptTrailbalanceFromTo
                        SELECT  *
                        FROM    #Render
                        ORDER BY SortID ,
                                AccCode
            END
	 
        IF @zero = 0
            BEGIN
                INSERT  INTO RptTrailbalanceFromTo
                        SELECT  *
                        FROM    #Render
                        ORDER BY SortID ,
                                AccCode

            END

    END
