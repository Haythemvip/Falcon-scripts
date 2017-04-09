 

ALTER VIEW [dbo].[vbyan_ezn]
AS
SELECT dbo.byan_item_ezn.InvoiceNo, dbo.byan_item_ezn.serialitem, dbo.byan_item_ezn.unit, dbo.byan_item_ezn.PriceOne, dbo.byan_item_ezn.Q, dbo.byan_item_ezn.TotalPrice, dbo.byan_ezn.idate, dbo.byan_ezn.ClientID, 
                  dbo.byan_ezn.aTotal, dbo.byan_ezn.aArabicTotal, dbo.byan_ezn.monycome, dbo.byan_ezn.monystill, dbo.byan_ezn.notes, dbo.byan_ezn.iyeer, dbo.byan_ezn.store_id, dbo.Stores.store_name, dbo.byan_ezn.flag, 
                  dbo.byan_ezn.ProunchID, dbo.byan_ezn.COMP_ID, dbo.byan_ezn.invtype, dbo.byan_ezn.Fright, dbo.byan_ezn.Descount, dbo.byan_ezn.Net, dbo.byan_item_ezn.SN, dbo.byan_item_ezn.itemid, 
                  dbo.byan_item_ezn.ITEMS_ITEM_NAME, dbo.customers.customer_name, dbo.Groups.groupname, dbo.byan_ezn.servicetype, dbo.byan_ezn.IsUsed, dbo.byan_ezn.Mandop_Name, dbo.byan_ezn.MandopID, 
                  dbo.byan_item_ezn.IsFast, dbo.byan_ezn.DocNo, dbo.byan_item_ezn.IsHold
FROM     dbo.Groups RIGHT OUTER JOIN
                  dbo.customers RIGHT OUTER JOIN
                  dbo.Stores RIGHT OUTER JOIN
                  dbo.byan_ezn INNER JOIN
                  dbo.byan_item_ezn ON dbo.byan_ezn.InvoiceNo = dbo.byan_item_ezn.InvoiceNo INNER JOIN
                  dbo.Items ON dbo.byan_item_ezn.itemid = dbo.Items.Item_Id ON dbo.Stores.store_id = dbo.byan_ezn.store_id ON dbo.customers.Customer_id = dbo.byan_ezn.ClientID ON dbo.Groups.groupid = dbo.Items.Item_Gro_Id

GO


