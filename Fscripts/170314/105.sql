 
CREATE VIEW [dbo].[V_AccTree3]
AS
SELECT        dbo.tblAccTree.ID AS ID3, dbo.tblAccTree.AccCode AS F3, dbo.tblAccTree.AccName AS N3, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE3, dbo.V_AccTree2.F1, dbo.V_AccTree2.N1, 
                         dbo.V_AccTree2.NE1, dbo.V_AccTree2.F2, dbo.V_AccTree2.N2, dbo.V_AccTree2.NE2
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree2 ON dbo.tblAccTree.ParentID = dbo.V_AccTree2.ID2

GO
 