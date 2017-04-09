 

ALTER VIEW [dbo].[View_Form_BusinessTravel]
AS
SELECT        dbo.jobs.jname, dbo.Form_BusinessTravel.ID, dbo.Form_BusinessTravel.EmpCode, dbo.Form_BusinessTravel.EmpName, dbo.Form_BusinessTravel.FromPlace, dbo.Form_BusinessTravel.ToPlace, 
                         dbo.Form_BusinessTravel.FromDate, dbo.Form_BusinessTravel.Todate, dbo.Form_BusinessTravel.Days, dbo.Form_BusinessTravel.Stay, dbo.Form_BusinessTravel.Deposit, 
                         dbo.Form_BusinessTravel.DepositTo, dbo.Form_BusinessTravel.OutAndBack, dbo.Form_BusinessTravel.Internal, dbo.Form_BusinessTravel.Other, dbo.Form_BusinessTravel.Notes, 
                         dbo.Form_Business_Items.JopsDescripe, dbo.departments.depart_name, dbo.emp.IqamaID
FROM            dbo.Form_Business_Items INNER JOIN
                         dbo.Form_BusinessTravel ON dbo.Form_Business_Items.ID = dbo.Form_BusinessTravel.ID INNER JOIN
                         dbo.jobs INNER JOIN
                         dbo.emp ON dbo.jobs.jobid = dbo.emp.jobid ON dbo.Form_BusinessTravel.EmpCode = dbo.emp.emp_code INNER JOIN
                         dbo.departments ON dbo.emp.depart_id = dbo.departments.depart_id

GO


