 

ALTER PROCEDURE [dbo].[AmrShoglSelectProduct]
    @orderid BIGINT ,
    @Storeid BIGINT ,
    @ActionDate DATETIME
AS
    BEGIN
	 

        CREATE TABLE #Result
            (
              [orderid] [BIGINT] NOT NULL ,
              [orderdate] [DATE] NULL ,
              [customer_name] [VARCHAR](250) COLLATE Arabic_CI_AS
                                             NOT NULL ,
              [serial] [BIGINT] NULL ,
              [Item_Id] [BIGINT] NULL ,
              [item] [TEXT] COLLATE Arabic_CI_AS
                            NOT NULL ,
              [quantity] [FLOAT] NULL ,
              [width] [DECIMAL](18, 2) NOT NULL ,
              [Lingh] [VARCHAR](50) NOT NULL ,
              [CustCode] [VARCHAR](50) NULL ,
              [CostPrice] DECIMAL(18, 2) NULL ,
              [Fineshed] BIT NULL ,
            ) 
	
	

        CREATE TABLE #ContentTable
            (
              [DefaultID] [BIGINT] NOT NULL ,
              [ContintID] [BIGINT] NOT NULL ,
              [ContentCount] DECIMAL(18, 2) NULL ,
              bigunit INT NULL ,
              UnitCode INT NULL ,
              Medumcode INT NULL ,
              smallucod INT NULL ,
              [PriceContent] DECIMAL(18, 2) NULL ,
              EqulUnit DECIMAL(18, 2) NULL ,
              EqulUnit2 DECIMAL(18, 2) NULL
            ) 


 
        INSERT  INTO #Result
                SELECT  orders.orderid ,
                        orders.orderdate ,
                        customers.customer_name ,
                        order_items.serial ,
                        order_items.Item_Id ,
                        order_items.item ,
                        order_items.quantity ,
                        ISNULL(order_items.Width, 0.00) AS width ,
                        ISNULL(order_items.DrawNo, 0.00) AS Lingh ,
                        order_items.CustCode ,
                        0 AS CostPrice,
						order_items.Fineshed
                FROM    orders
                        INNER JOIN customers ON orders.Customer_id = customers.Customer_id
                        INNER JOIN order_items ON orders.orderid = order_items.orderid
                WHERE   ( orders.orderid = @orderid )
         
 
    END
 

    INSERT  INTO #ContentTable
            SELECT  #Result.Item_Id ,
                    dbo.ItemContent.itemid ,
                    dbo.ItemContent.Q ,
                    Items.Item_Unit_Id AS bigunit ,
                    Items.Item_unit2 AS UnitCode ,
                    Items.Item_unit3 AS Medumcode ,
                    dbo.ItemContent.unitCode AS selectedUnit ,
                    CASE WHEN ( Items.Item_Unit_Id = ItemContent.unitCode )
                         THEN ( dbo.get_item_average(@Storeid,
                                                     dbo.ItemContent.itemid,
                                                     @ActionDate,DATEPART(YEAR,@ActionDate)) * Q )
                         WHEN ( Items.Item_unit2 = ItemContent.unitCode
                                AND ISNULL(Items.EqulUnit, 0) > 0
                              )
                         THEN ( ( dbo.get_item_average(@Storeid,
                                                       dbo.ItemContent.itemid,
                                                       @ActionDate,DATEPART(YEAR,@ActionDate))
                                  / ISNULL(Items.EqulUnit, 0) ) * Q )
                         WHEN ( Items.Item_unit3 = ItemContent.unitCode
                                AND ISNULL(Items.EqulUnit2, 0) > 0
                              )
                         THEN ( ( dbo.get_item_average(@Storeid,
                                                       dbo.ItemContent.itemid,
                                                       @ActionDate,DATEPART(YEAR,@ActionDate))
                                  / ISNULL(Items.EqulUnit2, 0) ) * Q )
                    END ,
                    Items.EqulUnit ,
                    Items.EqulUnit2
            FROM    dbo.ItemContent
                    INNER JOIN #Result ON #Result.Item_Id = dbo.ItemContent.DefaulID
                    INNER JOIN Items ON Items.Item_Id = dbo.ItemContent.itemid 
	 
	 
    UPDATE  #Result
    SET     CostPrice = ( SELECT    ISNULL(SUM(#ContentTable.PriceContent), 0)
                          FROM      #ContentTable
                          WHERE     #Result.Item_Id = #ContentTable.DefaultID
                        )

   


    SELECT  *
    FROM    #Result


