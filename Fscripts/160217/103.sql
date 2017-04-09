 

ALTER VIEW [dbo].[View_tblAccTree]
AS
SELECT TOP (100) PERCENT tblAccTree_1.AccCode AS F1, tblAccTree_1.AccName AS N1, tblAccTree_2.AccCode AS F2, tblAccTree_2.AccName AS N2, tblAccTree_3.AccCode AS F3, tblAccTree_3.AccName AS N3, 
                  tblAccTree_5.AccCode AS F4, tblAccTree_5.AccName AS N4, tblAccTree_6.AccCode AS F5, tblAccTree_6.AccName AS N5, tblAccTree_7.AccCode AS F6, tblAccTree_7.AccName AS N6, tblAccTree_4.AccLevel, 
                  tblAccTree_8.AccCode AS F7, tblAccTree_8.AccName AS N7, tblAccTree_9.AccCode AS F8, tblAccTree_9.AccName AS N8, tblAccTree_10.AccCode AS F9, tblAccTree_10.AccName AS N9, 
                  dbo.tblAccTree.AccCode AS F10, dbo.tblAccTree.AccName AS N10, tblAccTree_4.ParentID, tblAccTree_4.AccType, tblAccTree_4.ISmain, tblAccTree_4.MezanyaID, tblAccTree_4.ACC_Type_ID, tblAccTree_4.LongCode, 
                  dbo.Acc_Type_tree.Type_Name, dbo.FinalBalanceTypes.ClassificationId, dbo.FinalBalanceTypes.ClassificationName, dbo.Mezanya.Mezanya_Name, dbo.Account_Group.AccountGroup_ID, 
                  dbo.Account_Group.AccountGroup_Name, dbo.TblAccTreeAZ.AccCode, dbo.TblAccTreeAZ.AccName, dbo.TblAccTreeAZ.SortID, dbo.TblAccTreeAZ.AccName_En
FROM     dbo.Account_Group RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_4 INNER JOIN
                  dbo.TblAccTreeAZ ON tblAccTree_4.ID = dbo.TblAccTreeAZ.ID ON dbo.Account_Group.AccountGroup_ID = tblAccTree_4.AccountGroup_ID LEFT OUTER JOIN
                  dbo.FinalBalanceTypes ON tblAccTree_4.ClassificationId = dbo.FinalBalanceTypes.ClassificationId LEFT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_1 ON tblAccTree_4.ParentID = tblAccTree_1.ID LEFT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_7 LEFT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_10 LEFT OUTER JOIN
                  dbo.tblAccTree ON tblAccTree_10.ParentID = dbo.tblAccTree.ID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_9 ON tblAccTree_10.ID = tblAccTree_9.ParentID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_8 ON tblAccTree_9.ID = tblAccTree_8.ParentID ON tblAccTree_7.ParentID = tblAccTree_8.ID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_6 ON tblAccTree_7.ID = tblAccTree_6.ParentID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_5 ON tblAccTree_6.ID = tblAccTree_5.ParentID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_3 ON tblAccTree_5.ID = tblAccTree_3.ParentID RIGHT OUTER JOIN
                  dbo.tblAccTree AS tblAccTree_2 ON tblAccTree_3.ID = tblAccTree_2.ParentID ON tblAccTree_1.ParentID = tblAccTree_2.ID LEFT OUTER JOIN
                  dbo.Mezanya ON tblAccTree_4.MezanyaID = dbo.Mezanya.MezanyaID LEFT OUTER JOIN
                  dbo.Acc_Type_tree ON tblAccTree_4.ACC_Type_ID = dbo.Acc_Type_tree.ACC_Type_ID

GO


