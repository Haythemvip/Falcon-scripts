

ALTER VIEW [dbo].[View_EznSarfOhda]
AS
SELECT        dbo.EsnSarfOhda.SarfID, dbo.EsnSarfOhda.Sarfdate, dbo.Items.Item_Name, dbo.EsnSarfItemOhda.Unite, dbo.EsnSarfItemOhda.Price, dbo.EsnSarfItemOhda.Quantity, dbo.EsnSarfItemOhda.total, 
                         dbo.Stores.store_name, dbo.EsnSarfOhda.notes, dbo.EsnSarfOhda.year, dbo.EsnSarfItemOhda.itemid, dbo.EsnSarfItemOhda.serial, dbo.EsnSarfItemOhda.SN, dbo.EsnSarfOhda.ActionDate, 
                         dbo.EsnSarfOhda.UserName, dbo.EsnSarfOhda.ProunchID, dbo.EsnSarfOhda.COMP_ID, dbo.EsnSarfOhda.Customer_id, dbo.EsnSarfOhda.InvNO, dbo.EsnSarfOhda.EZnTypeID, dbo.EsnSarfOhda.store_id, 
                         dbo.Items.PartNo, dbo.emp.emp_code, dbo.emp.emp_name, dbo.EsnSarfItemOhda.datecome, dbo.EsnSarfItemOhda.Baknotes, dbo.EsnSarfItemOhda.CostId, dbo.EsnSarfItemOhda.Bounas, 
                         dbo.EsnSarfItemOhda.Unit_Quantity, dbo.EsnSarfItemOhda.Unit_Price, dbo.EsnSarfItemOhda.Defualt_ItemCost, dbo.EsnSarfItemOhda.UnitCost, dbo.EsnSarfItemOhda.Unit_Balance, dbo.EsnSarfItemOhda.Rate, 
                         dbo.EsnSarfItemOhda.CostAllItemOut, dbo.EsnSarfItemOhda.maksap, dbo.EsnSarfItemOhda.SaleUnitID, dbo.EsnSarfOhda.DocNO, dbo.EsnSarfOhda.Journal
FROM            dbo.EsnSarfOhda INNER JOIN
                         dbo.Stores ON dbo.EsnSarfOhda.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.EsnSarfItemOhda ON dbo.EsnSarfOhda.SarfID = dbo.EsnSarfItemOhda.SarfID INNER JOIN
                         dbo.Items ON dbo.EsnSarfItemOhda.itemid = dbo.Items.Item_Id INNER JOIN
                         dbo.emp ON dbo.EsnSarfOhda.Customer_id = dbo.emp.emp_code LEFT OUTER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid

GO


