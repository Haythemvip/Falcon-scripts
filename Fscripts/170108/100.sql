 

ALTER PROCEDURE [dbo].[Acc_Mezan]
    @fromdate DATE ,
    @todate DATE ,
    @curranceid INT ,
    @Lang CHAR(2) ,
    @zero INT ,
    @FinancialYear NVARCHAR(50) ,
    @CostID BIGINT = 0 ,
    @CostGroupID BIGINT = 0,
	@MezanyaID INT = 0

AS
    CREATE TABLE #Render
        (
          [ISmain] BIT ,
          [AccCode] [BIGINT] NULL ,
          [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_AI
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
    ON  [PRIMARY];


    
    INSERT  INTO #Render
            SELECT  ISmain ,
                    Acc.AccCode ,
                    ( CASE WHEN ( @Lang = 'AR' ) THEN ( Acc.AccName )
                           ELSE ( Acc.AccName_En )
                      END ) AS AccName ,
                    0.00 AS 'balanceMaden' ,
                    0.00 AS 'BalanceDaen' ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  El_Koyod_El_Yawmia.aDate BETWEEN @fromdate
                                                             AND
                                                              @todate
                                    AND El_Koyod_El_Yawmia.CurID = @curranceid
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND IsStartedBalance = 0
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS SumMaden ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumDaen
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  El_Koyod_El_Yawmia.aDate BETWEEN @fromdate
                                                             AND
                                                              @todate
                                    AND El_Koyod_El_Yawmia.CurID = @curranceid
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND IsStartedBalance = 0
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS SumDaen ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS totalMaden
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  El_Koyod_El_Yawmia.CurID = @curranceid
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND El_Koyod_El_Yawmia.aDate <= @todate
                                    AND year = @FinancialYear
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS totalMaden ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS totalDaen
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  El_Koyod_El_Yawmia.CurID = @curranceid
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND El_Koyod_El_Yawmia.aDate <= @todate
                                    AND year = @FinancialYear
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                          )
										  AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS totalDaen ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND year = @FinancialYear
                                    AND IsStartedBalance = 1
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS StartMaden ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumMaden
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND year = @FinancialYear
                                    AND IsStartedBalance = 1
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS StartDaen ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Maden) AS SumMaden
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                    AND El_Koyod_El_Yawmia.aDate < @fromdate
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND year = @FinancialYear
                                    AND IsStartedBalance = 0
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS BeforMaden ,
                    ISNULL(( SELECT SUM(El_Koyod_El_Yawmia.Daen) AS SumDaen
                             FROM   TblAccTree
                                    INNER JOIN El_Koyod_El_Yawmia ON TblAccTree.AccCode = El_Koyod_El_Yawmia.AccID
                             WHERE  ( El_Koyod_El_Yawmia.CurID = @curranceid )
                                    AND El_Koyod_El_Yawmia.aDate < @fromdate
                                    AND Acc.AccCode = TblAccTree.AccCode
                                    AND year = @FinancialYear
                                    AND IsStartedBalance = 0
                                    AND ( @CostID = 0
                                          OR costid = @CostID
                                        )
                                    AND ( @CostGroupID = 0
                                          OR costid IN (
                                          SELECT    AccCode
                                          FROM      dbo.TblCostTree
                                          WHERE     ClassificationId = @CostGroupID )
                                        )
										AND (@MezanyaID = 0 OR MezanyaID = @MezanyaID)
                           ), 0) AS BeforDaen ,
                    SortID
            FROM    TblAccTree Acc
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
            HAVING  ( Acc.ISmain = 0 )
            ORDER BY SortID;
      


 


    UPDATE  #Render
    SET     balanceMaden = ( CASE WHEN ( #Render.totalMaden > #Render.totalDaen )
                                  THEN ( totalMaden - totalDaen )
                                  ELSE ( 0 )
                             END );


    UPDATE  #Render
    SET     BalanceDaen = ( CASE WHEN ( #Render.totalMaden < #Render.totalDaen )
                                 THEN ( totalDaen - totalMaden )
                                 ELSE ( 0 )
                            END );



    IF @zero = 1
        BEGIN

            SELECT  *
            FROM    #Render
            ORDER BY SortID ,
                    AccCode; 
        END;
	 
    IF @zero = 0
        BEGIN

            SELECT  *
            FROM    #Render
            WHERE   #Render.balanceMaden <> #Render.BalanceDaen
            ORDER BY SortID ,
                    AccCode;
        END;

	 

    DELETE  FROM RptTrailbalanceFromTo;


    IF @zero = 1
        BEGIN

            INSERT  INTO RptTrailbalanceFromTo
                    SELECT  *
                    FROM    #Render
                    ORDER BY SortID ,
                            AccCode;
        END;
	 
    IF @zero = 0
        BEGIN
            INSERT  INTO RptTrailbalanceFromTo
                    SELECT  *
                    FROM    #Render
                    ORDER BY SortID ,
                            AccCode;

        END;







