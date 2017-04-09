 

CREATE VIEW [dbo].[V_AccTree4]
AS
SELECT        dbo.tblAccTree.ID AS ID4, dbo.tblAccTree.AccCode AS F4, dbo.tblAccTree.AccName AS N4, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE4, dbo.V_AccTree3.F1, dbo.V_AccTree3.N1, 
                         dbo.V_AccTree3.NE1, dbo.V_AccTree3.F2, dbo.V_AccTree3.N2, dbo.V_AccTree3.NE2, dbo.V_AccTree3.F3, dbo.V_AccTree3.N3, dbo.V_AccTree3.NE3
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree3 ON dbo.tblAccTree.ParentID = dbo.V_AccTree3.ID3

GO
 
