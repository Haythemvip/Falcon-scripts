 
 
ALTER PROCEDURE [dbo].[Stor_Takyeem]
    @select BIGINT ,
    @Item_Gro_Id NVARCHAR(50) = 0 ,
    @Item_Gro_Sub_Id NVARCHAR(50) = '0' ,
    @TradeTypeID NVARCHAR(50) = '0' ,
    @store_id NVARCHAR(50) ,
    @fromDate DATE ,
    @Todate DATE
AS
    CREATE TABLE #TbleItems
        (
          Item_Id BIGINT ,
          Item_Name [NVARCHAR](100) COLLATE Arabic_CI_Ai
                                    NULL ,
          unitname [NVARCHAR](20) COLLATE Arabic_CI_Ai
                                  NULL ,
          groupname [NVARCHAR](50) COLLATE Arabic_CI_Ai
                                   NULL ,
          subname [NVARCHAR](50) COLLATE Arabic_CI_Ai
                                 NULL ,
          TradeType [NVARCHAR](50) COLLATE Arabic_CI_Ai
                                   NULL ,
          Barcode NVARCHAR(50) ,
          itm_code2 NVARCHAR(50)
        )
	

    DECLARE @Query NVARCHAR(MAX)




 

    SET @Query = N' INSERT  INTO #TbleItems
                    SELECT  Items.Item_Id ,
                            Items.Item_Name ,
                            unit.unitname ,
                            Groups.groupname ,
                            Groups_Sub.subname ,
                            TasnefTogary.TradeType,Barcode ,itm_code2
                    FROM    Items
                            INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                            INNER JOIN TasnefTogary ON Items.TradeTypeID = TasnefTogary.TradeTypeID
                            INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                            INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid 
							WHERE Item_Id in(select Item_Card.Item_Id from Item_Card where Item_Card.store_id = '''
        + @store_id + ''') '
    
    IF @Item_Gro_Id <> 0
        BEGIN
            SET @Query += ' and Items.Item_Gro_Id = ''' + @Item_Gro_Id + ''''
        END
               
    IF @Item_Gro_Sub_Id <> '0'
        BEGIN
            SET @Query += ' and Items.Item_Gro_Sub_Id = ''' + @Item_Gro_Sub_Id
                + ''''
        END

    IF @TradeTypeID <> '0'
        BEGIN
            SET @Query += ' and Items.TradeTypeID = ''' + @TradeTypeID + ''''
        END

 
    EXEC sp_executesql @Query




    CREATE TABLE #ItemPrice
        (
          item_id BIGINT ,
          maxPriceCome FLOAT ,
          minPriceCome FLOAT ,
          maxPriceOut FLOAT ,
          minPriceOut FLOAT ,
          PriceCome FLOAT ,
          priceout FLOAT ,
          topPriceCome FLOAT ,
          topPriceOut FLOAT ,
          avrage FLOAT ,
          rased FLOAT
        )

    CREATE TABLE #ItemPriceFinal
        (
          item_id BIGINT ,
          maxPriceCome FLOAT ,
          minPriceCome FLOAT ,
          maxPriceOut FLOAT ,
          minPriceOut FLOAT ,
          PriceCome FLOAT ,
          priceout FLOAT ,
          topPriceCome FLOAT ,
          topPriceOut FLOAT ,
          avrage FLOAT ,
          rased FLOAT
        )
    




    INSERT  INTO #ItemPrice
            SELECT  Item_Id ,
                    ISNULL(MAX(PriceCome), 0) AS maxPriceCome ,
                    dbo.Last_purchase(Item_Id) AS minPriceCome ,
                    ISNULL(MAX(PriceOut), 0) AS maxPriceOut ,
                    ISNULL(MIN(PriceOut), 0) AS minPriceOut ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0
            FROM    Item_Card
            WHERE   Item_Id IN ( SELECT Item_Id
                                 FROM   #TbleItems )
            GROUP BY Item_Id



   
    INSERT  INTO #ItemPrice
            SELECT  Item_Id ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    ISNULL(priceCome, 0) ,
                    ISNULL(price, 0) ,
                    0 ,
                    0 ,
                    0 ,
                    0
            FROM    Items
            WHERE   Item_Id IN ( SELECT Item_Id
                                 FROM   #TbleItems )



    INSERT  INTO #ItemPrice
            SELECT TOP 1
                    Item_Id ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    ISNULL(PriceCome, 0) ,
                    0 ,
                    0 ,
                    0
            FROM    Item_Card
            WHERE   Item_Id IN ( SELECT Item_Id
                                 FROM   #TbleItems )



    INSERT  INTO #ItemPrice
            SELECT TOP 1
                    Item_Id ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    ISNULL(PriceOut, 0) ,
                    0 ,
                    0
            FROM    Item_Card
            WHERE   Item_Id IN ( SELECT Item_Id
                                 FROM   #TbleItems )



    INSERT  INTO #ItemPrice
            SELECT  Item_Id ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    ISNULL(SUM(QCome), 0) - ISNULL(SUM(Qout), 0)
            FROM    Item_Card
            WHERE   Item_Id IN ( SELECT Item_Id
                                 FROM   #TbleItems )
                    AND store_id = @store_id
                    AND ActionDate BETWEEN @fromDate AND @Todate
            GROUP BY Item_Id

--update Item_store_Cost set Avreg =  dbo.GetAvgCost(  Item_store_Cost.Item_Id,@fromDate,@Todate,Item_store_Cost.store_id )


    INSERT  INTO #ItemPrice
            SELECT  Items.Item_Id ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    0 ,
                    ISNULL(dbo.get_item_average(@store_id, Items.Item_Id,
                                                @Todate), 0) ,
                    0
            FROM    Items
                    INNER JOIN #TbleItems ON Items.Item_Id = #TbleItems.Item_Id  
                                




--select top 1 Item_Id,0,0,0,0,0,0,0,0,avreg,0 from Item_store_Cost 



    INSERT  INTO #ItemPriceFinal
            SELECT  item_id ,
                    ISNULL(SUM(maxPriceCome), 0) AS maxPriceCome ,
                    ISNULL(SUM(minPriceCome), 0) AS minPriceCome ,
                    ISNULL(SUM(maxPriceOut), 0) AS maxPriceOut ,
                    ISNULL(SUM(minPriceOut), 0) AS minPriceOut ,
                    ISNULL(SUM(PriceCome), 0) AS PriceCome ,
                    ISNULL(SUM(priceout), 0) AS priceout ,
                    ISNULL(SUM(topPriceCome), 0) AS topPriceCome ,
                    ISNULL(SUM(topPriceOut), 0) AS topPriceOut ,
                    ISNULL(SUM(avrage), 0) AS avrage ,
                    ISNULL(SUM(rased), 0) AS rased
            FROM    #ItemPrice
            GROUP BY item_id 




   
    IF @select = 0
        BEGIN
            SELECT  #TbleItems.* ,
                    ISNULL(#ItemPriceFinal.maxPriceCome, 0) AS theprice ,
                    ISNULL(rased, 0) AS rased ,
                    ISNULL(maxPriceCome, 0) * ISNULL(rased, 0) AS Valtheprice
            FROM    #ItemPriceFinal
                    INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
            WHERE   ISNULL(rased, 0) > 0
        END
   
   
    ELSE
        IF @select = 1
            BEGIN
                SELECT  #TbleItems.* ,
                        ISNULL(#ItemPriceFinal.minPriceCome, 0) AS theprice ,
                        ISNULL(rased, 0) AS rased ,
                        ISNULL(minPriceCome, 0) * ISNULL(rased, 0) AS Valtheprice
                FROM    #ItemPriceFinal
                        INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                WHERE   ISNULL(rased, 0) > 0
            END
   
   
        ELSE
            IF @select = 2
                BEGIN
                    SELECT  #TbleItems.* ,
                            ISNULL(#ItemPriceFinal.maxPriceOut, 0) AS theprice ,
                            ISNULL(rased, 0) AS rased ,
                            ISNULL(maxPriceOut, 0) * ISNULL(rased, 0) AS Valtheprice
                    FROM    #ItemPriceFinal
                            INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                    WHERE   ISNULL(rased, 0) > 0
                END
   
   
   
            ELSE
                IF @select = 3
                    BEGIN
                        SELECT  #TbleItems.* ,
                                ISNULL(#ItemPriceFinal.minPriceOut, 0) AS theprice ,
                                ISNULL(rased, 0) AS rased ,
                                ISNULL(minPriceOut, 0) * ISNULL(rased, 0) AS Valtheprice
                        FROM    #ItemPriceFinal
                                INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                        WHERE   ISNULL(rased, 0) > 0
                    END
   
   
                ELSE
                    IF @select = 4
                        BEGIN
                            SELECT  #TbleItems.* ,
                                    ISNULL(#ItemPriceFinal.PriceCome, 0) AS theprice ,
                                    ISNULL(rased, 0) AS rased ,
                                    ISNULL(PriceCome, 0) * ISNULL(rased, 0) AS Valtheprice
                            FROM    #ItemPriceFinal
                                    INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                            WHERE   ISNULL(rased, 0) > 0
                        END
   
   
                    ELSE
                        IF @select = 5
                            BEGIN
                                SELECT  #TbleItems.* ,
                                        ISNULL(#ItemPriceFinal.priceout, 0) AS theprice ,
                                        ISNULL(rased, 0) AS rased ,
                                        ISNULL(priceout, 0) * ISNULL(rased, 0) AS Valtheprice
                                FROM    #ItemPriceFinal
                                        INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                                WHERE   ISNULL(rased, 0) > 0
                            END
   
                        ELSE
                            IF @select = 6
                                BEGIN
                                    SELECT  #TbleItems.* ,
                                            ISNULL(#ItemPriceFinal.avrage, 0) AS theprice ,
                                            ISNULL(rased, 0) AS rased ,
                                            ISNULL(avrage, 0) * ISNULL(rased,
                                                              0) AS Valtheprice
                                    FROM    #ItemPriceFinal
                                            INNER JOIN #TbleItems ON #TbleItems.Item_Id = #ItemPriceFinal.item_id
                                    WHERE   ISNULL(rased, 0) > 0
                                END
   
   

        
        
 