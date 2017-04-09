

ALTER VIEW [dbo].[vcustomeraccount]
AS
SELECT        TOP (100) PERCENT dbo.customer_account.id, dbo.customer_account.venderid, dbo.customer_account.year, dbo.customer_account.actionname, dbo.customer_account.invno_ormony_id, 
                         dbo.customer_account.movedate, dbo.customer_account.maden, dbo.customer_account.daen, dbo.customers.customer_name, dbo.customer_account.CuttingWillBake, dbo.customer_account.CuttingNotBack, 
                         dbo.customer_account.COMP_ID, dbo.customer_account.ProunchID, dbo.customers.Mcid, dbo.MainCustomer.CustomerName AS CustomerMain, dbo.customer_account.Notes, dbo.customers.MAndopID, 
                         dbo.customers.CityID, dbo.City.CityName, dbo.customer_account.Detail, dbo.customer_account.Detail2, dbo.customer_account.Taxes, dbo.customer_account.Stamps, dbo.customer_account.Others, 
                         dbo.customer_account.ChekNet, dbo.customer_account.CurID, dbo.customer_account.Mandob_ID, dbo.customer_account.Descount, dbo.customer_emp.PercentVaue, dbo.customer_emp.MandopName, 
                         0 AS raseed, dbo.customer_account.CaseID, dbo.customer_account.CaseName, dbo.customer_account.Journal
FROM            dbo.customer_account INNER JOIN
                         dbo.customers ON dbo.customer_account.venderid = dbo.customers.Customer_id LEFT OUTER JOIN
                         dbo.customer_emp ON dbo.customer_account.Mandob_ID = dbo.customer_emp.MAndopID LEFT OUTER JOIN
                         dbo.City ON dbo.customers.CityID = dbo.City.CityID LEFT OUTER JOIN
                         dbo.MainCustomer ON dbo.customers.Mcid = dbo.MainCustomer.Mcid

GO


