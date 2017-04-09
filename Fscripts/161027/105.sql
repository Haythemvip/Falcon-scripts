 

ALTER VIEW [dbo].[VTaswyaKhasm]
AS
SELECT        dbo.Stores.store_name, dbo.TaswyaKhasm.SarfID, dbo.TaswyaKhasm.Sarfdate, dbo.TaswyaKhasm_item.Unite, dbo.TaswyaKhasm_item.Price, dbo.TaswyaKhasm_item.Quantity, dbo.TaswyaKhasm_item.total, 
                         dbo.Items.Item_Name, dbo.Groups.groupname, dbo.Stores.store_id, dbo.TaswyaKhasm_item.serial, dbo.TaswyaKhasm_item.SN, dbo.TaswyaKhasm.notes, dbo.TaswyaKhasm.year, 
                         dbo.TaswyaKhasm_item.itemid, dbo.TaswyaKhasm.ActionDate, dbo.TaswyaKhasm.UserName, dbo.TaswyaKhasm.ProunchID, dbo.TaswyaKhasm.COMP_ID, dbo.TaswyaKhasm_item.Bounas, 
                         dbo.TaswyaKhasm_item.Unit_Quantity, dbo.TaswyaKhasm_item.Unit_Price, dbo.TaswyaKhasm_item.Defualt_ItemCost, dbo.TaswyaKhasm_item.UnitCost, dbo.TaswyaKhasm_item.Unit_Balance, 
                         dbo.TaswyaKhasm_item.Rate, dbo.TaswyaKhasm_item.CostAllItemOut, dbo.TaswyaKhasm_item.maksap, dbo.TaswyaKhasm_item.SaleUnitID, dbo.TaswyaKhasm.Journal, dbo.TaswyaKhasm.EZnTypeID, 
                         dbo.TaswyaKhasm_item.CostID
FROM            dbo.Groups RIGHT OUTER JOIN
                         dbo.Items INNER JOIN
                         dbo.TaswyaKhasm INNER JOIN
                         dbo.Stores ON dbo.TaswyaKhasm.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.TaswyaKhasm_item ON dbo.TaswyaKhasm.SarfID = dbo.TaswyaKhasm_item.SarfID ON dbo.Items.Item_Id = dbo.TaswyaKhasm_item.itemid ON dbo.Groups.groupid = dbo.Items.Item_Gro_Id

GO


