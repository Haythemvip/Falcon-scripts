
 
ALTER PROCEDURE [dbo].[Stor_Takyeem]
    @select INT ,
    @Item_Gro_Id INT = 0 ,
    @Item_Gro_Sub_Id INT = 0 ,
    @TradeTypeID INT = 0 ,
    @store_id INT = 0 ,
    @fromDate DATE ,
    @Todate DATE ,
    @year INT
AS
    CREATE TABLE #TbleItems
        (
          Item_Id BIGINT ,
          Item_Name [NVARCHAR](100) COLLATE Arabic_CI_AI
                                    NULL ,
          unitname [NVARCHAR](20) COLLATE Arabic_CI_AI
                                  NULL ,
          groupname [NVARCHAR](50) COLLATE Arabic_CI_AI
                                   NULL ,
          subname [NVARCHAR](50) COLLATE Arabic_CI_AI
                                 NULL ,
          TradeType [NVARCHAR](50) COLLATE Arabic_CI_AI
                                   NULL ,
          Barcode NVARCHAR(50) ,
          itm_code2 NVARCHAR(50) ,
          rased FLOAT DEFAULT 0 ,
          theprice FLOAT DEFAULT 0 ,
          Valtheprice FLOAT DEFAULT 0
        );
	

    INSERT  INTO #TbleItems
            SELECT  Items.Item_Id ,
                    Items.Item_Name ,
                    unit.unitname ,
                    Groups.groupname ,
                    Groups_Sub.subname ,
                    TasnefTogary.TradeType ,
                    Barcode ,
                    itm_code2 ,
                    SUM(QCome) - SUM(Qout) AS rased ,
                    10 ,
                    30
            FROM    Items
                    INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                    INNER JOIN TasnefTogary ON Items.TradeTypeID = TasnefTogary.TradeTypeID
                    INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                    INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                    INNER JOIN dbo.Item_Card ON Item_Card.Item_Id = Items.Item_Id
            WHERE   ( @store_id = 0
                      OR Item_Card.store_id = @store_id
                    )
                    AND ( @Item_Gro_Id = 0
                          OR Items.Item_Gro_Id = @Item_Gro_Id
                        )
                    AND ( @Item_Gro_Sub_Id = 0
                          OR Item_Gro_Sub_Id = @Item_Gro_Sub_Id
                        )
                    AND ( @TradeTypeID = 0
                          OR dbo.Items.TradeTypeID = @TradeTypeID
                        )
                    AND Year = @year
                    AND Item_Card.ActionDate BETWEEN @fromDate
                                             AND     @Todate
            GROUP BY Items.Item_Id ,
                    Items.Item_Name ,
                    unit.unitname ,
                    Groups.groupname ,
                    Groups_Sub.subname ,
                    TasnefTogary.TradeType ,
                    Barcode ,
                    itm_code2
            HAVING  ROUND(SUM(QCome) - SUM(Qout), 3) > 0;
 
 
  

  -- max sheraa 
    IF @select = 0
        BEGIN
            
            UPDATE  #TbleItems
            SET     theprice = ( SELECT ISNULL(MAX(PriceCome), 0) AS maxPriceCome
                                 FROM   dbo.Item_Card
                                 WHERE  #TbleItems.Item_Id = dbo.Item_Card.Item_Id
                               );
                   
        END;

		--last purshase \

    ELSE
        IF @select = 1
            BEGIN
                UPDATE  #TbleItems
                SET     theprice = dbo.Last_purchase(Item_Id,@year);  

		

            END; 



-- max out
    IF @select = 2
        BEGIN
            
            UPDATE  #TbleItems
            SET     theprice = ( SELECT ISNULL(MAX(PriceOut), 0) AS maxout
                                 FROM   dbo.Item_Card
                                 WHERE  #TbleItems.Item_Id = dbo.Item_Card.Item_Id
                               );
                   
        END;


-- min out 
    IF @select = 3
        BEGIN
            
            UPDATE  #TbleItems
            SET     theprice = ( SELECT ISNULL(MIN(PriceOut), 0) AS minPriceOut
                                 FROM   dbo.Item_Card
                                 WHERE  #TbleItems.Item_Id = dbo.Item_Card.Item_Id
                               );
                   
        END;


 
    IF @select = 4
        BEGIN
            
            UPDATE  #TbleItems
            SET     theprice = ( SELECT ISNULL(priceCome, 0)
                                 FROM   dbo.Items
                                 WHERE  #TbleItems.Item_Id = dbo.Items.Item_Id
                               );
                   
        END;



		    IF @select = 5
        BEGIN
            
            UPDATE  #TbleItems
            SET     theprice = ( SELECT ISNULL(price, 0)
                                 FROM   dbo.Items
                                 WHERE  #TbleItems.Item_Id = dbo.Items.Item_Id
                               );
                   
        END;




	--avarge \

    ELSE
        IF @select =6
            BEGIN
                UPDATE  #TbleItems
                SET     theprice = dbo.get_item_average(@store_id,Item_Id,@Todate,@year);  

		

            END; 

    UPDATE  #TbleItems
    SET     Valtheprice = rased * theprice;



    SELECT  *
    FROM    #TbleItems;