 

ALTER VIEW [dbo].[View_tblAccTree]
AS
SELECT        TOP (100) PERCENT dbo.tblAccTree.AccCode, dbo.tblAccTree.AccName, dbo.Mezanya.Mezanya_Name, dbo.tblAccTree.ParentID, dbo.tblAccTree.AccType, dbo.tblAccTree.AccLevel, dbo.tblAccTree.ISmain, 
                         dbo.tblAccTree.MezanyaID, dbo.tblAccTree.ACC_Type_ID, dbo.tblAccTree.LongCode, dbo.tblAccTree.AccName_En, dbo.tblAccTree.AccountGroup_ID, dbo.tblAccTree.ClassificationId, dbo.tblAccTree.SortID, 
                         dbo.V_AccTree10.F1, dbo.V_AccTree10.N1, dbo.V_AccTree10.NE1, dbo.V_AccTree10.F2, dbo.V_AccTree10.N2, dbo.V_AccTree10.NE2, dbo.V_AccTree10.F3, dbo.V_AccTree10.N3, dbo.V_AccTree10.NE3, 
                         dbo.V_AccTree10.F4, dbo.V_AccTree10.N4, dbo.V_AccTree10.NE4, dbo.V_AccTree10.F5, dbo.V_AccTree10.N5, dbo.V_AccTree10.NE5, dbo.V_AccTree10.F6, dbo.V_AccTree10.N6, dbo.V_AccTree10.NE6, 
                         dbo.V_AccTree10.F7, dbo.V_AccTree10.N7, dbo.V_AccTree10.NE7, dbo.V_AccTree10.F8, dbo.V_AccTree10.N8, dbo.V_AccTree10.NE8, dbo.V_AccTree10.F9, dbo.V_AccTree10.N9, dbo.V_AccTree10.NE9, 
                         dbo.V_AccTree10.NE10, dbo.V_AccTree10.F10, dbo.V_AccTree10.N10
FROM            dbo.V_AccTree10 LEFT OUTER JOIN
                         dbo.tblAccTree ON dbo.V_AccTree10.ID10 = dbo.tblAccTree.ParentID LEFT OUTER JOIN
                         dbo.Mezanya ON dbo.tblAccTree.MezanyaID = dbo.Mezanya.MezanyaID

GO


