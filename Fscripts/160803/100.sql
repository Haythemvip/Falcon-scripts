 

ALTER PROCEDURE [dbo].[CostProject_Costs]
    @Main INT = 0 ,
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
    IF @Main = 0
        BEGIN


            IF @fromtree = 1
                BEGIN

                    IF @MainCode = 0
                        AND @ProjectCode = 0
                        AND @MainAcc = 0
                        AND @AccCode = 0
                        BEGIN

                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(CostProjects.Wared) AS Wared ,
                                            SUM(CostProjects.Monsaref) AS Monsaref ,
                                            TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName AS acctreeName ,
                                            CostProjects.TreeID ,
                                            CostTypeName
                                    FROM    CostProjects
                                            INNER JOIN TblCostTree ON CostProjects.CostId = TblCostTree.AccCode
                                            LEFT OUTER JOIN TblAccTreeAZ ON CostProjects.TreeID = TblAccTreeAZ.AccCode
                                    WHERE   CostProjects.CostDate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                            AND CostProjects.TreeID NOT IN (
                                            SELECT  AccCode
                                            FROM    TreeSecurity
                                            WHERE   UserID = @UserID )
                                            AND CostProjects.CostId NOT IN (
                                            SELECT  Accid
                                            FROM    Tree_Cost_Security
                                            WHERE   UserID = @UserID )
                                            AND TreeID IN (
                                            SELECT  VarParameter
                                            FROM    dbo.Table_Parameter )
                                    GROUP BY TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName ,
                                            CostProjects.TreeID ,
                                            CostProjects.CostTypeName,SortID
											 ORDER BY TblAccTreeAZ.SortID
											

                                END

                            IF @totaly = 0
                                BEGIN 
                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   CostDate BETWEEN @DateFrom AND @DateTo
                                            AND TreeID IN (
                                            SELECT  VarParameter
                                            FROM    dbo.Table_Parameter )
                                    ORDER BY CostDate ,
                                            KedID 

                                END
                        END 
                    IF @MainCode > 0
                        AND @ProjectCode > 0
                        AND @MainAcc = 0
                        AND @AccCode = 0
                        BEGIN

                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(CostProjects.Wared) AS Wared ,
                                            SUM(CostProjects.Monsaref) AS Monsaref ,
                                            TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName AS acctreeName ,
                                            CostProjects.TreeID ,
                                            CostTypeName
                                    FROM    CostProjects
                                            INNER JOIN TblCostTree ON CostProjects.CostId = TblCostTree.AccCode
                                            LEFT OUTER JOIN TblAccTreeAZ ON CostProjects.TreeID = TblAccTreeAZ.AccCode
                                    WHERE   CostProjects.CostDate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                            AND CostId = @ProjectCode
                                            AND CostProjects.TreeID NOT IN (
                                            SELECT  AccCode
                                            FROM    TreeSecurity
                                            WHERE   UserID = @UserID )
                                            AND CostProjects.CostId NOT IN (
                                            SELECT  Accid
                                            FROM    Tree_Cost_Security
                                            WHERE   UserID = @UserID )
                                            AND TreeID IN (
                                            SELECT  VarParameter
                                            FROM    dbo.Table_Parameter )
                                    GROUP BY TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName ,
                                            CostProjects.TreeID ,
                                            CostProjects.CostTypeName ,SortID
											 ORDER BY TblAccTreeAZ.SortID

                                END

                            IF @totaly = 0
                                BEGIN 
                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID IN (
                                            SELECT  VarParameter
                                            FROM    dbo.Table_Parameter )
                                    ORDER BY CostDate ,
                                            KedID 

                                END
                        END


                END

            IF @fromtree = 0
                BEGIN  


           
                    IF @MainCode = 0
                        AND @ProjectCode = 0
                        AND @MainAcc = 0
                        AND @AccCode = 0
                        BEGIN


                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(CostProjects.Wared) AS Wared ,
                                            SUM(CostProjects.Monsaref) AS Monsaref ,
                                            TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName AS acctreeName ,
                                            CostProjects.TreeID ,
                                            CostTypeName
                                    FROM    CostProjects
                                            INNER JOIN TblCostTree ON CostProjects.CostId = TblCostTree.AccCode
                                            LEFT OUTER JOIN TblAccTreeAZ ON CostProjects.TreeID = TblAccTreeAZ.AccCode
                                    WHERE   CostProjects.CostDate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                            AND CostProjects.TreeID NOT IN (
                                            SELECT  AccCode
                                            FROM    TreeSecurity
                                            WHERE   UserID = @UserID )
                                            AND CostProjects.CostId NOT IN (
                                            SELECT  Accid
                                            FROM    Tree_Cost_Security
                                            WHERE   UserID = @UserID )
                                    GROUP BY TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName ,
                                            CostProjects.TreeID ,
                                            CostProjects.CostTypeName ,SortID
											 ORDER BY TblAccTreeAZ.SortID

                                END

                            IF @totaly = 0
                                BEGIN 
                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   CostDate BETWEEN @DateFrom AND @DateTo
                                    ORDER BY CostDate ,
                                            KedID

                                END
                        END





                    IF @MainCode > 0
                        AND @ProjectCode > 0
                        AND @MainAcc = 0
                        AND @AccCode = 0
                        BEGIN

                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(CostProjects.Wared) AS Wared ,
                                            SUM(CostProjects.Monsaref) AS Monsaref ,
                                            TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName AS acctreeName ,
                                            CostProjects.TreeID ,
                                            CostTypeName
                                    FROM    CostProjects
                                            INNER JOIN TblCostTree ON CostProjects.CostId = TblCostTree.AccCode
                                            LEFT OUTER JOIN TblAccTreeAZ ON CostProjects.TreeID = TblAccTreeAZ.AccCode
                                    WHERE   CostProjects.CostDate BETWEEN @DateFrom
                                                              AND
                                                              @DateTo
                                            AND CostId = @ProjectCode
                                            AND CostProjects.TreeID NOT IN (
                                            SELECT  AccCode
                                            FROM    TreeSecurity
                                            WHERE   UserID = @UserID )
                                            AND CostProjects.CostId NOT IN (
                                            SELECT  Accid
                                            FROM    Tree_Cost_Security
                                            WHERE   UserID = @UserID )
                                    GROUP BY TblCostTree.AccName ,
                                            TblAccTreeAZ.AccName ,
                                            CostProjects.TreeID ,
                                            CostProjects.CostTypeName ,SortID
											 ORDER BY TblAccTreeAZ.SortID

                                END

                            IF @totaly = 0
                                BEGIN 

                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                    ORDER BY CostDate ,
                                            KedID 

                                END
                        END

                    IF @MainCode > 0
                        AND @ProjectCode > 0
                        AND @MainAcc > 0
                        AND @AccCode = 0
                        BEGIN

                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(Wared) AS Wared ,
                                            SUM(Monsaref) AS Monsaref ,
                                            AccName ,
                                            acctreeName ,
                                            TreeID ,
                                            CostTypeName
                                    FROM    View_CostProjects
                                    WHERE   F1 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F2 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F3 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F4 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F5 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F6 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F7 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F8 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F9 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F10 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                    GROUP BY AccName ,
                                            acctreeName ,
                                            TreeID ,
                                            CostTypeName 

                                END

                            IF @totaly = 0
                                BEGIN 
                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   F1 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F2 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F3 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F4 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F5 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F6 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F7 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F8 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F9 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            OR F10 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                    ORDER BY CostDate ,
                                            KedID
                                END
                        END



                    IF @MainCode > 0
                        AND @ProjectCode > 0
                        AND @MainAcc > 0
                        AND @AccCode > 0
                        BEGIN

                            IF @totaly = 1
                                BEGIN 

                                    SELECT  SUM(Wared) AS Wared ,
                                            SUM(Monsaref) AS Monsaref ,
                                            AccName ,
                                            acctreeName ,
                                            TreeID ,
                                            CostTypeName
                                    FROM    View_CostProjects
                                    WHERE   F1 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F2 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F3 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F4 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F5 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F6 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F7 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F8 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F9 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F10 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                    GROUP BY AccName ,
                                            acctreeName ,
                                            TreeID ,
                                            CostTypeName 

                                END

                            IF @totaly = 0
                                BEGIN 
                                    SELECT  *
                                    FROM    View_CostProjects
                                    WHERE   F1 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F2 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F3 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F4 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F5 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F6 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F7 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F8 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F9 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                            OR F10 = @MainAcc
                                            AND CostDate BETWEEN @DateFrom AND @DateTo
                                            AND CostId = @ProjectCode
                                            AND TreeID = @AccCode
                                    ORDER BY CostDate ,
                                            KedID
                                END
                        END

                END


        END



    IF @Main = 1
        BEGIN

            IF @fromtree = 1
                BEGIN

                    IF @totaly = 1
                        BEGIN 

                            SELECT  SUM(Wared) AS Wared ,
                                    SUM(Monsaref) AS Monsaref ,
                                    AccName ,
                                    acctreeName ,
                                    TreeID ,
                                    CostTypeName
                            FROM    View_CostProjects
                            WHERE   CO1 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO2 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO3 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO4 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO5 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO6 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO7 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO8 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO9 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO10 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                            GROUP BY AccName ,
                                    acctreeName ,
                                    TreeID ,
                                    CostTypeName 

                        END

                    IF @totaly = 0
                        BEGIN 
                            SELECT  *
                            FROM    View_CostProjects
                            WHERE   CO1 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO2 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO3 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO4 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO5 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO6 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO7 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO8 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO9 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                                    OR CO10 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    AND TreeID IN (
                                    SELECT  VarParameter
                                    FROM    dbo.Table_Parameter )
                            ORDER BY CostDate ,
                                    KedID

                        END
                END
   
   
            IF @fromtree = 0
                BEGIN

                    IF @totaly = 1
                        BEGIN 

                            SELECT  SUM(Wared) AS Wared ,
                                    SUM(Monsaref) AS Monsaref ,
                                    AccName ,
                                    acctreeName ,
                                    TreeID ,
                                    CostTypeName
                            FROM    View_CostProjects
                            WHERE   CO1 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO2 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO3 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO4 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO5 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO6 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO7 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO8 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO9 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO10 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                            GROUP BY AccName ,
                                    acctreeName ,
                                    TreeID ,
                                    CostTypeName 

                        END

                    IF @totaly = 0
                        BEGIN 

                            SELECT  *
                            FROM    View_CostProjects
                            WHERE   CO1 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO2 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO3 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO4 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO5 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO6 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO7 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO8 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO9 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                                    OR CO10 = @MainCode
                                    AND CostDate BETWEEN @DateFrom AND @DateTo
                            ORDER BY CostDate ,
                                    KedID


                        END
                END
		  
        END

