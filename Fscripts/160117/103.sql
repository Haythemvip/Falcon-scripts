 
ALTER VIEW [dbo].[vinvoicecome]
AS
SELECT dbo.invcomeitem.InvoiceNo, dbo.invcomeitem.serialitem, dbo.invcomeitem.unit, dbo.invcomeitem.PriceOne, dbo.invcomeitem.Q, dbo.invcomeitem.TotalPrice, dbo.invcome.idate, dbo.invcome.ClientID, dbo.invcome.aTotal, 
                  dbo.invcome.aArabicTotal, dbo.invcome.invtype, dbo.invcome.monycome, dbo.invcome.monystill, dbo.invcome.notes, dbo.invcome.saltax, dbo.invcome.generaltax, dbo.invcome.Fright, dbo.invcome.Descount, 
                  dbo.invcome.net, dbo.invcome.iyeer, dbo.invcome.store_id, dbo.invcome.flag, dbo.invcome.ProunchID, dbo.invcome.COMP_ID, dbo.Stores.store_name, dbo.invcomeitem.itemid, dbo.invcomeitem.SN, 
                  dbo.invcomeitem.ITEMS_ITEM_NAME, dbo.suppliers.suppliers_name, dbo.Groups.groupname, dbo.invcome.InooiceNOVender, dbo.BerchisingType.BeurchisingTypeMoves, dbo.Items.Item_Gro_Sub_Id, 
                  dbo.Items.TradeTypeID, dbo.Items.Item_Gro_Id, dbo.invcome.InvEznNo, dbo.invcome.EznEdafa, dbo.invcome.EznEstekhrag, dbo.Items.Barcode, dbo.invcomeitem.Itemtax, dbo.invcomeitem.Valitemtax, 
                  dbo.invcomeitem.descount_percent, dbo.invcomeitem.descount_val, dbo.invcome.CollectedDate, dbo.invcome.Tahseel, dbo.invcome.Extra_Tax, 'Tax' AS TaxType, dbo.invcome.Journal, dbo.Items.Item_Name, 
                  dbo.Items.Item_Name_AR
FROM     dbo.Items INNER JOIN
                  dbo.invcome INNER JOIN
                  dbo.invcomeitem ON dbo.invcome.InvoiceNo = dbo.invcomeitem.InvoiceNo INNER JOIN
                  dbo.Stores ON dbo.invcome.store_id = dbo.Stores.store_id INNER JOIN
                  dbo.suppliers ON dbo.invcome.ClientID = dbo.suppliers.suppliers_id ON dbo.Items.Item_Id = dbo.invcomeitem.itemid LEFT OUTER JOIN
                  dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid LEFT OUTER JOIN
                  dbo.TasnefTogary ON dbo.Items.TradeTypeID = dbo.TasnefTogary.TradeTypeID LEFT OUTER JOIN
                  dbo.Groups_Sub ON dbo.Items.Item_Gro_Sub_Id = dbo.Groups_Sub.subid LEFT OUTER JOIN
                  dbo.BerchisingType ON dbo.invcome.BeurchisingID = dbo.BerchisingType.BeurchisingID

GO


