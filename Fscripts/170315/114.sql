

ALTER PROCEDURE [dbo].[Acc_All_Levels]
    @DateFrom DATE ,
    @DateTo DATE
AS
    CREATE TABLE #Render
        (
          [ISmain] BIT ,
          [AccCode] [BIGINT] NULL ,
          [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai
                                    NULL ,
          [MezanyaID] [BIGINT] NULL ,
          [Mezanya_Name] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai ,
          [ACC_Type_ID] [BIGINT] NULL ,
          [Type_Name] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai ,
          [ClassificationName] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai ,
          [AccountGroup_Name] [NVARCHAR](MAX) COLLATE Arabic_CI_Ai ,
          [balanceMaden] [DECIMAL](18, 2) NOT NULL ,
          [BalanceDaen] [DECIMAL](18, 2) NOT NULL ,
          [StartMaden] [DECIMAL](38, 2) NOT NULL ,
          [StartDaen] [DECIMAL](38, 2) NOT NULL ,
          [BeforMaden] [DECIMAL](38, 2) NOT NULL ,
          [BeforDaen] [DECIMAL](38, 2) NOT NULL ,
          [maden] [DECIMAL](38, 2) NOT NULL ,
          [Daen] [DECIMAL](38, 2) NOT NULL ,
          [totalMaden] [DECIMAL](38, 2) NOT NULL ,
          [totalDaen] [DECIMAL](38, 2) NOT NULL ,
         
        
        )
    ON  [PRIMARY]


    BEGIN
        INSERT  INTO #Render
                SELECT  ISmain ,
                        AccCode ,
                        AccName ,
                        MezanyaID ,
                      0 AS  Mezanya_Name ,
                       0 AS  ACC_Type_ID ,
                       0 AS Type_Name ,
                      0 AS  ClassificationName ,
                      0 AS  AccountGroup_Name ,
                        0.00 AS 'balanceMaden' ,
                        0.00 AS 'BalanceDaen' ,
                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                               ), 0) AS 'StartMaden' ,
                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 1
                               ), 0) AS 'StartDaen' ,
                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                               ), 0) AS 'BeforMaden' ,
                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate < @DateFrom
                               ), 0) AS 'BeforDaen' ,
                       
                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                               ), 0) AS maden ,

                        ISNULL(( SELECT SUM(Daen)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        AND View_Mezn.IsStartedBalance = 0
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                                        AND View_Mezn.aDate BETWEEN @DateFrom AND @DateTo
                                        AND View_Mezn.IsStartedBalance = 0
                               ), 0) AS Daen ,

                        ISNULL(( SELECT SUM(Maden)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                               ), 0) AS totalMaden ,

                        ISNULL(( SELECT SUM(Daen)
                                 FROM   View_Mezn
                                 WHERE  View_Mezn.AccID = View_tblAccTree.AccCode
                                        OR View_Mezn.F1 = View_tblAccTree.AccCode
                                        OR View_Mezn.F2 = View_tblAccTree.AccCode
                                        OR View_Mezn.F3 = View_tblAccTree.AccCode
                                        OR View_Mezn.F4 = View_tblAccTree.AccCode
                                        OR View_Mezn.F5 = View_tblAccTree.AccCode
                                        OR View_Mezn.F6 = View_tblAccTree.AccCode
                                        OR View_Mezn.F7 = View_tblAccTree.AccCode
                                        OR View_Mezn.F8 = View_tblAccTree.AccCode
                                        OR View_Mezn.F9 = View_tblAccTree.AccCode
                                        OR View_Mezn.F10 = View_tblAccTree.AccCode
                               ), 0) AS totalDaen



                FROM    View_tblAccTree
       
	            where ISmain = 0

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



SELECT * FROM #Render


    END


