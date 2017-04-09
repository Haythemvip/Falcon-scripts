

ALTER VIEW [dbo].[VinvoiceComeNoTax]
AS
SELECT dbo.invcomeNoTax.InvoiceNo, dbo.invcomeNoTax.idate, dbo.invcomeNoTax.ClientID, dbo.invcomeNoTax.aTotal, dbo.invcomeNoTax.Fright, dbo.invcomeNoTax.Descount, dbo.invcomeNoTax.aArabicTotal, 
                  dbo.invcomeNoTax.invtype, dbo.invcomeNoTax.monycome, dbo.invcomeNoTax.monystill, dbo.invcomeNoTax.notes, dbo.invcomeNoTax.iyeer, dbo.invcomeNoTax.store_id, dbo.invcomeNoTax.flag, 
                  dbo.invcomeNoTax.ProunchID, dbo.invcomeNoTax.COMP_ID, dbo.invcomeitemNoTax.serialitem, dbo.invcomeitemNoTax.itemid, dbo.invcomeitemNoTax.unit, dbo.invcomeitemNoTax.PriceOne, dbo.invcomeitemNoTax.Q, 
                  dbo.invcomeitemNoTax.TotalPrice, dbo.invcomeitemNoTax.SN, dbo.Stores.store_name, dbo.invcomeitemNoTax.ITEMS_ITEM_NAME, dbo.suppliers.suppliers_name, dbo.invcomeNoTax.net, dbo.Groups.groupname, 
                  dbo.invcomeNoTax.InooiceNOVender, dbo.invcomeNoTax.BeurchisingID, dbo.BerchisingType.BeurchisingTypeMoves, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, 
                  dbo.TasnefTogary.TradeType, dbo.Groups_Sub.subname, dbo.invcomeNoTax.InvEznNo, dbo.invcomeNoTax.EznEdafa, dbo.invcomeNoTax.EznEstekhrag, dbo.invcomeitemNoTax.ponas_percent, 
                  dbo.invcomeitemNoTax.ponsa_val, dbo.invcomeitemNoTax.descount_percent, dbo.invcomeitemNoTax.descount_val, dbo.invcomeitemNoTax.total_quantity, dbo.invcomeNoTax.Extra_Descount, 
                  dbo.Items.itm_print_barcode, dbo.invcomeitemNoTax.oparateno, dbo.Items.Barcode, dbo.invcomeNoTax.CollectedDate, dbo.invcomeNoTax.Tahseel, 'NoT Tax' AS TaxType, dbo.invcomeNoTax.Journal, 
                  dbo.Items.Item_Name
FROM     dbo.Stores INNER JOIN
                  dbo.invcomeNoTax INNER JOIN
                  dbo.invcomeitemNoTax ON dbo.invcomeNoTax.InvoiceNo = dbo.invcomeitemNoTax.InvoiceNo ON dbo.Stores.store_id = dbo.invcomeNoTax.store_id INNER JOIN
                  dbo.suppliers ON dbo.invcomeNoTax.ClientID = dbo.suppliers.suppliers_id INNER JOIN
                  dbo.Items ON dbo.invcomeitemNoTax.itemid = dbo.Items.Item_Id LEFT OUTER JOIN
                  dbo.Groups_Sub ON dbo.Items.Item_Gro_Id = dbo.Groups_Sub.subid LEFT OUTER JOIN
                  dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid LEFT OUTER JOIN
                  dbo.TasnefTogary ON dbo.Items.TradeTypeID = dbo.TasnefTogary.TradeTypeID LEFT OUTER JOIN
                  dbo.BerchisingType ON dbo.invcomeNoTax.BeurchisingID = dbo.BerchisingType.BeurchisingID

GO


