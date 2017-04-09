 
ALTER VIEW [dbo].[VTree_Masroft_Bank]
AS
SELECT        dbo.Tree_Masroft_Bank.TaswyaID, dbo.Tree_Masroft_Bank.serial, dbo.Tree_Masroft_Bank.TaswyaDate, dbo.Tree_Masroft_Bank.TaswyaValue, dbo.Tree_Masroft_Bank.FromAccount, 
                         dbo.Tree_Masroft_Bank.ToAccount, dbo.tblAccTree.AccName, dbo.Tree_Masroft_Bank.IsToCost, dbo.Tree_Masroft_Bank.Notes, dbo.Tree_Masroft_Bank.Journal, dbo.Tree_Masroft_Bank.CostID, 
                         dbo.TblCostTree.ShortCode, dbo.TblCostTree.AccName AS Costname, dbo.Tree_Masroft_Bank.Not1, dbo.Tree_Masroft_Bank.DayName, dbo.Tree_Masroft_Bank.Doc_No, dbo.BankAccountName.AccountName, 
                         dbo.Tree_Masroft_Bank.Acccode2, dbo.Tree_Masroft_Bank.AccName2, dbo.Tree_Masroft_Bank.ToTree, dbo.Tree_Masroft_Bank.ToCust, dbo.Tree_Masroft_Bank.Tobank, dbo.Tree_Masroft_Bank.ToVender, 
                         dbo.Tree_Masroft_Bank.ToSolfa, dbo.Tree_Masroft_Bank.ToOhda, dbo.Tree_Masroft_Bank.HeadNote, dbo.Tree_Masroft_Bank.ToBox, dbo.Tree_Masroft_Bank.CaseID, dbo.Tree_Masroft_Bank.CaseName, 
                         dbo.Tree_Masroft_Bank.ChekDueDate, dbo.Tree_Masroft_Bank.IsChedk
FROM            dbo.Tree_Masroft_Bank INNER JOIN
                         dbo.tblAccTree ON dbo.Tree_Masroft_Bank.ToAccount = dbo.tblAccTree.AccCode INNER JOIN
                         dbo.BankAccountName ON dbo.Tree_Masroft_Bank.FromAccount = dbo.BankAccountName.AccountID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Tree_Masroft_Bank.CostID = dbo.TblCostTree.AccCode

GO


