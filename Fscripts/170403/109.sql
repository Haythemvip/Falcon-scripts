
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
          UserAA NVARCHAR(250),
		  AccountGroup_ID NVARCHAR(50)
        );


 
    IF @totaly = 1
        BEGIN 

            SELECT  SUM(Maden) AS Maden ,
                    SUM(Daen) AS Daen ,
                    View_TblCostTree.AccName ,
                    TblAccTree.AccName AS acctreeName ,
                    AccID AS TreeID ,
                    CostTypeName ,
                    costid,AccountGroup_ID
            FROM    dbo.El_Koyod_El_Yawmia
                    INNER JOIN dbo.View_TblCostTree ON El_Koyod_El_Yawmia.costid = View_TblCostTree.AccCode
                    LEFT OUTER JOIN TblAccTree ON El_Koyod_El_Yawmia.AccID = TblAccTree.AccCode
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
                    TblAccTree.AccName ,
                    El_Koyod_El_Yawmia.AccID ,
                    El_Koyod_El_Yawmia.CostTypeName ,
                    SortID ,
                    costid,AccountGroup_ID
            ORDER BY Daen ,
                    TblAccTree.SortID;  
											

        END;

    IF @totaly = 0
        BEGIN 
            
SELECT        El_Koyod_El_Yawmia.Maden, El_Koyod_El_Yawmia.Daen, View_TblCostTree.AccName, View_tblAccTree.AccName AS acctreeName, El_Koyod_El_Yawmia.AccID AS TreeID, 
                         El_Koyod_El_Yawmia.CostTypeName, El_Koyod_El_Yawmia.ID, El_Koyod_El_Yawmia.Notes, El_Koyod_El_Yawmia.CostTypeName AS Expr1, El_Koyod_El_Yawmia.Destination, 
                         El_Koyod_El_Yawmia.Acccode2, El_Koyod_El_Yawmia.AccName2, El_Koyod_El_Yawmia.OstasName, El_Koyod_El_Yawmia.costid, El_Koyod_El_Yawmia.aDate, El_Koyod_El_Yawmia.UserAA, 
                         tblAccTree.AccountGroup_ID
FROM            El_Koyod_El_Yawmia INNER JOIN
                         View_TblCostTree ON El_Koyod_El_Yawmia.costid = View_TblCostTree.AccCode LEFT OUTER JOIN
                         tblAccTree ON El_Koyod_El_Yawmia.AccID = tblAccTree.AccCode LEFT OUTER JOIN
                         View_tblAccTree ON El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
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
 
      
    

 
 