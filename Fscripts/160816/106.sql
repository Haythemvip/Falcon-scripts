 

ALTER VIEW [dbo].[View_Stores_Consumer]
AS
SELECT        dbo.Stores_Consumer.GardID, dbo.Stores_Consumer.ScanDate, dbo.Stores_Consumer.StoreID, dbo.Stores_Consumer.ProunchID, dbo.Stores_Consumer.COMP_ID, dbo.Stores.store_name, 
                         dbo.Stores_Consumer_items.Item_Id, dbo.Items.Item_Name, dbo.unit.unitname, dbo.Stores_Consumer_items.First_Period, dbo.Stores_Consumer_items.Credit_purchases, 
                         dbo.Stores_Consumer_items.Cash_purchases, dbo.Stores_Consumer_items.AllCome, dbo.Stores_Consumer_items.CurrentBalance, dbo.Stores_Consumer_items.NetOut, dbo.Stores_Consumer.Item_Gro_Id, 
                         dbo.Stores_Consumer.Item_Gro_Sub_Id, dbo.Stores_Consumer_items.Avvrage, dbo.Stores_Consumer_items.Total
FROM            dbo.Stores_Consumer INNER JOIN
                         dbo.Stores_Consumer_items ON dbo.Stores_Consumer.GardID = dbo.Stores_Consumer_items.GardID INNER JOIN
                         dbo.Items ON dbo.Stores_Consumer_items.Item_Id = dbo.Items.Item_Id INNER JOIN
                         dbo.unit ON dbo.Items.Item_Unit_Id = dbo.unit.unitcode LEFT OUTER JOIN
                         dbo.Stores ON dbo.Stores_Consumer.StoreID = dbo.Stores.store_id

GO


