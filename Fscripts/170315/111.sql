 

ALTER VIEW [dbo].[View_tblAccTree]
AS
SELECT        TOP (100) PERCENT CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree10.F10) ELSE (dbo.tblAccTree.AccCode) END AS AccCode, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree10.N10) ELSE (dbo.tblAccTree.AccName) END AS AccName, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree10.NE10) ELSE (dbo.tblAccTree.AccName_En) 
                         END AS AccName_En, dbo.V_AccTree10.F1, dbo.V_AccTree10.N1, dbo.V_AccTree10.F2, dbo.V_AccTree10.N2, dbo.V_AccTree10.NE2, dbo.V_AccTree10.F3, dbo.V_AccTree10.N3, dbo.V_AccTree10.NE3, 
                         dbo.V_AccTree10.F4, dbo.V_AccTree10.N4, dbo.V_AccTree10.NE4, dbo.V_AccTree10.F5, dbo.V_AccTree10.N5, dbo.V_AccTree10.NE5, dbo.V_AccTree10.F6, dbo.V_AccTree10.N6, dbo.V_AccTree10.NE6, 
                         dbo.V_AccTree10.F7, dbo.V_AccTree10.N7, dbo.V_AccTree10.NE7, dbo.V_AccTree10.F8, dbo.V_AccTree10.N8, dbo.V_AccTree10.NE8, dbo.V_AccTree10.F9, dbo.V_AccTree10.N9, dbo.V_AccTree10.NE9, 
                         dbo.V_AccTree10.NE10, dbo.V_AccTree10.F10, dbo.V_AccTree10.N10, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree10.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, 
                         CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree10.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree10.MezanyaID) 
                         ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.V_AccTree10 LEFT OUTER JOIN
                         dbo.tblAccTree ON dbo.V_AccTree10.ID10 = dbo.tblAccTree.ParentID

GO


