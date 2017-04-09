
ALTER VIEW [dbo].[vcustomers]
AS
SELECT        dbo.customers.Customer_id, dbo.customers.customer_name, dbo.customers.address, dbo.customers.phone, dbo.customers.fax, dbo.customers.mobile, dbo.customers.site, dbo.customers.scope, 
                         dbo.customer_contact.serial, dbo.customer_contact.contact_person, dbo.customer_contact.titel_job, dbo.customer_contact.mobile AS pmobile, dbo.customer_contact.phone AS pphone, 
                         dbo.customer_contact.email AS pmail, dbo.customer_contact.department, dbo.customers.flag, dbo.customers.ntes, dbo.customers.user_id, dbo.customers.TypeCode, dbo.customers_types.TypeName, 
                         dbo.customers.action_date, dbo.customers.Mcid, dbo.MainCustomer.CustomerName, dbo.customers.CityID, dbo.City.CityName, dbo.customers.COMP_ID, dbo.customers.ProunchID, dbo.customers.custtime, 
                         dbo.customers.custVacaiotn, dbo.customers.Taxstate, dbo.customers.paystate, dbo.customers.waypay, dbo.customers.custlevel, dbo.customers.TahseelModa, customer_emp_1.UserID, 
                         dbo.customers.Customer_Name_EN, dbo.customers.Short_Name_Ar, dbo.customers.Limet_money, dbo.customers.Short_Name_EN, dbo.Customer_Mandop.SuperFaizerID AS SuperFizer, 
                         dbo.customer_emp.MandopName, customer_emp_1.MandopName AS SuperFizerName, dbo.Customer_Mandop.MandopID, dbo.customers.Nationality, dbo.customers.brth_date, dbo.customers.TreeCode, 
                         dbo.customers.TreeName, dbo.customers.OperatorID, dbo.Operators.Operator_Name, dbo.Operators.Operator_Phone, dbo.Operators.ID_NO, dbo.customers.ID_Date_End, dbo.customers.ID_From, 
                         dbo.customers.ID_Number, dbo.customers.Mokadama, dbo.customers.Mokadama_Name, dbo.customers.Mo7tagazat_Name, dbo.customers.Mo7tagazat, dbo.customers.Dman, dbo.customers.Dman_Name, 
                         dbo.customers.IBAN_NO, dbo.customers.BankName, dbo.customers.EMail
FROM            dbo.Operators RIGHT OUTER JOIN
                         dbo.customers ON dbo.Operators.OperatorID = dbo.customers.OperatorID LEFT OUTER JOIN
                         dbo.customer_emp INNER JOIN
                         dbo.Customer_Mandop ON dbo.customer_emp.MAndopID = dbo.Customer_Mandop.MandopID INNER JOIN
                         dbo.customer_emp AS customer_emp_1 ON dbo.Customer_Mandop.SuperFaizerID = customer_emp_1.MAndopID ON dbo.customers.Customer_id = dbo.Customer_Mandop.CustID LEFT OUTER JOIN
                         dbo.City ON dbo.customers.CityID = dbo.City.CityID LEFT OUTER JOIN
                         dbo.MainCustomer ON dbo.customers.Mcid = dbo.MainCustomer.Mcid LEFT OUTER JOIN
                         dbo.customer_contact ON dbo.customers.Customer_id = dbo.customer_contact.Customer_id LEFT OUTER JOIN
                         dbo.customers_types ON dbo.customers.TypeCode = dbo.customers_types.TypeCode

GO


