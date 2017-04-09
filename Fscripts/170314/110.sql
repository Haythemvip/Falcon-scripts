 
CREATE VIEW [dbo].[V_AccTree8]
AS
SELECT        dbo.tblAccTree.ID AS ID8, dbo.tblAccTree.AccCode AS F8, dbo.tblAccTree.AccName AS N8, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE8, dbo.V_AccTree7.F1, dbo.V_AccTree7.N1, 
                         dbo.V_AccTree7.NE1, dbo.V_AccTree7.F2, dbo.V_AccTree7.N2, dbo.V_AccTree7.NE2, dbo.V_AccTree7.F3, dbo.V_AccTree7.N3, dbo.V_AccTree7.NE3, dbo.V_AccTree7.F4, dbo.V_AccTree7.N4, dbo.V_AccTree7.NE4, 
                         dbo.V_AccTree7.F5, dbo.V_AccTree7.N5, dbo.V_AccTree7.NE5, dbo.V_AccTree7.F6, dbo.V_AccTree7.N6, dbo.V_AccTree7.NE6, dbo.V_AccTree7.F7, dbo.V_AccTree7.N7, dbo.V_AccTree7.NE7
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree7 ON dbo.tblAccTree.ParentID = dbo.V_AccTree7.ID7

GO

 
