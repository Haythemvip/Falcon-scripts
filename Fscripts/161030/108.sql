 

ALTER VIEW [dbo].[V_Amr_Sheraa]
AS
SELECT        dbo.Amr_Sheraa.performa_id, dbo.Amr_Sheraa.Customer_id, dbo.Amr_Sheraa.contactcmb, dbo.Amr_Sheraa.performa_date, dbo.Amr_Sheraa.intro, dbo.Amr_Sheraa.performa_date_end, 
                         dbo.Amr_Sheraa.payment_termes, dbo.Amr_Sheraa.delivery_termes, dbo.Amr_Sheraa.delivery_place, dbo.Amr_Sheraa.shipping_type, dbo.Amr_Sheraa.sales_tax, dbo.Amr_Sheraa.general_tax, 
                         dbo.Amr_Sheraa.notes, dbo.Amr_Sheraa.total, dbo.Amr_Sheraa.net, dbo.Amr_Sheraa.performaonly, dbo.Amr_Sheraa.user_id AS UserName, dbo.Amr_Sheraa.action_date, dbo.Amr_Sheraa.flag, 
                         dbo.Amr_Sheraa.idmandop, dbo.Amr_Sheraa.ProunchID, dbo.Amr_Sheraa.COMP_ID, dbo.Amr_Sheraa_Item.serial, dbo.Amr_Sheraa_Item.item_name, dbo.Amr_Sheraa_Item.price, dbo.Amr_Sheraa_Item.unit, 
                         dbo.Amr_Sheraa_Item.quantity, dbo.Amr_Sheraa_Item.total AS totalitem, dbo.Amr_Sheraa_Item.ConstControl, dbo.Amr_Sheraa_Item.ConstControlStart, dbo.Amr_Sheraa_Item.ConstControlStartEnd, 
                         dbo.Amr_Sheraa_Item.ConstControlNOtes, dbo.Amr_Sheraa_Item.ProjectManeger, dbo.Amr_Sheraa_Item.ProjectManegerStart, dbo.Amr_Sheraa_Item.ProjectManegerEnd, 
                         dbo.Amr_Sheraa_Item.ProjectManegerNOtes, dbo.Amr_Sheraa_Item.ExcutiveManager, dbo.Amr_Sheraa_Item.ExcutiveManagerStart, dbo.Amr_Sheraa_Item.ExcutiveManagerEnd, 
                         dbo.Amr_Sheraa_Item.ExcutiveManagerNotes, dbo.Amr_Sheraa_Item.Accont, dbo.Amr_Sheraa_Item.AccontStart, dbo.Amr_Sheraa_Item.AccontEnd, dbo.Amr_Sheraa_Item.AccontNotes, dbo.Amr_Sheraa_Item.Gm, 
                         dbo.Amr_Sheraa_Item.GmStart, dbo.Amr_Sheraa_Item.GmEnd, dbo.Amr_Sheraa_Item.GmNotes, dbo.Amr_Sheraa_Item.BurchaseDate, dbo.Amr_Sheraa.order_no, dbo.Amr_Sheraa.OrderNotes, 
                         dbo.TblCostTree.AccName, dbo.Amr_Sheraa_Item.mohla, dbo.Amr_Sheraa_Item.DateNeed, dbo.suppliers.address AS supaddress, dbo.suppliers.phone AS suppphone, dbo.suppliers.fax AS supfax, 
                         dbo.suppliers.mobile AS supmopile, dbo.suppliers.email AS supmail, dbo.Amr_Sheraa.PO_NO, dbo.Amr_Sheraa.Inqury_Ref, dbo.Amr_Sheraa.Discount, dbo.Tenders_Consalts.TheName, 
                         dbo.Tenders_Consalts.Mail AS consaltmail, dbo.Tenders_Consalts.Adress AS consaladdress, dbo.Tenders_Consalts.Phone AS consaltphone, dbo.City.CityName, dbo.Amr_Sheraa.ProjectID, 
                         dbo.Tenders_Add.TheName AS Project_Name, dbo.Amr_Sheraa.DepartID, dbo.Amr_Sheraa.depart_name, dbo.departments.depart_name AS ArDepart, dbo.departments.EnglishName AS EnDepart, 
                         dbo.Tenders_Add.EnName AS ENTender, dbo.Amr_Sheraa.customername, dbo.suppliers.suppliers_name, dbo.suppliers.Supplier_Name_EN, dbo.Items.Item_Name_AR, dbo.Items.Item_Name AS Item_Name_EN, 
                         dbo.Tender_Tech.CityID, dbo.Tender_Tech.TendeID, dbo.Amr_Sheraa.Rate, dbo.Amr_Sheraa.PurchaseTypeID, dbo.Amr_Sheraa.ContactPesonID, dbo.Amr_Sheraa.ContactMobile, 
                         dbo.Amr_Sheraa.ContactMial
FROM            dbo.City RIGHT OUTER JOIN
                         dbo.TblCostTree RIGHT OUTER JOIN
                         dbo.departments RIGHT OUTER JOIN
                         dbo.Items INNER JOIN
                         dbo.Amr_Sheraa INNER JOIN
                         dbo.Amr_Sheraa_Item ON dbo.Amr_Sheraa.performa_id = dbo.Amr_Sheraa_Item.performa_id INNER JOIN
                         dbo.suppliers ON dbo.Amr_Sheraa.Customer_id = dbo.suppliers.suppliers_id ON dbo.Items.Item_Id = dbo.Amr_Sheraa_Item.ItemCode ON dbo.departments.depart_id = dbo.Amr_Sheraa.DepartID ON 
                         dbo.TblCostTree.AccCode = dbo.Amr_Sheraa_Item.CostID LEFT OUTER JOIN
                         dbo.Tender_Tech LEFT OUTER JOIN
                         dbo.Tenders_Consalts ON dbo.Tender_Tech.Tenders_ConsaltsID = dbo.Tenders_Consalts.ID ON dbo.Amr_Sheraa.ProjectID = dbo.Tender_Tech.TendeID ON 
                         dbo.City.CityID = dbo.Tender_Tech.CityID LEFT OUTER JOIN
                         dbo.Tenders_Add ON dbo.Amr_Sheraa.ProjectID = dbo.Tenders_Add.ID

GO


