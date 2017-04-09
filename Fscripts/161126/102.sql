 
ALTER VIEW [dbo].[VTaswyaMony_Emp]
AS
SELECT        dbo.TaswyaMony_Emp.TaswyaID, dbo.TaswyaMony_Emp.serial, dbo.TaswyaMony_Emp.TaswyaDate, dbo.TaswyaMony_Emp.TaswyaValue, dbo.TaswyaMony_Emp.FromAccount, dbo.emp.emp_name, 
                         dbo.TaswyaMony_Emp.ToAccount, dbo.tblAccTree.AccName, dbo.TaswyaMony_Emp.Journal, dbo.TaswyaMony_Emp.Notes, dbo.TaswyaMony_Emp.Cust, dbo.TaswyaMony_Emp.Vender, 
                         dbo.TaswyaMony_Emp.Tree, dbo.TaswyaMony_Emp.AccountName, dbo.TaswyaMony_Emp.solfa, dbo.TaswyaMony_Emp.CostId, dbo.TblCostTree.AccName AS costname, dbo.TblCostTree.ShortCode, 
                         dbo.TaswyaMony_Emp.DocNO, dbo.TaswyaMony_Emp.DayName, dbo.TaswyaMony_Emp.Tobank, dbo.TaswyaMony_Emp.Acccode2, dbo.TaswyaMony_Emp.AccName2, dbo.TaswyaMony_Emp.toohda, 
                         dbo.TaswyaMony_Emp.ToBox, dbo.TaswyaMony_Emp.CaseID, dbo.TaswyaMony_Emp.CaseName, dbo.TaswyaMonyEmpHead.HeadNote
FROM            dbo.TaswyaMony_Emp INNER JOIN
                         dbo.emp ON dbo.TaswyaMony_Emp.FromAccount = dbo.emp.emp_code INNER JOIN
                         dbo.TaswyaMonyEmpHead ON dbo.TaswyaMony_Emp.TaswyaID = dbo.TaswyaMonyEmpHead.TaswyaID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.TaswyaMony_Emp.CostId = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.tblAccTree ON dbo.TaswyaMony_Emp.ToAccount = dbo.tblAccTree.AccCode

GO


