 

CREATE VIEW [dbo].[V_AccTree9]
AS
SELECT        dbo.tblAccTree.ID AS ID9, dbo.tblAccTree.AccCode AS F9, dbo.tblAccTree.AccName AS N9, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccName_En AS NE9, dbo.V_AccTree8.F1, dbo.V_AccTree8.N1, 
                         dbo.V_AccTree8.NE1, dbo.V_AccTree8.F2, dbo.V_AccTree8.N2, dbo.V_AccTree8.NE2, dbo.V_AccTree8.F3, dbo.V_AccTree8.N3, dbo.V_AccTree8.NE3, dbo.V_AccTree8.F4, dbo.V_AccTree8.N4, dbo.V_AccTree8.NE4, 
                         dbo.V_AccTree8.F5, dbo.V_AccTree8.N5, dbo.V_AccTree8.NE5, dbo.V_AccTree8.F6, dbo.V_AccTree8.N6, dbo.V_AccTree8.NE6, dbo.V_AccTree8.F7, dbo.V_AccTree8.N7, dbo.V_AccTree8.NE7, dbo.V_AccTree8.F8, 
                         dbo.V_AccTree8.N8, dbo.V_AccTree8.NE8
FROM            dbo.tblAccTree RIGHT OUTER JOIN
                         dbo.V_AccTree8 ON dbo.tblAccTree.ParentID = dbo.V_AccTree8.ID8

GO

 


