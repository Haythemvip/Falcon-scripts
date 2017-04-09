
ALTER VIEW [dbo].[V_AccTree7]
AS
SELECT        dbo.tblAccTree.ID AS ID7, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree6.F6) ELSE (dbo.tblAccTree.AccCode) END AS F7, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree6.N6) ELSE (dbo.tblAccTree.AccName) END AS N7, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree6.NE6) ELSE (dbo.tblAccTree.AccName_En) END AS NE7, 
                         dbo.V_AccTree6.F1, dbo.V_AccTree6.N1, dbo.V_AccTree6.F2, dbo.V_AccTree6.N2, dbo.V_AccTree6.NE2, dbo.V_AccTree6.F3, dbo.V_AccTree6.N3, dbo.V_AccTree6.NE3, dbo.V_AccTree6.F4, dbo.V_AccTree6.N4, 
                         dbo.V_AccTree6.NE4, dbo.V_AccTree6.F5, dbo.V_AccTree6.N5, dbo.V_AccTree6.NE5, dbo.V_AccTree6.F6, dbo.V_AccTree6.N6, dbo.V_AccTree6.NE6, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL 
                         THEN (dbo.V_AccTree6.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree6.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, 
                         CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree6.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree6 ON dbo.tblAccTree.ParentID = dbo.V_AccTree6.ID6

GO


