 
ALTER VIEW [dbo].[Vitemminemum]
AS
SELECT dbo.Items.Item_Name, ISNULL(SUM(dbo.Item_Card.QCome), 0) AS ALLCOM, ISNULL(SUM(dbo.Item_Card.Qout), 0) AS ALLOUT, dbo.Stores.store_name, dbo.Items.MINQ AS MINQ, 
                  CAST(ISNULL(SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout), 0) AS DECIMAL(18, 2)) AS RASEED, dbo.Item_Card.store_id, dbo.Items.MINQ - ISNULL(SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout), 0) 
                  AS Need, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.Items.MaxQ, dbo.Items.MaxQ - (SUM(dbo.Item_Card.QCome) - SUM(dbo.Item_Card.Qout)) AS MaxNeed, dbo.Items.Item_Id
FROM     dbo.Stores RIGHT OUTER JOIN
                  dbo.Item_Card ON dbo.Stores.store_id = dbo.Item_Card.store_id RIGHT OUTER JOIN
                  dbo.Items ON dbo.Item_Card.Item_Id = dbo.Items.Item_Id
GROUP BY dbo.Items.Item_Name, dbo.Stores.store_name, dbo.Items.MINQ, dbo.Item_Card.store_id, dbo.Items.Item_Gro_Id, dbo.Items.Item_Gro_Sub_Id, dbo.Items.TradeTypeID, dbo.Items.MaxQ, dbo.Items.Item_Id

GO


