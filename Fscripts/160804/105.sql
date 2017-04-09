

ALTER VIEW [dbo].[View_Stores_Scan]
AS
SELECT        dbo.Stores_Scan.GardID, dbo.Stores_Scan.ScanDate, dbo.Stores_Scan.StoreID, dbo.Stores_Scan.ProunchID, dbo.Stores_Scan.COMP_ID, dbo.Stores.store_name, dbo.Stores_Scan_items.Item_Id, 
                         dbo.Items.Item_Name, dbo.Stores_Scan_items.TotalByHande, dbo.Stores_Scan_items.TotalByComputer, dbo.Stores_Scan_items.CalcCompAndHand, dbo.unit.unitname, dbo.Items.PartNo, 
                         dbo.Stores_Scan_items.ValDeff, dbo.Stores_Scan_items.PriceCome
FROM            dbo.Stores_Scan INNER JOIN
                         dbo.Stores_Scan_items ON dbo.Stores_Scan.GardID = dbo.Stores_Scan_items.GardID INNER JOIN
                         dbo.Items ON dbo.Stores_Scan_items.Item_Id = dbo.Items.Item_Id INNER JOIN
                         dbo.unit ON dbo.Items.Item_Unit_Id = dbo.unit.unitcode LEFT OUTER JOIN
                         dbo.Stores ON dbo.Stores_Scan.StoreID = dbo.Stores.store_id

GO


