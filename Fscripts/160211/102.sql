

ALTER   PROCEDURE [dbo].[GridTable_Stores]
    @MovmentID INT ,
    @year INT ,
    @DefultQ FLOAT = 1 , --الكمية المراد تجميعها 
    @ActionDate DATE ,
    @StoreID INT = 0 ,
    @FlageCase INT = 0 --  0 EznEdafa    1 Ezn Sarf 2 TaxInvoice  3  Not Tax Invoice  4 Assemply 5 ConvertBetween 6 - Taswyaedafa 7 View_Stores_Scan_Edafa 8 VTaswyaKhasm  10 - Tajme3Sanf
AS
    BEGIN

        CREATE TABLE #temp
            (
              Srial BIGINT NULL ,--مسلسل
              ItemCode BIGINT , -- كود الصنف
              ItemName NVARCHAR(100) COLLATE Arabic_CI_Ai ,-- اسم الصنف
              unit NCHAR(10) ,-- الوحدة ال تم بيها البيع
              price FLOAT ,-- سعر البيع على حسب وحدة البيع
              Q FLOAT ,-- الكمية المباعة على حسب وحدة البيع
              Total FLOAT ,-- الاجمالى
              SN NVARCHAR(MAX) ,-- السريال
              Balance FLOAT ,-- الرصيد الفعلى اثناء البيع على حسب وحدة البيع
              Bounas FLOAT ,-- البونص
              Unit_Quantity FLOAT ,-- الكمية على حسب الوحدة الرئيسية
              Unit_Price DECIMAL(18, 4) ,-- السعر على حسب بيع الوحدة الرئيسية
              CostID INT ,-- مركز التكلفة
              CostName NVARCHAR(100) COLLATE Arabic_CI_Ai ,--مركز التكلفة
              Defualt_ItemCost DECIMAL(18, 4) ,-- التكلفة على حسب الوحدة الرئيسية
              UnitCost FLOAT ,-- التكلفة على حسب الوحدة المباعة 
              Unit_Balance FLOAT ,-- الرصيد الفعلى للبيع على حسب الوحدة الرئيسية
              Rate FLOAT ,-- معدل التحويل بين الوحدات حسب الوحدة المباعه
              CostAllItemOut FLOAT ,-- اجمالى تكلفة البضاعه على حسب الوحدة الرئيسية
              maksap FLOAT ,-- مكسب الصنف
              PreviousQTY FLOAT ,-- الكمية السابقة من الصنف فى حالة التعديل على الصنف 
              Tax DECIMAL(18, 4) ,--ضريبه
              PriceFexed BIT ,--لمعرفة هل يمكن التعديل على السعر اثناء البيع ام لا 
              itm_ismedicine BIT , -- لمعرفة هل هو صنف ام خدمة 
              Item_Unit_Id INT
            )


        DELETE  FROM #temp 


        IF @FlageCase = 0
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                VEznEdafa.Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                CostID , -- CostID - int
                                AccName , -- CostName - nvarchar(100)
                                dbo.get_item_average(1, itemid, @ActionDate) , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    VEznEdafa
                        WHERE   EdafaID = @MovmentID
                      
                             
            END



        IF @FlageCase = 1
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                CostId , -- CostID - int
                                AccName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    VEznSarf
                        WHERE   SarfID = @MovmentID
                      
                             
            END




        IF @FlageCase = 2
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serialitem , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                unit , -- unit - nchar(50)
                                ISNULL(PriceOne, 0) AS Price , -- price - decimal
                                Q , -- Q - decimal
                                TotalPrice , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                CostID , -- CostID - int
                                AccName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Q ,-- PreviousQTY - decimal
                                Itemtax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    vinvoiceout
                        WHERE   InvoiceNo = @MovmentID
                                AND store_id > 0
                      
                             
            END



        IF @FlageCase = 3
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serialitem , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                unit , -- unit - nchar(50)
                                ISNULL(PriceOne, 0) AS Price , -- price - decimal
                                Q , -- Q - decimal
                                TotalPrice , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                CostId , -- CostID - int
                                AccName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Q ,-- PreviousQTY - decimal
                                Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    vbyan
                        WHERE   InvoiceNo = @MovmentID
                                AND store_id > 0
                      
                             
            END



        IF @FlageCase = 4  -- assemply
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                CostID , -- CostID - int
                                AccName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    View_Assemplyfrom
                        WHERE   AssID = @MovmentID  
                      
                             
            END



        IF @FlageCase = 5  -- Convert
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                0 AS CostName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                0 AS Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    VConvertBetweenStores
                        WHERE   TransId = @MovmentID  
                      
                             
            END






        IF @FlageCase = 6  -- VTaswyaEdafa
            BEGIN 

                INSERT  INTO #temp
                        SELECT  serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                0 AS CostName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                0 AS Tax , -- Tax - decimal
                                0 AS PriceFexed ,--PriceFexed bit 
                                0 AS itm_ismedicine -- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    VTaswyaEdafa
                        WHERE   EdafaID = @MovmentID  
                      
                             
            END

			 


        IF @FlageCase = 7  -- View_Stores_Scan
            BEGIN 

                INSERT  INTO #temp
                        SELECT  0 AS Srial , -- Srial - numeric
                                Item_Id AS itemid , -- ItemCode - int
                                Item_Id AS ItemName , -- ItemName - nvarchar(100)
                                unitname AS Unite , -- unit - nchar(50)
                                ISNULL(PriceCome, 0) AS Price , -- price - decimal
                                CalcCompAndHand AS Quantity , -- Q - decimal
                                ( CalcCompAndHand * PriceCome ) AS total , -- Total - decimal
                                0 AS SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(Item_Id, @year, @StoreID) AS Balance , -- Balance - decimal
                                0 AS Bounas , -- Bounas - decimal
                                CalcCompAndHand AS Unit_Quantity , -- Unit_Quantity - decimal
                                0 AS Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                '' AS CostName , -- CostName - nvarchar(100)
                                dbo.get_item_average(1, Item_Id, @ActionDate) AS Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                0 AS UnitCost , -- UnitCost - decimal
                                0 AS Unit_Balance , -- Unit_Balance - decimal
                                1 AS Rate , -- Rate - decimal
                                0 AS CostAllItemOut , -- CostAllItemOut - decimal
                                0 AS maksap , -- maksap - decimal
                                ABS(CalcCompAndHand) AS Quantity ,-- PreviousQTY - decimal
                                0 AS Tax , -- Tax - decimal
                                0 AS PriceFexed ,--PriceFexed bit 
                                0 AS itm_ismedicine -- itm_ismedicine bit 
                                ,
                                0 AS SaleUnitID
                        FROM    View_Stores_Scan
                        WHERE   GardID = @MovmentID
                                AND CalcCompAndHand > 0
                      
                             
            END




        IF @FlageCase = 8  -- VTaswyaKhasm
            BEGIN 
                INSERT  INTO #temp
                        SELECT  0 AS Srial , -- Srial - numeric
                                itemid AS itemid , -- ItemCode - int
                                itemid AS ItemName , -- ItemName - nvarchar(100)
                                Unite , -- unit - nchar(50)
                                ISNULL(Price, 0) AS Price , -- price - decimal
                                Quantity , -- Q - decimal
                                total , -- Total - decimal
                                SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                Bounas , -- Bounas - decimal
                                Unit_Quantity , -- Unit_Quantity - decimal
                                Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                0 AS CostName , -- CostName - nvarchar(100)
                                Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                UnitCost , -- UnitCost - decimal
                                Unit_Balance , -- Unit_Balance - decimal
                                Rate , -- Rate - decimal
                                CostAllItemOut , -- CostAllItemOut - decimal
                                maksap , -- maksap - decimal
                                Quantity ,-- PreviousQTY - decimal
                                0 AS Tax , -- Tax - decimal
                                0 AS PriceFexed ,--PriceFexed bit 
                                0 AS itm_ismedicine-- itm_ismedicine bit 
                                ,
                                SaleUnitID
                        FROM    VTaswyaKhasm
                        WHERE   SarfID = @MovmentID  
                      
                             
            END



        IF @FlageCase = 9  -- View_Stores_Scan Khasm
            BEGIN 

                INSERT  INTO #temp
                        SELECT  0 AS Srial , -- Srial - numeric
                                Item_Id AS itemid , -- ItemCode - int
                                Item_Id AS itemid , -- ItemName - nvarchar(100)
                                unitname AS Unite , -- unit - nchar(50)
                                ISNULL(PriceCome, 0) AS Price , -- price - decimal
                                CalcCompAndHand * -1 AS Quantity , -- Q - decimal
                                ( CalcCompAndHand * PriceCome ) AS total , -- Total - decimal
                                0 AS SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(Item_Id, @year, @StoreID) AS Balance , -- Balance - decimal
                                0 AS Bounas , -- Bounas - decimal
                                CalcCompAndHand AS Unit_Quantity , -- Unit_Quantity - decimal
                                0 AS Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                '' AS CostName , -- CostName - nvarchar(100)
                                dbo.get_item_average(1, Item_Id, @ActionDate) AS Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                0 AS UnitCost , -- UnitCost - decimal
                                0 AS Unit_Balance , -- Unit_Balance - decimal
                                1 AS Rate , -- Rate - decimal
                                0 AS CostAllItemOut , -- CostAllItemOut - decimal
                                0 AS maksap , -- maksap - decimal
                                ABS(CalcCompAndHand) AS Quantity ,-- PreviousQTY - decimal
                                0 AS Tax , -- Tax - decimal
                                0 AS PriceFexed ,--PriceFexed bit 
                                0 AS itm_ismedicine -- itm_ismedicine bit 
                                ,
                                0 AS SaleUnitID
                        FROM    View_Stores_Scan
                        WHERE   GardID = @MovmentID
                                AND CalcCompAndHand < 0
                      
                             
            END




        IF @FlageCase = 10  -- Tajme3
            BEGIN 

                INSERT  INTO #temp
                        SELECT  0 AS serial , -- Srial - numeric
                                itemid , -- ItemCode - int
                                itemid , -- ItemName - nvarchar(100)
                                unit , -- unit - nchar(50)
                                dbo.get_item_average(1, itemid, @ActionDate) AS Price , -- price - decimal
                                ( ISNULL(Q, 0) * ( @DefultQ ) ) AS Quantity , -- Q - decimal
                                0 AS total , -- Total - decimal
                                0 AS SN , -- SN - nvarchar(max)
                                dbo.Item_Balance(itemid, @year, @StoreID) , -- Balance - decimal
                                0 AS Bounas , -- Bounas - decimal
                                0 AS Unit_Quantity , -- Unit_Quantity - decimal
                                0 AS Unit_Price , -- Unit_Price - decimal
                                0 AS CostID , -- CostID - int
                                0 AS AccName , -- CostName - nvarchar(100)
                                0 AS Defualt_ItemCost , -- Defualt_ItemCost - decimal
                                0 AS UnitCost , -- UnitCost - decimal
                                0 AS Unit_Balance , -- Unit_Balance - decimal
                                CASE WHEN ( ItemContent.unitCode = Items.Item_Unit_Id )
                                     THEN ( 1 )
                                     WHEN ( ItemContent.unitCode = dbo.Items.Item_unit2
                                            AND ISNULL(EqulUnit, 0) > 0
                                          ) THEN ( EqulUnit )
                                     WHEN ( ItemContent.unitCode = dbo.Items.Item_unit3
                                            AND ISNULL(EqulUnit2, 0) > 0
                                          ) THEN ( EqulUnit2 )
                                     ELSE ( 1 )
                                END AS Rate , -- Rate - decimal
                                0 AS CostAllItemOut , -- CostAllItemOut - decimal
                                0 AS maksap , -- maksap - decimal
                                0 AS Quantity ,-- PreviousQTY - decimal
                                Tax , -- Tax - decimal
                                PriceFexed ,--PriceFexed bit 
                                itm_ismedicine , -- itm_ismedicine bit 
                                ItemContent.unitCode AS SaleUnitID
                        FROM    dbo.Items
                                INNER JOIN dbo.ItemContent ON dbo.Items.Item_Id = dbo.ItemContent.itemid
                        WHERE   DefaulID = @MovmentID 


            END  
			
			
        IF @FlageCase = 10  -- Tajme3
            BEGIN 
			
                UPDATE  #temp
                SET     Total = price * Q ,
                        Unit_Price = price ,
                        Unit_Quantity = Q /Rate ,
                        Defualt_ItemCost = price ,
                        UnitCost = price ,
                        Unit_Balance = Balance  
                      
					 

            END       
    END














    UPDATE  #temp
    SET     Q = ABS(Q)
    WHERE   Q < 0


    UPDATE  #temp
    SET     Unit_Quantity = ABS(Unit_Quantity)
    WHERE   Unit_Quantity < 0


    SELECT  *
    FROM    #temp


 