

ALTER VIEW [dbo].[V_Bank_Accounts]
AS
SELECT        dbo.Bank_Accounts.id, dbo.Bank_Accounts.year, dbo.Bank_Accounts.actionname, dbo.Bank_Accounts.invno_ormony_id, dbo.Bank_Accounts.movedate, dbo.Bank_Accounts.maden, dbo.Bank_Accounts.daen, 
                         dbo.BankAccountName.AccountName, dbo.BankAccountName.Bank_Name, dbo.BankAccountName.Bank_Location, dbo.Bank_Accounts.venderid, dbo.Bank_Accounts.Notes, dbo.BankAccountName.id_Bank, 
                         dbo.Bank_Accounts.CurID, dbo.Bank_Accounts.TiketNO, dbo.BankAccountName.COMP_ID, dbo.BankAccountName.ProunchID, 0 AS raseed, dbo.Bank_Accounts.Journal
FROM            dbo.BankAccountName INNER JOIN
                         dbo.Bank_Accounts ON dbo.BankAccountName.AccountID = dbo.Bank_Accounts.venderid

GO


