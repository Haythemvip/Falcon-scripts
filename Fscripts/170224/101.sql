 
ALTER VIEW [dbo].[VmachineTasleem]
AS
SELECT        dbo.emp.emp_name, dbo.machinelist.depart_id, dbo.machinelist.depart_name, dbo.machinelist.machinename, dbo.machinelist.Balad, dbo.machinelist.machinemodel, dbo.machinelist.machinedate, 
                         dbo.machinelist.Mcolre, dbo.machinelist.Counterfirst, dbo.machinelist.Chaseh, dbo.machinelist.Motor, dbo.machinelist.Loha, dbo.machinelist.MachineValeu, dbo.machinelist.BrDate, dbo.machinelist.Vendorname, 
                         dbo.machinelist.Payway, dbo.machinelist.Estmarah, dbo.machinelist.EsdarEstmarahdate, dbo.machinelist.EsdarEstmarah, dbo.machinelist.EndDateEstmara, dbo.machinelist.TameenNO, 
                         dbo.machinelist.TameenEsdar, dbo.machinelist.Tameenco, dbo.machinelist.EndTamendate, dbo.machinelist.MCode, dbo.Taslem_Machine.ID, dbo.Taslem_Machine.Counterfirst AS Expr1, 
                         dbo.Taslem_Machine.DateTasleem
FROM            dbo.emp INNER JOIN
                         dbo.Taslem_Machine ON dbo.emp.emp_code = dbo.Taslem_Machine.emp_code INNER JOIN
                         dbo.machinelist ON dbo.Taslem_Machine.machiinedi = dbo.machinelist.machiinedi

GO


