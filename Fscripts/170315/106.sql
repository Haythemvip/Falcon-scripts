

ALTER VIEW [dbo].[V_AccTree6]
AS
SELECT        dbo.tblAccTree.ID AS ID6, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree5.F5) ELSE (dbo.tblAccTree.AccCode) END AS F6, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree5.N5) ELSE (dbo.tblAccTree.AccName) END AS N6, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree5.NE5) ELSE (dbo.tblAccTree.AccName_En) END AS NE6, 
                         dbo.V_AccTree5.F1, dbo.V_AccTree5.N1, dbo.V_AccTree5.F2, dbo.V_AccTree5.N2, dbo.V_AccTree5.NE2, dbo.V_AccTree5.F3, dbo.V_AccTree5.N3, dbo.V_AccTree5.NE3, dbo.V_AccTree5.F4, dbo.V_AccTree5.N4, 
                         dbo.V_AccTree5.NE4, dbo.V_AccTree5.F5, dbo.V_AccTree5.N5, dbo.V_AccTree5.NE5, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree5.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, 
                         CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree5.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree5.MezanyaID) 
                         ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree5 ON dbo.tblAccTree.ParentID = dbo.V_AccTree5.ID5

GO


