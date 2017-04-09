 

ALTER VIEW [dbo].[View_Documentary_of_Extend]
AS
SELECT        dbo.Documentary_of_Extend.ID, dbo.Documentary_of_Extend.Letter_ID, dbo.Documentary_of_Extend.Collateral_NO, dbo.Documentary_of_Extend.Notes, dbo.Documentary_of_Extend.Date_Strat, 
                         dbo.Documentary_of_Extend.Date_End, dbo.Documentary_of_Extend.commission, dbo.Documentary.Collateral_AR, dbo.Documentary.Collateral_EN, dbo.Documentary_of_Guarantee_Used.Collateral_Value, 
                         dbo.Documentary_of_Extend.KaidID, dbo.Documentary_of_Extend.Journal, dbo.Documentary_of_Extend.OstazID, dbo.Documentary_of_Extend.CostID, dbo.Documentary_of_Extend.CurrnceID, 
                         dbo.Documentary_of_Extend.ActionDate, dbo.Documentary_of_Guarantee_Used.Bank_ID, dbo.BankAccountName.AccountID, dbo.BankAccountName.Bank_Name, dbo.Curaunes.CurName, 
                         dbo.TblCostTree.AccName, dbo.Documentary_of_Guarantee_Used.Collateral_Rat, dbo.Documentary_of_Guarantee_Used.Collateral_Mony, dbo.Documentary_of_Guarantee_Used.Date_Strat AS Expr1, 
                         dbo.Documentary_of_Guarantee_Used.Date_End AS Expr2
FROM            dbo.Documentary INNER JOIN
                         dbo.Documentary_of_Guarantee_Used ON dbo.Documentary.ID = dbo.Documentary_of_Guarantee_Used.Collateral_ID INNER JOIN
                         dbo.Documentary_of_Extend ON dbo.Documentary_of_Guarantee_Used.ID = dbo.Documentary_of_Extend.Letter_ID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Documentary_of_Extend.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.Curaunes ON dbo.Documentary_of_Extend.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.BankAccountName ON dbo.Documentary_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID

GO


