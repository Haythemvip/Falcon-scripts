 

ALTER VIEW [dbo].[View_CostProjects]
AS
SELECT        dbo.CostProjects.CostId, dbo.CostProjects.Wared, dbo.CostProjects.Monsaref, dbo.CostProjects.notes, dbo.CostProjects.UserName, dbo.CostProjects.CostDate, dbo.CostProjects.KedID, dbo.CostProjects.item_id, 
                         dbo.Items.Item_Name, dbo.CostProjects.item_Quntity, dbo.CostProjects.Esn_sarf_Id, dbo.CostProjects.Byan_No, dbo.CostProjects.InvoiceoutNO, dbo.CostProjects.Esn_Edafa_No, 
                         dbo.CostProjects.InvCom_NOtTax_No, dbo.CostProjects.Inv_ComNO, dbo.CostProjects.Box_Moves_ID, dbo.CostProjects.TreeID, dbo.CostProjects.CostTypeName, dbo.View_TblCostTree.AccName, 
                         dbo.View_TblCostTree.CN1, dbo.View_TblCostTree.CO1, dbo.View_TblCostTree.CO2, dbo.View_TblCostTree.CN2, dbo.View_TblCostTree.CO3, dbo.View_TblCostTree.CN3, dbo.View_TblCostTree.CO4, 
                         dbo.View_TblCostTree.CN4, dbo.View_TblCostTree.CO5, dbo.View_TblCostTree.CN5, dbo.View_TblCostTree.CO6, dbo.View_TblCostTree.CN6, dbo.View_TblCostTree.CO7, dbo.View_TblCostTree.CN7, 
                         dbo.View_TblCostTree.CO8, dbo.View_TblCostTree.CN8, dbo.View_TblCostTree.CO9, dbo.View_TblCostTree.CN9, dbo.View_TblCostTree.CO10, dbo.View_TblCostTree.CN10, 
                         dbo.View_tblAccTree.AccName AS acctreeName, dbo.View_tblAccTree.F1, dbo.View_tblAccTree.F2, dbo.View_tblAccTree.F3, dbo.View_tblAccTree.F4, dbo.View_tblAccTree.F5, dbo.View_tblAccTree.F6, 
                         dbo.View_tblAccTree.F7, dbo.View_tblAccTree.F8, dbo.View_tblAccTree.F9, dbo.View_tblAccTree.F10, dbo.El_Koyod_El_Yawmia.Destination, dbo.El_Koyod_El_Yawmia.Acccode2, 
                         dbo.El_Koyod_El_Yawmia.AccName2
FROM            dbo.CostProjects INNER JOIN
                         dbo.View_TblCostTree ON dbo.CostProjects.CostId = dbo.View_TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.El_Koyod_El_Yawmia ON dbo.CostProjects.KedID = dbo.El_Koyod_El_Yawmia.ID LEFT OUTER JOIN
                         dbo.View_tblAccTree ON dbo.CostProjects.TreeID = dbo.View_tblAccTree.AccCode LEFT OUTER JOIN
                         dbo.Items ON dbo.CostProjects.item_id = dbo.Items.Item_Id

GO


