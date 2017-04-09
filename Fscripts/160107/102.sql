

ALTER VIEW [dbo].[View_CostItemBudget]
AS
SELECT dbo.CostItemsBudget.GroupID, dbo.CostItemsBudget.SupID, dbo.CostItemsBudget.CostID, dbo.CostItemsBudget.Budget, dbo.CostItemsBudget.DateAdd, dbo.CostItemsBudget.UserAdd, dbo.CostItemsBudget.year, 
                  dbo.Groups.groupname, dbo.Groups_Sub.subname, dbo.TblCostTree.AccName
FROM     dbo.CostItemsBudget LEFT OUTER JOIN
                  dbo.TblCostTree ON dbo.CostItemsBudget.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                  dbo.Groups ON dbo.CostItemsBudget.GroupID = dbo.Groups.groupid LEFT OUTER JOIN
                  dbo.Groups_Sub ON dbo.CostItemsBudget.SupID = dbo.Groups_Sub.subid

GO


