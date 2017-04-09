 
ALTER VIEW [dbo].[Vitems]
AS
SELECT        dbo.Items.Item_Id, dbo.unit.unitname, dbo.Groups.groupname, dbo.Groups_Sub.subname, dbo.Items.Item_Name, dbo.Items.aNotes, dbo.Items.flag, dbo.Items.price, dbo.Items.gomla, dbo.Items.MINQ, 
                         dbo.Items.Item_Unit_Id, dbo.Items.EqulUnit, dbo.Items.UnitEqualed, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.Items.FixPrice, dbo.Items.MaxQ, dbo.Items.Tax, 
                         dbo.Items.HameshRebh, dbo.Items.actiondate, dbo.Items.Pic, dbo.Items.UserName, dbo.Items.ProunchID, dbo.Items.COMP_ID, dbo.Items.Barcode, dbo.TasnefTogary.TradeType, dbo.Items.PriceFexed, 
                         dbo.Items.priceCome, dbo.Items.hgomla, dbo.Items.PartNo, dbo.Items.hmonaksat, dbo.Items.pricemonaksat, dbo.Items.hbig, dbo.Items.pricbig, dbo.Items.hmedum, dbo.Items.pricemedum, dbo.Items.hlow, 
                         dbo.Items.pricelow, dbo.Items.Item_unit2, dbo.Items.Item_unit3, dbo.Items.Item_Name_AR, dbo.Items.itm_request_limit, dbo.Items.EqulUnit2, unit_1.unitname AS midelunit, unit_2.unitname AS smallunit, 
                         dbo.Items.itm_ismedicine, dbo.Items.itm_code2, dbo.Items.DescountPercent, dbo.Items.PonasPercent, dbo.Items.com_id, dbo.Items.itm_com_code, dbo.Items.itm_sell_unit, dbo.MadeCompany.com_name_ar, 
                         unit_3.unitname AS SellUnit, dbo.Items.itm_stop_sell, dbo.Items.itm_print_barcode, dbo.Items.StorePlace, dbo.Items.Waigt, dbo.Items.ChargDesc, dbo.Items.GomrokDesc, dbo.Items.GomrakFinshDesc, 
                         dbo.Items.OtherDesc, dbo.Items.OntherNameDesc, dbo.Items.Shehada, dbo.Items.OtherShehada, dbo.Items.Boxcost, dbo.Items.Tabkher, dbo.Items.InernalCharg, dbo.Items.Purchase, dbo.Items.Quntity_Price, 
                         dbo.Items.Width, dbo.Items.highet, dbo.Items.Thikness, dbo.Items.CountInBox, dbo.Items.ImagePha, dbo.Items.IsOffer
FROM            dbo.Groups INNER JOIN
                         dbo.Groups_Sub ON dbo.Groups.groupid = dbo.Groups_Sub.groupid RIGHT OUTER JOIN
                         dbo.Items ON dbo.Groups_Sub.subid = dbo.Items.Item_Gro_Sub_Id AND dbo.Groups.groupid = dbo.Items.Item_Gro_Id LEFT OUTER JOIN
                         dbo.unit ON dbo.Items.Item_Unit_Id = dbo.unit.unitcode LEFT OUTER JOIN
                         dbo.TasnefTogary ON dbo.Items.TradeTypeID = dbo.TasnefTogary.TradeTypeID LEFT OUTER JOIN
                         dbo.unit AS unit_3 ON dbo.Items.itm_sell_unit = unit_3.unitcode LEFT OUTER JOIN
                         dbo.MadeCompany ON dbo.Items.com_id = dbo.MadeCompany.com_id LEFT OUTER JOIN
                         dbo.unit AS unit_1 ON dbo.Items.Item_unit2 = unit_1.unitcode LEFT OUTER JOIN
                         dbo.unit AS unit_2 ON dbo.Items.Item_unit3 = unit_2.unitcode

GO


