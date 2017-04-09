

ALTER VIEW [dbo].[VConvertBetweenStores]
AS
SELECT        dbo.Stores_Transfares.TransId, dbo.Stores.store_name, dbo.Groups.groupname, dbo.Items.Item_Name, dbo.Stores_Transfares.TransDate, dbo.Stores_Transfares_items.Unite, 
                         dbo.Stores_Transfares_items.Price, dbo.Stores_Transfares_items.Quantity, dbo.Stores_Transfares_items.total, dbo.Stores.store_id, dbo.Stores_Transfares.ToStore, dbo.Stores_Transfares_items.serial, 
                         dbo.Stores_Transfares_items.itemid, dbo.Stores_Transfares_items.SN, dbo.Stores_Transfares.Notes, dbo.Stores_Transfares.FormStore, dbo.Items.Barcode, dbo.Stores_Transfares.Journal, 
                         dbo.Items.PriceFexed, dbo.Items.itm_ismedicine, dbo.Stores_Transfares_items.Bounas, dbo.Stores_Transfares_items.Unit_Quantity, dbo.Stores_Transfares_items.Unit_Price, 
                         dbo.Stores_Transfares_items.Defualt_ItemCost, dbo.Stores_Transfares_items.UnitCost, dbo.Stores_Transfares_items.Unit_Balance, dbo.Stores_Transfares_items.Rate, 
                         dbo.Stores_Transfares_items.CostAllItemOut, dbo.Stores_Transfares_items.maksap, dbo.Stores_Transfares_items.SaleUnitID, dbo.Stores_Transfares.TalabMowadID, dbo.Stores_Transfares_items.CostID, 
                         dbo.TblCostTree.AccName AS CostName, dbo.Stores_Transfares.ActionDate, dbo.Stores_Transfares.UserName, dbo.Stores_Transfares.ProunchID, dbo.Stores_Transfares.COMP_ID, 
                         Stores_1.store_name AS StoreNameTO
FROM            dbo.Stores INNER JOIN
                         dbo.Stores_Transfares ON dbo.Stores.store_id = dbo.Stores_Transfares.FormStore INNER JOIN
                         dbo.Groups INNER JOIN
                         dbo.Items ON dbo.Groups.groupid = dbo.Items.Item_Gro_Id INNER JOIN
                         dbo.Stores_Transfares_items ON dbo.Items.Item_Id = dbo.Stores_Transfares_items.itemid ON dbo.Stores_Transfares.TransId = dbo.Stores_Transfares_items.TransId INNER JOIN
                         dbo.Stores AS Stores_1 ON dbo.Stores_Transfares.ToStore = Stores_1.store_id LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Stores_Transfares_items.CostID = dbo.TblCostTree.AccCode

GO


