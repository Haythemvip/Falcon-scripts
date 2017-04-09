
 

ALTER    PROCEDURE dbo.Acc_All_Levels_Mezan
    @Lang NVARCHAR(2) ,
    @DateFrom DATE ,
    @DateTo DATE ,
    @FinancialYear NVARCHAR(10)
AS
    DELETE  FROM RptTrailbalanceAll



    IF @Lang = 'Ar'
        BEGIN

            INSERT  INTO RptTrailbalanceAll
                    SELECT  ISmain ,
                            AccCode ,
                            AccName ,
                            ACC_Type_ID ,
                            ISNULL(Type_Name, '') AS Type_Name ,
                            ClassificationId ,
                            ISNULL(ClassificationName, '') AS ClassificationName ,
                            AccountGroup_ID ,
                            ISNULL(AccountGroup_Name, '') AS AccountGroup_Name ,
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
                            SortID
                    FROM    View_tblAccTree
                    WHERE   ISmain = 0
                    ORDER BY View_tblAccTree.SortID ,
                            View_tblAccTree.ClassificationId ,
                            View_tblAccTree.ACC_Type_ID ,
                            View_tblAccTree.AccountGroup_ID

        END

    IF @Lang = 'En'
        BEGIN

            INSERT  INTO RptTrailbalanceAll
                    SELECT  ISmain ,
                            AccCode ,
                            AccName_En AS AccName ,
                            ACC_Type_ID ,
                            ISNULL(Type_Name, '') AS Type_Name ,
                            ClassificationId ,
                            ISNULL(ClassificationName, '') AS ClassificationName ,
                            AccountGroup_ID ,
                            ISNULL(AccountGroup_Name, '') AS AccountGroup_Name ,
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
                            SortID
                    FROM    View_tblAccTree
                    WHERE   ISmain = 0
                    ORDER BY View_tblAccTree.SortID ,
                            View_tblAccTree.ClassificationId ,
                            View_tblAccTree.ACC_Type_ID ,
                            View_tblAccTree.AccountGroup_ID

        END
    

  


    UPDATE  RptTrailbalanceAll
    SET     StartMaden = ( SELECT   ISNULL(( SELECT SUM(Maden)
                                             FROM   View_Mezn
                                             WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                                    AND IsStartedBalance = 1
                                                    AND year = @FinancialYear
                                           ), 0)
                         )


    UPDATE  RptTrailbalanceAll
    SET     StartDaen = ( SELECT    ISNULL(( SELECT SUM(Daen)
                                             FROM   View_Mezn
                                             WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                                    AND IsStartedBalance = 1
                                                    AND year = @FinancialYear
                                           ), 0)
                        )





    UPDATE  RptTrailbalanceAll
    SET     BeforMaden = ( SELECT   ISNULL(( SELECT SUM(Maden)
                                             FROM   View_Mezn
                                             WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND year = @FinancialYear
                                           ), 0)
                         )


    UPDATE  RptTrailbalanceAll
    SET     BeforDaen = ( SELECT    ISNULL(( SELECT SUM(Daen)
                                             FROM   View_Mezn
                                             WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                                    AND aDate < @DateFrom
                                                    AND IsStartedBalance = 0
                                                    AND year = @FinancialYear
                                           ), 0)
                        )






    UPDATE  RptTrailbalanceAll
    SET     maden = ( SELECT    ISNULL(( SELECT SUM(Maden)
                                         FROM   View_Mezn
                                         WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                                AND aDate BETWEEN @DateFrom AND @DateTo
                                                AND IsStartedBalance = 0
                                                AND year = @FinancialYear
                                       ), 0)
                    )


    UPDATE  RptTrailbalanceAll
    SET     Daen = ( SELECT ISNULL(( SELECT SUM(Daen)
                                     FROM   View_Mezn
                                     WHERE  View_Mezn.AccID = RptTrailbalanceAll.AccCode
                                            AND aDate BETWEEN @DateFrom AND @DateTo
                                            AND IsStartedBalance = 0
                                            AND year = @FinancialYear
                                   ), 0)
                   )




    UPDATE  RptTrailbalanceAll
    SET     totalMaden = BeforMaden + maden + StartMaden


    UPDATE  RptTrailbalanceAll
    SET     totalDaen = BeforDaen + Daen + StartDaen








    UPDATE  RptTrailbalanceAll
    SET     balanceMaden = ( CASE WHEN ( RptTrailbalanceAll.totalMaden > RptTrailbalanceAll.totalDaen )
                                  THEN ( totalMaden - totalDaen )
                                  ELSE ( 0 )
                             END )


    UPDATE  RptTrailbalanceAll
    SET     BalanceDaen = ( CASE WHEN ( RptTrailbalanceAll.totalMaden < RptTrailbalanceAll.totalDaen )
                                 THEN ( totalDaen - totalMaden )
                                 ELSE ( 0 )
                            END )




    SELECT  *
    FROM    RptTrailbalanceAll
    ORDER BY SortID ,
            ClassificationId ,
            ACC_Type_ID ,
            AccountGroup_ID


			
GO