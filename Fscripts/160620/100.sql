

ALTER VIEW [dbo].[Vitemrased]
AS
SELECT        dbo.Items.Item_Id, dbo.Items.Item_Name, dbo.Items.aNotes, dbo.Items.flag, dbo.Items.price, dbo.Items.gomla, dbo.Items.MINQ, dbo.Items.Item_Unit_Id, dbo.Items.EqulUnit, dbo.Items.UnitEqualed, 
                         dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.Items.FixPrice, dbo.Items.MaxQ, dbo.Items.Tax, dbo.Items.HameshRebh, dbo.Item_Card.ActionDate, dbo.Items.Pic, 
                         dbo.Items.UserName, dbo.Items.ProunchID, dbo.Items.COMP_ID, dbo.Items.Barcode, dbo.Item_Card.store_id, dbo.Stores.store_name, dbo.Items.PartNo, dbo.unit.unitname, dbo.Items.DescountPercent, 
                         dbo.Item_Card.QCome, dbo.Item_Card.Qout, dbo.Item_Card.Year, dbo.Item_Card.PriceCome, dbo.Items.priceCome AS ItemPriceCome, dbo.Items.itm_code2, dbo.Items.Width, dbo.Items.highet, 
                         dbo.Items.CountInBox
FROM            dbo.Stores INNER JOIN
                         dbo.Item_Card ON dbo.Stores.store_id = dbo.Item_Card.store_id INNER JOIN
                         dbo.Items ON dbo.Item_Card.Item_Id = dbo.Items.Item_Id LEFT OUTER JOIN
                         dbo.unit ON dbo.Items.Item_Unit_Id = dbo.unit.unitcode

GO


