 
 
CREATE PROCEDURE [dbo].[Item_Movment]
    @FromDate DATE ,
    @ToDate DATE ,
    @tafsely BIT ,
    @CaseID INT ,
    @StoreID INT
AS
    CREATE TABLE #Resul
        (
          InvoiceNo INT ,
          store_name NVARCHAR(50) ,
          itemid BIGINT ,
          ITEMS_ITEM_NAME NVARCHAR(MAX) ,
          unit NVARCHAR(50) ,
          PriceOne FLOAT ,
          Q FLOAT ,
          TotalPrice FLOAT ,
          idate DATE ,
          suppliers_name NVARCHAR(300) ,
          InooiceNOVender NVARCHAR(100) ,
          TaxType NVARCHAR(50) ,
          saltax FLOAT ,
          generaltax FLOAT ,
          Fright FLOAT ,
          Descount FLOAT ,
          net FLOAT ,
          Journal BIGINT ,
          MovmentName NVARCHAR(100)
        )



    IF @StoreID > 0
        BEGIN
           

            IF @CaseID = 0
                BEGIN 
                --    'مراجعة حركة المخازن  '        رصيد(افتتاحى) 

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate


               

                END
                
            IF @CaseID = 1
                BEGIN
                --    '        مشتريات(ضريبية)

                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,ITEMS_ITEM_NAME as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from vinvoicecome where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate
                END 

            IF @CaseID = 2
                BEGIN 

                --    'مشتريات غير ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,ITEMS_ITEM_NAME as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from VinvoiceComeNoTax where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                

            IF @CaseID = 3
                BEGIN 
                --    'مردودات مشتريات ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,ITEMS_ITEM_NAME as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from Mardodat_Vinvoicecome where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'  and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END 

            IF @CaseID = 4
                BEGIN 
                --    'مردودات مشتريات غير ضريبية

                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,ITEMS_ITEM_NAME as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from V_Mardodat_invoiceComeNoTax where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'   and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                
            IF @CaseID = 5
                BEGIN 
                --    '        مبيعات(ضريبية)

                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from vinvoiceout where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vinvoiceout")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                
            IF @CaseID = 6
                BEGIN 
                --    'مبيعات غير ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from vbyan where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vbyan")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                
            IF @CaseID = 7
                BEGIN 


                --    'مردودات مبيعات ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from Mardodat_Vinvoiceout where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vinvoiceout")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                

            IF @CaseID = 8
                BEGIN 
                --    'مردودات مبيعات غير ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from V_Mardodat_byan where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "' and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vbyan")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                

            IF @CaseID = 9
                BEGIN 
                --    '        اذن(اضافة)

                --    DB.Fill_Grid("select EdafaID as 'مسلسل',Edafadate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',Unite  as 'الوحدة',Quantity as 'الكمية' ,Price as 'السعر' ,total as 'قيمة'  from VEznEdafa where Edafadate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY Edafadate", dgv, "VEznEdafa")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                
            IF @CaseID = 10
                BEGIN 
                --    '        اذن(صرف)

                --    DB.Fill_Grid("select SarfID as 'مسلسل',Sarfdate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',Unite  as 'الوحدة',Quantity as 'الكمية' ,Price as 'السعر' ,total as 'قيمة'  from VEznSarf where Sarfdate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY Sarfdate", dgv, "VEznSarf")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END

            IF @CaseID = 11
                BEGIN 

                --    '        تسوية(بالاضافة)
                --    DB.Fill_Grid("select EdafaID as 'مسلسل',Edafadate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',Unite  as 'الوحدة',Quantity as 'الكمية' ,Price as 'السعر' ,total as 'قيمة'  from VTaswyaEdafa where Edafadate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY Edafadate", dgv, "VTaswyaEdafa")


                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                
            IF @CaseID = 12
                BEGIN 
                --    '        تسوية(بالخصم)

                --    DB.Fill_Grid("select SarfID as 'مسلسل',Sarfdate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,Item_Name as 'الصنف',Unite  as 'الوحدة',Quantity as 'الكمية' ,Price as 'السعر' ,total as 'قيمة'  from VTaswyaKhasm where Sarfdate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY Sarfdate", dgv, "VTaswyaKhasm")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END

            IF @CaseID = 13
                BEGIN 
                --    'تحويل بين المخازن


                --    DB.Fill_Grid("select TransId as 'مسلسل',TransDate as 'التاريخ',FormStore as 'المخزن' , groupname as 'المجموعة' ,Item_Name as 'الصنف',Unite  as 'الوحدة',Quantity as 'الكمية' ,Price as 'السعر' ,total as 'قيمة'  from VConvertBetweenStores where TransDate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY TransDate", dgv, "VConvertBetweenStores")

                    INSERT  INTO #Resul
                            ( InvoiceNo ,
                              store_name ,
                              itemid ,
                              ITEMS_ITEM_NAME ,
                              unit ,
                              PriceOne ,
                              Q ,
                              TotalPrice ,
                              idate ,
                              suppliers_name ,
                              InooiceNOVender ,
                              TaxType ,
                              saltax ,
                              generaltax ,
                              Fright ,
                              Descount ,
                              net ,
                              Journal ,
                              MovmentName
				            )
                            SELECT  FSID , -- InvoiceNo - int
                                    store_name , -- store_name - nvarchar(50)
                                    0 , -- itemid - bigint
                                    Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                                    Unite , -- unit - nvarchar(50)
                                    Price , -- PriceOne - float
                                    Quantity , -- Q - float
                                    total , -- TotalPrice - float
                                    FSdate , -- idate - date
                                    N'' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate

                END
                

        END


    --IF @StoreID = 0
    --    BEGIN
           
    --    END
 


    SELECT  *
    FROM    #Resul 

 