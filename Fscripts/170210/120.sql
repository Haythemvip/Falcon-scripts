 

ALTER   PROCEDURE [dbo].[Kitchen]
    @ProductID INT ,
    @year INT ,
    @DefultQ FLOAT = 1 , --الكمية المراد تجميعها 
    @ActionDate DATE ,
    @StoreIDFrom INT = 1 ,
    @StoreIDTo INT = 2,
	@byaneznID int
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
              bigunit INT NULL ,
              UnitCode INT NULL ,
              Medumcode INT NULL ,
              smallucod INT NULL ,
              EqulUnit FLOAT NULL ,
              EqulUnit2 FLOAT NULL
            )


        DELETE  FROM #temp 

        INSERT  INTO #temp
                SELECT  0 AS serial , -- Srial - numeric
                        itemid , -- ItemCode - int
                        itemid , -- ItemName - nvarchar(100)
                        unit , -- unit - nchar(50)
                        dbo.get_item_average(1, itemid, @ActionDate,@year) AS Price , -- price - decimal
                        ( ISNULL(Q, 0) * ( @DefultQ ) ) AS Quantity , -- Q - decimal
                        0 AS total , -- Total - decimal
                        0 AS SN , -- SN - nvarchar(max)
                        0 , -- Balance - decimal
                        0 AS Bounas , -- Bounas - decimal
                        0 AS Unit_Quantity , -- Unit_Quantity - decimal
                        0 AS Unit_Price , -- Unit_Price - decimal
                        0 AS CostID , -- CostID - int
                        0 AS AccName , -- CostName - nvarchar(100)
                        0 AS Defualt_ItemCost , -- Defualt_ItemCost - decimal
                        0 AS UnitCost , -- UnitCost - decimal
                        0 AS Unit_Balance , -- Unit_Balance - decimal
                        0 AS Rate , -- Rate - decimal
                        0 AS CostAllItemOut , -- CostAllItemOut - decimal
                        0 AS maksap , -- maksap - decimal
                        0 AS Quantity ,-- PreviousQTY - decimal
                        Tax , -- Tax - decimal
                        PriceFexed ,--PriceFexed bit 
                        itm_ismedicine , -- itm_ismedicine bit 
                        Item_Unit_Id ,
                        ItemContent.unitCode ,
                        Item_unit2 ,
                        Item_unit3 ,
                        EqulUnit ,
                        EqulUnit2
                FROM    dbo.Items
                        INNER JOIN dbo.ItemContent ON dbo.Items.Item_Id = dbo.ItemContent.itemid
                WHERE   DefaulID = @ProductID 


        UPDATE  #temp
        SET     Q = CASE WHEN ( #temp.bigunit = #temp.UnitCode )
                         THEN ( #temp.Q )
                         WHEN ( #temp.UnitCode = #temp.Medumcode )
                         THEN ( #temp.Q / EqulUnit )
                         WHEN ( #temp.UnitCode = #temp.smallucod )
                         THEN ( #temp.Q / EqulUnit2 )
                    END
			


        UPDATE  #temp
        SET     Total = price * Q ,
                Unit_Price = price ,
                Unit_Quantity = Q ,
                Defualt_ItemCost = price ,
                UnitCost = price 
              

            
    
		 
	  
        INSERT  INTO dbo.Item_Card
                ( store_id ,
                  Item_Id ,
                  VenderOrCustomer ,
                  EznNO ,
                  InvNO ,
                  ActionDate ,
                  QCome ,
                  PriceCome ,
                  AllPriceCome ,
                  Qout ,
                  PriceOut ,
                  AllPriceOut ,
                  CostAllItemOut ,
                  Year ,
                  VallItemsInStores ,
                  Maksab ,
                  ActionName ,
                  SN ,
                  FirstStokID ,
                  EsnSarfID ,
                  EznEdafaID ,
                  InvtaxID ,
                  ByanID ,
                  TaswyaEdafaID ,
                  TaswyaKhasmID ,
                  ConvertBetwenStores ,
                  TagmeaSanf ,
                  TalabMowadID ,
                  Mardodat_inv_ID ,
                  Mardoat_byan_id ,
                  Inv_com_ID ,
                  Inv_com_noTax_ID ,
                  Mardodat_Inv_Com_Id ,
                  Mardodat_Inv_Com_Nottax_ID ,
                  Srial ,
                  TalabMowadINDEX
	            )
                SELECT  @StoreIDTo , -- store_id - bigint
                        @ProductID , -- Item_Id - bigint
                        'Kitchen' , -- VenderOrCustomer - varchar(50)
                        @byaneznID , -- EznNO - bigint
                        @byaneznID , -- InvNO - bigint
                        @ActionDate , -- ActionDate - date
                        @DefultQ , -- QCome - float
                        SUM(Unit_Price) , -- PriceCome - float
                        SUM(Total) , -- AllPriceCome - float
                        0.0 , -- Qout - float
                        0.0 , -- PriceOut - float
                        0.0 , -- AllPriceOut - float
                        0.0 , -- CostAllItemOut - float
                        @year , -- Year - bigint
                        0.0 , -- VallItemsInStores - float
                        0.0 , -- Maksab - float
                        'Kitchen' , -- ActionName - varchar(50)
                        N'' , -- SN - nvarchar(max)
                        0 , -- FirstStokID - bigint
                        0 , -- EsnSarfID - bigint
                        0 , -- EznEdafaID - bigint
                        0 , -- InvtaxID - int
                        0 , -- ByanID - int
                        0 , -- TaswyaEdafaID - int
                        0 , -- TaswyaKhasmID - int
                        0 , -- ConvertBetwenStores - int
                        0 , -- TagmeaSanf - int
                        0 , -- TalabMowadID - int
                        0 , -- Mardodat_inv_ID - int
                        0 , -- Mardoat_byan_id - int
                        0 , -- Inv_com_ID - int
                        0 , -- Inv_com_noTax_ID - int
                        0 , -- Mardodat_Inv_Com_Id - int
                        0 , -- Mardodat_Inv_Com_Nottax_ID - int
                        0 , -- Srial - int
                        0  -- TalabMowadINDEX - int
                FROM    #temp 
	         

       
	    INSERT  INTO dbo.Item_Card
                ( store_id ,
                  Item_Id ,
                  VenderOrCustomer ,
                  EznNO ,
                  InvNO ,
                  ActionDate ,
                  QCome ,
                  PriceCome ,
                  AllPriceCome ,
                  Qout ,
                  PriceOut ,
                  AllPriceOut ,
                  CostAllItemOut ,
                  Year ,
                  VallItemsInStores ,
                  Maksab ,
                  ActionName ,
                  SN ,
                  FirstStokID ,
                  EsnSarfID ,
                  EznEdafaID ,
                  InvtaxID ,
                  ByanID ,
                  TaswyaEdafaID ,
                  TaswyaKhasmID ,
                  ConvertBetwenStores ,
                  TagmeaSanf ,
                  TalabMowadID ,
                  Mardodat_inv_ID ,
                  Mardoat_byan_id ,
                  Inv_com_ID ,
                  Inv_com_noTax_ID ,
                  Mardodat_Inv_Com_Id ,
                  Mardodat_Inv_Com_Nottax_ID ,
                  Srial ,
                  TalabMowadINDEX
	            )
                SELECT  @StoreIDFrom , -- store_id - bigint
                        ItemCode , -- Item_Id - bigint
                        'Kitchen' , -- VenderOrCustomer - varchar(50)
                        @byaneznID , -- EznNO - bigint
                        @byaneznID , -- InvNO - bigint
                        @ActionDate , -- ActionDate - date
                        0 , -- QCome - float
                        0 , -- PriceCome - float
                        0 , -- AllPriceCome - float
                        Q , -- Qout - float
                        price , -- PriceOut - float
                        Total , -- AllPriceOut - float
                        Total , -- CostAllItemOut - float
                        @year , -- Year - bigint
                        0.0 , -- VallItemsInStores - float
                        0.0 , -- Maksab - float
                        'Kitchen' , -- ActionName - varchar(50)
                        N'' , -- SN - nvarchar(max)
                        0 , -- FirstStokID - bigint
                        0 , -- EsnSarfID - bigint
                        0 , -- EznEdafaID - bigint
                        0 , -- InvtaxID - int
                        0 , -- ByanID - int
                        0 , -- TaswyaEdafaID - int
                        0 , -- TaswyaKhasmID - int
                        0 , -- ConvertBetwenStores - int
                        0 , -- TagmeaSanf - int
                        0 , -- TalabMowadID - int
                        0 , -- Mardodat_inv_ID - int
                        0 , -- Mardoat_byan_id - int
                        0 , -- Inv_com_ID - int
                        0 , -- Inv_com_noTax_ID - int
                        0 , -- Mardodat_Inv_Com_Id - int
                        0 , -- Mardodat_Inv_Com_Nottax_ID - int
                        0 , -- Srial - int
                        0  -- TalabMowadINDEX - int
                FROM    #temp 

	 

    END
    


