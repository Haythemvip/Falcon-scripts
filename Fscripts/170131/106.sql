 

CREATE VIEW [dbo].[View_Loan_Extend]
AS
SELECT        dbo.Loan_Extend.ID, dbo.Loan_Extend.Letter_ID, dbo.Loan_Extend.Collateral_NO, dbo.Loan_Extend.Notes, dbo.Loan_Extend.Date_Strat, dbo.Loan_Extend.Date_End, 
                         dbo.Loan_Extend.commission, dbo.collateral.Collateral_AR, dbo.collateral.Collateral_EN, dbo.Letter_of_Guarantee_Used.Collateral_Value, dbo.Loan_Extend.KaidID, dbo.Loan_Extend.Journal, 
                         dbo.Loan_Extend.OstazID, dbo.Loan_Extend.CostID, dbo.Loan_Extend.CurrnceID, dbo.Loan_Extend.ActionDate, dbo.TblCostTree.AccName, dbo.BankAccountName.AccountName, 
                         dbo.Letter_of_Guarantee_Used.Bank_ID, dbo.OstazCode.OstazName, dbo.Curaunes.CurName
FROM            dbo.collateral INNER JOIN
                         dbo.Letter_of_Guarantee_Used ON dbo.collateral.ID = dbo.Letter_of_Guarantee_Used.Collateral_ID INNER JOIN
                         dbo.BankAccountName ON dbo.Letter_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID INNER JOIN
                         dbo.Loan_Extend ON dbo.Letter_of_Guarantee_Used.ID = dbo.Loan_Extend.Letter_ID LEFT OUTER JOIN
                         dbo.Curaunes ON dbo.Loan_Extend.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Loan_Extend.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Loan_Extend.CostID = dbo.TblCostTree.AccCode

;

 

GO


