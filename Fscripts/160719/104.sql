 
ALTER VIEW [dbo].[vvenderaccount]
AS
SELECT        dbo.venderaccount.id, dbo.venderaccount.year, dbo.venderaccount.actionname, dbo.venderaccount.invno_ormony_id, dbo.venderaccount.movedate, dbo.venderaccount.maden, dbo.venderaccount.daen, 
                         dbo.venderaccount.venderid, dbo.suppliers.suppliers_name, dbo.venderaccount.Notes, dbo.venderaccount.COMP_ID, dbo.venderaccount.ProunchID, dbo.venderaccount.Invcomno, dbo.venderaccount.Taxes, 
                         dbo.venderaccount.Stamps, dbo.venderaccount.Others, dbo.venderaccount.ChekNet, dbo.venderaccount.CurID, 0 AS Raseed, dbo.venderaccount.CaseID, dbo.venderaccount.CaseName, 
                         dbo.venderaccount.Journal, dbo.suppliers.SuppTypeID, dbo.SuppType.TypeName, dbo.venderaccount.DocNo
FROM            dbo.suppliers INNER JOIN
                         dbo.venderaccount ON dbo.suppliers.suppliers_id = dbo.venderaccount.venderid INNER JOIN
                         dbo.SuppType ON dbo.suppliers.SuppTypeID = dbo.SuppType.SuppTypeID

GO


