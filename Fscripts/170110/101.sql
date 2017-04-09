 

ALTER VIEW [dbo].[VEznEdafa]
AS
SELECT        dbo.EznEdafa.EdafaID, dbo.Stores.store_name, dbo.EznEdafa.Edafadate, dbo.Items.Item_Name, dbo.Groups.groupname, dbo.EznEdafa_item.Unite, dbo.EznEdafa_item.Price, dbo.EznEdafa_item.Quantity, 
                         dbo.EznEdafa_item.total, dbo.Stores.store_id, dbo.EznType.TypeName, dbo.EznEdafa.notes, dbo.EznEdafa.year, dbo.EznEdafa_item.serial, dbo.EznEdafa_item.itemid, dbo.EznEdafa_item.SN, 
                         dbo.suppliers.suppliers_name, dbo.EznEdafa.INVNO, dbo.EznEdafa.ActionDate, dbo.EznEdafa.UserName, dbo.Items.PartNo, dbo.Items.Barcode, dbo.EznEdafa.DocNO, dbo.Items.Tax, dbo.Items.itm_ismedicine, 
                         dbo.Items.PriceFexed, dbo.EznEdafa_item.Bounas, dbo.EznEdafa_item.Unit_Quantity, dbo.EznEdafa_item.Unit_Price, dbo.EznEdafa_item.Defualt_ItemCost, dbo.EznEdafa_item.UnitCost, 
                         dbo.EznEdafa_item.Unit_Balance, dbo.EznEdafa_item.Rate, dbo.EznEdafa_item.CostAllItemOut, dbo.EznEdafa_item.maksap, dbo.EznEdafa_item.CostID, dbo.TblCostTree.AccName, 
                         dbo.EznEdafa_item.SaleUnitID, dbo.EznEdafa.Journal, dbo.EznEdafa.suppliers_id
FROM            dbo.EznEdafa INNER JOIN
                         dbo.EznEdafa_item ON dbo.EznEdafa.EdafaID = dbo.EznEdafa_item.EdafaID INNER JOIN
                         dbo.Items ON dbo.EznEdafa_item.itemid = dbo.Items.Item_Id INNER JOIN
                         dbo.Stores ON dbo.EznEdafa.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.suppliers ON dbo.EznEdafa.suppliers_id = dbo.suppliers.suppliers_id LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.EznEdafa_item.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid LEFT OUTER JOIN
                         dbo.EznType ON dbo.EznEdafa.EZnTypeID = dbo.EznType.EZnTypeID

GO


