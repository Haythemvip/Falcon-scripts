 

ALTER   PROCEDURE [dbo].[Select_Matrial]
    @ordrid INT ,
    @Storeid INT ,
    @ActionDate DATETIME,
	@year INT 

AS
    CREATE TABLE #Codes
        (
          orderid [NUMERIC](8, 0) NULL ,
          orderdate DATE NULL ,
          serial [NVARCHAR](100) NULL ,
          Item_Id BIGINT NULL ,
          item [NVARCHAR](100) COLLATE Arabic_CI_Ai
                               NULL ,
          quantity FLOAT NULL ,
          Item_Name [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                    NULL ,
          Q FLOAT NULL ,
          unit [NVARCHAR](50) COLLATE Arabic_CI_Ai
                              NULL ,
          itemid BIGINT NULL ,
          qprevus FLOAT NULL ,
          QNeed FLOAT NULL ,
          Raseed FLOAT NULL ,
          QBurshae FLOAT NULL ,
          EznQuntity FLOAT NULL ,
          INDIX INT ,
          Lenth FLOAT NULL ,
          Width FLOAT NULL ,
          bigunit INT NULL ,  
          UnitCode INT NULL ,  
          Medumcode INT NULL ,  
          smallucod INT NULL ,  
          EqulUnit FLOAT NULL ,  
          EqulUnit2 FLOAT NULL ,         
          ItmCOst FLOAT NULL 
		
        )

		 

	
    CREATE TABLE #CodesTotal
        (
          orderid [NUMERIC](8, 0) NULL ,
          orderdate DATE NULL ,
          Item_Id BIGINT NULL ,
          item [NVARCHAR](100) COLLATE Arabic_CI_Ai
                               NULL ,
          quantity FLOAT NULL ,
          Item_Name [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                    NULL ,
          Q DECIMAL(18,4) NULL ,
          unit [NVARCHAR](50) COLLATE Arabic_CI_Ai
                              NULL ,
          itemid BIGINT NULL ,
          qprevus FLOAT NULL ,
          QNeed FLOAT NULL ,
          Raseed FLOAT NULL ,
          QBurshae FLOAT NULL ,
          EznQuntity FLOAT NULL ,
          ItmCOst FLOAT NULL ,
          UnitCode INT NULL,
		  Rate FLOAT
        ) 
		
		
			
    BEGIN

        INSERT  INTO #Codes
                SELECT  orders.orderid ,
                        orders.orderdate ,
                        order_items.serial ,
                        order_items.Item_Id ,
                        order_items.item ,
                        order_items.quantity ,
                        Items.Item_Name ,
                        ItemContent.Q ,
                        ItemContent.unit ,
                        ItemContent.itemid ,
                        0.00 AS qprevus ,
                        0.00 AS QNeed ,
                        dbo.Item_Balance(ItemContent.itemid, @year,@Storeid) AS Raseed ,
                        0.00 AS QBurshae ,
                        0.00 AS EznQuntity ,
                        0 AS INDIX ,
                        0 AS DrawNo ,
                        order_items.Width ,
                        Items.Item_Unit_Id AS bigunit ,
                        dbo.ItemContent.unitCode ,
                        Items.Item_unit2 AS Medumcode ,
                        Items.Item_unit3 AS Smallunit ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        0
                FROM    orders
                        INNER JOIN order_items ON orders.orderid = order_items.orderid
                        INNER JOIN ItemContent ON order_items.Item_Id = ItemContent.DefaulID
                        INNER JOIN Items ON ItemContent.itemid = Items.Item_Id
                --WHERE   ( ItemContent.DefaulID IN ( SELECT  VarParameter
                --                                    FROM    Table_Parameter ) )
                                            AND ( orders.orderid = @ordrid )
                ORDER BY order_items.Item_Id ,
                        ItemContent.itemid

    END




    UPDATE  #Codes
    SET     Q = Q * ISNULL(quantity, 0.0000)  




    INSERT  INTO #CodesTotal
            SELECT  orderid ,
                    orderdate ,
                    Item_Id ,
                    item ,
                    SUM(quantity) ,
                    Item_Name ,
                    SUM(Q) AS Q ,
                    unit ,
                    itemid ,
                    0 ,
                    0 ,
                    SUM(Raseed) AS Raseed ,
                    0 ,
                    0 ,
                    CASE WHEN ( #Codes.bigunit = #Codes.UnitCode )
                         THEN ( dbo.get_item_average(@Storeid, itemid,
                                                     @ActionDate,@year) * SUM(Q) )
                         WHEN ( #Codes.UnitCode = #Codes.Medumcode
                                AND EqulUnit > 0
                              )
                         THEN ( ( dbo.get_item_average(@Storeid, itemid,
                                                       @ActionDate,@year)
                                  / ISNULL(EqulUnit, 0) ) * SUM(Q) )
                         WHEN ( #Codes.UnitCode = #Codes.smallucod
                                AND ISNULL(EqulUnit2, 0) > 0
                              )
                         THEN ( ( dbo.get_item_average(@Storeid, itemid,
                                                       @ActionDate,@year)
                                  / ISNULL(EqulUnit2, 0) ) * SUM(Q) )
                         ELSE ( 0 )
                    END ,
                    UnitCode,
					CASE WHEN ( #Codes.bigunit = #Codes.UnitCode )
                         THEN ( 1 )
                         WHEN ( #Codes.UnitCode = #Codes.Medumcode
                                AND EqulUnit > 0
                              )
                         THEN ( EqulUnit)
                         WHEN ( #Codes.UnitCode = #Codes.smallucod
                                AND ISNULL(EqulUnit2, 0) > 0
                              )
                         THEN ( EqulUnit2)
                         ELSE ( 1 )
                    END 
					 AS Rate
            FROM    #Codes
            GROUP BY orderid ,
                    orderdate ,
                    Item_Id ,
                    Item_Name ,
                    item ,
                    unit ,
                    itemid ,
                    ItmCOst ,
                    #Codes.bigunit ,
                    #Codes.UnitCode ,
                    #Codes.smallucod ,
                    #Codes.Medumcode ,
                    EqulUnit2 ,
                    EqulUnit




 
    UPDATE  #CodesTotal
    SET     Raseed = CASE WHEN ( #Codes.bigunit = #Codes.UnitCode )
                          THEN ( #CodesTotal.Raseed )
                          WHEN ( #Codes.UnitCode = #Codes.Medumcode )
                          THEN ( #CodesTotal.Raseed * EqulUnit )
                          WHEN ( #Codes.UnitCode = #Codes.smallucod )
                          THEN ( #CodesTotal.Raseed * EqulUnit2 )
                     END

    FROM    #CodesTotal
            INNER JOIN #Codes ON #Codes.itemid = #CodesTotal.itemid 
	 
	  



    UPDATE  #CodesTotal
    SET     qprevus = ( SELECT  ISNULL(SUM(Qout), 0)
                        FROM    dbo.Item_Card
                        WHERE   TalabMowadID = @ordrid
                        AND Item_Card.Item_Id = #CodesTotal.itemid
						AND ActionName = 'تحويل بين المخازن'
                      )




    UPDATE  #CodesTotal
    SET     qprevus = CASE WHEN ( #Codes.bigunit = #Codes.UnitCode )
                           THEN ( #CodesTotal.qprevus )
                           WHEN ( #Codes.UnitCode = #Codes.Medumcode )
                           THEN ( #CodesTotal.qprevus * EqulUnit )
                           WHEN ( #Codes.UnitCode = #Codes.smallucod )
                           THEN ( #CodesTotal.qprevus * EqulUnit2 )
                      END
    FROM    #CodesTotal
            INNER JOIN #Codes ON #Codes.itemid = #CodesTotal.itemid 





    --UPDATE  #CodesTotal
    --SET     QNeed = Q - qprevus



    --UPDATE  #CodesTotal
    --SET     QBurshae = CASE WHEN ( Raseed > QNeed ) THEN ( 0 )
    --                        ELSE ( QNeed - Raseed )
    --                   END


 --UPDATE  #CodesTotal
 --   SET     EznQuntity = CASE WHEN ( Raseed > QNeed ) THEN ( QNeed )
 --                             ELSE ( CASE WHEN Raseed > 0 THEN (Raseed) ELSE 0 END  )
 --                        END

 
    UPDATE  #CodesTotal
    SET     EznQuntity = Q - qprevus



    SELECT  ROW_NUMBER() OVER ( ORDER BY Item_Id ) AS 'Srial' ,
            itemid AS ItemCode ,
            itemid AS ItemName  ,
            unit ,
            ( ItmCOst / Q ) AS price ,
            ISNULL(EznQuntity, 0.0000) AS Q ,
            ISNULL(( ItmCOst / Q ), 0.0000) * ISNULL(EznQuntity, 0.00000) AS Total ,
            0 AS SN ,
            Raseed  AS Balance ,
            0 AS Bounas ,
            ISNULL(EznQuntity, 0)/rate AS Unit_Quantity ,
            (( ItmCOst * Rate )/ Q  ) AS Unit_Price ,
            0 AS CostID ,
            0 AS CostName ,
            ( ItmCOst / Q ) AS Defualt_ItemCost ,
            ( ItmCOst / Q )  AS UnitCost ,
           ( Raseed / Rate ) AS Unit_Balance ,
              Rate ,
            
            0 AS CostAllItemOut ,
            0 AS maksap ,
            ISNULL(qprevus, 0) AS PreviousQTY ,
            0 AS Tax ,
            0 AS PriceFexed ,
            0 AS itm_ismedicine
			,UnitCode   AS Item_Unit_Id
    FROM    #CodesTotal
    WHERE   EznQuntity > 0.0001


	 
             
            
           
            
           
            
            
             
            
          
       
          

 

   
           
             
            
             
