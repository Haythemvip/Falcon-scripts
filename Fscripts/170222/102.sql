 
ALTER PROCEDURE [dbo].[Accont_Details]
    @Main INT = 0 ,
    @DateFrom DATE ,
    @DateTo DATE ,
    @MainCode BIGINT = 0 ,
    @FROMaCC BIGINT = 0 ,
    @TOaCC BIGINT = 0 ,
    @CurID INT = 1 ,
    @year INT = 0 ,
    @ProjectCode AS dbo.MyCostParam READONLY
AS
    CREATE TABLE #Result
        (
          aDate DATE NULL ,
          idindix BIGINT NULL ,
          KaidID BIGINT NULL ,
          AccName NVARCHAR(350) COLLATE Arabic_CI_AI
                                NULL ,
          Maden FLOAT NULL ,
          Daen FLOAT NULL ,
          raseed FLOAT NULL ,
          Detis NVARCHAR(500) COLLATE Arabic_CI_AI
                              NULL ,
          OstazName NVARCHAR(50) COLLATE Arabic_CI_AI
                                 NULL ,
          costname NVARCHAR(MAX) COLLATE Arabic_CI_AI
                                 NULL ,
          CostTypeName NVARCHAR(50) COLLATE Arabic_CI_AI
                                    NULL ,
          AccID BIGINT NULL ,
          DocJorrnal VARCHAR(50) NULL ,
          OstasName VARCHAR(50) COLLATE Arabic_CI_AI
                                NULL ,
          DocNo NVARCHAR(50) ,
          Acccode2 BIGINT ,
          AccName2 NVARCHAR(250) ,
          Destination NVARCHAR(250)
        );


    IF @Main = 0
        BEGIN

            IF @year > 0
                BEGIN 

                    IF @TOaCC = 0
                        AND @FROMaCC > 0
                        BEGIN
                            INSERT  INTO #Result
                                    SELECT  NULL AS aDate ,
                                            NULL AS idindix ,
                                            NULL AS KaidID ,
                                            AccName ,
                                            SUM(ISNULL(Maden, 0.00)) AS Maden ,
                                            SUM(ISNULL(Daen, 0.00)) AS Daen ,
                                            0 AS 'raseed' ,
                                            'رصيد ماقبله' AS Detis ,
                                            NULL AS OstazName ,
                                            NULL AS costname ,
                                            NULL AS CostTypeName ,
                                            AccID ,
                                            NULL AS DocJorrnal ,
                                            NULL AS OstasName ,
                                            '' AS DocNo ,
                                            0 ,
                                            0 ,
                                            0
                                    FROM    VEl_Koyod_El_Yawmia
                                    WHERE   aDate < @DateFrom
                                            AND year = @year
                                            AND CurID = @CurID
                                            AND AccID = @FROMaCC
                                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                                    FROM    @ProjectCode
                                                  ) = 0
                                                  OR costid IN ( SELECT
                                                              *
                                                              FROM
                                                              @ProjectCode )
                                                )
                                    GROUP BY AccName ,
                                            AccID; 

                            INSERT  INTO #Result
                                    SELECT  aDate ,
                                            idindix ,
                                            KaidID ,
                                            AccName ,
                                            Maden ,
                                            Daen ,
                                            0.00 AS 'raseed' ,
                                            Detis ,
                                            OstazName ,
                                            costname ,
                                            CostTypeName ,
                                            AccID ,
                                            DocJorrnal ,
                                            OstasName ,
                                            DocNO ,
                                            Acccode2 ,
                                            AccName2 ,
                                            Destination
                                    FROM    VEl_Koyod_El_Yawmia
                                    WHERE   aDate BETWEEN @DateFrom AND @DateTo
                                            AND CurID = @CurID
                                            AND AccID = @FROMaCC
                                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                                    FROM    @ProjectCode
                                                  ) = 0
                                                  OR costid IN ( SELECT
                                                              *
                                                              FROM
                                                              @ProjectCode )
                                                )
                                    ORDER BY aDate;     

                        END;
                END;
           

            IF @year = 0
                BEGIN 

                    IF @TOaCC = 0
                        AND @FROMaCC > 0
                        BEGIN
                            INSERT  INTO #Result
                                    SELECT  NULL AS aDate ,
                                            NULL AS idindix ,
                                            NULL AS KaidID ,
                                            AccName ,
                                            SUM(ISNULL(Maden, 0.00)) AS Maden ,
                                            SUM(ISNULL(Daen, 0.00)) AS Daen ,
                                            0 AS 'raseed' ,
                                            'رصيد ماقبله' AS Detis ,
                                            NULL AS OstazName ,
                                            NULL AS costname ,
                                            NULL AS CostTypeName ,
                                            AccID ,
                                            NULL AS DocJorrnal ,
                                            NULL AS OstasName ,
                                            '' AS DocNo ,
                                            0 ,
                                            0 ,
                                            0
                                    FROM    VEl_Koyod_El_Yawmia
                                    WHERE   aDate < @DateFrom
                                            AND CurID = @CurID
                                            AND AccID = @FROMaCC
                                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                                    FROM    @ProjectCode
                                                  ) = 0
                                                  OR costid IN ( SELECT
                                                              *
                                                              FROM
                                                              @ProjectCode )
                                                )
                                    GROUP BY AccName ,
                                            AccID;
                            INSERT  INTO #Result
                                    SELECT  aDate ,
                                            idindix ,
                                            KaidID ,
                                            AccName ,
                                            Maden ,
                                            Daen ,
                                            0.00 AS 'raseed' ,
                                            Detis ,
                                            OstazName ,
                                            costname ,
                                            CostTypeName ,
                                            AccID ,
                                            DocJorrnal ,
                                            OstasName ,
                                            DocNO ,
                                            Acccode2 ,
                                            AccName2 ,
                                            Destination
                                    FROM    VEl_Koyod_El_Yawmia
                                    WHERE   aDate BETWEEN @DateFrom AND @DateTo
                                            AND CurID = @CurID
                                            AND AccID = @FROMaCC
                                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                                    FROM    @ProjectCode
                                                  ) = 0
                                                  OR costid IN ( SELECT
                                                              *
                                                              FROM
                                                              @ProjectCode )
                                                )
                                    ORDER BY aDate;     

                        END;
                END;

           

            IF @TOaCC = 0
                AND @FROMaCC = 0
                BEGIN
                    INSERT  INTO #Result
                            SELECT  aDate ,
                                    idindix ,
                                    KaidID ,
                                    AccName ,
                                    Maden ,
                                    Daen ,
                                    0.00 AS 'raseed' ,
                                    Detis ,
                                    OstazName ,
                                    costname ,
                                    CostTypeName ,
                                    AccID ,
                                    DocJorrnal ,
                                    OstasName ,
                                    DocNO ,
                                    Acccode2 ,
                                    AccName2 ,
                                    Destination
                            FROM    VEl_Koyod_El_Yawmia
                            WHERE   aDate BETWEEN @DateFrom AND @DateTo
                                    AND CurID = @CurID
                                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                            FROM    @ProjectCode
                                          ) = 0
                                          OR costid IN ( SELECT
                                                              *
                                                         FROM @ProjectCode )
                                        )
                            ORDER BY aDate;     

                END;


        END;

    IF @Main = 1
        BEGIN
            INSERT  INTO #Result
                    SELECT  aDate ,
                            idindix ,
                            KaidID ,
                            AccName ,
                            Maden ,
                            Daen ,
                            0.00 AS 'raseed' ,
                            Detis ,
                            OstazName ,
                            costname ,
                            CostTypeName ,
                            AccID ,
                            DocJorrnal ,
                            OstasName ,
                            DocNO ,
                            Acccode2 ,
                            AccName2 ,
                            Destination
                    FROM    VEl_Koyod_El_Yawmia
                    WHERE   F1 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F2 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F3 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F4 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F5 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F6 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F7 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F8 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F9 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                            OR F10 = @MainCode
                            AND aDate BETWEEN @DateFrom AND @DateTo
                            AND CurID = @CurID
                            AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                    FROM    @ProjectCode
                                  ) = 0
                                  OR costid IN ( SELECT *
                                                 FROM   @ProjectCode )
                                )
                    ORDER BY aDate;

        END;
     


    SELECT  *
    FROM    #Result; 
