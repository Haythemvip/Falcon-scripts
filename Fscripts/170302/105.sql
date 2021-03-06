 

ALTER PROCEDURE [dbo].[GridTable]
    @gnitemcod BIGINT ,
    @gnitemCode2 NVARCHAR(150) ,
    @year INT ,
    @ActionDate DATE ,
    @StoreID INT = 0 ,
    @price_Case INT = 0 , --  0 burchase   1  sale   2 convert between stores all assembly    
    @pirce_listID INT = 0 -- قائمة الاسعار   وفى حالة صفر يتم جلب السعر الافتراضى من بطاقة المادة
AS
    BEGIN

        CREATE TABLE #temp
            (
              Srial NUMERIC(8) NULL ,--مسلسل
              ItemCode BIGINT , -- كود الصنف
              ItemName NVARCHAR(100) COLLATE Arabic_CI_Ai ,-- اسم الصنف
              unit NCHAR(20) ,-- الوحدة ال تم بيها البيع
              price DECIMAL(18, 4) DEFAULT 0.0000 ,-- سعر البيع على حسب وحدة البيع
              Q DECIMAL(18, 4) ,-- الكمية المباعة على حسب وحدة البيع
              Total DECIMAL(18, 4) ,-- الاجمالى
              SN NVARCHAR(MAX) ,-- السريال
              Balance DECIMAL(18, 4) ,-- الرصيد الفعلى اثناء البيع على حسب وحدة البيع
			  Discount DECIMAL (18,4),
              Bounas DECIMAL(18, 4) ,-- البونص
              Unit_Quantity DECIMAL(18, 4) ,-- الكمية على حسب الوحدة الرئيسية
              Unit_Price DECIMAL(18, 4) ,-- السعر على حسب بيع الوحدة الرئيسية
              CostID INT ,-- مركز التكلفة
              CostName NVARCHAR(100) COLLATE Arabic_CI_Ai ,--مركز التكلفة
              Defualt_ItemCost DECIMAL(18, 4) ,-- التكلفة على حسب الوحدة الرئيسية
              UnitCost DECIMAL(18, 4) ,-- التكلفة على حسب الوحدة المباعة 
              Unit_Balance DECIMAL(18, 4) ,-- الرصيد الفعلى للبيع على حسب الوحدة الرئيسية
              Rate DECIMAL(18, 4) ,-- معدل التحويل بين الوحدات حسب الوحدة المباعه
               
              CostAllItemOut DECIMAL(18, 4) ,-- اجمالى تكلفة البضاعه على حسب الوحدة الرئيسية
              maksap DECIMAL(18, 4) ,-- مكسب الصنف
              PreviousQTY DECIMAL(18, 4) ,-- الكمية السابقة من الصنف فى حالة التعديل على الصنف 
              Tax DECIMAL(18, 4) ,--ضريبه
              PriceFexed BIT ,--لمعرفة هل يمكن التعديل على السعر اثناء البيع ام لا 
              itm_ismedicine BIT , -- لمعرفة هل هو صنف ام خدمة 
			  Item_Unit_Id INT,
			  LastPurchase FLOAT ,
			  
			  MinPrice FLOAT 


            )


        DELETE  FROM #temp 

        INSERT  INTO #temp
                SELECT  0 , -- Srial - numeric
                        Item_Id , -- ItemCode - int
                        Item_Name , -- ItemName - nvarchar(100)
                        unitname , -- unit - nchar(50)
                        ISNULL(price, 0.0000) AS Price , -- price - decimal
                        1 , -- Q - decimal
                        0.0000 , -- Total - decimal
                        N'' , -- SN - nvarchar(max)
                        dbo.Item_Balance(Item_Id, @year, @StoreID) , -- Balance - decimal
						0,
                        0 , -- Bounas - decimal
                        1 , -- Unit_Quantity - decimal
                        0 , -- Unit_Price - decimal
                        0 , -- CostID - int
                        N'' , -- CostName - nvarchar(100)
                        dbo.get_item_average(@StoreID, Item_Id, @ActionDate,@year) , -- Defualt_ItemCost - decimal
                        NULL , -- UnitCost - decimal
                        NULL , -- Unit_Balance - decimal
                        1 , -- Rate - decimal
                       
                        NULL , -- CostAllItemOut - decimal
                        NULL , -- maksap - decimal
                        NULL ,-- PreviousQTY - decimal
                        Tax , -- Tax - decimal
                        PriceFexed ,--PriceFexed bit 
                        itm_ismedicine  , -- itm_ismedicine bit 
						Item_Unit_Id,
						dbo.Last_purchase(Item_Id,@year) AS    LastPurchase  ,
			            pricelow 
			  

                FROM    Vitems
                WHERE   flag = 1
                        AND Item_Id = @gnitemcod
                             
    END
                 
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Id , -- ItemCode - int
                            Item_Name , -- ItemName - nvarchar(100)
                            unitname , -- unit - nchar(50)
                            ISNULL(price, 0.0000) AS Price , -- price - decimal
                            1 , -- Q - decimal
                            0.0000 , -- Total - decimal
                            N'' , -- SN - nvarchar(max)
                            dbo.Item_Balance(Item_Id, @year, @StoreID) , -- Balance - decimal
							0,
                            0 , -- Bounas - decimal
                            NULL , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            dbo.get_item_average(@StoreID, Item_Id,
                                                 @ActionDate,@year) , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                            
                            NULL , -- CostAllItemOut - decimal
                            NULL , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            Tax , -- Tax - decimal
                            PriceFexed ,--PriceFexed bit 
                            itm_ismedicine, -- itm_ismedicine bit 
							Item_Unit_Id,
						dbo.Last_purchase(Item_Id,@year) AS    LastPurchase  ,
			            pricelow 

                    FROM    Vitems
                    WHERE   flag = 1
                            AND itm_code2 = @gnitemCode2

        END

			  
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Id , -- ItemCode - int
                            Item_Name , -- ItemName - nvarchar(100)
                            unitname , -- unit - nchar(50)
                            ISNULL(price, 0.0000) AS Price , -- price - decimal
                            1 , -- Q - decimal
                            0.0000 , -- Total - decimal
                            N'' , -- SN - nvarchar(max)
                            dbo.Item_Balance(Item_Id, @year, @StoreID) , -- Balance - decimal
							0,
                            0 , -- Bounas - decimal
                            NULL , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            dbo.get_item_average(@StoreID, Item_Id, @ActionDate,@year) , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                            
                            NULL , -- CostAllItemOut - decimal
                            NULL , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            Tax , -- Tax - decimal
                            PriceFexed ,--PriceFexed bit 
                            itm_ismedicine , -- itm_ismedicine bit 
							Item_Unit_Id,
						dbo.Last_purchase(Item_Id,@year) AS    LastPurchase  ,
			            pricelow 

                    FROM    Vitems
                    WHERE   flag = 1
                            AND Barcode = @gnitemCode2

        END

		 
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Stores.Item_Id , -- ItemCode - int
                            0 , -- ItemName - nvarchar(100)
                            0 , -- unit - nchar(50)
                            0.0000 , -- price - decimal
                            1 , -- Q - decimal
                            0.0000 , -- Total - decimal
                            ExpDate , -- SN - nvarchar(max)
                            dbo.Item_Balance(Item_Stores.Item_Id, @year, @StoreID) , -- Balance - decimal
							0,
                            0 , -- Bounas - decimal
                            0 , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            dbo.get_item_average(@StoreID, Item_Stores.Item_Id, @ActionDate,@year) , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                           
                            NULL , -- CostAllItemOut - decimal
                            NULL , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            0 , -- Tax - decimal
                            0 ,--PriceFexed bit 
                            1 , -- itm_ismedicine bit 
							Item_Unit_Id,
						dbo.Last_purchase(Item_Stores.Item_Id,@year) AS    LastPurchase  ,
			            pricelow 

                    FROM    Item_Stores
					INNER JOIN dbo.Items ON items.Item_Id = dbo.Item_Stores .Item_Id 
                    WHERE   Item_Stores.Barcode = @gnitemCode2
                            

        END


		  

    UPDATE  #temp
    SET     
            CostAllItemOut = ISNULL(Defualt_ItemCost, 0) * Unit_Quantity



    UPDATE  #temp
    SET     maksap = Total - CostAllItemOut  


    UPDATE  #temp
    SET     price = CASE WHEN ( @price_Case = 2 ) THEN ( ISNULL(Defualt_ItemCost, 0.0000) )
                         WHEN ( @price_Case = 0 )
                         THEN ( SELECT  ISNULL(priceCome, 0.0000) AS priceCome
                                FROM    dbo.Items
                                WHERE   Item_Id = #temp.ItemCode
                              )
                         WHEN ( @price_Case = 1
                                AND @pirce_listID > 0
                              )
                         THEN ( SELECT  ISNULL(price, 0.0000) AS Price
                                FROM    dbo.priceList
                                WHERE   priceList.ItemCode = #temp.ItemCode
                                        AND priceList.pirce_listID = @pirce_listID AND priceList.UnitCode =  #temp.Item_Unit_Id
                              )
                         ELSE ( ISNULL(price, 0.0000) )
                    END


if @pirce_listID > 0 

begin


 UPDATE  #temp
    SET     MinPrice =  
                           ( SELECT  ISNULL(priceList.Percentage, 0.0000) AS MinPrice
                                FROM    dbo.priceList
                                WHERE   priceList.ItemCode = #temp.ItemCode
                                        AND priceList.pirce_listID = @pirce_listID AND priceList.UnitCode =  #temp.Item_Unit_Id
                              )
                        


end


   




  UPDATE  #temp
    SET     UnitCost = Defualt_ItemCost ,
            Unit_Price = ISNULL(price, 0.0000) ,
            Unit_Balance = ISNULL(Balance, 0) ,
            Unit_Quantity = ISNULL(Q, 0.0000)



 UPDATE  #temp

    SET     Total =   (ISNULL(price, 0.0000) * ISNULL(Q, 0.0000)) 





	 


UPDATE  #temp

    SET     CostAllItemOut = Defualt_ItemCost * Unit_Quantity


UPDATE  #temp

    SET     maksap = Total - CostAllItemOut





    SELECT  *
    FROM    #temp


 