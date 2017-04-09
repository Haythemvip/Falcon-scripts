 

ALTER PROCEDURE [dbo].[CostProject_Costs]
    @DateFrom DATE ,
    @DateTo DATE ,
    @MainCode BIGINT ,
    @ProjectCode BIGINT ,
    @MainAcc BIGINT ,
    @AccCode BIGINT ,
    @UserID BIGINT ,
    @fromtree SMALLINT ,
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


    IF @fromtree = 1
        BEGIN

            IF @totaly = 1
                BEGIN 

                    SELECT  SUM(Maden) AS Maden ,
                            SUM(Daen) AS Daen ,
                            View_TblCostTree.AccName ,
                            TblAccTreeAZ.AccName AS acctreeName ,
                            AccID AS TreeID ,
                            CostTypeName,costid 
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
                            AND AccID IN ( SELECT   VarParameter
                                           FROM     dbo.Table_Parameter )
                            AND ( @ProjectCode = 0
                                  OR costid = @ProjectCode
                                )
                            AND ( @MainCode = 0
                                  OR CO1 = @MainCode
                                  OR CO2 = @MainCode
                                  OR CO3 = @MainCode
                                  OR CO4 = @MainCode
                                  OR CO5 = @MainCode
                                  OR CO6 = @MainCode
                                  OR CO7 = @MainCode
                                  OR CO8 = @MainCode
                                  OR CO9 = @MainCode
                                  OR CO10 = @MainCode
                                )
                    GROUP BY View_TblCostTree.AccName ,
                            TblAccTreeAZ.AccName ,
                            El_Koyod_El_Yawmia.AccID ,
                            El_Koyod_El_Yawmia.CostTypeName ,
                            SortID,costid
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
                            AND AccID IN ( SELECT   VarParameter
                                           FROM     dbo.Table_Parameter )
                            AND ( @ProjectCode = 0
                                  OR costid = @ProjectCode
                                )
                            AND ( @MainCode = 0
                                  OR CO1 = @MainCode
                                  OR CO2 = @MainCode
                                  OR CO3 = @MainCode
                                  OR CO4 = @MainCode
                                  OR CO5 = @MainCode
                                  OR CO6 = @MainCode
                                  OR CO7 = @MainCode
                                  OR CO8 = @MainCode
                                  OR CO9 = @MainCode
                                  OR CO10 = @MainCode
                                )
                    ORDER BY aDate ,
                            El_Koyod_El_Yawmia.ID; 

                END;
 
        END;

    IF @fromtree = 0
        BEGIN  

				 
            IF @totaly = 1
                BEGIN 

                    SELECT  SUM(Maden) AS Maden ,
                            SUM(Daen) AS Daen ,
                            View_TblCostTree.AccName ,
                            View_tblAccTree.AccName AS acctreeName ,
                            AccID AS TreeID ,
                            CostTypeName,costid 
                    FROM    dbo.El_Koyod_El_Yawmia
                            INNER JOIN View_TblCostTree ON El_Koyod_El_Yawmia.costid = View_TblCostTree.AccCode
                            LEFT OUTER JOIN dbo.View_tblAccTree ON El_Koyod_El_Yawmia.AccID = View_tblAccTree.AccCode
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
                            AND ( @ProjectCode = 0
                                  OR costid = @ProjectCode
                                )
                            AND ( @MainAcc = 0
                                  OR F1 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F2 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F3 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F4 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F5 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F6 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F7 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F8 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F9 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F10 = @MainAcc
                                  AND costid = @ProjectCode
                                )
                            AND ( @AccCode = 0
                                  OR AccID = @AccCode
                                )
                            AND ( @MainCode = 0
                                  OR CO1 = @MainCode
                                  OR CO2 = @MainCode
                                  OR CO3 = @MainCode
                                  OR CO4 = @MainCode
                                  OR CO5 = @MainCode
                                  OR CO6 = @MainCode
                                  OR CO7 = @MainCode
                                  OR CO8 = @MainCode
                                  OR CO9 = @MainCode
                                  OR CO10 = @MainCode
                                )
                    GROUP BY View_TblCostTree.AccName ,
                            View_tblAccTree.AccName ,
                            El_Koyod_El_Yawmia.AccID ,
                            El_Koyod_El_Yawmia.CostTypeName ,
                            SortID ,
                            costid
                    ORDER BY Daen ,
                            SortID;  

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
                            AND ( @ProjectCode = 0
                                  OR costid = @ProjectCode
                                )
                            AND ( @MainAcc = 0
                                  OR F1 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F2 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F3 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F4 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F5 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F6 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F7 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F8 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F9 = @MainAcc
                                  AND costid = @ProjectCode
                                  OR F10 = @MainAcc
                                  AND costid = @ProjectCode
                                )
                            AND ( @AccCode = 0
                                  OR AccID = @AccCode
                                )
                            AND ( @MainCode = 0
                                  OR CO1 = @MainCode
                                  OR CO2 = @MainCode
                                  OR CO3 = @MainCode
                                  OR CO4 = @MainCode
                                  OR CO5 = @MainCode
                                  OR CO6 = @MainCode
                                  OR CO7 = @MainCode
                                  OR CO8 = @MainCode
                                  OR CO9 = @MainCode
                                  OR CO10 = @MainCode
                                )
                    ORDER BY aDate ,
                            El_Koyod_El_Yawmia.ID;

                END;
                       
					    
        END;

 
 