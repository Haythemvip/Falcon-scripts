 
ALTER VIEW [dbo].[V_AccTree8]
AS
SELECT        dbo.tblAccTree.ID AS ID8, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree7.F7) ELSE (dbo.tblAccTree.AccCode) END AS F8, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree7.N7) ELSE (dbo.tblAccTree.AccName) END AS N8, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree7.NE7) ELSE (dbo.tblAccTree.AccName_En) END AS NE8, 
                         dbo.V_AccTree7.F1, dbo.V_AccTree7.N1, dbo.V_AccTree7.F2, dbo.V_AccTree7.N2, dbo.V_AccTree7.NE2, dbo.V_AccTree7.F3, dbo.V_AccTree7.N3, dbo.V_AccTree7.NE3, dbo.V_AccTree7.F4, dbo.V_AccTree7.N4, 
                         dbo.V_AccTree7.NE4, dbo.V_AccTree7.F5, dbo.V_AccTree7.N5, dbo.V_AccTree7.NE5, dbo.V_AccTree7.F6, dbo.V_AccTree7.N6, dbo.V_AccTree7.NE6, dbo.V_AccTree7.F7, dbo.V_AccTree7.N7, dbo.V_AccTree7.NE7, 
                         CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree7.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree7.SortID) 
                         ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree7.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree7 ON dbo.tblAccTree.ParentID = dbo.V_AccTree7.ID7

GO


