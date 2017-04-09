
ALTER  PROCEDURE [dbo].[DaylySales]
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
          aTotal FLOAT ,
          TotalPrice FLOAT ,
          idate DATE ,
          customer_name NVARCHAR(300) ,
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
          invtype NVARCHAR(50) ,
          DriverName NVARCHAR(50) ,
          MandopName NVARCHAR(250)
        );


    DELETE  FROM #Resul; 



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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            MandopName
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
                                            AND ( @MandopID = 0
                                                  OR MAndopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            MandopName
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
                                            AND ( @MandopID = 0
                                                  OR MAndopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            0 AS servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            '' AS MandopName
                                    FROM    dbo.VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            --AND ( @MandopID = 0
                                            --      OR MAndopID = @MandopID
                                            --    )
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            DriverName ,
                                            Mandop_Name
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
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            DriverName ,
                                            Mandop_Name
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
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    dbo.VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            MandopName
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
                                            AND ( @MandopID = 0
                                                  OR MAndopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            DriverName ,
                                            Mandop_Name
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
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    dbo.VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            DriverName ,
                                            Mandop_Name
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
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            MandopName
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
                                            AND ( @MandopID = 0
                                                  OR MAndopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    VinvoiceOutService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      Journal ,
                                      SuppID ,
                                      servicetype ,
                                      invtype ,
                                      DriverName ,
                                      MandopName
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
                                            ClientID ,
                                            servicetype ,
                                            invtype ,
                                            0 AS DriverName ,
                                            Mandop_Name
                                    FROM    dbo.VbyanService
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @MandopID = 0
                                                  OR MandopID = @MandopID
                                                )
                                    ORDER BY idate;




                        END;
                END;

        END;


		




































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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR .invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( byan.store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( invoiceout.store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                            INNER JOIN Stores ON byan.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR byan.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Not Tax' ,
                                            0 ,
                                            0 ,
                                            Fright ,
                                            Descount ,
                                            Net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.byan
                                            INNER JOIN dbo.customers ON customers.Customer_id = byan.ClientID
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( byan.store_id = 0 )
                                            AND ( @MandopID = 0
                                                  OR byan.MandopID = @MandopID
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
                                      customer_name ,
                                      InooiceNOVender ,
                                      TaxType ,
                                      generaltax ,
                                      saltax ,
                                      Fright ,
                                      Descount ,
                                      net ,
                                      Journal ,
                                      SuppID ,
                                      MandopName ,
                                      aTotal
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
                                            customer_name ,
                                            InvoiceNo ,
                                            'Tax' ,
                                            saltax ,
                                            generaltax ,
                                            Fright ,
                                            Descount ,
                                            net ,
                                            Journal ,
                                            ClientID ,
                                            Mandop_Name ,
                                            aTotal
                                    FROM    dbo.invoiceout
                                            INNER JOIN dbo.customers ON customers.Customer_id = invoiceout.ClientID
                                            INNER JOIN Stores ON invoiceout.store_id = Stores.store_id
                                    WHERE   idate BETWEEN @FromDate AND @ToDate
                                            AND ( @CustID = 0
                                                  OR ClientID = @CustID
                                                )
                                            AND ( @StoreID = 0
                                                  OR invoiceout.store_id = @StoreID
                                                )
                                            AND ( @MandopID = 0
                                                  OR invoiceout.MandopID = @MandopID
                                                );




                        END;
                END;

        END;




    SELECT  *
    FROM    #Resul; 

 