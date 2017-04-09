
 
CREATE  PROCEDURE [dbo].[DaylySales_Back]
    @FromDate DATE ,
    @ToDate DATE ,
    @tafsely BIT ,
    @Items BIT ,
    @Service BIT ,
    @tax BIT ,
    @Nottax BIT ,
    @ItemCode BIGINT ,
    @CustID INT ,
    @StoreID INT ,
    @MandopID INT
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
          SuppID BIGINT ,
          servicetype NVARCHAR(50) ,
          invtype NVARCHAR(50)
        );


    DELETE  FROM #Resul; 



		-- ›’Ì·Ï 
    IF @tafsely = 1
        BEGIN

            IF @tax = 1
                AND @Nottax = 0
                BEGIN

                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            Journal ,
                                            ClientID
                                    FROM    vinvoiceout
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;


                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;
                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            Journal ,
                                            ClientID
                                    FROM    vinvoiceout
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;



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
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
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
                                            Journal ,
                                            ClientID
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;


                        END;



                END;

            IF @Nottax = 1
                AND @tax = 0
                BEGIN

            
                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    vbyan
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;
                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;
                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    vbyan
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;



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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
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
                                            Journal ,
                                            ClientID
                                    FROM    VinvoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;


                        END;
                END;

            IF @Nottax = 0
                AND @tax = 0
                BEGIN

            
                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            Journal ,
                                            ClientID
                                    FROM    vinvoiceout
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.vbyan
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;
                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;



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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;



                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.vbyan
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.vinvoiceout
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                                  OR itemid = @ItemCode
                                                )
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;



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
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            TotalPrice ,
                                            idate ,
                                            customer_name ,
                                            InvoiceNo ,
                                            TaxType ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                    ORDER BY idate;




                        END;
                END;

        END;


		




































		--«Ã„«·Ï 
    IF @tafsely = 0
        BEGIN

            IF @tax = 1
                AND @Nottax = 0
                BEGIN

                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                    ORDER BY idate;


                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0
                                                )
                                    ORDER BY idate;
                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                    ORDER BY idate;



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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    invoiceout
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0
                                                );


                        END;



                END;

            IF @Nottax = 1
                AND @tax = 0
                BEGIN

            
                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.byan
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                    ORDER BY idate;
                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    byan
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0
                                                )
                                    ORDER BY idate;
                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo  ,
                                            'Not tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    byan
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                    ORDER BY idate;



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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    byan
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id =  0
                                                )
                                    ORDER BY idate;


                        END;
                END;

            IF @Nottax = 0
                AND @tax = 0
                BEGIN

            
                    IF @Items = 1
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.byan
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                    ORDER BY idate;
                        END;
				  
				   
                    IF @Items = 0
                        AND @Service = 1
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.byan
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND (   byan.store_id = 0
                                                )
                                    ORDER BY idate;



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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND (   invoiceout.store_id =0
                                                );



                        END;
				        
 

                    IF @Items = 0
                        AND @Service = 0
                        BEGIN 
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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.byan
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID 
		                            )
                                    SELECT  InvoiceNo ,
                                            store_name ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                    ORDER BY idate;


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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.byan
                                            INNER JOIN suppliers ON byan.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND (   byan.store_id = 0
                                                )
                                    ORDER BY idate;



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
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID
		                            )
                                    SELECT  InvoiceNo ,
                                            '' ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            NULL ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID
                                    FROM    dbo.invoiceout
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invoiceout.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                );




                        END;
                END;

        END;




    SELECT  *
    FROM    #Resul; 

 