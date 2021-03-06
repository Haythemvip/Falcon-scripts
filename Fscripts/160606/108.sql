


 
ALTER PROCEDURE [dbo].[Amr_Shogl_Materials]
    @ordrid INT ,
    @Storeid INT ,
    @ActionDate DATETIME
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
          bigunit INT NULL , -- الوحدة الكبرى
          UnitCode INT NULL , -- الوحدة المستخدمة
          Medumcode INT NULL , -- المتوسطه
          smallucod INT NULL , -- الصغرى
          EqulUnit FLOAT NULL , -- العلاقة بين الوسطى والكبرى
          EqulUnit2 FLOAT NULL ,-- العلاقة بين الصغرى والكبرى        
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
          Q FLOAT NULL ,
          unit [NVARCHAR](50) COLLATE Arabic_CI_Ai
                              NULL ,
          itemid BIGINT NULL ,
          qprevus FLOAT NULL ,
          QNeed FLOAT NULL ,
          Raseed FLOAT NULL ,
          QBurshae FLOAT NULL ,
          EznQuntity FLOAT NULL ,
          ItmCOst FLOAT NULL,
		  UnitCode INT NULL,
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
                        0.00 AS Raseed ,
                        0.00 AS QBurshae ,
                        0.00 AS EznQuntity ,
                        0 AS INDIX ,
                        order_items.DrawNo ,
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
                WHERE   ( ItemContent.DefaulID IN ( SELECT  VarParameter
                                                    FROM    Table_Parameter ) )
                        AND ( orders.orderid = @ordrid )
                ORDER BY order_items.Item_Id ,
                        ItemContent.itemid

    END


    UPDATE  #Codes
    SET     Q = Q * ISNULL(quantity, 0.00)  




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
                    0 ,
                    0 ,
                    0 ,
                    CASE WHEN (  #Codes.bigunit = #Codes.UnitCode )
                         THEN ( dbo.get_item_average(@Storeid, itemid,
                                                     @ActionDate) * ISNULL(  SUM(Q),0) )
                         WHEN ( #Codes.UnitCode =  #Codes.Medumcode AND ISNULL( EqulUnit,0) > 0 )
                         THEN ( ( dbo.get_item_average(@Storeid, itemid,
                                                       @ActionDate) / ISNULL( EqulUnit,0) )
                                * ISNULL( SUM(Q),0) )
                         WHEN (  #Codes.UnitCode =  #Codes.smallucod AND ISNULL( EqulUnit2,0) > 0 )
                         THEN ( ( dbo.get_item_average(@Storeid, itemid,
                                                       @ActionDate)
                                  / ISNULL( EqulUnit2,0) ) * SUM(Q) )
								  
								 
                    END
					,
					UnitCode 
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
    SET     Raseed = ( SELECT   ISNULL(SUM(QCome), 0) - ISNULL(SUM(Qout), 0) AS rassed
                       FROM     dbo.Item_Card
                       WHERE    #CodesTotal.itemid = Item_Card.Item_Id
                     ) 


 
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
                        WHERE   EznNO = @ordrid
                                AND ActionName = 'صرف لامر تشغيل'
                                AND Item_Card.Item_Id = #CodesTotal.itemid
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





    UPDATE  #CodesTotal
    SET     QNeed = Q - qprevus



    UPDATE  #CodesTotal
    SET     QBurshae = CASE WHEN ( Raseed > QNeed ) THEN ( 0 )
                            ELSE ( QNeed - Raseed )
                       END



    UPDATE  #CodesTotal
    SET     EznQuntity = CASE WHEN ( Raseed > QNeed ) THEN ( QNeed )
                              ELSE ( Raseed )
                         END





    SELECT  orderid ,
            orderdate ,
            Item_Id ,
            item ,
            ISNULL( quantity,0) AS quantity ,
            Item_Name ,
            ISNULL(Q,0) AS Q,
            unit ,UnitCode,
            itemid ,
            ISNULL( qprevus,0) AS qprevus,
           
			 CASE WHEN (ISNULL( QNeed,0))<0 
			THEN (0)
			ELSE (ISNULL( QNeed,0))

			end
			 AS QNeed ,
            ISNULL( Raseed,0) AS Raseed,
            ISNULL( QBurshae,0) AS QBurshae ,

            CASE WHEN (ISNULL( EznQuntity,0))<0 
			THEN (0)
			ELSE (ISNULL( EznQuntity,0))
			end
			AS EznQuntity ,

            ISNULL( ItmCOst,0) AS ItmCOst ,
            ISNULL( ( ItmCOst / Q ),0) AS Ucost ,
            ROW_NUMBER() OVER ( ORDER BY Item_Id ) AS INDIX
    FROM    #CodesTotal

