 


ALTER PROCEDURE [dbo].[Acc_All_mezan]
    @DateFrom DATE ,
    @DateTo DATE ,
    @zero INT
AS
    CREATE TABLE #Mezan
        (
          [AccCode] [BIGINT] NULL ,
          [AccName] [VARCHAR](150) COLLATE Arabic_CI_AS
                                   NOT NULL ,
          [MezanyaID] [INT] NULL ,
          [Mezanya_Name] [VARCHAR](50) COLLATE Arabic_CI_AS
                                       NULL ,
          [ACC_Type_ID] [INT] NULL ,
          [Type_Name] [VARCHAR](50) COLLATE Arabic_CI_AS
                                    NULL ,
          [ClassificationName] [NVARCHAR](50) COLLATE Arabic_CI_AS
                                              NULL ,
          [balanceMaden] [NUMERIC](2, 2) NOT NULL ,
          [BalanceDaen] [NUMERIC](2, 2) NOT NULL ,
          [SumMaden] [DECIMAL](38, 2) NULL ,
          [SumDaen] [DECIMAL](38, 2) NULL ,
          [totalMaden] [DECIMAL](38, 2) NULL ,
          [totalDaen] [DECIMAL](38, 2) NULL ,
          [StartMaden] [DECIMAL](38, 2) NULL ,
          [StartDaen] [DECIMAL](38, 2) NULL ,
          [BeforMaden] [DECIMAL](38, 2) NULL ,
          [BeforDaen] [DECIMAL](38, 2) NULL ,
          [ISmain] BIT ,
          [SortID] BIGINT
        )
    ON  [PRIMARY]


    INSERT  INTO #Mezan
            SELECT  AccCode ,
                    AccName ,
                    MezanyaID ,
                   0    AS Mezanya_Name ,
                   0 AS ACC_Type_ID ,
                   0 AS Type_Name ,
                   0 AS ClassificationName ,
                    0.00 AS 'balanceMaden' ,
                    0.00 AS 'BalanceDaen' ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    0.00 ,
                    ISmain ,
                    SortID
            FROM    View_tblAccTree
			where ISmain = 0
            ORDER BY View_tblAccTree.SortID


    UPDATE  [#Mezan]
    SET     SumMaden = ( SELECT ISNULL(SUM(View_Mezn.Maden), 0.00)
                         FROM   View_Mezn
                         WHERE  [#Mezan].AccCode IN ( SELECT  F1
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F1 IS NOT NULL AND F1 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F2
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F2 IS NOT NULL AND F2 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F3
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F3 IS NOT NULL AND F3 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F4
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F4 IS NOT NULL AND F4 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F5
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F5 IS NOT NULL AND F5 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F6
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F6 IS NOT NULL AND F6 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F7
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F7 IS NOT NULL AND F7 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F8
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F8 IS NOT NULL AND F8 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F9
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F9 IS NOT NULL AND F9 = [#Mezan].AccCode
                                                      UNION
                                                      SELECT  F10
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F10 IS NOT NULL AND F10 = [#Mezan].AccCode) 
                                AND ( View_Mezn.aDate BETWEEN @DateFrom AND @DateTo )
                                AND View_Mezn.IsStartedBalance = 0
                       ) 
                      
                                                         
    UPDATE  [#Mezan]
    SET     SumDaen = ( SELECT  ISNULL(SUM(View_Mezn.Daen), 0.00)
                        FROM    View_Mezn
                        WHERE   [#Mezan].AccCode IN ( SELECT  F1
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F1 IS NOT NULL
                                                      UNION
                                                      SELECT  F2
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F2 IS NOT NULL
                                                      UNION
                                                      SELECT  F3
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F3 IS NOT NULL
                                                      UNION
                                                      SELECT  F4
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F4 IS NOT NULL
                                                      UNION
                                                      SELECT  F5
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F5 IS NOT NULL
                                                      UNION
                                                      SELECT  F6
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F6 IS NOT NULL
                                                      UNION
                                                      SELECT  F7
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F7 IS NOT NULL
                                                      UNION
                                                      SELECT  F8
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F8 IS NOT NULL
                                                      UNION
                                                      SELECT  F9
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F9 IS NOT NULL
                                                      UNION
                                                      SELECT  F10
                                                      FROM    dbo.View_Mezn
                                                      WHERE   F10 IS NOT NULL )
                                AND ( View_Mezn.aDate BETWEEN @DateFrom AND @DateTo )
                                AND View_Mezn.IsStartedBalance = 0
                      )
                      

         
        
    UPDATE  [#Mezan]
    SET     StartMaden = ( SELECT   ISNULL(SUM(View_Mezn.Maden), 0.00)
                           FROM     View_Mezn
                           WHERE    [#Mezan].AccCode IN ( SELECT
                                                              F1
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F1 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F2
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F2 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F3
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F3 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F4
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F4 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F5
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F5 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F6
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F6 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F7
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F7 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F8
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F8 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F9
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F9 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F10
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F10 IS NOT NULL )
                                    AND View_Mezn.IsStartedBalance = 1
                         )
                          

								
								
								              



    UPDATE  [#Mezan]
    SET     StartDaen = ( SELECT    ISNULL(SUM(View_Mezn.Daen), 0.00)
                          FROM      View_Mezn
                          WHERE     [#Mezan].AccCode IN ( SELECT
                                                              F1
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F1 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F2
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F2 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F3
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F3 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F4
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F4 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F5
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F5 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F6
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F6 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F7
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F7 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F8
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F8 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F9
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F9 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F10
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F10 IS NOT NULL )
                        ) 

         

    UPDATE  [#Mezan]
    SET     BeforMaden = ( SELECT   ISNULL(SUM(View_Mezn.Maden), 0.00)
                           FROM     View_Mezn
                           WHERE    [#Mezan].AccCode IN ( SELECT
                                                              F1
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F1 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F2
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F2 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F3
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F3 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F4
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F4 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F5
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F5 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F6
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F6 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F7
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F7 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F8
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F8 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F9
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F9 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F10
                                                          FROM
                                                              dbo.View_Mezn
                                                          WHERE
                                                              F10 IS NOT NULL )
                         )
								
								

    UPDATE  [#Mezan]
    SET     BeforDaen = ( SELECT    ISNULL(SUM(View_Mezn.Daen), 0.00)
                          FROM      View_Mezn
                          WHERE     [#Mezan].AccCode IN ( SELECT
                                                              F1
                                                          WHERE
                                                              F1 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F2
                                                          WHERE
                                                              F2 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F3
                                                          WHERE
                                                              F3 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F4
                                                          WHERE
                                                              F4 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F5
                                                          WHERE
                                                              F5 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F6
                                                          WHERE
                                                              F6 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F7
                                                          WHERE
                                                              F7 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F8
                                                          WHERE
                                                              F8 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F9
                                                          WHERE
                                                              F9 IS NOT NULL
                                                          UNION
                                                          SELECT
                                                              F10
                                                          WHERE
                                                              F10 IS NOT NULL )
                                    AND View_Mezn.aDate < @DateFrom
                                    AND View_Mezn.IsStartedBalance = 0
                        ) 



    UPDATE  [#Mezan]
    SET     totalDaen = ISNULL(#Mezan.SumDaen, 0.00) + ISNULL(#Mezan.BeforDaen,
                                                              0.00)
            + ISNULL(#Mezan.StartDaen, 0.00)
                             


    UPDATE  [#Mezan]
    SET     totalMaden = ISNULL(#Mezan.SumMaden, 0.00)
            + ISNULL(#Mezan.BeforMaden, 0.00) + ISNULL(#Mezan.StartMaden, 0.00)
                             


         
    IF @zero = 0
        BEGIN

            SELECT  *
            FROM    #Mezan
            
            
        END


    IF @zero = 1
        BEGIN

            SELECT  *
            FROM    #Mezan
            
        END    

 


