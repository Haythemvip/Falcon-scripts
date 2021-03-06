 

ALTER PROCEDURE [dbo].[PO_ItemGrid]
    @gnitemcod NVARCHAR(150) ,
    @gnitemCode2 NVARCHAR(150) ,
    @year INT ,
    @ActionDate DATE
AS
    BEGIN

        CREATE TABLE #temp
            (
              Srial NUMERIC(8) NULL ,--مسلسل
              ItemCode BIGINT , -- كود الصنف
              ItemName NVARCHAR(MAX) COLLATE Arabic_CI_AI ,-- اسم الصنف
              unit NCHAR(20) ,-- الوحدة ال تم بيها البيع
              price FLOAT DEFAULT 0.00 ,-- سعر البيع على حسب وحدة البيع
              Q FLOAT ,-- الكمية المباعة على حسب وحدة البيع
              Total FLOAT ,-- الاجمالى
              SN NVARCHAR(MAX) ,-- السريال
              Balance FLOAT ,-- الرصيد الفعلى اثناء البيع على حسب وحدة البيع
              Discount FLOAT ,
              Bounas FLOAT ,-- البونص
              Unit_Quantity FLOAT ,-- الكمية على حسب الوحدة الرئيسية
              Unit_Price FLOAT ,-- السعر على حسب بيع الوحدة الرئيسية
              CostID INT ,-- مركز التكلفة
              CostName NVARCHAR(100) COLLATE Arabic_CI_AI ,--مركز التكلفة
              Defualt_ItemCost DECIMAL(18, 4) ,-- التكلفة على حسب الوحدة الرئيسية
              UnitCost FLOAT ,-- التكلفة على حسب الوحدة المباعة 
              Unit_Balance FLOAT ,-- الرصيد الفعلى للبيع على حسب الوحدة الرئيسية
              Rate FLOAT ,-- معدل التحويل بين الوحدات حسب الوحدة المباعه
              CostAllItemOut FLOAT ,-- اجمالى تكلفة البضاعه على حسب الوحدة الرئيسية
              maksap FLOAT ,-- مكسب الصنف
              PreviousQTY FLOAT ,-- الكمية السابقة من الصنف فى حالة التعديل على الصنف 
              Tax FLOAT ,--ضريبه
              PriceFexed BIT ,--لمعرفة هل يمكن التعديل على السعر اثناء البيع ام لا 
              itm_ismedicine BIT , -- لمعرفة هل هو صنف ام خدمة 
              Item_Unit_Id INT ,
              Budget FLOAT ,
              PreviousValue FLOAT ,
              Diff FLOAT ,
              SupID BIGINT ,
              Last_purchase FLOAT ,
              Stock FLOAT
            );


        DELETE  FROM #temp; 

        INSERT  INTO #temp
                SELECT  0 , -- Srial - numeric
                        Item_Id , -- ItemCode - int
                        Item_Name , -- ItemName - nvarchar(100)
                        unitname , -- unit - nchar(50)
                        ISNULL(priceCome, 0.00) AS Price , -- price - decimal
                        0 , -- Q - decimal
                        0.00 , -- Total - decimal
                        N'' , -- SN - nvarchar(max)
                        0 , -- Balance - decimal
                        0 ,
                        0 , -- Bounas - decimal
                        1 , -- Unit_Quantity - decimal
                        0 , -- Unit_Price - decimal
                        0 , -- CostID - int
                        N'' , -- CostName - nvarchar(100)
                        0 , -- Defualt_ItemCost - decimal
                        NULL , -- UnitCost - decimal
                        NULL , -- Unit_Balance - decimal
                        1 , -- Rate - decimal
                        NULL , -- CostAllItemOut - decimal
                        0 , -- maksap - decimal
                        NULL ,-- PreviousQTY - decimal
                        Tax , -- Tax - decimal
                        PriceFexed ,--PriceFexed bit 
                        itm_ismedicine , -- itm_ismedicine bit 
                        Item_Unit_Id ,
                        0 AS Budget ,
                        0 AS PreviousValue ,
                        0 AS Diff ,
                        Item_Gro_Sub_Id AS SupID ,
                        dbo.Last_purchase(@gnitemcod) ,
                        0
                FROM    Vitems
                WHERE   flag = 1
                        AND Item_Id = @gnitemcod;
                             
    END;
                 
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Id , -- ItemCode - int
                            Item_Name , -- ItemName - nvarchar(100)
                            unitname , -- unit - nchar(50)
                            ISNULL(priceCome, 0.00) AS Price , -- price - decimal
                            1 , -- Q - decimal
                            0.00 , -- Total - decimal
                            N'' , -- SN - nvarchar(max)
                            0 , -- Balance - decimal
                            0 ,
                            0 , -- Bounas - decimal
                            NULL , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            0 , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                            NULL , -- CostAllItemOut - decimal
                            0 , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            Tax , -- Tax - decimal
                            PriceFexed ,--PriceFexed bit 
                            itm_ismedicine , -- itm_ismedicine bit 
                            Item_Unit_Id ,
                            0 AS Budget ,
                            0 AS PreviousValue ,
                            0 AS Diff ,
                            Item_Gro_Sub_Id AS SupID ,
                             dbo.Last_purchase(@gnitemcod) ,
                            0
                    FROM    Vitems
                    WHERE   flag = 1
                            AND itm_code2 = @gnitemCode2;

        END;

			  
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Id , -- ItemCode - int
                            Item_Name , -- ItemName - nvarchar(100)
                            unitname , -- unit - nchar(50)
                            ISNULL(priceCome, 0.00) AS Price , -- price - decimal
                            1 , -- Q - decimal
                            0.00 , -- Total - decimal
                            N'' , -- SN - nvarchar(max)
                            0 , -- Balance - decimal
                            0 ,
                            0 , -- Bounas - decimal
                            NULL , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            0 , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                            NULL , -- CostAllItemOut - decimal
                            0 , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            Tax , -- Tax - decimal
                            PriceFexed ,--PriceFexed bit 
                            itm_ismedicine , -- itm_ismedicine bit 
                            Item_Unit_Id ,
                            0 AS Budget ,
                            0 AS PreviousValue ,
                            0 AS Diff ,
                            Item_Gro_Sub_Id AS SupID ,
                             dbo.Last_purchase(@gnitemcod) ,
                            0
                    FROM    Vitems
                    WHERE   flag = 1
                            AND Barcode = @gnitemCode2;

        END;

		 
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  0 , -- Srial - numeric
                            Item_Stores.Item_Id , -- ItemCode - int
                            0 , -- ItemName - nvarchar(100)
                            0 , -- unit - nchar(50)
                            ISNULL(priceCome, 0.00) AS Price , -- price - decimal
                            1 , -- Q - decimal
                            0.00 , -- Total - decimal
                            ExpDate , -- SN - nvarchar(max)
                            0 , -- Balance - decimal
                            0 ,
                            0 , -- Bounas - decimal
                            0 , -- Unit_Quantity - decimal
                            0 , -- Unit_Price - decimal
                            0 , -- CostID - int
                            N'' , -- CostName - nvarchar(100)
                            0 , -- Defualt_ItemCost - decimal
                            NULL , -- UnitCost - decimal
                            NULL , -- Unit_Balance - decimal
                            NULL , -- Rate - decimal
                            NULL , -- CostAllItemOut - decimal
                            0 , -- maksap - decimal
                            NULL ,-- PreviousQTY - decimal
                            0 , -- Tax - decimal
                            0 ,--PriceFexed bit 
                            1 , -- itm_ismedicine bit 
                            Item_Unit_Id ,
                            0 AS Budget ,
                            0 AS PreviousValue ,
                            0 AS Diff ,
                            Item_Gro_Sub_Id AS SupID ,
                             dbo.Last_purchase(@gnitemcod) ,
                            0
                    FROM    Item_Stores
                            INNER JOIN dbo.Items ON Items.Item_Id = dbo.Item_Stores.Item_Id
                    WHERE   Item_Stores.Barcode = @gnitemCode2;
                            

        END;


		  

    UPDATE  #temp
    SET     CostAllItemOut = ISNULL(Defualt_ItemCost, 0) * Unit_Quantity;



   

   



    UPDATE  #temp
    SET     UnitCost = Defualt_ItemCost ,
            Unit_Price = ISNULL(price, 0.0000) ,
            Unit_Balance = ISNULL(Balance, 0) ,
            Unit_Quantity = ISNULL(Q, 0.0000);



    UPDATE  #temp
    SET     Total = ( ISNULL(price, 0.0000) * ISNULL(Q, 0.0000) ); 





	 


--UPDATE  #temp

--    SET     CostAllItemOut = Defualt_ItemCost * Unit_Quantity



    BEGIN TRY		

        UPDATE  #temp
        SET     Stock = ( SELECT    SUM(QCome) - SUM(Qout)
                          FROM      dbo.Item_Card
                          WHERE     Year = @year
                                    AND Item_Id = ItemCode
                        );


    END TRY

    BEGIN CATCH

    END CATCH;




  


    SELECT  *
    FROM    #temp;


 