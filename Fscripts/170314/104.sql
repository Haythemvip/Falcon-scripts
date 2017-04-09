 

CREATE VIEW [dbo].[V_AccTree2]
AS
SELECT        dbo.tblAccTree.ID AS ID2, dbo.tblAccTree.AccCode AS F2, dbo.tblAccTree.AccName AS N2, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE2, dbo.V_AccTree1.F1, dbo.V_AccTree1.N1, 
                         dbo.V_AccTree1.NE1
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree1 ON dbo.tblAccTree.ParentID = dbo.V_AccTree1.ID1

GO

 

