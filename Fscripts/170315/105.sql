

ALTER VIEW [dbo].[V_AccTree5]
AS
SELECT        dbo.tblAccTree.ID AS ID5, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree4.F4) ELSE (dbo.tblAccTree.AccCode) END AS F5, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree4.N4) ELSE (dbo.tblAccTree.AccName) END AS N5, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree4.NE4) ELSE (dbo.tblAccTree.AccName_En) END AS NE5, 
                         dbo.V_AccTree4.F1, dbo.V_AccTree4.N1, dbo.V_AccTree4.F2, dbo.V_AccTree4.N2, dbo.V_AccTree4.NE2, dbo.V_AccTree4.F3, dbo.V_AccTree4.N3, dbo.V_AccTree4.NE3, dbo.V_AccTree4.F4, dbo.V_AccTree4.N4, 
                         dbo.V_AccTree4.NE4, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree4.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL 
                         THEN (dbo.V_AccTree4.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree4.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) 
                         END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree4 ON dbo.tblAccTree.ParentID = dbo.V_AccTree4.ID4

GO


