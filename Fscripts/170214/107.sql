 

ALTER VIEW [dbo].[View_Documentary_of_Guarantee_Used]
AS
SELECT        dbo.Documentary_of_Guarantee_Used.ID, dbo.Documentary_of_Guarantee_Used.Collateral_ID, dbo.Documentary_of_Guarantee_Used.Collateral_NO, dbo.Documentary_of_Guarantee_Used.Opration, 
                         dbo.Documentary_of_Guarantee_Used.Collateral_Value, dbo.Documentary_of_Guarantee_Used.Collateral_Rat, dbo.Documentary_of_Guarantee_Used.Collateral_Mony, 
                         dbo.Documentary_of_Guarantee_Used.Notes, dbo.Documentary_of_Guarantee_Used.Date_Strat, dbo.Documentary_of_Guarantee_Used.Date_End, dbo.Documentary_of_Guarantee_Used.commission, 
                         dbo.Documentary.Collateral_AR, dbo.Documentary.Collateral_EN, dbo.BankAccountName.AccountID, dbo.BankAccountName.AccountName, dbo.Documentary_of_Guarantee_Used.KaidID, 
                         dbo.Documentary_of_Guarantee_Used.Journal, dbo.Documentary_of_Guarantee_Used.OstazID, dbo.Documentary_of_Guarantee_Used.CostID, dbo.Documentary_of_Guarantee_Used.CurrnceID, 
                         dbo.Documentary_of_Guarantee_Used.ActionDate, dbo.Documentary_of_Guarantee_Used.JournalEnd, dbo.Documentary_of_Guarantee_Used.KIdIDEnd, dbo.Documentary_of_Guarantee_Used.NewValue, 
                         dbo.Documentary_of_Guarantee_Used.NewINs, dbo.Documentary_of_Guarantee_Used.VendorID, dbo.Curaunes.CurName, dbo.TblCostTree.AccName, dbo.OstazCode.OstazName, dbo.suppliers.suppliers_name, 
                         dbo.Documentary.ID AS LetterTypeID
FROM            dbo.Documentary_of_Guarantee_Used INNER JOIN
                         dbo.Documentary ON dbo.Documentary_of_Guarantee_Used.Collateral_ID = dbo.Documentary.ID INNER JOIN
                         dbo.BankAccountName ON dbo.Documentary_of_Guarantee_Used.Bank_ID = dbo.BankAccountName.AccountID LEFT OUTER JOIN
                         dbo.suppliers ON dbo.Documentary_of_Guarantee_Used.VendorID = dbo.suppliers.suppliers_id LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Documentary_of_Guarantee_Used.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Documentary_of_Guarantee_Used.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                         dbo.Curaunes ON dbo.Documentary_of_Guarantee_Used.CurrnceID = dbo.Curaunes.CurID

GO


