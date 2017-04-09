 

CREATE VIEW [dbo].[V_AccTree5]
AS
SELECT        dbo.tblAccTree.ID AS ID5, dbo.tblAccTree.AccCode AS F5, dbo.tblAccTree.AccName AS N5, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE5, dbo.V_AccTree4.F1, dbo.V_AccTree4.N1, 
                         dbo.V_AccTree4.NE1, dbo.V_AccTree4.F2, dbo.V_AccTree4.N2, dbo.V_AccTree4.NE2, dbo.V_AccTree4.F3, dbo.V_AccTree4.N3, dbo.V_AccTree4.NE3, dbo.V_AccTree4.F4, dbo.V_AccTree4.N4, 
                         dbo.V_AccTree4.NE4
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree4 ON dbo.tblAccTree.ParentID = dbo.V_AccTree4.ID4

GO

 

