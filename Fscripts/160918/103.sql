

ALTER VIEW dbo.View_Due_Vection
AS
SELECT
  Due_Vection.ID
 ,Due_Vection.Emp_Name
 ,Due_Vection.Jop
 ,Due_Vection.Bare_Cod
 ,Due_Vection.Nationalty
 ,Due_Vection.Sec_Name
 ,Due_Vection.Bisc_Salary
 ,Due_Vection.Allawonce
 ,Due_Vection.Total_Salary
 ,Due_Vection.Tickt
 ,Due_Vection.ContractPiod
 ,Due_Vection.LaveDate
 ,Due_Vection.LastComBak
 ,Due_Vection.WorkDayes
 ,Due_Vection_Items.Coli
 ,Due_Vection_Items.ColAmount
 ,Due_Vection_Items.Colst1
 ,Due_Vection_Items.Colst2
 ,Due_Vection.net
 ,Due_Vection.Net_Arabic
 ,Due_Vection.LaveDate2
FROM dbo.Due_Vection
INNER JOIN dbo.Due_Vection_Items
  ON Due_Vection.ID = Due_Vection_Items.ID
GO

