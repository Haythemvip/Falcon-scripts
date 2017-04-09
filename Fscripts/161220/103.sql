 

CREATE VIEW [dbo].[View_Letter_of_Guarantee_Used]
AS
SELECT        dbo.Letter_of_Guarantee_Used.ID, dbo.Letter_of_Guarantee_Used.Collateral_ID, dbo.Letter_of_Guarantee_Used.Collateral_NO, dbo.Letter_of_Guarantee_Used.Opration, 
                         dbo.Letter_of_Guarantee_Used.Collateral_Value, dbo.Letter_of_Guarantee_Used.Collateral_Rat, dbo.Letter_of_Guarantee_Used.Collateral_Mony, dbo.Letter_of_Guarantee_Used.Notes, 
                         dbo.Letter_of_Guarantee_Used.Date_Strat, dbo.Letter_of_Guarantee_Used.Date_End, dbo.Letter_of_Guarantee_Used.commission, dbo.collateral.Collateral_AR, dbo.collateral.Collateral_EN, 
                         dbo.BankAccountName.AccountID, dbo.BankAccountName.AccountName, dbo.Letter_of_Guarantee_Used.KaidID, dbo.Letter_of_Guarantee_Used.Journal, dbo.Letter_of_Guarantee_Used.OstazID, 
                         dbo.Letter_of_Guarantee_Used.CostID, dbo.Letter_of_Guarantee_Used.CurrnceID, dbo.Letter_of_Guarantee_Used.ActionDate, dbo.Curaunes.CurName, dbo.TblCostTree.AccName, dbo.OstazCode.OstazName, 
                         dbo.Letter_of_Guarantee_Used.JournalEnd, dbo.Letter_of_Guarantee_Used.KIdIDEnd, dbo.Letter_of_Guarantee_Used.NewValue, dbo.Letter_of_Guarantee_Used.NewINs
FROM            dbo.Letter_of_Guarantee_Used INNER JOIN
                         dbo.collateral ON dbo.Letter_of_Guarantee_Used.Collateral_ID = dbo.collateral.ID INNER JOIN
                         dbo.BankAccountName ON dbo.Letter_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID INNER JOIN
                         dbo.Curaunes ON dbo.Letter_of_Guarantee_Used.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Letter_of_Guarantee_Used.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Letter_of_Guarantee_Used.CostID = dbo.TblCostTree.AccCode

GO
