 

ALTER PROCEDURE [dbo].[Acc_Mezan]
    @fromdate DATE ,
    @todate DATE ,
    @curranceid INT ,
    @Lang CHAR(2) ,
    @zero INT ,
    @CaseSubAccID INT = 0,
	@FinancialYear NVARCHAR(50) 

AS
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




    IF @CaseSubAccID = 0
        BEGIN 
            INSERT  INTO #Render
                    SELECT  ISmain ,
                            Acc.AccCode ,
                            ( CASE WHEN ( @Lang = 'AR' ) THEN ( Acc.AccName )
                                   ELSE ( Acc.AccName_En )
                              END ) AS AccName ,
                            0.00 AS 'balanceMaden' ,
                            0.00 AS 'BalanceDaen' ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  El_Koyod_El_Yawmia.aDate BETWEEN @fromdate
                                                              AND
                                                              @todate
                                            AND El_Koyod_El_Yawmia.CurID = @curranceid
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND IsStartedBalance = 0
                                   ), 0) AS SumMaden ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumDaen
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  El_Koyod_El_Yawmia.aDate BETWEEN @fromdate
                                                              AND
                                                              @todate
                                            AND El_Koyod_El_Yawmia.CurID = @curranceid
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND IsStartedBalance = 0
                                   ), 0) AS SumDaen ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS totalMaden
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  El_Koyod_El_Yawmia.CurID = @curranceid
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
                                            AND El_Koyod_El_Yawmia.aDate <= @todate
											AND year = @FinancialYear
											
                                   ), 0) AS totalMaden ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS totalDaen
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  El_Koyod_El_Yawmia.CurID = @curranceid
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
                                            AND El_Koyod_El_Yawmia.aDate <= @todate
											AND year = @FinancialYear
                                   ), 0) AS totalDaen ,
                           ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                            
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND year = @FinancialYear
											AND IsStartedBalance = 1
                                   ), 0)AS StartMaden ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumMaden
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                          
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND year = @FinancialYear
											AND IsStartedBalance = 1
                                   ), 0) AS StartDaen ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                            AND El_Koyod_El_Yawmia.aDate < @fromdate
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND year = @FinancialYear
											AND IsStartedBalance = 0
                                   ), 0) AS BeforMaden ,
                            ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumDaen
                                     FROM   TblAccTreeAZ
                                            INNER JOIN El_Koyod_El_Yawmia ON TblAccTreeAZ.AccCode = El_Koyod_El_Yawmia.AccID
                                     WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                            AND El_Koyod_El_Yawmia.aDate < @fromdate
                                            AND Acc.AccCode = TblAccTreeAZ.AccCode
											AND year = @FinancialYear
											AND IsStartedBalance = 0
                                   ), 0) AS BeforDaen ,
                            SortID
                    FROM    TblAccTreeAZ Acc
                            INNER JOIN El_Koyod_El_Yawmia ON Acc.AccCode = El_Koyod_El_Yawmia.AccID
            --WHERE   ( El_Koyod_El_Yawmia.Maden > 0
            --          OR El_Koyod_El_Yawmia.Daen > 0
            --          AND El_Koyod_El_Yawmia.aDate BETWEEN @fromdate
            --                                       AND     @todate
                    --)
                    GROUP BY Acc.AccCode ,
                            Acc.AccName ,
                            Acc.ISmain ,
                            Acc.AccName_En ,
                            Acc.SortID
            --HAVING  ( Acc.ISmain = 0 )
                    ORDER BY SortID
        END 


