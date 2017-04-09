

ALTER VIEW [dbo].[View_WayBill]
AS
SELECT        dbo.WayBill.WaybillID, dbo.WayBill.date, dbo.WayBill.UserID, dbo.WayBill.LoadingPoint, dbo.WayBill.LoadSeaport, dbo.WayBill.LoadTerminal, dbo.WayBill.LoadWhouse, dbo.WayBill.LoadAirport, 
                         dbo.WayBill.ArrivalPoint, dbo.WayBill.ArrivalSeaport, dbo.WayBill.ArrivalTerminal, dbo.WayBill.ArrivalWhouse, dbo.WayBill.ArrivalAirport, dbo.WayBill.CustomerID, dbo.WayBill.Quantity, 
                         dbo.WayBill.ReceivedID, dbo.WayBill.CarrierID, dbo.WayBill.ShipmentID, dbo.WayBill.TruckNumber, dbo.WayBill.DriverID, dbo.WayBill.TransportAmount, dbo.WayBill.Demurrage, dbo.WayBill.Other, 
                         dbo.WayBill.SubTotal, dbo.WayBill.LoadArrivalDate, dbo.WayBill.LoadArrivalTime, dbo.WayBill.LoadDepartureDate, dbo.WayBill.LoadDepartureTime, dbo.WayBill.DeliveryArrivalDate, 
                         dbo.WayBill.DeliveryArrivalTime, dbo.WayBill.DeliveryunLoadingDate, dbo.WayBill.DeliveryunLoadingTime, dbo.Users.UserName, dbo.customers.customer_name, 
                         customers_1.customer_name AS Recceiver_Name, dbo.emp.emp_name, dbo.customers.address, dbo.customers.phone, dbo.customers.mobile, customers_1.address AS Raddress, 
                         customers_1.phone AS Rphone, customers_1.mobile AS Rmobile, dbo.CHarg_CO.customer_name AS CarGo_Name, dbo.CHarg_CO.Customer_id AS CarGo_ID, dbo.CHarg_CO.address AS CarGo_Address, 
                         dbo.CHarg_CO.mobile AS CarGo_Mobile, dbo.CHarg_CO.phone AS CarGo_Phone
FROM            dbo.WayBill INNER JOIN
                         dbo.ShipmentData ON dbo.WayBill.WaybillID = dbo.ShipmentData.WaybillID INNER JOIN
                         dbo.Users ON dbo.WayBill.UserID = dbo.Users.UserID INNER JOIN
                         dbo.customers ON dbo.WayBill.CustomerID = dbo.customers.Customer_id INNER JOIN
                         dbo.customers AS customers_1 ON dbo.WayBill.ReceivedID = customers_1.Customer_id INNER JOIN
                         dbo.emp ON dbo.WayBill.DriverID = dbo.emp.emp_code LEFT OUTER JOIN
                         dbo.CHarg_CO ON dbo.WayBill.CarrierID = dbo.CHarg_CO.Customer_id LEFT OUTER JOIN
                         dbo.Load_Report ON dbo.WayBill.WaybillID = dbo.Load_Report.WaybillID LEFT OUTER JOIN
                         dbo.Arrival_Report ON dbo.WayBill.WaybillID = dbo.Arrival_Report.WaybillID

GO


