

ALTER VIEW [dbo].[View_Letter_ChangeValue]
AS
SELECT        dbo.Letter_ChangeValue.ID, dbo.Letter_ChangeValue.Letter_ID, dbo.Letter_ChangeValue.Collateral_NO, dbo.Letter_ChangeValue.Notes, dbo.Letter_ChangeValue.ChangeDate, 
                         dbo.Letter_ChangeValue.commission, dbo.collateral.Collateral_AR, dbo.collateral.Collateral_EN, dbo.Letter_ChangeValue.insurance, dbo.Letter_of_Guarantee_Used.Collateral_ID, 
                         dbo.BankAccountName.AccountName, dbo.BankAccountName.AccountID, dbo.Letter_of_Guarantee_Used.Opration, dbo.Letter_of_Guarantee_Used.Collateral_Rat, dbo.Letter_of_Guarantee_Used.Collateral_Mony, 
                         dbo.Letter_of_Guarantee_Used.Date_Strat, dbo.Letter_of_Guarantee_Used.Date_End, dbo.Letter_ChangeValue.KaidID, dbo.Letter_ChangeValue.Journal, dbo.Letter_ChangeValue.OstazID, 
                         dbo.Letter_ChangeValue.CostID, dbo.Letter_ChangeValue.CurrnceID, dbo.Letter_ChangeValue.ActionDate, dbo.OstazCode.OstazName, dbo.TblCostTree.AccName, dbo.Curaunes.CurName, 
                         dbo.Letter_of_Guarantee_Used.Bank_ID, dbo.Letter_ChangeValue.NewValue, dbo.Letter_ChangeValue.Orginal_INS, dbo.Letter_ChangeValue.Orginal_Value
FROM            dbo.collateral INNER JOIN
                         dbo.Letter_of_Guarantee_Used ON dbo.collateral.ID = dbo.Letter_of_Guarantee_Used.Collateral_ID INNER JOIN
                         dbo.Letter_ChangeValue ON dbo.Letter_of_Guarantee_Used.ID = dbo.Letter_ChangeValue.Letter_ID INNER JOIN
                         dbo.BankAccountName ON dbo.Letter_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID LEFT OUTER JOIN
                         dbo.Curaunes ON dbo.Letter_ChangeValue.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Letter_ChangeValue.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Letter_ChangeValue.OstazID = dbo.OstazCode.OstazID

GO


