
 
ALTER PROCEDURE [dbo].[Item_Movment]
    @FromDate DATE ,
    @ToDate DATE ,
    @CaseID INT ,
    @StoreID INT = 0
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
                            itemid , -- itemid - bigint
                            Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                            Unite , -- unit - nvarchar(50)
                            Price , -- PriceOne - float
                            Quantity , -- Q - float
                            total , -- TotalPrice - float
                            FSdate , -- idate - date
                            N'رصيد افتتاحى' , -- suppliers_name - nvarchar(300)
                            N'0' , -- InooiceNOVender - nvarchar(100)
                            N'' , -- TaxType - nvarchar(50)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            0.0 , -- net - float
                            0 , -- Journal - bigint
                            N'رصيد افتتاحى'  -- MovmentName - nvarchar(100)
                    FROM    dbo.VFirestStock
                    WHERE   FSdate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY FSdate


               

        END
                
    IF @CaseID = 1
        BEGIN
                --    '        مشتريات(ضريبية)

               
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            suppliers_name , -- suppliers_name - nvarchar(300)
                            InooiceNOVender , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            saltax , -- saltax - float
                            generaltax , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            BeurchisingTypeMoves -- MovmentName - nvarchar(100)
                    FROM    dbo.vinvoicecome
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate
        END 

    IF @CaseID = 2
        BEGIN 

                --    'مشتريات غير ضريبية
                --    DB.Fill_Grid("select InvoiceNo as 'مسلسل',idate as 'التاريخ',store_name as 'المخزن',groupname as 'المجموعة' ,ITEMS_ITEM_NAME as 'الصنف',unit as 'الوحدة',Q as 'الكمية' ,PriceOne as 'السعر' ,TotalPrice as 'قيمة'  from  where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            suppliers_name , -- suppliers_name - nvarchar(300)
                            InooiceNOVender , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            0 , -- saltax - float
                            0 , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            BeurchisingTypeMoves -- MovmentName - nvarchar(100)
                    FROM    dbo.VinvoiceComeNoTax
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END
                

    IF @CaseID = 3
        BEGIN 
                --    'مردودات مشتريات ضريبية
 
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            suppliers_name , -- suppliers_name - nvarchar(300)
                            InooiceNOVender , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            saltax , -- saltax - float
                            generaltax , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            BeurchisingTypeMoves -- MovmentName - nvarchar(100)
                    FROM    dbo.Mardodat_Vinvoicecome
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END 

    IF @CaseID = 4
        BEGIN 
                --    'مردودات مشتريات غير ضريبية

 
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            suppliers_name , -- suppliers_name - nvarchar(300)
                            InooiceNOVender , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            0 , -- saltax - float
                            0 , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            BeurchisingTypeMoves -- MovmentName - nvarchar(100)
                    FROM    dbo.V_Mardodat_invoiceComeNoTax
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END
                
    IF @CaseID = 5
        BEGIN 
                --    '        مبيعات(ضريبية)

 
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            customer_name , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            saltax , -- saltax - float
                            generaltax , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            servicetype -- MovmentName - nvarchar(100)
                    FROM    dbo.vinvoiceout
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            customer_name , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            0 , -- saltax - float
                            0 , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            Net , -- net - float
                            Journal , -- Journal - bigint
                            servicetype -- MovmentName - nvarchar(100)
                    FROM    dbo.vbyan
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END
                
    IF @CaseID = 7
        BEGIN 


                --    'مردودات مبيعات ضريبية
 
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            customer_name , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            saltax , -- saltax - float
                            generaltax , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            net , -- net - float
                            Journal , -- Journal - bigint
                            servicetype -- MovmentName - nvarchar(100)
                    FROM    dbo.Mardodat_Vinvoiceout
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END
                

    IF @CaseID = 8
        BEGIN 
                --    'مردودات مبيعات غير ضريبية
 
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
                    SELECT  InvoiceNo , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            0 , -- itemid - bigint
                            ITEMS_ITEM_NAME , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unit , -- unit - nvarchar(50)
                            PriceOne , -- PriceOne - float
                            Q , -- Q - float
                            TotalPrice , -- TotalPrice - float
                            idate , -- idate - date
                            customer_name , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            invtype , -- TaxType - nvarchar(50)
                            0 , -- saltax - float
                            0 , -- generaltax - float
                            Fright , -- Fright - float
                            Descount , -- Descount - float
                            Net , -- net - float
                            Journal , -- Journal - bigint
                            servicetype -- MovmentName - nvarchar(100)
                    FROM    dbo.V_Mardodat_byan
                    WHERE   idate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY idate

        END
                

    IF @CaseID = 9
        BEGIN 
                --    '        اذن(اضافة)

 
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
                    SELECT  EdafaID , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            itemid , -- itemid - bigint
                            Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                            Unite , -- unit - nvarchar(50)
                            Price , -- PriceOne - float
                            Quantity , -- Q - float
                            total , -- TotalPrice - float
                            Edafadate , -- idate - date
                            suppliers_name , -- suppliers_name - nvarchar(300)
                            TblCostTree.AccName , -- suppliers_name - nvarchar(300)
                            CostID , -- InooiceNOVender - nvarchar(100)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            total , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.VEznEdafa
                            LEFT OUTER JOIN TblCostTree ON TblCostTree.AccCode = VEznEdafa.CostID
                    WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY Edafadate

        END
                
    IF @CaseID = 10
        BEGIN 
                --    '        اذن(صرف)

 
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
                    SELECT  SarfID , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            itemid , -- itemid - bigint
                            Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                            Unite , -- unit - nvarchar(50)
                            Price , -- PriceOne - float
                            Quantity , -- Q - float
                            total , -- TotalPrice - float
                            Sarfdate , -- idate - date
                            customer_name , -- suppliers_name - nvarchar(300)
                            TblCostTree.AccName , -- suppliers_name - nvarchar(300)
                            CostId , -- InooiceNOVender - nvarchar(100)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            total , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.VEznSarf
                            LEFT OUTER JOIN TblCostTree ON TblCostTree.AccCode = VEznSarf.CostId
                    WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY Sarfdate

        END

    IF @CaseID = 11
        BEGIN 

                --    '        تسوية(بالاضافة)
 

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
                    SELECT  EdafaID , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            itemid , -- itemid - bigint
                            Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                            Unite , -- unit - nvarchar(50)
                            Price , -- PriceOne - float
                            Quantity , -- Q - float
                            total , -- TotalPrice - float
                            Edafadate , -- idate - date
                          
                            AccName , -- suppliers_name - nvarchar(300)
                            CostID , -- InooiceNOVender - nvarchar(100)
							  '' , -- suppliers_name - nvarchar(300)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            total , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.VTaswyaEdafa
                            LEFT OUTER JOIN TblCostTree ON TblCostTree.AccCode = VTaswyaEdafa.CostID
                    WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY Edafadate

        END
                
    IF @CaseID = 12
        BEGIN 
                --    '        تسوية(بالخصم)


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
                    SELECT  SarfID ,
                            store_name ,
                            itemid ,
                            Item_Name ,
                            Unite ,
                            Price ,
                            Quantity ,
                            total ,
                            Sarfdate ,
                            TblCostTree.AccName ,
                            VTaswyaKhasm.CostID ,
							   '' ,
                            0.0 ,
                            0.0 ,
                            0.0 ,
                            0.0 ,
                            VTaswyaKhasm.total AS Expr6 ,
                            0 AS Expr7 ,
                            N'' AS Expr8
                    FROM    VTaswyaKhasm
                            LEFT OUTER JOIN TblCostTree ON TblCostTree.AccCode = VTaswyaKhasm.CostID
                    WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY Sarfdate

        END

    IF @CaseID = 13
        BEGIN 
                --    'تحويل بين المخازن

 
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
                    SELECT  TransId , -- InvoiceNo - int
                            store_name , -- store_name - nvarchar(50)
                            itemid , -- itemid - bigint
                            Item_Name , -- ITEMS_ITEM_NAME - nvarchar(max)
                            Unite , -- unit - nvarchar(50)
                            Price , -- PriceOne - float
                            Quantity , -- Q - float
                            total , -- TotalPrice - float
                            TransDate , -- idate - date
                            StoreNameTO , -- suppliers_name - nvarchar(300)
                            AccName , -- suppliers_name - nvarchar(300)
                            CostID , -- InooiceNOVender - nvarchar(100)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            0.0 , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.VConvertBetweenStores
                            LEFT OUTER JOIN TblCostTree ON TblCostTree.AccCode = VConvertBetweenStores.CostID
                    WHERE   TransDate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR store_id = @StoreID
                                )
                    ORDER BY TransDate

        END
                

      
 
  IF @CaseID = 14
        BEGIN 
                --    'تجميع وتفكيك الاصناف

 
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
                    SELECT  AssID , -- InvoiceNo - int
                            storenamefrom , -- store_name - nvarchar(50)
                            itemidfrom , -- itemid - bigint
                            itemfrom , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unitfrom , -- unit - nvarchar(50)
                            pricefrom , -- PriceOne - float
                            quntiyfrom , -- Q - float
                            totalfrom , -- TotalPrice - float
                            ActionDate , -- idate - date
                            stornameto , -- suppliers_name - nvarchar(300)
                            0 , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            0.0 , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.View_Assemplyitem

                    WHERE   ActionDate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR StoreFromID = @StoreID
                                )
                    ORDER BY ActionDate










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
                    SELECT  AssID , -- InvoiceNo - int
                            stornameto , -- store_name - nvarchar(50)
                            itemidTo , -- itemid - bigint
                            itemto , -- ITEMS_ITEM_NAME - nvarchar(max)
                            unitto , -- unit - nvarchar(50)
                            priceto , -- PriceOne - float
                            quntityto , -- Q - float
                            totalto , -- TotalPrice - float
                            ActionDate , -- idate - date
                            stornameto , -- suppliers_name - nvarchar(300)
                            0 , -- suppliers_name - nvarchar(300)
                            0 , -- InooiceNOVender - nvarchar(100)
                            0.0 , -- saltax - float
                            0.0 , -- generaltax - float
                            0.0 , -- Fright - float
                            0.0 , -- Descount - float
                            0.0 , -- net - float
                            0 , -- Journal - bigint
                            N''  -- MovmentName - nvarchar(100)
                    FROM    dbo.View_Assemplyitem

                    WHERE   ActionDate BETWEEN @FromDate AND @ToDate
                            AND ( @StoreID = 0
                                  OR StoreIDTo = @StoreID
                                )
                    ORDER BY ActionDate





        END



    SELECT  *
    FROM    #Resul 

 