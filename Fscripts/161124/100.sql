 
ALTER VIEW [dbo].[Vchart]
AS
SELECT        dbo.chartaccount.id, dbo.chartaccount.actionname, dbo.chartaccount.invno_ormony_id, dbo.chartaccount.movedate, dbo.chartaccount.maden, dbo.chartaccount.daen, dbo.chartaccount.year, 
                         dbo.chartaccount.venderid, dbo.tblAccTree.AccName, dbo.tblAccTree.AccCode, dbo.chartaccount.COMP_ID, dbo.chartaccount.ProunchID, dbo.tblAccTree.ParentID, dbo.chartaccount.Notes, dbo.chartaccount.ACCID, 
                         dbo.chartaccount.ACC_Name, dbo.chartaccount.Detail, dbo.chartaccount.CuttingWillBake, dbo.chartaccount.ACCID2, dbo.chartaccount.ACC_Name2, dbo.chartaccount.Detail2, dbo.chartaccount.CuttingNotBack, 
                         dbo.tblAccTree.LongCode, dbo.chartaccount.CurID, 0 AS Raseed
FROM            dbo.chartaccount INNER JOIN
                         dbo.tblAccTree ON dbo.chartaccount.venderid = dbo.tblAccTree.AccCode

GO


