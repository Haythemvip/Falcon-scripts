 

ALTER VIEW [dbo].[VbyanService]
AS
SELECT        dbo.byan_item.InvoiceNo, dbo.byan_item.serialitem, dbo.byan_item.unit, dbo.byan_item.PriceOne, dbo.byan_item.Q, dbo.byan_item.TotalPrice, dbo.byan.idate, dbo.byan.ClientID, dbo.byan.aTotal, 
                         dbo.byan.aArabicTotal, dbo.byan.monycome, dbo.byan.monystill, dbo.byan.notes, dbo.byan.iyeer, dbo.byan.store_id, dbo.byan.flag, dbo.byan.ProunchID, dbo.byan.COMP_ID, dbo.byan.invtype, dbo.byan.Fright, 
                         dbo.byan.Descount, dbo.byan.Net, dbo.byan_item.SN, dbo.byan_item.itemid, dbo.byan_item.ITEMS_ITEM_NAME, dbo.customers.customer_name, dbo.byan.servicetype, dbo.byan.InvEznNo, dbo.byan.saletype, 
                         dbo.byan.dayname, 'Not Tax' AS TaxType, dbo.byan.Mandop_Name, dbo.byan.Journal, dbo.byan.MandopID
FROM            dbo.byan INNER JOIN
                         dbo.byan_item ON dbo.byan.InvoiceNo = dbo.byan_item.InvoiceNo INNER JOIN
                         dbo.customers ON dbo.byan.ClientID = dbo.customers.Customer_id
WHERE        (dbo.byan.store_id IS NULL) OR
                         (dbo.byan.store_id = 0)

GO


