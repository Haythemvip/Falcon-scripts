 
 
ALTER PROCEDURE [dbo].[Purchased]
    @FromDate DATE ,
    @ToDate DATE ,
    @tafsely BIT ,
    @Items BIT ,
    @Service BIT ,
    @tax BIT ,
    @Nottax BIT ,
    @ItemCode BIGINT ,
    @SuppID INT,
	@StoreID INT 
AS
    DECLARE @FromSubbID INT ,
        @ToSubbID INT ,
        @FromItemId BIGINT ,
        @ToItemID BIGINT 



    IF @ItemCode > 0
        BEGIN
            SET @FromItemId = @ItemCode
            SET @ToItemID = @ItemCode
        END


    IF @ItemCode = 0
        BEGIN
            SET @FromItemId = 0
            SET @ToItemID = ( SELECT    MAX(Item_Id)
                              FROM      Items
                            )
        END





    IF @SuppID > 0
        BEGIN
            SET @FromSubbID = @SuppID
            SET @ToSubbID = @SuppID
        END


    IF @SuppID = 0
        BEGIN
            SET @FromSubbID = 0
            SET @ToSubbID = ( SELECT    MAX(suppliers_id)
                              FROM      dbo.suppliers
                            )
        END




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


		 DELETE 
    FROM    #Resul 



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
                                            TaxType
                                    FROM    vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    vinvoicecome
                                   WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    dbo.vinvoicecome
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    dbo.vinvoicecome_Service 
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    dbo.vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                            TaxType
                                    FROM    dbo.vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    vinvoicecome
                                   WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net
		                            )
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                           
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.vinvoicecome
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
											 FROM    dbo.vinvoicecome_Service

                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            store_name ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.vinvoicecome
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND itemid BETWEEN @FromItemId AND @ToItemID
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    VinvoiceComeNoTax_Service
                                     WHERE   idate BETWEEN @FromDate AND @ToDate
                                             
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
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
                                    SELECT DISTINCT
                                            InvoiceNo ,
                                            '' ,
                                            itemid ,
                                            ITEMS_ITEM_NAME ,
                                            unit ,
                                            PriceOne ,
                                            Q ,
                                            aTotal ,
                                            idate ,
                                            suppliers_name ,
                                            InooiceNOVender ,
                                            TaxType ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net
                                    FROM    dbo.vinvoicecome_Service
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            
                                            AND ClientID BETWEEN @FromSubbID AND @ToSubbID
                                    ORDER BY idate




                        END
                END

        END












    SELECT  *
    FROM    #Resul 

 