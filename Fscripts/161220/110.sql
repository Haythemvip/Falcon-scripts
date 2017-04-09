 
CREATE VIEW [dbo].[View_Documentary_ChangeValue]
AS
SELECT        dbo.Documentary_ChangeValue.ID, dbo.Documentary_ChangeValue.Letter_ID, dbo.Documentary_ChangeValue.Collateral_NO, dbo.Documentary_ChangeValue.Notes, dbo.Documentary_ChangeValue.ChangeDate,
                          dbo.Documentary_ChangeValue.commission, dbo.Documentary.Collateral_AR, dbo.Documentary.Collateral_EN, dbo.Documentary_of_Guarantee_Used.Collateral_Value, dbo.Bank_Code.Bank_Name, 
                         dbo.Documentary_ChangeValue.NewValue, dbo.Documentary_ChangeValue.insurance
FROM            dbo.Documentary_ChangeValue INNER JOIN
                         dbo.Documentary_of_Guarantee_Used ON dbo.Documentary_ChangeValue.ID = dbo.Documentary_of_Guarantee_Used.ID INNER JOIN
                         dbo.Documentary ON dbo.Documentary_of_Guarantee_Used.Collateral_ID = dbo.Documentary.ID INNER JOIN
                         dbo.Bank_Code ON dbo.Documentary_of_Guarantee_Used.Bank_ID = dbo.Bank_Code.id_Bank

GO


