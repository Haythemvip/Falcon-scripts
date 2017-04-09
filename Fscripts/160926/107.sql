 

ALTER VIEW [dbo].[View_Amr_Shra_Costs]
AS
SELECT        dbo.Amr_Sheraa_Item.performa_id, dbo.Amr_Sheraa.performa_date, dbo.Amr_Sheraa.customername, dbo.Amr_Sheraa_Item.serial, dbo.Amr_Sheraa_Item.price, dbo.Amr_Sheraa_Item.unit, 
                         dbo.Amr_Sheraa_Item.quantity, dbo.Amr_Sheraa_Item.total, dbo.TblCostTree.AccName, dbo.TblCostTree.ParentID, TblCostTree_1.AccName AS AccNameMain, dbo.Amr_Sheraa_Item.CostID, 
                         dbo.Amr_Sheraa.order_no, dbo.Amr_Sheraa_Item.ItemNO_IN_Tender, dbo.Amr_Sheraa_Item.ItemCode, dbo.Amr_Sheraa_Item.mohla, dbo.Amr_Sheraa_Item.DateNeed, dbo.CostItemsBudget.Budget, 
                         dbo.CostItemsBudget.SupID, dbo.Amr_Sheraa.ProjectID, dbo.Items.Item_Name, dbo.Items.Item_Name_AR, dbo.Amr_Sheraa.PO_NO
FROM            dbo.Amr_Sheraa INNER JOIN
                         dbo.Amr_Sheraa_Item ON dbo.Amr_Sheraa.performa_id = dbo.Amr_Sheraa_Item.performa_id LEFT OUTER JOIN
                         dbo.Items ON dbo.Amr_Sheraa_Item.ItemCode = dbo.Items.Item_Id LEFT OUTER JOIN
                         dbo.CostItemsBudget ON dbo.Items.Item_Gro_Id = dbo.CostItemsBudget.GroupID AND dbo.Items.Item_Gro_Sub_Id = dbo.CostItemsBudget.SupID AND 
                         dbo.Amr_Sheraa_Item.CostID = dbo.CostItemsBudget.CostID LEFT OUTER JOIN
                         dbo.TblCostTree AS TblCostTree_1 RIGHT OUTER JOIN
                         dbo.TblCostTree ON TblCostTree_1.ID = dbo.TblCostTree.ParentID ON dbo.Amr_Sheraa_Item.CostID = dbo.TblCostTree.AccCode

GO


