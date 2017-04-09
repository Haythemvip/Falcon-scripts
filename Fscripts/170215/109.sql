 
ALTER VIEW [dbo].[View_Loan_Used]
AS
SELECT        dbo.Loan_Used.ID, dbo.Loan_Used.Collateral_ID, dbo.Loan_Used.Collateral_NO, dbo.Loan_Used.Opration, dbo.Loan_Used.Collateral_Value, dbo.Loan_Used.Collateral_Rat, dbo.Loan_Used.Collateral_Mony, 
                         dbo.Loan_Used.Notes, dbo.Loan_Used.Date_Strat, dbo.Loan_Used.Date_End, dbo.Loan_Used.commission, dbo.collateral.Collateral_AR, dbo.collateral.Collateral_EN, dbo.BankAccountName.AccountID, 
                         dbo.BankAccountName.AccountName, dbo.Loan_Used.KaidID, dbo.Loan_Used.Journal, dbo.Loan_Used.OstazID, dbo.Loan_Used.CostID, dbo.Loan_Used.CurrnceID, dbo.Loan_Used.ActionDate, 
                         dbo.Curaunes.CurName, dbo.TblCostTree.AccName, dbo.OstazCode.OstazName, dbo.Loan_Used.JournalEnd, dbo.Loan_Used.KIdIDEnd, dbo.Loan_Used.NewValue, dbo.Loan_Used.NewINs, 
                         dbo.Loan_Used.ProjectID, dbo.Tenders_Add.TheName, dbo.Loan_Used.VedorID, dbo.suppliers.suppliers_name, dbo.collateral.ID AS LetterTypeID
FROM            dbo.Loan_Used INNER JOIN
                         dbo.collateral ON dbo.Loan_Used.Collateral_ID = dbo.collateral.ID INNER JOIN
                         dbo.BankAccountName ON dbo.Loan_Used.Bank_ID = dbo.BankAccountName.AccountID INNER JOIN
                         dbo.Curaunes ON dbo.Loan_Used.CurrnceID = dbo.Curaunes.CurID LEFT OUTER JOIN
                         dbo.suppliers ON dbo.Loan_Used.VedorID = dbo.suppliers.suppliers_id LEFT OUTER JOIN
                         dbo.Tenders_Add ON dbo.Loan_Used.ProjectID = dbo.Tenders_Add.ID LEFT OUTER JOIN
                         dbo.OstazCode ON dbo.Loan_Used.OstazID = dbo.OstazCode.OstazID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Loan_Used.CostID = dbo.TblCostTree.AccCode

GO


