 
ALTER VIEW [dbo].[View_Assemplyfrom]
AS
SELECT        dbo.AssemplyFrom.AssID, dbo.AssemplyFrom.serial, dbo.AssemplyFrom.itemid, dbo.Items.Item_Name_AR, dbo.AssemplyFrom.Unite, dbo.AssemplyFrom.Price, dbo.AssemplyFrom.Quantity, 
                         dbo.AssemplyFrom.total, dbo.AssemplyFrom.SN, dbo.Items.itm_ismedicine, dbo.Items.PriceFexed, dbo.AssemplyFrom.Bounas, dbo.AssemplyFrom.Unit_Quantity, dbo.AssemplyFrom.Unit_Price, 
                         dbo.AssemplyFrom.Defualt_ItemCost, dbo.AssemplyFrom.UnitCost, dbo.AssemplyFrom.Unit_Balance, dbo.AssemplyFrom.Rate, dbo.AssemplyFrom.CostAllItemOut, dbo.AssemplyFrom.maksap, 
                         dbo.AssemplyFrom.CostID, dbo.TblCostTree.AccName, dbo.Items.Tax, dbo.AssemplyFrom.SaleUnitID, dbo.AssemplyTo.StoreFrom
FROM            dbo.AssemplyFrom INNER JOIN
                         dbo.Items ON dbo.AssemplyFrom.itemid = dbo.Items.Item_Id INNER JOIN
                         dbo.AssemplyTo ON dbo.AssemplyFrom.AssID = dbo.AssemplyTo.AssID LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.AssemplyFrom.CostID = dbo.TblCostTree.AccCode

GO


