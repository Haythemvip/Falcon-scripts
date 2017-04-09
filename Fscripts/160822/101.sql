 
 
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



    IF @StoreID > 0
        BEGIN
           

            IF @CaseID = 0
                BEGIN 
                --    '„—«Ã⁄… Õ—ﬂ… «·„Œ«“‰  '        —’Ìœ(«›  «ÕÏ) 

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
                                    N'—’Ìœ «›  «ÕÏ' , -- suppliers_name - nvarchar(300)
                                    N'0' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N'—’Ìœ «›  «ÕÏ'  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY FSdate


               

                END
                
            IF @CaseID = 1
                BEGIN
                --    '        „‘ —Ì« (÷—Ì»Ì…)

               
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
                                    AND store_id = @StoreID
                            ORDER BY idate
                END 

            IF @CaseID = 2
                BEGIN 

                --    '„‘ —Ì«  €Ì— ÷—Ì»Ì…
                --    DB.Fill_Grid("select InvoiceNo as '„”·”·',idate as '«· «—ÌŒ',store_name as '«·„Œ“‰',groupname as '«·„Ã„Ê⁄…' ,ITEMS_ITEM_NAME as '«·’‰›',unit as '«·ÊÕœ…',Q as '«·ﬂ„Ì…' ,PriceOne as '«·”⁄—' ,TotalPrice as 'ﬁÌ„…'  from  where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                

            IF @CaseID = 3
                BEGIN 
                --    '„—œÊœ«  „‘ —Ì«  ÷—Ì»Ì…
 
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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END 

            IF @CaseID = 4
                BEGIN 
                --    '„—œÊœ«  „‘ —Ì«  €Ì— ÷—Ì»Ì…

 
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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                
            IF @CaseID = 5
                BEGIN 
                --    '        „»Ì⁄« (÷—Ì»Ì…)

 
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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                
            IF @CaseID = 6
                BEGIN 
                --    '„»Ì⁄«  €Ì— ÷—Ì»Ì…
                --    DB.Fill_Grid("select InvoiceNo as '„”·”·',idate as '«· «—ÌŒ',store_name as '«·„Œ“‰',groupname as '«·„Ã„Ê⁄…' ,Item_Name as '«·’‰›',unit as '«·ÊÕœ…',Q as '«·ﬂ„Ì…' ,PriceOne as '«·”⁄—' ,TotalPrice as 'ﬁÌ„…'  from vbyan where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vbyan")

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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                
            IF @CaseID = 7
                BEGIN 


                --    '„—œÊœ«  „»Ì⁄«  ÷—Ì»Ì…
 
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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                

            IF @CaseID = 8
                BEGIN 
                --    '„—œÊœ«  „»Ì⁄«  €Ì— ÷—Ì»Ì…
 
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
                                    AND store_id = @StoreID
                            ORDER BY idate

                END
                

            IF @CaseID = 9
                BEGIN 
                --    '        «–‰(«÷«›…)

 
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
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VEznEdafa
                            WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY Edafadate

                END
                
            IF @CaseID = 10
                BEGIN 
                --    '        «–‰(’—›)

 
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
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VEznSarf
                            WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY Sarfdate

                END

            IF @CaseID = 11
                BEGIN 

                --    '         ”ÊÌ…(»«·«÷«›…)
 

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
                                    '' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VTaswyaEdafa
                            WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY Edafadate

                END
                
            IF @CaseID = 12
                BEGIN 
                --    '         ”ÊÌ…(»«·Œ’„)


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
                                    '' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VTaswyaKhasm
                            WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY Sarfdate

                END

            IF @CaseID = 13
                BEGIN 
                --    ' ÕÊÌ· »Ì‰ «·„Œ«“‰

 
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
                            FROM    dbo.VConvertBetweenStores
                            WHERE   TransDate BETWEEN @FromDate AND @ToDate
                                    AND store_id = @StoreID
                            ORDER BY TransDate

                END
                

        END


    IF @StoreID = 0
        BEGIN
           

            IF @CaseID = 0
                BEGIN 
                --    '„—«Ã⁄… Õ—ﬂ… «·„Œ«“‰  '        —’Ìœ(«›  «ÕÏ) 

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
                                    N'—’Ìœ «›  «ÕÏ' , -- suppliers_name - nvarchar(300)
                                    N'0' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    0.0 , -- net - float
                                    0 , -- Journal - bigint
                                    N'—’Ìœ «›  «ÕÏ'  -- MovmentName - nvarchar(100)
                            FROM    dbo.VFirestStock
                            WHERE   FSdate BETWEEN @FromDate AND @ToDate
                            ORDER BY FSdate


               

                END
                
            IF @CaseID = 1
                BEGIN
                --    '        „‘ —Ì« (÷—Ì»Ì…)

               
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
                            ORDER BY idate
                END 

            IF @CaseID = 2
                BEGIN 

                --    '„‘ —Ì«  €Ì— ÷—Ì»Ì…
                --    DB.Fill_Grid("select InvoiceNo as '„”·”·',idate as '«· «—ÌŒ',store_name as '«·„Œ“‰',groupname as '«·„Ã„Ê⁄…' ,ITEMS_ITEM_NAME as '«·’‰›',unit as '«·ÊÕœ…',Q as '«·ﬂ„Ì…' ,PriceOne as '«·”⁄—' ,TotalPrice as 'ﬁÌ„…'  from  where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "VFirestStock")

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
                            ORDER BY idate

                END
                

            IF @CaseID = 3
                BEGIN 
                --    '„—œÊœ«  „‘ —Ì«  ÷—Ì»Ì…
 
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
                            ORDER BY idate

                END 

            IF @CaseID = 4
                BEGIN 
                --    '„—œÊœ«  „‘ —Ì«  €Ì— ÷—Ì»Ì…

 
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
                            ORDER BY idate

                END
                
            IF @CaseID = 5
                BEGIN 
                --    '        „»Ì⁄« (÷—Ì»Ì…)

 
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
                            ORDER BY idate

                END
                
            IF @CaseID = 6
                BEGIN 
                --    '„»Ì⁄«  €Ì— ÷—Ì»Ì…
                --    DB.Fill_Grid("select InvoiceNo as '„”·”·',idate as '«· «—ÌŒ',store_name as '«·„Œ“‰',groupname as '«·„Ã„Ê⁄…' ,Item_Name as '«·’‰›',unit as '«·ÊÕœ…',Q as '«·ﬂ„Ì…' ,PriceOne as '«·”⁄—' ,TotalPrice as 'ﬁÌ„…'  from vbyan where idate Between '" & Format(froDate.Value, "yyyy-MM-dd") & "' and '" & Format(toDate.Value, "yyyy-MM-dd") & "'and store_id = " & StorID.Text & "ORDER BY idate", dgv, "vbyan")

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
                            ORDER BY idate

                END
                
            IF @CaseID = 7
                BEGIN 


                --    '„—œÊœ«  „»Ì⁄«  ÷—Ì»Ì…
 
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
                            ORDER BY idate

                END
                

            IF @CaseID = 8
                BEGIN 
                --    '„—œÊœ«  „»Ì⁄«  €Ì— ÷—Ì»Ì…
 
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
                            ORDER BY idate

                END
                

            IF @CaseID = 9
                BEGIN 
                --    '        «–‰(«÷«›…)

 
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
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VEznEdafa
                            WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                            ORDER BY Edafadate

                END
                
            IF @CaseID = 10
                BEGIN 
                --    '        «–‰(’—›)

 
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
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VEznSarf
                            WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                            ORDER BY Sarfdate

                END

            IF @CaseID = 11
                BEGIN 

                --    '         ”ÊÌ…(»«·«÷«›…)
 

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
                                    '' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VTaswyaEdafa
                            WHERE   Edafadate BETWEEN @FromDate AND @ToDate
                            ORDER BY Edafadate

                END
                
            IF @CaseID = 12
                BEGIN 
                --    '         ”ÊÌ…(»«·Œ’„)


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
                                    '' , -- suppliers_name - nvarchar(300)
                                    N'' , -- InooiceNOVender - nvarchar(100)
                                    N'' , -- TaxType - nvarchar(50)
                                    0.0 , -- saltax - float
                                    0.0 , -- generaltax - float
                                    0.0 , -- Fright - float
                                    0.0 , -- Descount - float
                                    total , -- net - float
                                    0 , -- Journal - bigint
                                    N''  -- MovmentName - nvarchar(100)
                            FROM    dbo.VTaswyaKhasm
                            WHERE   Sarfdate BETWEEN @FromDate AND @ToDate
                            ORDER BY Sarfdate

                END

            IF @CaseID = 13
                BEGIN 
                --    ' ÕÊÌ· »Ì‰ «·„Œ«“‰

 
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
                            FROM    dbo.VConvertBetweenStores
                            WHERE   TransDate BETWEEN @FromDate AND @ToDate
                            ORDER BY TransDate

                END
                

        END
 


    SELECT  *
    FROM    #Resul 

 