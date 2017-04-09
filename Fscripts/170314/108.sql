 

CREATE VIEW [dbo].[V_AccTree6]
AS
SELECT        dbo.tblAccTree.ID AS ID6, dbo.tblAccTree.AccCode AS F6, dbo.tblAccTree.AccName AS N6, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE6, dbo.V_AccTree5.F1, dbo.V_AccTree5.N1, 
                         dbo.V_AccTree5.NE1, dbo.V_AccTree5.F2, dbo.V_AccTree5.N2, dbo.V_AccTree5.NE2, dbo.V_AccTree5.F3, dbo.V_AccTree5.N3, dbo.V_AccTree5.NE3, dbo.V_AccTree5.F4, dbo.V_AccTree5.N4, dbo.V_AccTree5.NE4, 
                         dbo.V_AccTree5.F5, dbo.V_AccTree5.N5, dbo.V_AccTree5.NE5
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree5 ON dbo.tblAccTree.ParentID = dbo.V_AccTree5.ID5

GO

 

