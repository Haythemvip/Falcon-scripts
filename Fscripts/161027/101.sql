 
ALTER VIEW [dbo].[VinvoiceOutService]
AS
SELECT        dbo.invoiceoutitem.InvoiceNo, dbo.invoiceoutitem.serialitem, dbo.invoiceoutitem.unit, dbo.invoiceoutitem.PriceOne, dbo.invoiceoutitem.Q, dbo.invoiceoutitem.TotalPrice, dbo.invoiceout.idate, 
                         dbo.invoiceout.ClientID, dbo.invoiceoutitem.itemid, dbo.invoiceout.aTotal, dbo.invoiceout.saltax, dbo.invoiceout.generaltax, dbo.invoiceout.net, dbo.invoiceout.aArabicTotal, dbo.invoiceout.monycome, 
                         dbo.invoiceout.monystill, dbo.invoiceout.notes, dbo.invoiceout.Fright, dbo.invoiceout.Descount, dbo.invoiceout.invtype, dbo.invoiceout.iyeer, dbo.invoiceout.store_id, dbo.invoiceout.flag, 
                         dbo.invoiceout.ProunchID, dbo.invoiceoutitem.SN, dbo.invoiceoutitem.ITEMS_ITEM_NAME, dbo.customers.customer_name, dbo.invoiceout.servicetype, dbo.invoiceout.COMP_ID, dbo.invoiceout.Tahseel, 
                         dbo.invoiceout.TahseelNote, dbo.invoiceout.tahseldate, dbo.invoiceout.InvEznNo, dbo.customer_contact.contact_person, dbo.customer_contact.mobile, dbo.customers.address, dbo.invoiceoutitem.Itemtax, 
                         dbo.invoiceoutitem.Valitemtax, dbo.invoiceout.Extra_Tax, 'Tax' AS TaxType, dbo.invoiceout.Mandop_Name, dbo.invoiceout.Journal, dbo.invoiceout.MandopID
FROM            dbo.invoiceout INNER JOIN
                         dbo.invoiceoutitem ON dbo.invoiceout.InvoiceNo = dbo.invoiceoutitem.InvoiceNo INNER JOIN
                         dbo.customers ON dbo.invoiceout.ClientID = dbo.customers.Customer_id LEFT OUTER JOIN
                         dbo.customer_contact ON dbo.invoiceout.Contact_ID = dbo.customer_contact.Contact_ID

GO


