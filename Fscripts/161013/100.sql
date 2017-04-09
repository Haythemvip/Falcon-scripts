

 
ALTER PROCEDURE [dbo].[Purchased]
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
          net FLOAT,
		  Journal BIGINT ,
		  SuppID BIGINT 
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
										 
											
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
                                      TaxType,Journal,SuppID 
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
                                            TaxType,Journal,ClientID
                                    FROM    vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID 
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
                                            TaxType,Journal,ClientID
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
										 
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
                                      TaxType,Journal,SuppID 
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											 
											
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                         
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
										 
											
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    dbo.vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                          
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
										 
											
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    dbo.vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                          
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											 
											
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                          AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    dbo.vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@ItemCode = 0 OR itemid = @ItemCode )
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR store_id = @StoreID)
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    VinvoiceComeNoTax_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                          
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
										 
											
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
                                      TaxType,Journal,SuppID
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
                                            TaxType,Journal,ClientID
                                    FROM    dbo.vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                          
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											 
											
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
                                      net,Journal,SuppID
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcome
									        INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
										 
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)


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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcome
									        
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)

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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcome
									INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                              AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcome
									        
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)


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
                                      net,Journal,SuppID 
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcomeNoTax
                                            INNER JOIN Stores ON invcomeNoTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
											 
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcomeNoTax
									 
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcomeNoTax
									        INNER JOIN Stores ON invcomeNoTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcomeNoTax
									 
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id

                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcomeNoTax
									        INNER JOIN Stores ON invcomeNoTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                              AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcome
									INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcomeNoTax
									        
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcome
									        INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)



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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcomeNoTax
									        INNER JOIN Stores ON invcomeNoTax.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID 
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcome
									INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                              AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)
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
                                      net,Journal,SuppID
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    dbo.invcomeNoTax
									        
                                            INNER JOIN suppliers ON invcomeNoTax.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcomeNoTax.store_id = @StoreID)
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
                                      net,Journal,SuppID
		                            )
                                    SELECT 
                                            InvoiceNo ,
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
                                            net,Journal,ClientID
                                    FROM    invcome
									        INNER JOIN Stores ON invcome.store_id = Stores.store_id
                                            INNER JOIN suppliers ON invcome.ClientID = suppliers.suppliers_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             AND (@SuppID = 0 OR ClientID = @SuppID)
											AND (@StoreID = 0 OR invcome.store_id = @StoreID)




                        END
                END

        END




    SELECT  *
    FROM    #Resul 

 