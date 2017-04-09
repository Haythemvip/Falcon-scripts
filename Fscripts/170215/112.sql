 
ALTER VIEW [dbo].[vbyan]
AS
SELECT        TOP (100) PERCENT dbo.byan_item.InvoiceNo, dbo.byan_item.serialitem, dbo.byan_item.unit, dbo.byan_item.PriceOne, dbo.byan_item.Q, dbo.byan_item.TotalPrice, dbo.byan.idate, dbo.byan.ClientID, 
                         dbo.byan.aTotal, dbo.byan.aArabicTotal, dbo.byan.monycome, dbo.byan.monystill, dbo.byan.notes, dbo.byan.iyeer, dbo.byan.store_id, dbo.Stores.store_name, dbo.byan.flag, dbo.byan.ProunchID, 
                         dbo.byan.COMP_ID, dbo.byan.invtype, dbo.byan.Fright, dbo.byan.Descount, dbo.byan.Net, dbo.byan_item.SN, dbo.byan_item.itemid, dbo.byan_item.ITEMS_ITEM_NAME, dbo.customers.customer_name, 
                         dbo.Groups.groupname, dbo.byan.servicetype, dbo.byan.InvEznNo, dbo.byan_item.Bonas, dbo.byan_item.despecent, dbo.byan_item.AllQuantity, dbo.Items.Item_Name, dbo.Items.Item_Name_AR, 
                         dbo.byan_item.ItemDescount, dbo.customers.address, dbo.byan.Descount_Percent, dbo.byan_item.ItemMaksab, dbo.byan_item.DefaltCost, dbo.byan_item.ItemCost, dbo.Items.StorePlace, dbo.Items.Waigt, 
                         dbo.byan_item.CostId, dbo.TblCostTree.AccName, dbo.TblCostTree.ShortCode, dbo.byan_item.oparateno, dbo.byan.saletype, dbo.Items.Tax, dbo.byan.Mandop_Name, 'Not Tax' AS TaxType, 
                         dbo.Items.itm_print_barcode, dbo.byan_item.rased, dbo.byan.Journal, dbo.Items.PriceFexed, dbo.Items.itm_ismedicine, dbo.byan_item.Bounas, dbo.byan_item.Unit_Quantity, dbo.byan_item.Unit_Price, 
                         dbo.byan_item.Defualt_ItemCost, dbo.byan_item.UnitCost, dbo.byan_item.Unit_Balance, dbo.byan_item.Rate, dbo.byan_item.CostAllItemOut, dbo.byan_item.maksap, dbo.byan_item.SaleUnitID, 
                         dbo.byan.InvTime, dbo.byan.MandopID, dbo.byan.Cash, dbo.byan.CardValue, dbo.byan.Tips, dbo.byan.BoxID, dbo.byan.DocNo, dbo.byan.DriverName, dbo.Items.Barcode, dbo.byan.ExtraMoney_Percent, 
                         dbo.byan.ExtraMoney_Value, dbo.byan.ProjectID, dbo.byan.ExtractCount, dbo.byan.CollectedJournal, dbo.byan.Isal_NO, dbo.byan.Isal_Vale, dbo.byan.Defrent_Collect, dbo.byan.dayname, dbo.byan.TaxDes, 
                         dbo.byan.TaxDoc, dbo.byan.UserColletMony, dbo.byan.BankName, dbo.byan.ChekNO, dbo.byan.ChekDate, dbo.byan.SuplayDate, dbo.byan.Fallowdate, dbo.byan.Tahseel, dbo.byan.TahseelNote, 
                         dbo.byan.tahseldate, dbo.byan.Isused
FROM            dbo.Groups RIGHT OUTER JOIN
                         dbo.TblCostTree RIGHT OUTER JOIN
                         dbo.Items INNER JOIN
                         dbo.byan_item ON dbo.Items.Item_Id = dbo.byan_item.itemid INNER JOIN
                         dbo.customers INNER JOIN
                         dbo.byan INNER JOIN
                         dbo.Stores ON dbo.byan.store_id = dbo.Stores.store_id ON dbo.customers.Customer_id = dbo.byan.ClientID ON dbo.byan_item.InvoiceNo = dbo.byan.InvoiceNo ON 
                         dbo.TblCostTree.AccCode = dbo.byan_item.CostId ON dbo.Groups.groupid = dbo.Items.Item_Gro_Id

GO


