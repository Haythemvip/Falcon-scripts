 

CREATE VIEW [dbo].[V_AccTree10]
AS
SELECT        dbo.tblAccTree.ID AS ID10, dbo.tblAccTree.AccCode AS F10, dbo.tblAccTree.AccName AS N10, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE10, dbo.V_AccTree9.F1, dbo.V_AccTree9.N1, 
                         dbo.V_AccTree9.NE1, dbo.V_AccTree9.F2, dbo.V_AccTree9.N2, dbo.V_AccTree9.NE2, dbo.V_AccTree9.F3, dbo.V_AccTree9.N3, dbo.V_AccTree9.NE3, dbo.V_AccTree9.F4, dbo.V_AccTree9.N4, dbo.V_AccTree9.NE4, 
                         dbo.V_AccTree9.F5, dbo.V_AccTree9.N5, dbo.V_AccTree9.NE5, dbo.V_AccTree9.F6, dbo.V_AccTree9.N6, dbo.V_AccTree9.NE6, dbo.V_AccTree9.F7, dbo.V_AccTree9.N7, dbo.V_AccTree9.NE7, dbo.V_AccTree9.F8, 
                         dbo.V_AccTree9.N8, dbo.V_AccTree9.NE8, dbo.V_AccTree9.F9, dbo.V_AccTree9.N9, dbo.V_AccTree9.NE9
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree9 ON dbo.tblAccTree.ParentID = dbo.V_AccTree9.ID9

GO

 