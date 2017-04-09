 
ALTER VIEW [dbo].[talabatsheraa]
AS
SELECT dbo.purchase_order.order_no, dbo.purchase_order.order_date, dbo.purchase_order_item.serial, dbo.purchase_order_item.item, dbo.purchase_order_item.unit, dbo.purchase_order_item.quantity, 
                  dbo.purchase_order_item.credit, dbo.purchase_order_item.quantitycom, dbo.purchase_order_item.quantitystill, dbo.purchase_order.flag, dbo.purchase_order.action_date, dbo.purchase_order.depart, 
                  dbo.purchase_order.employee, dbo.purchase_order.order_Time, dbo.purchase_order.GmSignature, dbo.purchase_order.StorSignature, dbo.purchase_order.userName, dbo.purchase_order_item.mohla, 
                  dbo.purchase_order_item.notes, dbo.purchase_order.purshasingSignature, dbo.purchase_order_item.weeneed, dbo.purchase_order_item.limet, dbo.purchase_order_item.DateNeed, dbo.purchase_order_item.state, 
                  dbo.purchase_order.Manager, dbo.purchase_order.ProunchID, dbo.purchase_order.COMP_ID, dbo.purchase_order_item.vendorname, dbo.purchase_order_item.pricecome, dbo.TblCostTree.AccCode, 
                  dbo.TblCostTree.AccName, dbo.TblCostTree.ShortCode, dbo.purchase_order_item.ItemCode, dbo.TblCostTree.Flag AS FlagCost, dbo.purchase_order_item.ConstControl, dbo.purchase_order_item.ConstControlStart, 
                  dbo.purchase_order_item.ConstControlStartEnd, dbo.purchase_order_item.ConstControlNOtes, dbo.purchase_order_item.ProjectManeger, dbo.purchase_order_item.ProjectManegerStart, 
                  dbo.purchase_order_item.ProjectManegerEnd, dbo.purchase_order_item.ProjectManegerNOtes, dbo.purchase_order_item.ExcutiveManager, dbo.purchase_order_item.ExcutiveManagerStart, 
                  dbo.purchase_order_item.ExcutiveManagerEnd, dbo.purchase_order_item.ExcutiveManagerNotes, dbo.purchase_order.OrderType, dbo.purchase_order.CustomerName, dbo.purchase_order.ContactPerson, 
                  dbo.purchase_order.TenderNO, dbo.purchase_order.DateTender, dbo.purchase_order.TenderTamen, dbo.purchase_order.UsersWilMake, dbo.purchase_order_item.BurchaseAcion, 
                  dbo.purchase_order_item.BurchaseStart, dbo.purchase_order_item.BurchaseEnd, dbo.purchase_order_item.Almoder_Altanfezy, dbo.purchase_order_item.Almoder_Altanfezy_Notes, dbo.purchase_order.Br_Notes, 
                  dbo.purchase_order.DocNO, dbo.purchase_order.Others, dbo.purchase_order.MyDepartID, dbo.purchase_order_item.ItemNO_IN_Tender, dbo.purchase_order.PMO_Notes, dbo.CostItemsBudget.SupID, 
                  dbo.CostItemsBudget.Budget, dbo.purchase_order_item.CostId, dbo.purchase_order.ProjectID
FROM     dbo.Items INNER JOIN
                  dbo.CostItemsBudget ON dbo.Items.Item_Gro_Id = dbo.CostItemsBudget.GroupID AND dbo.Items.Item_Gro_Sub_Id = dbo.CostItemsBudget.SupID RIGHT OUTER JOIN
                  dbo.purchase_order_item INNER JOIN
                  dbo.purchase_order ON dbo.purchase_order_item.order_no = dbo.purchase_order.order_no ON dbo.CostItemsBudget.CostID = dbo.purchase_order.ProjectID AND 
                  dbo.Items.Item_Id = dbo.purchase_order_item.ItemCode LEFT OUTER JOIN
                  dbo.TblCostTree ON dbo.purchase_order_item.CostId = dbo.TblCostTree.AccCode

GO


