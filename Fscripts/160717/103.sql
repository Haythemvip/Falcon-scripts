 

ALTER VIEW [dbo].[VEznSarf]
AS
SELECT        dbo.EsnSarf.SarfID, dbo.EsnSarf.Sarfdate, dbo.Items.Item_Name, dbo.EsnSarf_items.Unite, dbo.EsnSarf_items.Price, dbo.EsnSarf_items.Quantity, dbo.EsnSarf_items.total, dbo.Stores.store_name, 
                         dbo.EznType.TypeName, dbo.EsnSarf.notes, dbo.EsnSarf.year, dbo.EsnSarf_items.itemid, dbo.EsnSarf_items.serial, dbo.EsnSarf_items.SN, dbo.EsnSarf.ActionDate, dbo.EsnSarf.UserName, 
                         dbo.EsnSarf.ProunchID, dbo.EsnSarf.COMP_ID, dbo.EsnSarf.Customer_id, dbo.customers.customer_name, dbo.EsnSarf.InvNO, dbo.EsnSarf.EZnTypeID, dbo.EsnSarf.store_id, dbo.Items.PartNo, 
                         dbo.Groups.groupname, dbo.EsnSarf_items.CostId, dbo.TblCostTree.AccName, dbo.TblCostTree.ShortCode, dbo.Items.Barcode, dbo.EsnSarf.InVUsed, dbo.EsnSarf.DocNO, dbo.Items.Tax, dbo.Items.PriceFexed, 
                         dbo.Items.itm_ismedicine, dbo.EsnSarf_items.Bounas, dbo.EsnSarf_items.Unit_Quantity, dbo.EsnSarf_items.Defualt_ItemCost, dbo.EsnSarf_items.UnitCost, dbo.EsnSarf_items.Unit_Balance, 
                         dbo.EsnSarf_items.Rate, dbo.EsnSarf_items.CostAllItemOut, dbo.EsnSarf_items.maksap, dbo.EsnSarf_items.Unit_Price, dbo.EsnSarf_items.SaleUnitID, dbo.EsnSarf.Journal, dbo.EsnSarf.TO_StoreID
FROM            dbo.customers RIGHT OUTER JOIN
                         dbo.EsnSarf INNER JOIN
                         dbo.Stores ON dbo.EsnSarf.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.EsnSarf_items ON dbo.EsnSarf.SarfID = dbo.EsnSarf_items.SarfID INNER JOIN
                         dbo.Items ON dbo.EsnSarf_items.itemid = dbo.Items.Item_Id ON dbo.customers.Customer_id = dbo.EsnSarf.Customer_id LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.EsnSarf_items.CostId = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.EznType ON dbo.EsnSarf.EZnTypeID = dbo.EznType.EZnTypeID LEFT OUTER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid

GO


