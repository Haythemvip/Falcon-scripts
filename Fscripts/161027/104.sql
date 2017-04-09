 
ALTER VIEW [dbo].[VTaswyaEdafa]
AS
SELECT        dbo.TaswyaEdafa.EdafaID, dbo.TaswyaEdafa.Edafadate, dbo.Items.Item_Name, dbo.Groups.groupname, dbo.TaswyaEdafa_item.Unite, dbo.TaswyaEdafa_item.Price, dbo.TaswyaEdafa_item.Quantity, 
                         dbo.TaswyaEdafa_item.total, dbo.Stores.store_name, dbo.Stores.store_id, dbo.TaswyaEdafa_item.SN, dbo.TaswyaEdafa_item.serial, dbo.TaswyaEdafa.year, dbo.TaswyaEdafa.notes, 
                         dbo.TaswyaEdafa_item.itemid, dbo.TaswyaEdafa.ActionDate, dbo.TaswyaEdafa.UserName, dbo.TaswyaEdafa.ProunchID, dbo.TaswyaEdafa.COMP_ID, dbo.TaswyaEdafa_item.Bounas, 
                         dbo.TaswyaEdafa_item.Unit_Quantity, dbo.TaswyaEdafa_item.Unit_Price, dbo.TaswyaEdafa_item.Defualt_ItemCost, dbo.TaswyaEdafa_item.UnitCost, dbo.TaswyaEdafa_item.Unit_Balance, 
                         dbo.TaswyaEdafa_item.Rate, dbo.TaswyaEdafa_item.CostAllItemOut, dbo.TaswyaEdafa_item.maksap, dbo.TaswyaEdafa_item.SaleUnitID, dbo.TaswyaEdafa.Journal, dbo.TaswyaEdafa.EZnTypeID, 
                         dbo.TaswyaEdafa_item.CostID
FROM            dbo.Items INNER JOIN
                         dbo.TaswyaEdafa_item ON dbo.Items.Item_Id = dbo.TaswyaEdafa_item.itemid INNER JOIN
                         dbo.TaswyaEdafa INNER JOIN
                         dbo.Stores ON dbo.TaswyaEdafa.store_id = dbo.Stores.store_id ON dbo.TaswyaEdafa_item.EdafaID = dbo.TaswyaEdafa.EdafaID LEFT OUTER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid

GO


