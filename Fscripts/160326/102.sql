 

CREATE VIEW [dbo].[View_Due_Vection]
AS
    SELECT  dbo.Due_Vection.ID ,
            dbo.Due_Vection.Emp_Name ,
            dbo.Due_Vection.Jop ,
            dbo.Due_Vection.Bare_Cod ,
            dbo.Due_Vection.Nationalty ,
            dbo.Due_Vection.Sec_Name ,
            dbo.Due_Vection.Bisc_Salary ,
            dbo.Due_Vection.Allawonce ,
            dbo.Due_Vection.Total_Salary ,
            dbo.Due_Vection.Tickt ,
            dbo.Due_Vection.ContractPiod ,
            dbo.Due_Vection.LaveDate ,
            dbo.Due_Vection.LastComBak ,
            dbo.Due_Vection.WorkDayes ,
            dbo.Due_Vection_Items.Coli ,
            dbo.Due_Vection_Items.ColAmount ,
            dbo.Due_Vection_Items.Colst1 ,
            dbo.Due_Vection_Items.Colst2
    FROM    dbo.Due_Vection
            INNER JOIN dbo.Due_Vection_Items ON dbo.Due_Vection.ID = dbo.Due_Vection_Items.ID

GO
