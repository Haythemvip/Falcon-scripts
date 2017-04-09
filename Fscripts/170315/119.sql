

ALTER VIEW [dbo].[VTree_Makbodat_Bank]
AS
SELECT        dbo.Tree_Makbodat_Bank.TaswyaID, dbo.Tree_Makbodat_Bank.serial, dbo.Tree_Makbodat_Bank.TaswyaDate, dbo.Tree_Makbodat_Bank.TaswyaValue, dbo.Tree_Makbodat_Bank.FromAccount, 
                         dbo.Tree_Makbodat_Bank.ToAccount, dbo.tblAccTree.AccName, dbo.Tree_Makbodat_Bank.IsToCost, dbo.Tree_Makbodat_Bank.Notes, dbo.Tree_Makbodat_Bank.Journal, dbo.Tree_Makbodat_Bank.CostID, 
                         dbo.TblCostTree.ShortCode, dbo.TblCostTree.AccName AS Costname, dbo.Tree_Makbodat_Bank.Not1, dbo.Tree_Makbodat_Bank.DayName, dbo.Tree_Makbodat_Bank.Doc_No, 
                         dbo.BankAccountName.AccountName, dbo.Tree_Makbodat_Bank.Acccode2, dbo.Tree_Makbodat_Bank.AccName2, dbo.Tree_Makbodat_Bank.ToTree, dbo.Tree_Makbodat_Bank.ToCust, 
                         dbo.Tree_Makbodat_Bank.Tobank, dbo.Tree_Makbodat_Bank.ToVender, dbo.Tree_Makbodat_Bank.ToSolfa, dbo.Tree_Makbodat_Bank.ToOhda, dbo.Tree_Makbodat_Bank.HeadNote, 
                         dbo.Tree_Makbodat_Bank.ToBox, dbo.Tree_Makbodat_Bank.CaseID, dbo.Tree_Makbodat_Bank.CaseName, dbo.Tree_Makbodat_Bank.ChekDueDate, dbo.Tree_Makbodat_Bank.IsChedk
FROM            dbo.Tree_Makbodat_Bank INNER JOIN
                         dbo.tblAccTree ON dbo.Tree_Makbodat_Bank.ToAccount = dbo.tblAccTree.AccCode INNER JOIN
                         dbo.BankAccountName ON dbo.Tree_Makbodat_Bank.FromAccount = dbo.BankAccountName.AccountID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Tree_Makbodat_Bank.CostID = dbo.TblCostTree.AccCode

GO


