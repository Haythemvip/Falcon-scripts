


ALTER  PROCEDURE [dbo].[Purchased_Back]
    @FromDate DATE ,
    @ToDate DATE ,
    @tafsely BIT ,
    @Items BIT ,
    @Service BIT ,
    @tax BIT ,
    @Nottax BIT ,
    @ItemCode BIGINT ,
    @SuppID INT ,
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
          net FLOAT
        )


    DELETE  FROM #Resul 



		--تفصيلى 
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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate


                        END
				  
				   
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
                                      TaxType
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
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome_service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            
                                    ORDER BY idate
                        END
				        
 

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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      TaxType
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
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome_service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            
                                    ORDER BY idate


                        END



                END

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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax
                                    WHERE   ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            AND idate BETWEEN @FromDate AND @ToDate
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				  
				   
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
                                      TaxType
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
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                             
                                    ORDER BY idate
                        END
				        
 

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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      TaxType
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
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                             
                                    ORDER BY idate


                        END
                END

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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				  
				   
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
                                      TaxType
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
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                           
                                    ORDER BY idate



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
                                      TaxType
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
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome_service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                           
                                    ORDER BY idate



                        END
				        
 

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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      TaxType
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
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @ItemCode = 0
                                              OR itemid = @ItemCode
                                            )
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      TaxType
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
                                            'Not Tax'
                                    FROM    dbo.V_Mardodat_invoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            
                                    ORDER BY idate



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
                                      TaxType
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
                                            'Tax'
                                    FROM    dbo.Mardodat_Vinvoicecome_service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            
                                    ORDER BY idate




                        END
                END

        END


		












		--اجمالى 
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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )
                                    ORDER BY idate


                        END
				  
				   
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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invcome
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				        
 

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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invcome
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )


                        END



                END

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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN Stores ON Mardodat_Invoice_Com_NotTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invoice_Com_NotTax.store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				  
				   
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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND store_id = 0
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				        
 

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
                                      net
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
                                            InooiceNOVender ,
                                            'Not tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invoice_Com_NotTax
                                            INNER JOIN Stores ON Mardodat_Invoice_Com_NotTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invoice_Com_NotTax.store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invoice_Com_NotTax
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate


                        END
                END

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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN Stores ON Mardodat_Invoice_Com_NotTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invoice_Com_NotTax.store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )
                                    ORDER BY idate
                        END
				  
				   
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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )


                        END
				        
 

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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN Stores ON Mardodat_Invoice_Com_NotTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invoice_Com_NotTax.store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )
                                    ORDER BY idate


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
                                      net
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
                                            InooiceNOVender ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.Mardodat_Invoice_Com_NotTax
                                            INNER JOIN suppliers ON Mardodat_Invoice_Com_NotTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR store_id = @StoreID
                                                )
                                    ORDER BY idate



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
                                      net
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
                                            InooiceNOVender ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    Mardodat_Invcome
                                            INNER JOIN Stores ON Mardodat_Invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON Mardodat_Invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            
                                            AND ( @SuppID = 0
                                                  OR ClientID = @SuppID
                                                )
                                            AND ( @StoreID = 0
                                                  OR Mardodat_Invcome.store_id = @StoreID
                                                )




                        END
                END

        END




    SELECT  *
    FROM    #Resul 

 