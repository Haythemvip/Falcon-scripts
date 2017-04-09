
 CREATE PROC [dbo].[Acc_Cost_Summary_SP]
    @FromDate DATE ,
    @ToDate DATE ,@Cur_ID INT = 1,
    @ProjectCode AS dbo.MyCostParam READONLY ,
    @AccCode AS dbo.MyAccParam READONLY
 AS
    CREATE TABLE #Render
        (
          Acc_Code BIGINT ,
          Acc_Name NVARCHAR(250) ,
          Cost_Code BIGINT ,
          Cost_Name NVARCHAR(250) ,
          Maden DECIMAL(18, 2) ,
          Daen DECIMAL(18, 2) ,
          Maden_Balanse DECIMAL(18, 2) ,
          Daen_Balance DECIMAL(18, 2)
        );



  
    INSERT  #Render
            ( Acc_Code ,
              Acc_Name ,
              Cost_Code ,
              Cost_Name ,
              Maden ,
              Daen ,
              Maden_Balanse ,
              Daen_Balance
            )
            SELECT  AccID , -- Acc_Code - bigint
                    El_Koyod_El_Yawmia.AccName , -- Acc_Name - nvarchar(250)
                    costid , -- Cost_Code - bigint
                    TblCostTree.AccName , -- Cost_Name - nvarchar(250)
                    SUM(Maden) , -- Maden - decimal
                    SUM(Daen) , -- Daen - decimal
                    0 , -- Maden_Balanse - decimal
                    0  -- Daen_Balance - decimal
            FROM    dbo.El_Koyod_El_Yawmia
                    INNER JOIN dbo.TblCostTree ON costid = dbo.TblCostTree.AccCode
            WHERE   aDate BETWEEN @FromDate AND @ToDate
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @ProjectCode
                          ) = 0
                          OR AccCode IN ( SELECT    *
                                          FROM      @ProjectCode )
                        )
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @AccCode
                          ) = 0
                          OR El_Koyod_El_Yawmia.AccID IN ( SELECT
                                                              *
                                                           FROM
                                                              @AccCode )
                        )
						AND CurID = @Cur_ID 
            GROUP BY AccID ,
                    El_Koyod_El_Yawmia.AccName ,
                    costid ,
                    TblCostTree.AccName
            ORDER BY AccID;



    UPDATE  #Render
    SET     Maden_Balanse = CASE WHEN #Render.Maden > #Render.Daen
                                 THEN Maden - Daen
                                 ELSE 0
                            END;


    UPDATE  #Render
    SET     Daen_Balance = CASE WHEN #Render.Daen > #Render.Maden
                                THEN Daen - Maden
                                ELSE 0
                           END;





    SELECT  *
    FROM    #Render;
   