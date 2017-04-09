

ALTER VIEW [dbo].[View_Check_Book]
AS
SELECT        dbo.Chek_Book.IDBookChek, dbo.Chek_Book.AccountNo, dbo.Chek_Book.BankID, dbo.Chek_Book.ChekNO, dbo.Chek_Book.chekdate, dbo.Chek_Book.person, dbo.Chek_Book.chekval, dbo.Chek_Book.dateout, 
                         dbo.Chek_Book.datedone, dbo.Chek_Book.chekstate, dbo.Chek_Book.datesarf, dbo.Chek_Book.note, dbo.Chek_Book.ProunchID, dbo.Chek_Book.COMP_ID, dbo.Chek_Book.customer_vendor_name, 
                         dbo.Chek_Book.Customer, dbo.Chek_Book.Vendor, dbo.Chek_Book.Masrofat, dbo.Chek_Book.Journal, dbo.Chek_Book.Journal2, dbo.BankAccountName.AccountName, dbo.Chek_Book.isfirst, 
                         dbo.Bank_Code.Bank_Name
FROM            dbo.BankAccountName INNER JOIN
                         dbo.Bank_Code ON dbo.BankAccountName.id_Bank = dbo.Bank_Code.id_Bank INNER JOIN
                         dbo.Chek_Book ON dbo.BankAccountName.AccountID = dbo.Chek_Book.BankID

GO


