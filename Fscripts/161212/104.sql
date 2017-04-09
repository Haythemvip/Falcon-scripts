 

ALTER VIEW [dbo].[View_Assemplyitem]
AS
SELECT        dbo.AssemplyTo.AssID, dbo.AssemplyTo.StoreIDTo, dbo.Stores.store_name AS stornameto, Stores_1.store_name AS storenamefrom, dbo.AssemplyTo.ActionDate, dbo.AssemplyTo.itemidTo, 
                         dbo.Items.Item_Name AS itemto, dbo.Items.Item_Name_AR AS itemarto, dbo.AssemplyTo.Unite AS unitto, dbo.AssemplyTo.Price AS priceto, dbo.AssemplyTo.Quantity AS quntityto, dbo.AssemplyTo.total AS totalto, 
                         dbo.AssemplyTo.SN AS snto, dbo.AssemplyFrom.serial, dbo.AssemplyFrom.itemid AS itemidfrom, dbo.AssemplyFrom.Unite AS unitfrom, dbo.AssemplyFrom.Price AS pricefrom, 
                         dbo.AssemplyFrom.Quantity AS quntiyfrom, dbo.AssemplyFrom.total AS totalfrom, dbo.AssemplyFrom.SN AS snfrom, Items_1.Item_Name AS itemfrom, Items_1.Item_Name_AR AS itemarfrom, 
                         dbo.AssemplyFrom.Journal, dbo.AssemplyTo.Assembling
FROM            dbo.AssemplyFrom INNER JOIN
                         dbo.Items AS Items_1 ON dbo.AssemplyFrom.itemid = Items_1.Item_Id INNER JOIN
                         dbo.Stores INNER JOIN
                         dbo.AssemplyTo ON dbo.Stores.store_id = dbo.AssemplyTo.StoreIDTo INNER JOIN
                         dbo.Stores AS Stores_1 ON dbo.AssemplyTo.StoreFrom = Stores_1.store_id INNER JOIN
                         dbo.Items ON dbo.AssemplyTo.itemidTo = dbo.Items.Item_Id ON dbo.AssemplyFrom.AssID = dbo.AssemplyTo.AssID

GO


