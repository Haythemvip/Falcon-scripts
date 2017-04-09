 
CREATE VIEW [dbo].[V_AccTree7]
AS
SELECT        dbo.tblAccTree.ID AS ID7, dbo.tblAccTree.AccCode AS F7, dbo.tblAccTree.AccName AS N7, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE7, dbo.V_AccTree6.F1, dbo.V_AccTree6.N1, 
                         dbo.V_AccTree6.NE1, dbo.V_AccTree6.F2, dbo.V_AccTree6.N2, dbo.V_AccTree6.NE2, dbo.V_AccTree6.F3, dbo.V_AccTree6.N3, dbo.V_AccTree6.NE3, dbo.V_AccTree6.F4, dbo.V_AccTree6.N4, dbo.V_AccTree6.NE4, 
                         dbo.V_AccTree6.F5, dbo.V_AccTree6.N5, dbo.V_AccTree6.NE5, dbo.V_AccTree6.F6, dbo.V_AccTree6.N6, dbo.V_AccTree6.NE6
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree6 ON dbo.tblAccTree.ParentID = dbo.V_AccTree6.ID6

GO
