 

CREATE VIEW [dbo].[View_Letter_of_Extend]
AS
SELECT        dbo.Letter_of_Extend.ID, dbo.Letter_of_Extend.Letter_ID, dbo.Letter_of_Extend.Collateral_NO, dbo.Letter_of_Extend.Notes, dbo.Letter_of_Extend.Date_Strat, dbo.Letter_of_Extend.Date_End, 
                         dbo.Letter_of_Extend.commission, dbo.collateral.Collateral_AR, dbo.collateral.Collateral_EN, dbo.Letter_of_Guarantee_Used.Collateral_Value, dbo.Letter_of_Extend.KaidID, dbo.Letter_of_Extend.Journal, 
                         dbo.Letter_of_Extend.OstazID, dbo.Letter_of_Extend.CostID, dbo.Letter_of_Extend.CurrnceID, dbo.Letter_of_Extend.ActionDate, dbo.TblCostTree.AccName, dbo.BankAccountName.AccountName, 
                         dbo.Letter_of_Guarantee_Used.Bank_ID, dbo.OstazCode.OstazName, dbo.Curaunes.CurName
FROM            dbo.collateral INNER JOIN
                         dbo.Letter_of_Guarantee_Used ON dbo.collateral.ID = dbo.Letter_of_Guarantee_Used.Collateral_ID INNER JOIN
                         dbo.BankAccountName ON dbo.Letter_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID INNER JOIN
                         dbo.Letter_of_Extend ON dbo.Letter_of_Guarantee_Used.ID = dbo.Letter_of_Extend.Letter_ID LEFT OUTER JOIN
                         dbo.Curaunes ON dbo.Letter_of_Extend.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Letter_of_Extend.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Letter_of_Extend.CostID = dbo.TblCostTree.AccCode

GO

 
