
 
ALTER    PROCEDURE [dbo].[Acc_All_Levels_Mezan]
    @Lang NVARCHAR(2) ,
    @DateFrom DATE ,
    @DateTo DATE ,
    @FinancialYear NVARCHAR(10) ,
    @CostID BIGINT = 0 ,
    @CostGroupID BIGINT = 0
AS
    DELETE  FROM RptTrailbalanceAll;



    IF @Lang = 'Ar'
        BEGIN

            INSERT  INTO RptTrailbalanceAll
                    SELECT  ISmain ,
                            AccCode ,
                            AccName ,
                            0 AS ACC_Type_ID ,
                           0 AS Type_Name ,
                            0 AS ClassificationId ,
                            0 AS ClassificationName ,
                            0 AS AccountGroup_ID ,
                            0 AS AccountGroup_Name ,
                            0.00 AS 'balanceMaden' ,
                            0.00 AS 'BalanceDaen' ,
                            0.00 AS 'StartMaden' ,
                            0.00 AS 'StartDaen' ,
                            0.00 AS 'BeforMaden' ,
                            0.00 AS 'BeforDaen' ,
                            0.00 AS 'maden' ,
                            0.00 AS 'Daen' ,
                            0.00 AS 'totalMaden' ,
                            0.00 AS 'totalDaen' ,
                            SortID ,
                            N1 ,
                            N2 ,
                            N3 ,
                            N4 ,
                            N5 ,
                            N6 ,
                            N7 ,
                            N8 ,
                            N9 ,
                            N10
                    FROM    View_tblAccTree
                    WHERE   ISmain = 0
                    ORDER BY View_tblAccTree.SortID; 
                           

        END;

    IF @Lang = 'En'
        BEGIN

            INSERT  INTO RptTrailbalanceAll
                    SELECT  ISmain ,
                            AccCode ,
                            AccName_En AS AccName ,
                            0 AS ACC_Type_ID ,
                            0 AS Type_Name ,
                            0 AS ClassificationId ,
                            0 AS ClassificationName ,
                            0 AS AccountGroup_ID ,
                            0 AS AccountGroup_Name ,
                            0.00 AS 'balanceMaden' ,
                            0.00 AS 'BalanceDaen' ,
                            0.00 AS 'StartMaden' ,
                            0.00 AS 'StartDaen' ,
                            0.00 AS 'BeforMaden' ,
                            0.00 AS 'BeforDaen' ,
                            0.00 AS 'maden' ,
                            0.00 AS 'Daen' ,
                            0.00 AS 'totalMaden' ,
                            0.00 AS 'totalDaen' ,
                            SortID ,
                            N1 ,
                            N2 ,
                            N3 ,
                            N4 ,
                            N5 ,
                            N6 ,
                            N7 ,
                            N8 ,
                            N9 ,
                            N10
                    FROM    View_tblAccTree
                    WHERE   ISmain = 0
                    ORDER BY View_tblAccTree.SortID; 

        END;
    

  


    UPDATE  RptTrailbalanceAll
    SET     StartMaden = ( SELECT   ISNULL(( SELECT SUM(Maden)
                                             FROM   dbo.El_Koyod_El_Yawmia
                                             WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                                    AND IsStartedBalance = 1
                                                    AND year = @FinancialYear
                                                    AND ( @CostID = 0
                                                          OR costid = @CostID
                                                        )
                                                    AND ( @CostGroupID = 0
                                                          OR costid IN (
                                                          SELECT
                                                              AccCode
                                                          FROM
                                                              dbo.TblCostTree
                                                          WHERE
                                                              ClassificationId = @CostGroupID )
                                                        )
                                           ), 0)
                         );


    UPDATE  RptTrailbalanceAll
    SET     StartDaen = ( SELECT    ISNULL(( SELECT SUM(Daen)
                                             FROM   El_Koyod_El_Yawmia
                                             WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                                    AND IsStartedBalance = 1
                                                    AND year = @FinancialYear
                                                    AND ( @CostID = 0
                                                          OR costid = @CostID
                                                        )
                                                    AND ( @CostGroupID = 0
                                                          OR costid IN (
                                                          SELECT
                                                              AccCode
                                                          FROM
                                                              dbo.TblCostTree
                                                          WHERE
                                                              ClassificationId = @CostGroupID )
                                                        )
                                           ), 0)
                        );





    UPDATE  RptTrailbalanceAll
    SET     BeforMaden = ( SELECT   ISNULL(( SELECT SUM(Maden)
                                             FROM   El_Koyod_El_Yawmia
                                             WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND year = @FinancialYear
                                                    AND ( @CostID = 0
                                                          OR costid = @CostID
                                                        )
                                                    AND ( @CostGroupID = 0
                                                          OR costid IN (
                                                          SELECT
                                                              AccCode
                                                          FROM
                                                              dbo.TblCostTree
                                                          WHERE
                                                              ClassificationId = @CostGroupID )
                                                        )
                                           ), 0)
                         );


    UPDATE  RptTrailbalanceAll
    SET     BeforDaen = ( SELECT    ISNULL(( SELECT SUM(Daen)
                                             FROM   El_Koyod_El_Yawmia
                                             WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND year = @FinancialYear
                                                    AND ( @CostID = 0
                                                          OR costid = @CostID
                                                        )
                                                    AND ( @CostGroupID = 0
                                                          OR costid IN (
                                                          SELECT
                                                              AccCode
                                                          FROM
                                                              dbo.TblCostTree
                                                          WHERE
                                                              ClassificationId = @CostGroupID )
                                                        )
                                           ), 0)
                        );






    UPDATE  RptTrailbalanceAll
    SET     maden = ( SELECT    ISNULL(( SELECT SUM(Maden)
                                         FROM   El_Koyod_El_Yawmia
                                         WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND IsStartedBalance = 0
                                                AND year = @FinancialYear
                                                AND ( @CostID = 0
                                                      OR costid = @CostID
                                                    )
                                                AND ( @CostGroupID = 0
                                                      OR costid IN (
                                                      SELECT  AccCode
                                                      FROM    dbo.TblCostTree
                                                      WHERE   ClassificationId = @CostGroupID )
                                                    )
                                       ), 0)
                    );


    UPDATE  RptTrailbalanceAll
    SET     Daen = ( SELECT ISNULL(( SELECT SUM(Daen)
                                     FROM   El_Koyod_El_Yawmia
                                     WHERE  El_Koyod_El_Yawmia.AccID = RptTrailbalanceAll.AccCode
                                            AND aDate BETWEEN @DateFrom AND @DateTo
                                            AND IsStartedBalance = 0
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
                                   ), 0)
                   );




    UPDATE  RptTrailbalanceAll
    SET     totalMaden = BeforMaden + maden + StartMaden;


    UPDATE  RptTrailbalanceAll
    SET     totalDaen = BeforDaen + Daen + StartDaen;








    UPDATE  RptTrailbalanceAll
    SET     balanceMaden = ( CASE WHEN ( RptTrailbalanceAll.totalMaden > RptTrailbalanceAll.totalDaen )
                                  THEN ( totalMaden - totalDaen )
                                  ELSE ( 0 )
                             END );


    UPDATE  RptTrailbalanceAll
    SET     BalanceDaen = ( CASE WHEN ( RptTrailbalanceAll.totalMaden < RptTrailbalanceAll.totalDaen )
                                 THEN ( totalDaen - totalMaden )
                                 ELSE ( 0 )
                            END );




    SELECT  *
    FROM    RptTrailbalanceAll
    ORDER BY SortID ,
            ClassificationId ,
            ACC_Type_ID ,
            AccountGroup_ID;


			