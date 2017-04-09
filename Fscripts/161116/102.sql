 
ALTER VIEW [dbo].[Vitemminemum]
AS
SELECT        dbo.Items.Item_Name, SUM(dbo.Item_Card.QCome) AS ALLCOM, SUM(dbo.Item_Card.Qout) AS ALLOUT, dbo.Item_Card.Item_Id, dbo.Stores.store_name, dbo.Items.MINQ, SUM(dbo.Item_Card.QCome) 
                         - SUM(dbo.Item_Card.Qout) AS RASEED, dbo.Item_Card.store_id, dbo.Items.MINQ - CASE WHEN (SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) < 0 THEN (SUM(dbo.Item_Card.QCome) 
                         - SUM(dbo.Item_Card.Qout)) ELSE (((SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) * - 1)) END AS Need, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, 
                         dbo.Items.MaxQ, dbo.Items.MaxQ - CASE WHEN (SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) < 0 THEN (SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) 
                         ELSE (((SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) * - 1)) END AS MaxNeed
FROM            dbo.Stores INNER JOIN
                         dbo.Item_Card ON dbo.Stores.store_id = dbo.Item_Card.store_id INNER JOIN
                         dbo.Items ON dbo.Item_Card.Item_Id = dbo.Items.Item_Id
GROUP BY dbo.Items.Item_Name, dbo.Item_Card.Item_Id, dbo.Stores.store_name, dbo.Items.MINQ, dbo.Item_Card.store_id, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.Items.MaxQ

GO