-- العملاء 
    IF @CaseSubAccID = 1
        BEGIN 
 

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
                                     WHERE  customer_account.movedate BETWEEN @fromdate
                                                              AND
                                                              @todate
                                            AND customer_account.CurID = @curranceid
                                            AND Acc.Customer_id = customers.Customer_id
											AND IsStartedBalance = 0
                                   ), 0) AS SumMaden ,
                            ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  customer_account.movedate BETWEEN @fromdate
                                                              AND
                                                              @todate
                                            AND customer_account.CurID = @curranceid
                                            AND Acc.Customer_id = customers.Customer_id
											AND IsStartedBalance = 0
                                   ), 0) AS SumDaen ,
                            ISNULL(( SELECT SUM(customer_account.maden) AS totalMaden
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  customer_account.CurID = @curranceid
                                            AND Acc.Customer_id = customers.Customer_id
                                            AND customer_account.movedate <= @todate
											AND year = @FinancialYear
                                   ), 0) AS totalMaden ,
                            ISNULL(( SELECT SUM(customer_account.daen) AS totalDaen
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  customer_account.CurID = @curranceid
                                            AND Acc.Customer_id = customers.Customer_id
                                            AND customer_account.movedate <= @todate
											AND year = @FinancialYear
                                   ), 0) AS totalDaen ,
                             ISNULL(( SELECT SUM(customer_account.maden) AS SumMaden
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  ( customer_account.CurID = @curranceid )
                                            
                                            AND Acc.Customer_id = customers.Customer_id
											AND year = @FinancialYear
											AND IsStartedBalance = 1

                                   ), 0) AS StartMaden ,
                              ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  ( customer_account.CurID = @curranceid )
                                            
                                            AND Acc.Customer_id = customers.Customer_id
											AND year = @FinancialYear
											AND IsStartedBalance = 1
                                   ), 0)  AS StartDaen ,
                            ISNULL(( SELECT SUM(customer_account.maden) AS SumMaden
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  ( customer_account.CurID = @curranceid )
                                            AND customer_account.movedate < @fromdate
                                            AND Acc.Customer_id = customers.Customer_id
											AND year = @FinancialYear
											AND IsStartedBalance = 0

                                   ), 0) AS BeforMaden ,
                            ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                     FROM   customers
                                            INNER JOIN customer_account ON customers.Customer_id = customer_account.venderid
                                     WHERE  ( customer_account.CurID = @curranceid )
                                            AND customer_account.movedate < @fromdate
                                            AND Acc.Customer_id = customers.Customer_id
											AND year = @FinancialYear
											AND IsStartedBalance = 0
                                   ), 0) AS BeforDaen ,
                            0 AS SortID
                    FROM    customers Acc
                            INNER JOIN customer_account ON Customer_id = customer_account.venderid
            --WHERE   ( customer_account.Maden > 0
            --          OR customer_account.Daen > 0
            --          AND customer_account.aDate BETWEEN @fromdate
            --                                       AND     @todate
                    --)
                    GROUP BY Acc.Customer_id ,
                            Acc.customer_name ,
                            Acc.Customer_Name_EN  
                   
            --HAVING  ( Acc.ISmain = 0 )
                    ORDER BY Customer_id


        END
 


 -- الموردين 
    IF @CaseSubAccID = 2
        BEGIN 
          
		    SELECT  0 AS 'ddd'

        END


	 -- الموظفين 
    IF @CaseSubAccID = 3
        BEGIN 
            SELECT  0 AS 'ddd'
        END
 	   

 -- البنوك 
    IF @CaseSubAccID = 4
        BEGIN 
            SELECT  0 AS 'ddd'
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
            ORDER BY SortID
        END
	 
    IF @zero = 0
        BEGIN

            SELECT  *
            FROM    #Render
            WHERE   #Render.balanceMaden <> #Render.BalanceDaen
            ORDER BY SortID
        END

	 

    DELETE  FROM RptTrailbalanceFromTo


    IF @zero = 1
        BEGIN

            INSERT  INTO RptTrailbalanceFromTo
                    SELECT  *
                    FROM    #Render
                    ORDER BY SortID
        END
	 
    IF @zero = 0
        BEGIN
            INSERT  INTO RptTrailbalanceFromTo
                    SELECT  *
                    FROM    #Render
                    ORDER BY SortID

        END







