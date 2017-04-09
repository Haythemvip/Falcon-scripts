

ALTER VIEW [dbo].[VEl_Koyod_El_Yawmia]
AS
SELECT        dbo.El_Koyod_El_Yawmia.KaidID, dbo.El_Koyod_El_Yawmia.Detis, dbo.El_Koyod_El_Yawmia.AccID, dbo.El_Koyod_El_Yawmia.AccName AS AccountName, dbo.El_Koyod_El_Yawmia.Daen, 
                         dbo.El_Koyod_El_Yawmia.Maden, dbo.El_Koyod_El_Yawmia.aDate, dbo.El_Koyod_El_Yawmia.trancename, dbo.El_Koyod_El_Yawmia.ProunchID, dbo.El_Koyod_El_Yawmia.COMP_ID, 
                         dbo.El_Koyod_El_Yawmia.OstazID, dbo.El_Koyod_El_Yawmia.Seyial, dbo.El_Koyod_El_Yawmia.Notes, dbo.OstazCode.OstazName, dbo.El_Koyod_El_Yawmia.ID AS idindix, 
                         dbo.El_Koyod_El_Yawmia.IsStartedBalance, dbo.El_Koyod_El_Yawmia.costid, dbo.TblCostTree.AccName AS costname, dbo.TblCostTree.ShortCode, dbo.El_Koyod_El_Yawmia.CurID, 
                         dbo.El_Koyod_El_Yawmia.CostTypeID, dbo.El_Koyod_El_Yawmia.CostTypeName, dbo.El_Koyod_El_Yawmia.year, dbo.El_Koyod_El_Yawmia.Loked, dbo.El_Koyod_El_Yawmia.DayName, 
                         dbo.El_Koyod_El_Yawmia.UserAA, dbo.View_tblAccTree.AccCode, dbo.View_tblAccTree.AccName, dbo.View_tblAccTree.LongCode, dbo.View_tblAccTree.Type_Name, dbo.View_tblAccTree.ClassificationId, 
                         dbo.View_tblAccTree.ClassificationName, dbo.View_tblAccTree.Mezanya_Name, dbo.View_tblAccTree.AccountGroup_ID, dbo.View_tblAccTree.AccountGroup_Name, dbo.View_tblAccTree.ACC_Type_ID, 
                         dbo.View_tblAccTree.MezanyaID, dbo.View_tblAccTree.ISmain, dbo.View_tblAccTree.AccType, dbo.View_tblAccTree.ParentID, dbo.View_tblAccTree.N10, dbo.View_tblAccTree.F10, dbo.View_tblAccTree.N9, 
                         dbo.View_tblAccTree.F9, dbo.View_tblAccTree.N8, dbo.View_tblAccTree.F8, dbo.View_tblAccTree.N7, dbo.View_tblAccTree.F7, dbo.View_tblAccTree.AccLevel, dbo.View_tblAccTree.N6, dbo.View_tblAccTree.F6, 
                         dbo.View_tblAccTree.N5, dbo.View_tblAccTree.F5, dbo.View_tblAccTree.N4, dbo.View_tblAccTree.F4, dbo.View_tblAccTree.N3, dbo.View_tblAccTree.F3, dbo.View_tblAccTree.N2, dbo.View_tblAccTree.F2, 
                         dbo.View_tblAccTree.N1, dbo.View_tblAccTree.F1, dbo.El_Koyod_El_Yawmia.OstasName, dbo.El_Koyod_El_Yawmia.AccName2, dbo.El_Koyod_El_Yawmia.Acccode2, dbo.El_Koyod_El_Yawmia.DocJorrnal, 
                         0 AS raseed, ISNULL(dbo.El_Koyod_El_Yawmia.CaseID, 0) AS CaseID, dbo.El_Koyod_El_Yawmia.CaseName, dbo.El_Koyod_El_Yawmia.DocNO, dbo.El_Koyod_El_Yawmia.Destination, 
                         dbo.El_Koyod_El_Yawmia.Date_Add, dbo.El_Koyod_El_Yawmia.IsJournal
FROM            dbo.El_Koyod_El_Yawmia LEFT OUTER JOIN
                         dbo.View_tblAccTree ON dbo.El_Koyod_El_Yawmia.AccID = dbo.View_tblAccTree.AccCode LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.El_Koyod_El_Yawmia.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.El_Koyod_El_Yawmia.costid = dbo.TblCostTree.AccCode

GO


