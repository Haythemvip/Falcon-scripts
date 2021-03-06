
 

ALTER PROCEDURE [dbo].[Purchased_Items]
    @FromDate DATE ,
    @ToDate DATE ,
    @storeName NVARCHAR(100) = 'erwrer' ,
    @StoreID INT = 0 ,
    @SuplierID INT = 0 ,
    @SuppName NVARCHAR(200) = ''
AS
    BEGIN


        DECLARE @totalQuantiry FLOAT ,
            @TotalValue FLOAT 


        
        DELETE  FROM dbo.berchasebetweendate 


        CREATE TABLE #Result
            (
              [itemid] [BIGINT] NULL ,
              [itemname] [NVARCHAR](MAX) NULL ,
              [unit] [NVARCHAR](50) NULL ,
              [quantity] [FLOAT] NULL ,
              [valsum] [FLOAT] NULL ,
              [avrege] [DECIMAL](18, 4) NULL ,
              [pricepercent] [DECIMAL](18, 2) NULL ,
              [qpercent] [DECIMAL](18, 2) NULL ,
              [fromdate] [NVARCHAR](50) NULL ,
              [todate] [NVARCHAR](50) NULL ,
              [store] [NVARCHAR](50) NULL ,
              [tasnef] [NVARCHAR](50) NULL ,
              [grouup] [NVARCHAR](50) NULL ,
              [supgroup] [NVARCHAR](50) NULL ,
              [moared] [NVARCHAR](50) NULL ,
              [PurshaseUnit] INT ,
              [unitcode] INT ,
              [Item_unit2] INT ,
              [Item_unit3] INT ,
              [EqulUnit] FLOAT ,
              [EqulUnit2] FLOAT
            )



IF @StoreID = 0 AND @SuplierID = 0
BEGIN
        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitemNoTax
                        INNER JOIN invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitemNoTax.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitemNoTax.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND store_id > 0
                GROUP BY invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.unit ,
                        invcomeitemNoTax.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcomeitemNoTax.InvoiceNo
                ORDER BY invcomeitemNoTax.itemid



        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitem
                        INNER JOIN invcome ON invcome.InvoiceNo = invcomeitem.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitem.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitem.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND store_id > 0
                GROUP BY invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.unit ,
                        invcomeitem.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcome.InvoiceNo
                ORDER BY invcomeitem.itemid
END


IF @StoreID > 0 AND @SuplierID = 0
BEGIN
        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitemNoTax
                        INNER JOIN invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitemNoTax.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitemNoTax.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND store_id = @StoreID AND store_id > 0
                GROUP BY invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.unit ,
                        invcomeitemNoTax.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcomeitemNoTax.InvoiceNo
                ORDER BY invcomeitemNoTax.itemid



        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitem
                        INNER JOIN invcome ON invcome.InvoiceNo = invcomeitem.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitem.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitem.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND store_id = @StoreID AND store_id > 0
                GROUP BY invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.unit ,
                        invcomeitem.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcome.InvoiceNo
                ORDER BY invcomeitem.itemid
END



IF @StoreID = 0 AND @SuplierID > 0
BEGIN
        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitemNoTax
                        INNER JOIN invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitemNoTax.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitemNoTax.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND ClientID = @SuplierID AND store_id > 0
                GROUP BY invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.unit ,
                        invcomeitemNoTax.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcomeitemNoTax.InvoiceNo
                ORDER BY invcomeitemNoTax.itemid



        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitem
                        INNER JOIN invcome ON invcome.InvoiceNo = invcomeitem.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitem.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitem.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND ClientID = @SuplierID AND store_id > 0
                GROUP BY invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.unit ,
                        invcomeitem.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcome.InvoiceNo
                ORDER BY invcomeitem.itemid
END


IF @StoreID > 0 AND @SuplierID > 0
BEGIN
        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitemNoTax
                        INNER JOIN invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitemNoTax.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitemNoTax.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND ClientID = @SuplierID AND store_id > 0 AND store_id = @StoreID
                GROUP BY invcomeitemNoTax.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitemNoTax.Q ,
                        invcomeitemNoTax.unit ,
                        invcomeitemNoTax.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcomeitemNoTax.InvoiceNo
                ORDER BY invcomeitemNoTax.itemid



        INSERT  INTO #Result
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared ,
                  PurshaseUnit ,
                  unitcode ,
                  Item_unit2 ,
                  Item_unit3 ,
                  EqulUnit ,
                  EqulUnit2
			           
			    )
                SELECT  invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.TotalPrice ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        NULL ,
                        unit_1.unitcode , -- وحدة الشراء
                        Items.Item_Unit_Id ,-- الوحدة الكبرى
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2
                FROM    invcomeitem
                        INNER JOIN invcome ON invcome.InvoiceNo = invcomeitem.InvoiceNo
                        INNER JOIN Items ON Items.Item_Id = invcomeitem.itemid
                        INNER JOIN unit ON unit.unitcode = Items.Item_Unit_Id
                        LEFT OUTER JOIN unit AS unit_1 ON invcomeitem.unit = unit_1.unitname
                WHERE   idate BETWEEN @FromDate AND @ToDate AND ClientID = @SuplierID AND store_id > 0 AND store_id = @StoreID
                GROUP BY invcomeitem.itemid ,
                        Items.Item_Name ,
                        unit.unitname ,
                        invcomeitem.Q ,
                        invcomeitem.unit ,
                        invcomeitem.TotalPrice ,
                        unit_1.unitcode ,
                        Items.Item_unit2 ,
                        Items.Item_unit3 ,
                        Items.EqulUnit ,
                        Items.EqulUnit2 ,
                        Items.Item_Unit_Id ,
                        invcome.InvoiceNo
                ORDER BY invcomeitem.itemid
END





        UPDATE  #Result
        SET     quantity = CASE WHEN ( #Result.PurshaseUnit = #Result.unitcode )
                                THEN ( quantity )
                                WHEN ( #Result.PurshaseUnit = #Result.Item_unit2 )
                                THEN ( quantity / ISNULL(EqulUnit, 0) )
                                WHEN ( #Result.PurshaseUnit = #Result.Item_unit3 )
                                THEN ( quantity / ISNULL(EqulUnit2, 0) )
                                ELSE ( quantity )
                           END 



        INSERT  INTO berchasebetweendate
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared  
			           
			    )
                SELECT  itemid ,
                        itemname ,
                        unit ,
                        ISNULL(SUM(quantity), 0) ,
                        ISNULL(SUM(valsum), 0) ,
                        0 ,
                        0 ,
                        0 ,
                        @FromDate ,
                        @ToDate ,
                        @storeName ,
                        NULL ,
                        NULL ,
                        NULL ,
                        @SuppName
                FROM    #Result
                GROUP BY itemid ,
                        itemname ,
                        unit
                ORDER BY itemid 







        SET @TotalValue = ( SELECT  SUM(valsum)
                            FROM    berchasebetweendate
                          )


        SET @totalQuantiry = ( SELECT   SUM(quantity)
                               FROM     berchasebetweendate
                             )




        UPDATE  berchasebetweendate
        SET     avrege = valsum / quantity 

		
        UPDATE  berchasebetweendate
        SET     qpercent = ( quantity / @totalQuantiry ) * 100


        UPDATE  berchasebetweendate
        SET     pricepercent = ( valsum / @TotalValue ) * 100

		 

        SELECT  *
        FROM    berchasebetweendate 

    END
