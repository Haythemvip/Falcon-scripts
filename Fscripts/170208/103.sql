 

ALTER VIEW [dbo].[VEl_Koyod_El_Yawmia_Request]
AS
SELECT        dbo.El_Koyod_El_Yawmia_Request.KaidID, dbo.El_Koyod_El_Yawmia_Request.Detis, dbo.El_Koyod_El_Yawmia_Request.AccID, dbo.El_Koyod_El_Yawmia_Request.AccName AS AccountName, 
                         dbo.El_Koyod_El_Yawmia_Request.Daen, dbo.El_Koyod_El_Yawmia_Request.Maden, dbo.El_Koyod_El_Yawmia_Request.aDate, dbo.El_Koyod_El_Yawmia_Request.trancename, 
                         dbo.El_Koyod_El_Yawmia_Request.ProunchID, dbo.El_Koyod_El_Yawmia_Request.COMP_ID, dbo.El_Koyod_El_Yawmia_Request.OstazID, dbo.El_Koyod_El_Yawmia_Request.Seyial, 
                         dbo.El_Koyod_El_Yawmia_Request.Notes, dbo.OstazCode.OstazName, dbo.El_Koyod_El_Yawmia_Request.ID AS idindix, dbo.El_Koyod_El_Yawmia_Request.IsStartedBalance, 
                         dbo.El_Koyod_El_Yawmia_Request.costid, dbo.TblCostTree.AccName AS costname, dbo.TblCostTree.ShortCode, dbo.El_Koyod_El_Yawmia_Request.CurID, dbo.El_Koyod_El_Yawmia_Request.CostTypeID, 
                         dbo.El_Koyod_El_Yawmia_Request.CostTypeName, dbo.El_Koyod_El_Yawmia_Request.year, dbo.El_Koyod_El_Yawmia_Request.Loked, dbo.El_Koyod_El_Yawmia_Request.DayName, 
                         dbo.El_Koyod_El_Yawmia_Request.UserAA, dbo.View_tblAccTree.AccCode, dbo.View_tblAccTree.AccName, dbo.View_tblAccTree.LongCode, dbo.View_tblAccTree.Type_Name, dbo.View_tblAccTree.ClassificationId, 
                         dbo.View_tblAccTree.ClassificationName, dbo.View_tblAccTree.Mezanya_Name, dbo.View_tblAccTree.AccountGroup_ID, dbo.View_tblAccTree.AccountGroup_Name, dbo.View_tblAccTree.ACC_Type_ID, 
                         dbo.View_tblAccTree.MezanyaID, dbo.View_tblAccTree.ISmain, dbo.View_tblAccTree.AccType, dbo.View_tblAccTree.ParentID, dbo.View_tblAccTree.N10, dbo.View_tblAccTree.F10, dbo.View_tblAccTree.N9, 
                         dbo.View_tblAccTree.F9, dbo.View_tblAccTree.N8, dbo.View_tblAccTree.F8, dbo.View_tblAccTree.N7, dbo.View_tblAccTree.F7, dbo.View_tblAccTree.AccLevel, dbo.View_tblAccTree.N6, dbo.View_tblAccTree.F6, 
                         dbo.View_tblAccTree.N5, dbo.View_tblAccTree.F5, dbo.View_tblAccTree.N4, dbo.View_tblAccTree.F4, dbo.View_tblAccTree.N3, dbo.View_tblAccTree.F3, dbo.View_tblAccTree.N2, dbo.View_tblAccTree.F2, 
                         dbo.View_tblAccTree.N1, dbo.View_tblAccTree.F1, dbo.El_Koyod_El_Yawmia_Request.OstasName, dbo.El_Koyod_El_Yawmia_Request.AccName2, dbo.El_Koyod_El_Yawmia_Request.Acccode2, 
                         dbo.El_Koyod_El_Yawmia_Request.DocJorrnal, 0 AS raseed, ISNULL(dbo.El_Koyod_El_Yawmia_Request.CaseID, 0) AS CaseID, dbo.El_Koyod_El_Yawmia_Request.CaseName, 
                         dbo.El_Koyod_El_Yawmia_Request.DocNO, dbo.El_Koyod_El_Yawmia_Request.Destination, dbo.El_Koyod_El_Yawmia_Request.JournalID, dbo.El_Koyod_El_Yawmia_Request.Sigend, 
                         dbo.El_Koyod_El_Yawmia_Request.BeneficiaryCode, dbo.El_Koyod_El_Yawmia_Request.Beneficiary, dbo.El_Koyod_El_Yawmia_Request.Date_Add
FROM            dbo.El_Koyod_El_Yawmia_Request LEFT OUTER JOIN
                         dbo.View_tblAccTree ON dbo.El_Koyod_El_Yawmia_Request.AccID = dbo.View_tblAccTree.AccCode LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.El_Koyod_El_Yawmia_Request.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.El_Koyod_El_Yawmia_Request.costid = dbo.TblCostTree.AccCode

GO


