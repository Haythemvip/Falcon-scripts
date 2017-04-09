

ALTER VIEW [dbo].[V_AccTree4]
AS
SELECT        dbo.tblAccTree.ID AS ID4, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree3.F3) ELSE (dbo.tblAccTree.AccCode) END AS F4, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree3.N3) ELSE (dbo.tblAccTree.AccName) END AS N4, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree3.NE3) ELSE (dbo.tblAccTree.AccName_En) END AS NE4, 
                         dbo.V_AccTree3.F1, dbo.V_AccTree3.N1, dbo.V_AccTree3.F2, dbo.V_AccTree3.N2, dbo.V_AccTree3.NE2, dbo.V_AccTree3.F3, dbo.V_AccTree3.N3, dbo.V_AccTree3.NE3, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL
                          THEN (dbo.V_AccTree3.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree3.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, 
                         CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree3.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree3 ON dbo.tblAccTree.ParentID = dbo.V_AccTree3.ID3

GO


