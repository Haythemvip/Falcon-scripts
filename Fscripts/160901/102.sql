

ALTER PROCEDURE [dbo].[ACC_Monthly]
    @from_Month INT = 1 ,
    @to_Month INT = 12 ,
    @Cur_ID INT ,
    @MainAcc BIGINT ,
    @fromACC BIGINT ,
    @toAcc BIGINT ,
    @Year CHAR(4)
AS
    DECLARE @fromdate DATE;
    DECLARE @todate DATE;

 


    CREATE TABLE #Monthdata
        (
          [id] [INT] NULL ,
          [Month_Name] [NVARCHAR](100) COLLATE Arabic_CI_AI
                                       NULL ,
          [idindix] [BIGINT] NULL ,
          [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_AI
                                    NULL ,
          [FirstMaden] [DECIMAL](18, 2) NULL ,
          [FirstDaen] [DECIMAL](18, 2) NULL ,
          [Maden] [DECIMAL](18, 2) NULL ,
          [Daen] [DECIMAL](18, 2) NULL ,
          [totalMaden] [DECIMAL](18, 2) NULL ,
          [totalDaen] [DECIMAL](18, 2) NULL ,
          [balanceMaden] [DECIMAL](18, 2) NULL ,
          [BalanceDaen] [DECIMAL](18, 2) NULL, 


        );

    CREATE TABLE #names
        (
          [id] [INT] NULL ,
          [Month_Name] [NVARCHAR](100) COLLATE Arabic_CI_AI
                                       NULL ,
        );

    CREATE TABLE #codes
        (
          [AccCode] [BIGINT] NULL ,
          [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_AI
                                    NULL ,
        );


    INSERT  INTO #names
    VALUES  ( 1, 'يناير' );
    INSERT  INTO #names
    VALUES  ( 2, 'فبراير' );
    INSERT  INTO #names
    VALUES  ( 3, 'مارس' );
    INSERT  INTO #names
    VALUES  ( 4, 'ابريل' );
    INSERT  INTO #names
    VALUES  ( 5, 'مايو' );
    INSERT  INTO #names
    VALUES  ( 6, 'يونيو' );
    INSERT  INTO #names
    VALUES  ( 7, 'يوليو' );
    INSERT  INTO #names
    VALUES  ( 8, 'اغسطس' );
    INSERT  INTO #names
    VALUES  ( 9, 'سبتمبر' );
    INSERT  INTO #names
    VALUES  ( 10, 'اكتوبر' );
    INSERT  INTO #names
    VALUES  ( 11, 'نوفمبر' );
    INSERT  INTO #names
    VALUES  ( 12, 'ديسمبر' );


    DELETE  FROM #Monthdata; 

  

            INSERT  INTO #codes
                    SELECT  AccCode ,
                            AccName
                    FROM    tblAccTree
                    WHERE   (AccCode BETWEEN  @fromACC  
					AND  @toAcc)


         


		     INSERT  INTO #Monthdata
                    SELECT  #names.id ,
                            #names.Month_Name ,
                            #codes.AccCode ,
                            #codes.AccName ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0 ,
                            0
                    FROM    #names ,
                            #codes;




    SET @fromdate = ''+@Year+'-01-01';
    SET @todate = ''+@Year+'-01-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(ISNULL(SUM(Daen), 0.00), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 1;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(ISNULL(SUM(Maden), 0.00), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 1;





    SET @fromdate = ''+@Year+'-02-01';
    SET @todate = ''+@Year+'-02-28';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 2;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 2;

    SET @fromdate = ''+@Year+'-03-01';
    SET @todate = ''+@Year+'-03-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 3;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 3;


    SET @fromdate = ''+@Year+'-04-01';
    SET @todate = ''+@Year+'-04-30';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 4;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 4;


    SET @fromdate = ''+@Year+'-05-01';
    SET @todate = ''+@Year+'-05-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 5;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 5;


    SET @fromdate = ''+@Year+'-06-01';
    SET @todate = ''+@Year+'-06-30';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 6;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 6;


    SET @fromdate = ''+@Year+'-07-01';
    SET @todate = ''+@Year+'-07-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 7;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 7;


    SET @fromdate = ''+@Year+'-08-01';
    SET @todate = ''+@Year+'-08-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 8;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 8;


    SET @fromdate = ''+@Year+'-09-01';
    SET @todate = ''+@Year+'-09-30';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 9;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 9;


    SET @fromdate = ''+@Year+'-10-01';
    SET @todate = ''+@Year+'-10-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 10;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 10;


    SET @fromdate = ''+@Year+'-11-01';
    SET @todate = ''+@Year+'-11-30';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 11;



    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 11;


    SET @fromdate = ''+@Year+'-12-01';
    SET @todate = ''+@Year+'-12-31';


    UPDATE  #Monthdata
    SET     FirstDaen = ( SELECT    ISNULL(SUM(Daen), 0.00)
                          FROM      El_Koyod_El_Yawmia
                          WHERE     CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                        )
    WHERE   #Monthdata.id = 12;
    UPDATE  #Monthdata
    SET     FirstMaden = ( SELECT   ISNULL(SUM(Maden), 0.00)
                           FROM     El_Koyod_El_Yawmia
                           WHERE    CurID = @Cur_ID
                                    AND AccID = #Monthdata.idindix
                                    AND aDate < @fromdate
                         )
    WHERE   #Monthdata.id = 12;



--==============================================


    SET @fromdate = ''+@Year+'-01-01';
    SET @todate = ''+@Year+'-01-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(ISNULL(SUM(Daen), 0.00), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 1;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(ISNULL(SUM(Maden), 0.00), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 1;





    SET @fromdate = ''+@Year+'-02-01';
    SET @todate = ''+@Year+'-02-28';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 2;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 2;

    SET @fromdate = ''+@Year+'-03-01';
    SET @todate = ''+@Year+'-03-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 3;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 3;


    SET @fromdate = ''+@Year+'-04-01';
    SET @todate = ''+@Year+'-04-30';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 4;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 4;


    SET @fromdate = ''+@Year+'-05-01';
    SET @todate = ''+@Year+'-05-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 5;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 5;


    SET @fromdate = ''+@Year+'-06-01';
    SET @todate = ''+@Year+'-06-30';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 6;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 6;


    SET @fromdate = ''+@Year+'-07-01';
    SET @todate = ''+@Year+'-07-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 7;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 7;


    SET @fromdate = ''+@Year+'-08-01';
    SET @todate = ''+@Year+'-08-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 8;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 8;


    SET @fromdate = ''+@Year+'-09-01';
    SET @todate = ''+@Year+'-09-30';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 9;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 9;


    SET @fromdate = ''+@Year+'-10-01';
    SET @todate = ''+@Year+'-10-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 10;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 10;


    SET @fromdate = ''+@Year+'-11-01';
    SET @todate = ''+@Year+'-11-30';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 11;



    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 11;


    SET @fromdate = ''+@Year+'-12-01';
    SET @todate = ''+@Year+'-12-31';


    UPDATE  #Monthdata
    SET     Daen = ( SELECT ISNULL(SUM(Daen), 0.00)
                     FROM   El_Koyod_El_Yawmia
                     WHERE  CurID = @Cur_ID
                            AND AccID = #Monthdata.idindix
                            AND aDate BETWEEN @fromdate AND @todate
                   )
    WHERE   #Monthdata.id = 12;
    UPDATE  #Monthdata
    SET     Maden = ( SELECT    ISNULL(SUM(Maden), 0.00)
                      FROM      El_Koyod_El_Yawmia
                      WHERE     CurID = @Cur_ID
                                AND AccID = #Monthdata.idindix
                                AND aDate BETWEEN @fromdate AND @todate
                    )
    WHERE   #Monthdata.id = 12;




    SET @fromdate = ''+@Year+'-01-01';
    SET @todate = ''+@Year+'-01-31';


    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 1;

    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 2;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 3;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 4;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 5;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 6;

    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 7;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 8;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 9;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 10;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 11;
    UPDATE  #Monthdata
    SET     totalDaen = #Monthdata.Daen + #Monthdata.FirstDaen
    WHERE   #Monthdata.id = 12;


    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 1;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 2;


    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 3;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 4;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 5;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 6;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 7;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 8;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 9;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 10;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 11;

    UPDATE  #Monthdata
    SET     totalMaden = #Monthdata.Maden + #Monthdata.FirstMaden
    WHERE   #Monthdata.id = 12;




    SELECT  *
    FROM    #Monthdata
    ORDER BY idindix ,
            id;




