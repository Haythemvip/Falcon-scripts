

ALTER VIEW [dbo].[V_AccTree10]
AS
SELECT        dbo.tblAccTree.ID AS ID10, CASE WHEN (dbo.tblAccTree.AccCode) IS NULL THEN (dbo.V_AccTree9.F9) ELSE (dbo.tblAccTree.AccCode) END AS F10, CASE WHEN (dbo.tblAccTree.AccName) IS NULL 
                         THEN (dbo.V_AccTree9.N9) ELSE (dbo.tblAccTree.AccName) END AS N10, CASE WHEN (dbo.tblAccTree.AccName_En) IS NULL THEN (dbo.V_AccTree9.NE9) ELSE (dbo.tblAccTree.AccName_En) END AS NE10, 
                         dbo.V_AccTree9.F1, dbo.V_AccTree9.N1, dbo.V_AccTree9.F2, dbo.V_AccTree9.N2, dbo.V_AccTree9.NE2, dbo.V_AccTree9.F3, dbo.V_AccTree9.N3, dbo.V_AccTree9.NE3, dbo.V_AccTree9.F4, dbo.V_AccTree9.N4, 
                         dbo.V_AccTree9.NE4, dbo.V_AccTree9.F5, dbo.V_AccTree9.N5, dbo.V_AccTree9.NE5, dbo.V_AccTree9.F6, dbo.V_AccTree9.N6, dbo.V_AccTree9.NE6, dbo.V_AccTree9.F7, dbo.V_AccTree9.N7, dbo.V_AccTree9.NE7, 
                         dbo.V_AccTree9.F8, dbo.V_AccTree9.N8, dbo.V_AccTree9.NE8, dbo.V_AccTree9.F9, dbo.V_AccTree9.N9, dbo.V_AccTree9.NE9, CASE WHEN (dbo.tblAccTree.ISmain) IS NULL THEN (dbo.V_AccTree9.ISmain) 
                         ELSE (dbo.tblAccTree.ISmain) END AS ISmain, CASE WHEN (dbo.tblAccTree.SortID) IS NULL THEN (dbo.V_AccTree9.SortID) ELSE (dbo.tblAccTree.SortID) END AS SortID, CASE WHEN (dbo.tblAccTree.MezanyaID) 
                         IS NULL THEN (dbo.V_AccTree9.MezanyaID) ELSE (dbo.tblAccTree.MezanyaID) END AS MezanyaID
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree9 ON dbo.tblAccTree.ParentID = dbo.V_AccTree9.ID9

GO


