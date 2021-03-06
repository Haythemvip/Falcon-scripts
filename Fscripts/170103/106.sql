
ALTER VIEW [dbo].[View_ShipingBill]
AS
SELECT        dbo.ShipingBill.ShipingID, dbo.ShipingBill.Shiping_Bill_Date, dbo.ShipingBill.Expected_date_arrival, dbo.ShipingBill.Actual_arrival_date, dbo.ShipingBill.Shipping_date, dbo.ShipingBill.ShippingPortID, 
                         dbo.ShipingBill.Place_Shipping, dbo.ShipingBill.DeliveryNO, dbo.ShipingBill.Delivery_Date, dbo.ShipingBill.Customs_Declaration, dbo.ShipingBill.CustomsDeclarationdate, dbo.ShipingBill.Numberportservices, 
                         dbo.ShipingBill.DateServives, dbo.ShipingBill.Guarantee_check, dbo.ShipingBill.Insurance, dbo.ShipingBill.Customs_Duties, dbo.ShipingBill.DateofPayment, dbo.ShipingBill.ContainerType, 
                         dbo.ShipingBill.ContainerKind, dbo.ShipingBill.Container_Size, dbo.ShipingBill.Other_Truck_note, dbo.ShipingBill.Quantity, dbo.ShipingBill.Exemption, dbo.ShipingBill.Storage_Fees, 
                         dbo.ShipingBill.Shipping_Cost, dbo.ShipingBill.Wages_discharge, dbo.ShipingBill.Bill, dbo.ShipingBill.Certificate_Origin, dbo.ShipingBill.Health_Certificate, dbo.ShipingBill.SpecificationList, 
                         dbo.ShipingBill.Other, dbo.ShipingBill.Othernote, dbo.ShipingBill.BillNumber, dbo.ShipingBill.CustomsBondNo, dbo.ShipingBill.BillDate, dbo.ShipingBill.Amount, dbo.ShipingBill.NoticeNumber, 
                         dbo.ShipingBill.NoticeDate, dbo.ShipingBill.ExpirationPaymentDate, dbo.ShipingBill.Exportingcompany, dbo.ShipingBill.General_Notes, dbo.ShipingBill.Transport_OrderID, dbo.ShipingBill.ShiperName, 
                         dbo.ShipingBill.ShiperID, dbo.ShipingBill.ConsigneeName, dbo.ShipingBill.ConsigneeAddress, dbo.ShipingBill.ConsigneeID_Iqama, dbo.ShipingBill.ConsigneeCity, dbo.ShipingBill.ConsigneePhone, 
                         dbo.ShipingBill.ConsigneeID, dbo.ShipingBill.BillShiper, dbo.ShipingBill.Express, dbo.ShipingBill.BillConSiqner, dbo.ShipingBill.InsuranceService, dbo.ShipingBill.Note, dbo.ShipingBill.ReceiptNo, 
                         dbo.Shiping_Details.ShipingDetailsID, dbo.Shiping_Details.Type_goods, dbo.Shiping_Details.Unit, dbo.Shiping_Details.Weight, dbo.Shiping_Details.DetailsIindex, 
                         dbo.customers.customer_name AS Consignee_Name, dbo.Ports.Ports_Name, dbo.ShipingBill.ReceverName2, dbo.ShipingBill.ReceverAdd2, dbo.ShipingBill.ReceverPhone2, dbo.ShipingBill.VesselNO
FROM            dbo.customers INNER JOIN
                         dbo.ShipingBill INNER JOIN
                         dbo.Shiping_Details ON dbo.ShipingBill.ShipingID = dbo.Shiping_Details.ShipingID ON dbo.customers.Customer_id = dbo.ShipingBill.ShiperID INNER JOIN
                         dbo.Ports ON dbo.ShipingBill.ShippingPortID = dbo.Ports.PortsID

GO


