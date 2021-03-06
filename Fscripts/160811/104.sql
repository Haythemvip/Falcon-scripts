
 
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
                                AccID ,
                                ( CASE WHEN ( @Lang = 'AR' ) THEN ( AccName )
                                       ELSE ( AccName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                ISNULL(( SELECT SUM(Maden) AS SumMaden
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS SumMaden ,
                                ISNULL(( SELECT SUM(Daen) AS SumDaen
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS SumDaen ,
                                ISNULL(( SELECT SUM(Maden) AS totalMaden
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS totalMaden ,
                                ISNULL(( SELECT SUM(Daen) AS totalDaen
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                         GROUP BY AccID ,
                                                AccName
                                       ), 0) AS totalDaen ,
                                ISNULL(( SELECT SUM(Maden) AS SumMaden
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                         GROUP BY AccID ,
                                                AccName
                                       ), 0) AS StartMaden ,
                                ISNULL(( SELECT SUM(Daen) AS SumDaen
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS StartDaen ,
                                ISNULL(( SELECT SUM(Maden) AS SumMaden
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS BeforMaden ,
                                ISNULL(( SELECT SUM(Daen) AS SumDaen
                                         FROM   VEl_Koyod_El_Yawmia
                                         WHERE  F1 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F2 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F3 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F4 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F5 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F6 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F7 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F8 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F9 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                                OR F10 = @MainCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND CurID = @CurID
                                                AND AccID BETWEEN @FromAcc AND @ToAcc
                                       ), 0) AS BeforDaen ,
                                0 AS SortID
                        FROM    VEl_Koyod_El_Yawmia
                        WHERE   AccID BETWEEN @FromAcc AND @ToAcc 
            --WHERE   ( customer_account.Maden > 0
            --          OR customer_account.Daen > 0
            --          AND customer_account.aDate BETWEEN @DateFrom
            --                                       AND     @DateTo
                    --)
                        GROUP BY AccID ,
                                AccName  
                   
            --HAVING  ( Acc.ISmain = 0 )
                        ORDER BY AccID


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
                                ISNULL(( SELECT SUM(customer_account.maden) AS SumMaden
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  customer_account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND customer_account.CurID = @CurID
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumMaden ,
                                ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  customer_account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND customer_account.CurID = @CurID
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumDaen ,
                                ISNULL(( SELECT SUM(customer_account.maden) AS totalMaden
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  customer_account.CurID = @CurID
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND customer_account.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalMaden ,
                                ISNULL(( SELECT SUM(customer_account.daen) AS totalDaen
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  customer_account.CurID = @CurID
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND customer_account.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalDaen ,
                                ISNULL(( SELECT SUM(customer_account.maden) AS SumMaden
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  ( customer_account.CurID = @CurID )
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartMaden ,
                                ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  ( customer_account.CurID = @CurID )
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartDaen ,
                                ISNULL(( SELECT SUM(customer_account.maden) AS SumMaden
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  ( customer_account.CurID = @CurID )
                                                AND customer_account.movedate < @DateFrom
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforMaden ,
                                ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                         FROM   customers
                                                INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                         WHERE  ( customer_account.CurID = @CurID )
                                                AND customer_account.movedate < @DateFrom
                                                AND Acc.Customer_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforDaen ,
                                0 AS SortID
                        FROM    customers Acc
                                INNER JOIN customer_account ON Customer_id = customer_account.venderid
                        WHERE   Acc.Customer_id BETWEEN @FromAcc AND @ToAcc 
            --WHERE   ( customer_account.Maden > 0
            --          OR customer_account.Daen > 0
            --          AND customer_account.aDate BETWEEN @DateFrom
            --                                       AND     @DateTo
                    --)
                        GROUP BY Acc.Customer_id ,
                                Acc.customer_name ,
                                Acc.Customer_Name_EN  
                   
            --HAVING  ( Acc.ISmain = 0 )
                        ORDER BY Customer_id


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
                                suppliers_id ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.suppliers_name )
                                       ELSE ( Acc.Supplier_Name_EN )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                ISNULL(( SELECT SUM(venderaccount.maden) AS SumMaden
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  venderaccount.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND venderaccount.CurID = @CurID
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumMaden ,
                                ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  venderaccount.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND venderaccount.CurID = @CurID
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumDaen ,
                                ISNULL(( SELECT SUM(venderaccount.maden) AS totalMaden
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  venderaccount.CurID = @CurID
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND venderaccount.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalMaden ,
                                ISNULL(( SELECT SUM(venderaccount.daen) AS totalDaen
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  venderaccount.CurID = @CurID
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND venderaccount.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalDaen ,
                                ISNULL(( SELECT SUM(venderaccount.maden) AS SumMaden
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  ( venderaccount.CurID = @CurID )
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartMaden ,
                                ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  ( venderaccount.CurID = @CurID )
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartDaen ,
                                ISNULL(( SELECT SUM(venderaccount.maden) AS SumMaden
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  ( venderaccount.CurID = @CurID )
                                                AND venderaccount.movedate < @DateFrom
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforMaden ,
                                ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                         FROM   suppliers
                                                INNER JOIN venderaccount ON suppliers.suppliers_id = venderaccount.venderid
                                         WHERE  ( venderaccount.CurID = @CurID )
                                                AND venderaccount.movedate < @DateFrom
                                                AND Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforDaen ,
                                0 AS SortID
                        FROM    suppliers Acc
                                INNER JOIN venderaccount ON suppliers_id = venderaccount.venderid
                        WHERE   Acc.suppliers_id BETWEEN @FromAcc AND @ToAcc 
            --WHERE   ( venderaccount.Maden > 0
            --          OR venderaccount.Daen > 0
            --          AND venderaccount.aDate BETWEEN @DateFrom
            --                                       AND     @DateTo
                    --)
                        GROUP BY Acc.suppliers_id ,
                                Acc.suppliers_name ,
                                Acc.Supplier_Name_EN  
                   
            --HAVING  ( Acc.ISmain = 0 )
                        ORDER BY suppliers_id

					--venderaccount

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
                                emp_code ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.emp_name )
                                       ELSE ( Acc.SecondName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                ISNULL(( SELECT SUM(Emp_Account.maden) AS SumMaden
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp_code = Emp_Account.venderid
                                         WHERE  Emp_Account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND Emp_Account.CurID = @CurID
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumMaden ,
                                ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  Emp_Account.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND Emp_Account.CurID = @CurID
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumDaen ,
                                ISNULL(( SELECT SUM(Emp_Account.maden) AS totalMaden
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  Emp_Account.CurID = @CurID
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND Emp_Account.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalMaden ,
                                ISNULL(( SELECT SUM(Emp_Account.daen) AS totalDaen
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  Emp_Account.CurID = @CurID
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND Emp_Account.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalDaen ,
                                ISNULL(( SELECT SUM(Emp_Account.maden) AS SumMaden
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  ( Emp_Account.CurID = @CurID )
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartMaden ,
                                ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  ( Emp_Account.CurID = @CurID )
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartDaen ,
                                ISNULL(( SELECT SUM(Emp_Account.maden) AS SumMaden
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  ( Emp_Account.CurID = @CurID )
                                                AND Emp_Account.movedate < @DateFrom
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforMaden ,
                                ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                         FROM   emp
                                                INNER JOIN Emp_Account ON emp.emp_code = Emp_Account.venderid
                                         WHERE  ( Emp_Account.CurID = @CurID )
                                                AND Emp_Account.movedate < @DateFrom
                                                AND Acc.emp_code BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforDaen ,
                                0 AS SortID
                        FROM    emp Acc
                                INNER JOIN Emp_Account ON emp_code = Emp_Account.venderid
                        WHERE   Acc.emp_code BETWEEN @FromAcc AND @ToAcc 
            --WHERE   ( Emp_Account.Maden > 0
            --          OR Emp_Account.Daen > 0
            --          AND Emp_Account.aDate BETWEEN @DateFrom
            --                                       AND     @DateTo
                    --)
                        GROUP BY Acc.emp_code ,
                                Acc.emp_name ,
                                Acc.SecondName   
                   
            --HAVING  ( Acc.ISmain = 0 )
                        ORDER BY emp_code

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
                                AccountID ,
                                AccountName AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                ISNULL(( SELECT SUM(Bank_Accounts.maden) AS SumMaden
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON id_Bank = Bank_Accounts.venderid
                                         WHERE  Bank_Accounts.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND Bank_Accounts.CurID = @CurID
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumMaden ,
                                ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  Bank_Accounts.movedate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                                AND Bank_Accounts.CurID = @CurID
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND IsStartedBalance = 0
                                       ), 0) AS SumDaen ,
                                ISNULL(( SELECT SUM(Bank_Accounts.maden) AS totalMaden
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  Bank_Accounts.CurID = @CurID
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND Bank_Accounts.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalMaden ,
                                ISNULL(( SELECT SUM(Bank_Accounts.daen) AS totalDaen
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  Bank_Accounts.CurID = @CurID
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND Bank_Accounts.movedate <= @DateTo
                                                AND year = @FinancialYear
                                       ), 0) AS totalDaen ,
                                ISNULL(( SELECT SUM(Bank_Accounts.maden) AS SumMaden
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  ( Bank_Accounts.CurID = @CurID )
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartMaden ,
                                ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  ( Bank_Accounts.CurID = @CurID )
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 1
                                       ), 0) AS StartDaen ,
                                ISNULL(( SELECT SUM(Bank_Accounts.maden) AS SumMaden
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  ( Bank_Accounts.CurID = @CurID )
                                                AND Bank_Accounts.movedate < @DateFrom
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforMaden ,
                                ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                         FROM   BankAccountName
                                                INNER JOIN Bank_Accounts ON BankAccountName.id_Bank = Bank_Accounts.venderid
                                         WHERE  ( Bank_Accounts.CurID = @CurID )
                                                AND Bank_Accounts.movedate < @DateFrom
                                                AND Acc.AccountID BETWEEN @FromAcc AND @ToAcc
                                                AND year = @FinancialYear
                                                AND IsStartedBalance = 0
                                       ), 0) AS BeforDaen ,
                                0 AS SortID
                        FROM    BankAccountName Acc
                                INNER JOIN Bank_Accounts ON id_Bank = Bank_Accounts.venderid
                        WHERE   Acc.id_Bank BETWEEN @FromAcc AND @ToAcc 
            --WHERE   ( Bank_Accounts.Maden > 0
            --          OR Bank_Accounts.Daen > 0
            --          AND Bank_Accounts.aDate BETWEEN @DateFrom
            --                                       AND     @DateTo
                    --)
                        GROUP BY Acc.AccountID ,
                                Acc.AccountName  
							   
                   
            --HAVING  ( Acc.ISmain = 0 )
                        ORDER BY AccountID


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
