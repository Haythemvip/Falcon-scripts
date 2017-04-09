

ALTER VIEW [dbo].[V_Mardodat_invoiceComeNoTax]
AS
SELECT        dbo.Mardodat_Invoice_Com_NotTax.InvoiceNo, dbo.Mardodat_Invoice_Com_NotTax.idate, dbo.Mardodat_Invoice_Com_NotTax.ClientID, dbo.Mardodat_Invoice_Com_NotTax.aTotal, 
                         dbo.Mardodat_Invoice_Com_NotTax.Fright, dbo.Mardodat_Invoice_Com_NotTax.Descount, dbo.Mardodat_Invoice_Com_NotTax.aArabicTotal, dbo.Mardodat_Invoice_Com_NotTax.invtype, 
                         dbo.Mardodat_Invoice_Com_NotTax.monycome, dbo.Mardodat_Invoice_Com_NotTax.monystill, dbo.Mardodat_Invoice_Com_NotTax.notes, dbo.Mardodat_Invoice_Com_NotTax.iyeer, 
                         dbo.Mardodat_Invoice_Com_NotTax.store_id, dbo.Mardodat_Invoice_Com_NotTax.flag, dbo.Mardodat_Invoice_Com_NotTax.ProunchID, dbo.Mardodat_Invoice_Com_NotTax.COMP_ID, 
                         dbo.Mardodat_Invoice_Com_NotTax_Items.serialitem, dbo.Mardodat_Invoice_Com_NotTax_Items.itemid, dbo.Mardodat_Invoice_Com_NotTax_Items.unit, dbo.Mardodat_Invoice_Com_NotTax_Items.PriceOne, 
                         dbo.Mardodat_Invoice_Com_NotTax_Items.Q, dbo.Mardodat_Invoice_Com_NotTax_Items.TotalPrice, dbo.Mardodat_Invoice_Com_NotTax_Items.SN, dbo.Stores.store_name, 
                         dbo.Mardodat_Invoice_Com_NotTax_Items.ITEMS_ITEM_NAME, dbo.suppliers.suppliers_name, dbo.Mardodat_Invoice_Com_NotTax.net, dbo.Groups.groupname, 
                         dbo.Mardodat_Invoice_Com_NotTax.InooiceNOVender, dbo.Mardodat_Invoice_Com_NotTax.BeurchisingID, dbo.BerchisingType.BeurchisingTypeMoves, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, 
                         dbo.Items.TradeTypeID, dbo.TasnefTogary.TradeType, dbo.Groups_Sub.subname, dbo.Mardodat_Invoice_Com_NotTax.InvEznNo, dbo.Mardodat_Invoice_Com_NotTax.EznEdafa, 
                         dbo.Mardodat_Invoice_Com_NotTax.EznEstekhrag, dbo.Mardodat_Invoice_Com_NotTax_Items.ponas_percent, dbo.Mardodat_Invoice_Com_NotTax_Items.ponsa_val, 
                         dbo.Mardodat_Invoice_Com_NotTax_Items.descount_percent, dbo.Mardodat_Invoice_Com_NotTax_Items.descount_val, dbo.Mardodat_Invoice_Com_NotTax_Items.total_quantity, 
                         dbo.Mardodat_Invoice_Com_NotTax.Journal, dbo.Mardodat_Invoice_Com_NotTax.BoxID
FROM            dbo.Stores INNER JOIN
                         dbo.Mardodat_Invoice_Com_NotTax INNER JOIN
                         dbo.Mardodat_Invoice_Com_NotTax_Items ON dbo.Mardodat_Invoice_Com_NotTax.InvoiceNo = dbo.Mardodat_Invoice_Com_NotTax_Items.InvoiceNo ON 
                         dbo.Stores.store_id = dbo.Mardodat_Invoice_Com_NotTax.store_id INNER JOIN
                         dbo.suppliers ON dbo.Mardodat_Invoice_Com_NotTax.ClientID = dbo.suppliers.suppliers_id INNER JOIN
                         dbo.Items ON dbo.Mardodat_Invoice_Com_NotTax_Items.itemid = dbo.Items.Item_Id INNER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid INNER JOIN
                         dbo.TasnefTogary ON dbo.Items.TradeTypeID = dbo.TasnefTogary.TradeTypeID INNER JOIN
                         dbo.Groups_Sub ON dbo.Items.Item_Gro_Id = dbo.Groups_Sub.subid LEFT OUTER JOIN
                         dbo.BerchisingType ON dbo.Mardodat_Invoice_Com_NotTax.BeurchisingID = dbo.BerchisingType.BeurchisingID

GO


