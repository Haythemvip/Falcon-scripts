

ALTER VIEW [dbo].[View_Mezn]
AS
SELECT        dbo.View_tblAccTree.AccCode, dbo.View_tblAccTree.AccName, dbo.El_Koyod_El_Yawmia.KaidID, dbo.El_Koyod_El_Yawmia.Detis, dbo.El_Koyod_El_Yawmia.Daen, dbo.El_Koyod_El_Yawmia.Maden, 
                         dbo.El_Koyod_El_Yawmia.aDate, dbo.El_Koyod_El_Yawmia.trancename, dbo.El_Koyod_El_Yawmia.ProunchID, dbo.El_Koyod_El_Yawmia.COMP_ID, dbo.El_Koyod_El_Yawmia.OstazID, 
                         dbo.El_Koyod_El_Yawmia.Seyial, dbo.El_Koyod_El_Yawmia.Notes, dbo.El_Koyod_El_Yawmia.ID AS idindix, dbo.El_Koyod_El_Yawmia.IsStartedBalance, dbo.El_Koyod_El_Yawmia.costid, 
                         dbo.El_Koyod_El_Yawmia.CurID, dbo.View_tblAccTree.F1, dbo.View_tblAccTree.N1, dbo.View_tblAccTree.F2, dbo.View_tblAccTree.N2, dbo.View_tblAccTree.F3, dbo.View_tblAccTree.N3, dbo.View_tblAccTree.F4, 
                         dbo.View_tblAccTree.N4, dbo.View_tblAccTree.F5, dbo.View_tblAccTree.N5, dbo.View_tblAccTree.F6, dbo.View_tblAccTree.N6, dbo.View_tblAccTree.F7, dbo.View_tblAccTree.N7, dbo.View_tblAccTree.F8, 
                         dbo.View_tblAccTree.N8, dbo.View_tblAccTree.F9, dbo.View_tblAccTree.N9, dbo.View_tblAccTree.F10, dbo.View_tblAccTree.N10, dbo.View_tblAccTree.MezanyaID, dbo.View_tblAccTree.Mezanya_Name, 
                         dbo.View_tblAccTree.ACC_Type_ID, dbo.View_tblAccTree.Type_Name, dbo.View_tblAccTree.ClassificationId, dbo.View_tblAccTree.ClassificationName, dbo.El_Koyod_El_Yawmia.AccID, 
                         dbo.View_tblAccTree.AccountGroup_Name, dbo.El_Koyod_El_Yawmia.year
FROM            dbo.El_Koyod_El_Yawmia FULL OUTER JOIN
                         dbo.View_tblAccTree ON dbo.El_Koyod_El_Yawmia.AccID = dbo.View_tblAccTree.AccCode

GO


