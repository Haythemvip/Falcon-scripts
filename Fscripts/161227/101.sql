 
ALTER VIEW [dbo].[V_Mardodat_byan]
AS
SELECT        dbo.Mardodat_Byan_items.InvoiceNo, dbo.Mardodat_Byan_items.serialitem, dbo.Mardodat_Byan_items.unit, dbo.Mardodat_Byan_items.PriceOne, dbo.Mardodat_Byan_items.Q, 
                         dbo.Mardodat_Byan_items.TotalPrice, dbo.Mardodat_Byan.idate, dbo.Mardodat_Byan.ClientID, dbo.Mardodat_Byan.aTotal, dbo.Mardodat_Byan.aArabicTotal, dbo.Mardodat_Byan.monycome, 
                         dbo.Mardodat_Byan.monystill, dbo.Mardodat_Byan.notes, dbo.Mardodat_Byan.iyeer, dbo.Mardodat_Byan.store_id, dbo.Stores.store_name, dbo.Mardodat_Byan.flag, dbo.Mardodat_Byan.ProunchID, 
                         dbo.Mardodat_Byan.COMP_ID, dbo.Mardodat_Byan.invtype, dbo.Mardodat_Byan.Fright, dbo.Mardodat_Byan.Descount, dbo.Mardodat_Byan.Net, dbo.Mardodat_Byan_items.SN, 
                         dbo.Mardodat_Byan_items.itemid, dbo.Mardodat_Byan_items.ITEMS_ITEM_NAME, dbo.customers.customer_name, dbo.Groups.groupname, dbo.Mardodat_Byan.servicetype, dbo.Mardodat_Byan.InvEznNo, 
                         dbo.Mardodat_Byan_items.Bonas, dbo.Mardodat_Byan_items.despecent, dbo.Mardodat_Byan_items.AllQuantity, dbo.Mardodat_Byan_items.ItemDescount, dbo.Items.Item_Name, 
                         dbo.Mardodat_Byan_items.ItemCost, dbo.Mardodat_Byan_items.ItemMaksab, dbo.Mardodat_Byan_items.DefaltCost, dbo.Mardodat_Byan.Mandop_Name AS MandopName, dbo.Mardodat_Byan.Journal, 
                         dbo.Items.Barcode, dbo.Mardodat_Byan.BoxID, dbo.Mardodat_Byan.MandopID
FROM            dbo.customers INNER JOIN
                         dbo.Mardodat_Byan INNER JOIN
                         dbo.Mardodat_Byan_items ON dbo.Mardodat_Byan.InvoiceNo = dbo.Mardodat_Byan_items.InvoiceNo INNER JOIN
                         dbo.Stores ON dbo.Mardodat_Byan.store_id = dbo.Stores.store_id INNER JOIN
                         dbo.Items INNER JOIN
                         dbo.Groups ON dbo.Items.Item_Gro_Id = dbo.Groups.groupid ON dbo.Mardodat_Byan_items.itemid = dbo.Items.Item_Id ON dbo.customers.Customer_id = dbo.Mardodat_Byan.ClientID

GO


