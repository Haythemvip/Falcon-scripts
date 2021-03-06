
ALTER PROCEDURE [dbo].[AmrShoglSelectProduct_INvoice]
    @orderid BIGINT ,
    @Storeid BIGINT ,
    @ActionDate DATETIME
AS
    BEGIN
	 
	  

        CREATE TABLE #Result
            (
              customer_name [VARCHAR](250) COLLATE Arabic_CI_AS
                                           NOT NULL ,
              serial [BIGINT] NULL ,
              Item_Id [BIGINT] NULL ,
              item [TEXT] COLLATE Arabic_CI_AS
                          NOT NULL ,
              Lingh [DECIMAL](18, 2) NULL ,
              width [DECIMAL](18, 2) NULL ,
              unitname [VARCHAR](50) COLLATE Arabic_CI_AS
                                     NULL ,
              quantity [FLOAT] NULL ,
              TotalQ DECIMAL(18, 2) NULL ,
              price DECIMAL(18, 2) NULL ,
              Total DECIMAL(18, 2) NULL , -- TotalPrice
              UnitCost DECIMAL(18, 2) NULL ,
              DefultCost DECIMAL(18, 2) NULL ,
              CostID [BIGINT] NULL ,
              ShortName [VARCHAR](250) COLLATE Arabic_CI_AS
                                       NULL ,
              CostName [VARCHAR](250) COLLATE Arabic_CI_AS
                                      NULL ,
             
            ) 
	
	 
 
        INSERT  INTO #Result
                SELECT  customers.customer_name ,
                        order_items.serial ,
                        order_items.Item_Id ,
                        order_items.item ,
                        ISNULL(order_items.DrawNo, 0.00) AS Lingh ,
                        ISNULL(order_items.Width, 0.00) AS width ,
                        order_items.unit ,
                        order_items.CustCode AS quantity ,
                        quantity AS TotalQ ,
                        Items.price AS price ,
                        ( ISNULL(Items.price, 0.00)
                          * ISNULL(order_items.quantity, 0.00) ) AS Total ,
                        dbo.get_item_average(@Storeid, order_items.Item_Id,
                                             @ActionDate,DATEPART(YEAR,@ActionDate)) ,
                        dbo.get_item_average(@Storeid, order_items.Item_Id,
                                             @ActionDate,DATEPART(YEAR,@ActionDate)) ,
                        0 AS CostID ,
                        0 AS ShortName ,
                        0 AS CostName
                FROM    orders
                        INNER JOIN customers ON orders.Customer_id = customers.Customer_id
                        INNER JOIN order_items ON orders.orderid = order_items.orderid
                        INNER JOIN dbo.Items ON order_items.Item_Id = Items.Item_Id
                WHERE   ( orders.orderid = @orderid
                          AND Fineshed = 1
                          )
         
 
    END
 


    SELECT  *
    FROM    #Result


