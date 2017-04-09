
ALTER VIEW [dbo].[V_AccTree9]
AS
SELECT        dbo.tblAccTree.ID AS ID9, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree8.F8) ELSE (dbo.tblAccTree.AccCode) END AS F9, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree8.N8) ELSE (dbo.tblAccTree.AccName) END AS N9, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree8.NE8) ELSE (dbo.tblAccTree.AccName_En) END AS NE9, 
                         dbo.V_AccTree8.F1, dbo.V_AccTree8.N1, dbo.V_AccTree8.F2, dbo.V_AccTree8.N2, dbo.V_AccTree8.NE2, dbo.V_AccTree8.F3, dbo.V_AccTree8.N3, dbo.V_AccTree8.NE3, dbo.V_AccTree8.F4, dbo.V_AccTree8.N4, 
                         dbo.V_AccTree8.NE4, dbo.V_AccTree8.F5, dbo.V_AccTree8.N5, dbo.V_AccTree8.NE5, dbo.V_AccTree8.F6, dbo.V_AccTree8.N6, dbo.V_AccTree8.NE6, dbo.V_AccTree8.F7, dbo.V_AccTree8.N7, dbo.V_AccTree8.NE7, 
                         dbo.V_AccTree8.F8, dbo.V_AccTree8.N8, dbo.V_AccTree8.NE8, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree8.ISmain) ELSE (dbo.tblAccTree.ISmain) END AS ISmain, 
                         CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree8.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) IS NULL THEN (dbo.V_AccTree8.MezanyaID) 
                         ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree8 ON dbo.tblAccTree.ParentID = dbo.V_AccTree8.ID8

GO


