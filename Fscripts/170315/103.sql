
ALTER VIEW [dbo].[V_AccTree3]
AS
SELECT        dbo.tblAccTree.ID AS ID3, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree2.f2) ELSE (dbo.tblAccTree.AccCode) END AS F3, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree2.N2) ELSE (dbo.tblAccTree.AccName) END AS N3, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree2.NE2) ELSE (dbo.tblAccTree.AccName_En) END AS NE3, 
                         dbo.V_AccTree2.F1, dbo.V_AccTree2.N1, dbo.V_AccTree2.F2, dbo.V_AccTree2.N2, dbo.V_AccTree2.NE2, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree2.ISmain) ELSE (dbo.tblAccTree.ISmain) 
                         END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree2.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL 
                         THEN (dbo.V_AccTree2.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree2 ON dbo.tblAccTree.ParentID = dbo.V_AccTree2.ID2

GO


