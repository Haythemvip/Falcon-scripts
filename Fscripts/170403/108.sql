 

ALTER VIEW [dbo].[View_Amr_Shra_Costs]
AS
SELECT        dbo.Amr_Sheraa_Item.performa_id, dbo.Amr_Sheraa.performa_date, dbo.Amr_Sheraa.customername, dbo.Amr_Sheraa_Item.serial, dbo.Amr_Sheraa_Item.price, dbo.Amr_Sheraa_Item.unit, 
                         dbo.Amr_Sheraa_Item.quantity, dbo.Amr_Sheraa_Item.total, dbo.TblCostTree.AccName, dbo.TblCostTree.ParentID, dbo.Amr_Sheraa_Item.CostID, dbo.Amr_Sheraa.order_no, 
                         dbo.Amr_Sheraa_Item.ItemNO_IN_Tender, dbo.Amr_Sheraa_Item.ItemCode, dbo.Amr_Sheraa_Item.mohla, dbo.Amr_Sheraa_Item.DateNeed, dbo.CostItemsBudget.Budget, dbo.CostItemsBudget.SupID, 
                         dbo.Amr_Sheraa.ProjectID, dbo.Items.Item_Name AS Item_Name_EN, dbo.Items.Item_Name_AR, dbo.Amr_Sheraa.PO_NO, dbo.Amr_Sheraa_Item.item_name, dbo.Amr_Sheraa.Discount, 
                         dbo.Amr_Sheraa.Emp_Code, dbo.Amr_Sheraa.DepartID, dbo.Amr_Sheraa.PurchaseTypeID, dbo.Amr_Sheraa.ContactPesonID, dbo.Amr_Sheraa.ContactMobile, dbo.Amr_Sheraa.ContactMial, 
                         dbo.Amr_Sheraa.ProunchID, dbo.Amr_Sheraa.Customer_id, dbo.Tenders_Add.TheName, dbo.Tenders_Add.ShortName, dbo.Tenders_Add.ShortCode, dbo.Groups.groupname, dbo.Groups_Sub.subname, 
                         dbo.Groups_Sub.subid, dbo.Groups.groupid
FROM            dbo.Groups INNER JOIN
                         dbo.Items ON dbo.Groups.groupid = dbo.Items.Item_Gro_Id INNER JOIN
                         dbo.Groups_Sub ON dbo.Items.Item_Gro_Sub_Id = dbo.Groups_Sub.subid RIGHT OUTER JOIN
                         dbo.Amr_Sheraa INNER JOIN
                         dbo.Amr_Sheraa_Item ON dbo.Amr_Sheraa.performa_id = dbo.Amr_Sheraa_Item.performa_id LEFT OUTER JOIN
                         dbo.Tenders_Add ON dbo.Amr_Sheraa.ProjectID = dbo.Tenders_Add.ID ON dbo.Items.Item_Id = dbo.Amr_Sheraa_Item.ItemCode LEFT OUTER JOIN
                         dbo.CostItemsBudget ON dbo.Items.Item_Gro_Id = dbo.CostItemsBudget.GroupID AND dbo.Items.Item_Gro_Sub_Id = dbo.CostItemsBudget.SupID AND 
                         dbo.Amr_Sheraa_Item.CostID = dbo.CostItemsBudget.CostID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Amr_Sheraa_Item.CostID = dbo.TblCostTree.AccCode

GO


