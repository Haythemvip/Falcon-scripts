 

ALTER VIEW [dbo].[V_Item_Card]
AS
SELECT        TOP (100) PERCENT dbo.Items.Item_Name, dbo.Stores.store_name, dbo.Item_Card.VenderOrCustomer, dbo.Item_Card.EznNO, dbo.Item_Card.InvNO, dbo.Item_Card.ActionDate, dbo.Item_Card.QCome, 
                         dbo.Item_Card.PriceCome, dbo.Item_Card.AllPriceCome, dbo.Item_Card.Qout, dbo.Item_Card.PriceOut, dbo.Item_Card.AllPriceOut, dbo.Item_Card.CostAllItemOut, dbo.Item_Card.VallItemsInStores, 
                         dbo.Item_Card.Maksab, dbo.Item_Card.store_id, dbo.Item_Card.Item_Id, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.unit.unitcode, dbo.unit.unitname, dbo.Item_Card.Year, 
                         dbo.Groups.groupname, dbo.Groups_Sub.subname, dbo.Item_Card.ActionName, dbo.Items.priceCome AS ItemCost, dbo.Item_Card.Srial, dbo.Item_Card.TalabMowadINDEX, dbo.Item_Card.TalabMowadID, 
                         dbo.Item_Card.MoveType, dbo.Item_Card.SN, dbo.Items.Item_Unit_Id, dbo.Items.Item_unit2, dbo.Items.Item_unit3, dbo.Items.EqulUnit, dbo.Items.EqulUnit2, dbo.Items.UnitEqualed, dbo.Items.Barcode, 
                         dbo.Items.itm_code2, dbo.Items.CountInBox, dbo.Items.Thikness, dbo.Items.highet, dbo.Items.Width, unit_1.unitname AS UnitMedum, unit_2.unitname AS UnitSmall
FROM            dbo.Items INNER JOIN
                         dbo.Item_Card ON dbo.Items.Item_Id = dbo.Item_Card.Item_Id INNER JOIN
                         dbo.Stores ON dbo.Item_Card.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.unit ON dbo.Items.Item_Unit_Id = dbo.unit.unitcode LEFT OUTER JOIN
                         dbo.unit AS unit_2 ON dbo.Items.Item_unit3 = unit_2.unitcode LEFT OUTER JOIN
                         dbo.unit AS unit_1 ON dbo.Items.Item_unit2 = unit_1.unitcode LEFT OUTER JOIN
                         dbo.Groups_Sub ON dbo.Items.Item_Gro_Sub_Id = dbo.Groups_Sub.subid LEFT OUTER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid

GO


