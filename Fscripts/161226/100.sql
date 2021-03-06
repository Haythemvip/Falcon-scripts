 

ALTER PROCEDURE [dbo].[CostProject_Costs]
    @DateFrom DATE ,
    @DateTo DATE ,
    @ProjectCode AS dbo.MyCostParam READONLY ,
    @AccCode AS dbo.MyAccParam READONLY ,
    @UserID BIGINT ,
    @totaly SMALLINT
AS
    CREATE TABLE #Result
        (
          Maden FLOAT ,
          Daen FLOAT ,
          AccName NVARCHAR(MAX) ,
          acctreeName NVARCHAR(MAX) ,
          TreeID BIGINT ,
          CostTypeName NVARCHAR(MAX) ,
          ID BIGINT ,
          Notes NVARCHAR(MAX) ,
          Destination NVARCHAR(MAX) ,
          Acccode2 BIGINT ,
          AccName2 NVARCHAR(MAX) ,
          costid BIGINT ,
          aDate DATE ,
          UserAA NVARCHAR(250)
        );


 
    IF @totaly = 1
        BEGIN 

            SELECT  SUM(Maden) AS Maden ,
                    SUM(Daen) AS Daen ,
                    View_TblCostTree.AccName ,
                    TblAccTreeAZ.AccName AS acctreeName ,
                    AccID AS TreeID ,
                    CostTypeName ,
                    costid
            FROM    dbo.El_Koyod_El_Yawmia
                    INNER JOIN dbo.View_TblCostTree ON El_Koyod_El_Yawmia.costid = View_TblCostTree.AccCode
                    LEFT OUTER JOIN TblAccTreeAZ ON El_Koyod_El_Yawmia.AccID = TblAccTreeAZ.AccCode
            WHERE   El_Koyod_El_Yawmia.aDate BETWEEN @DateFrom
                                             AND     @DateTo
                    AND El_Koyod_El_Yawmia.AccID NOT IN ( SELECT
                                                              AccCode
                                                          FROM
                                                              TreeSecurity
                                                          WHERE
                                                              UserID = @UserID )
                    AND El_Koyod_El_Yawmia.costid NOT IN (
                    SELECT  Accid
                    FROM    Tree_Cost_Security
                    WHERE   UserID = @UserID )
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @AccCode
                          ) = 0
                          OR AccID IN ( SELECT  *
                                        FROM    @AccCode )
                        )
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @ProjectCode
                          ) = 0
                          OR costid IN ( SELECT *
                                         FROM   @ProjectCode )
                        )
            GROUP BY View_TblCostTree.AccName ,
                    TblAccTreeAZ.AccName ,
                    El_Koyod_El_Yawmia.AccID ,
                    El_Koyod_El_Yawmia.CostTypeName ,
                    SortID ,
                    costid
            ORDER BY Daen ,
                    TblAccTreeAZ.SortID;  
											

        END;

    IF @totaly = 0
        BEGIN 
            SELECT  Maden ,
                    Daen ,
                    View_TblCostTree.AccName ,
                    View_tblAccTree.AccName AS acctreeName ,
                    AccID AS TreeID ,
                    CostTypeName ,
                    ID ,
                    Notes ,
                    CostTypeName ,
                    Destination ,
                    Acccode2 ,
                    AccName2 ,
                    OstasName ,
                    costid ,
                    aDate ,
                    UserAA
            FROM    dbo.El_Koyod_El_Yawmia
                    INNER JOIN View_TblCostTree ON El_Koyod_El_Yawmia.costid = View_TblCostTree.AccCode
                    LEFT OUTER JOIN View_tblAccTree ON El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
            WHERE   El_Koyod_El_Yawmia.aDate BETWEEN @DateFrom
                                             AND     @DateTo
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @AccCode
                          ) = 0
                          OR AccID IN ( SELECT  *
                                        FROM    @AccCode )
                        )
                    AND ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @ProjectCode
                          ) = 0
                          OR costid IN ( SELECT *
                                         FROM   @ProjectCode )
                        )
            ORDER BY aDate ,
                    El_Koyod_El_Yawmia.ID; 

        END;
 
      
    

 
 