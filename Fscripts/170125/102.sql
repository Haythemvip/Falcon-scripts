 

ALTER PROCEDURE [dbo].[Invoice_Follow]
    @Tahseel INT = 100 ,
    @dateFrom DATE ,
    @dateto DATE ,
    @CustID BIGINT,
	@CollectedJournal BIGINT 
AS
    BEGIN 
 
        DELETE  FROM tahseelrep;



IF @CollectedJournal = 0

BEGIN 

        IF @Tahseel = 0
            BEGIN
       
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                invoiceout.InvoiceNo ,
                                invoiceout.idate ,
                                invoiceout.SuplayDate ,
                                customers.TahseelModa ,
                                invoiceout.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ),
                                         invoiceout.CollectedDate) AS CollectedDay ,
                                invoiceout.tahseldate ,
                                invoiceout.TahseelNote ,
                                invoiceout.Tahseel ,
                                invoiceout.aTotal ,
                                invoiceout.saltax ,
                                invoiceout.generaltax ,
                                invoiceout.Fright ,
                                invoiceout.Descount ,
                                invoiceout.net ,
                                invoiceout.invtype ,
                                invoiceout.servicetype ,
                                invoiceout.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                invoiceout.Fallowdate ,
                                invoiceout.ChekDate ,
                                invoiceout.ChekNO ,
                                invoiceout.BankName ,
                                invoiceout.TaxDes ,
                                invoiceout.TaxDoc ,
                                invoiceout.UserColletMony ,
                                invoiceout.Isal_NO ,
                                invoiceout.Defrent_Collect ,
                                invoiceout.Isal_Vale ,
                                invoiceout.Mandop_Name ,
                                'tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( net <> Isal_Vale )
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );

 
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                byan.InvoiceNo ,
                                byan.idate ,
                                byan.SuplayDate ,
                                customers.TahseelModa ,
                                byan.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ), byan.CollectedDate) AS CollectedDay ,
                                byan.tahseldate ,
                                byan.TahseelNote ,
                                byan.Tahseel ,
                                byan.aTotal ,
                                0 AS saltax ,
                                0 AS generaltax ,
                                byan.Fright ,
                                byan.Descount ,
                                byan.Net ,
                                byan.invtype ,
                                byan.servicetype ,
                                byan.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                byan.Fallowdate ,
                                byan.ChekDate ,
                                byan.ChekNO ,
                                byan.BankName ,
                                byan.TaxDes ,
                                byan.TaxDoc ,
                                byan.UserColletMony ,
                                byan.Isal_NO ,
                                byan.Defrent_Collect ,
                                byan.Isal_Vale ,
                                byan.Mandop_Name ,
                                'Not tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN byan ON customers.Customer_id = byan.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( Net <> Isal_Vale )
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );
            END;

        IF @Tahseel = 1
            BEGIN
       
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                invoiceout.InvoiceNo ,
                                invoiceout.idate ,
                                invoiceout.SuplayDate ,
                                customers.TahseelModa ,
                                invoiceout.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ),
                                         invoiceout.CollectedDate) AS CollectedDay ,
                                invoiceout.tahseldate ,
                                invoiceout.TahseelNote ,
                                invoiceout.Tahseel ,
                                invoiceout.aTotal ,
                                invoiceout.saltax ,
                                invoiceout.generaltax ,
                                invoiceout.Fright ,
                                invoiceout.Descount ,
                                invoiceout.net ,
                                invoiceout.invtype ,
                                invoiceout.servicetype ,
                                invoiceout.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                invoiceout.Fallowdate ,
                                invoiceout.ChekDate ,
                                invoiceout.ChekNO ,
                                invoiceout.BankName ,
                                invoiceout.TaxDes ,
                                invoiceout.TaxDoc ,
                                invoiceout.UserColletMony ,
                                invoiceout.Isal_NO ,
                                invoiceout.Defrent_Collect ,
                                invoiceout.Isal_Vale ,
                                invoiceout.Mandop_Name ,
                                'tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( net <= Isal_Vale )
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    ); 

 
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                byan.InvoiceNo ,
                                byan.idate ,
                                byan.SuplayDate ,
                                customers.TahseelModa ,
                                byan.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ), byan.CollectedDate) AS CollectedDay ,
                                byan.tahseldate ,
                                byan.TahseelNote ,
                                byan.Tahseel ,
                                byan.aTotal ,
                                0 AS saltax ,
                                0 AS generaltax ,
                                byan.Fright ,
                                byan.Descount ,
                                byan.Net ,
                                byan.invtype ,
                                byan.servicetype ,
                                byan.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                byan.Fallowdate ,
                                byan.ChekDate ,
                                byan.ChekNO ,
                                byan.BankName ,
                                byan.TaxDes ,
                                byan.TaxDoc ,
                                byan.UserColletMony ,
                                byan.Isal_NO ,
                                byan.Defrent_Collect ,
                                byan.Isal_Vale ,
                                byan.Mandop_Name ,
                                'Not tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN byan ON customers.Customer_id = byan.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( Net <= Isal_Vale )
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );
            END;

        IF @Tahseel = 2
            BEGIN
       
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                invoiceout.InvoiceNo ,
                                invoiceout.idate ,
                                invoiceout.SuplayDate ,
                                customers.TahseelModa ,
                                invoiceout.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ),
                                         invoiceout.CollectedDate) AS CollectedDay ,
                                invoiceout.tahseldate ,
                                invoiceout.TahseelNote ,
                                invoiceout.Tahseel ,
                                invoiceout.aTotal ,
                                invoiceout.saltax ,
                                invoiceout.generaltax ,
                                invoiceout.Fright ,
                                invoiceout.Descount ,
                                invoiceout.net ,
                                invoiceout.invtype ,
                                invoiceout.servicetype ,
                                invoiceout.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                invoiceout.Fallowdate ,
                                invoiceout.ChekDate ,
                                invoiceout.ChekNO ,
                                invoiceout.BankName ,
                                invoiceout.TaxDes ,
                                invoiceout.TaxDoc ,
                                invoiceout.UserColletMony ,
                                invoiceout.Isal_NO ,
                                invoiceout.Defrent_Collect ,
                                invoiceout.Isal_Vale ,
                                invoiceout.Mandop_Name ,
                                'tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( net > Isal_Vale )
                                AND Isal_Vale > 0
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    ); 

 
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                byan.InvoiceNo ,
                                byan.idate ,
                                byan.SuplayDate ,
                                customers.TahseelModa ,
                                byan.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ), byan.CollectedDate) AS CollectedDay ,
                                byan.tahseldate ,
                                byan.TahseelNote ,
                                byan.Tahseel ,
                                byan.aTotal ,
                                0 AS saltax ,
                                0 AS generaltax ,
                                byan.Fright ,
                                byan.Descount ,
                                byan.Net ,
                                byan.invtype ,
                                byan.servicetype ,
                                byan.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                byan.Fallowdate ,
                                byan.ChekDate ,
                                byan.ChekNO ,
                                byan.BankName ,
                                byan.TaxDes ,
                                byan.TaxDoc ,
                                byan.UserColletMony ,
                                byan.Isal_NO ,
                                byan.Defrent_Collect ,
                                byan.Isal_Vale ,
                                byan.Mandop_Name ,
                                'Not tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN byan ON customers.Customer_id = byan.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( Net > Isal_Vale )
                                AND Isal_Vale > 0
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );
            END;

        IF @Tahseel = 100
            BEGIN
       
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                invoiceout.InvoiceNo ,
                                invoiceout.idate ,
                                invoiceout.SuplayDate ,
                                customers.TahseelModa ,
                                invoiceout.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ),
                                         invoiceout.CollectedDate) AS CollectedDay ,
                                invoiceout.tahseldate ,
                                invoiceout.TahseelNote ,
                                invoiceout.Tahseel ,
                                invoiceout.aTotal ,
                                invoiceout.saltax ,
                                invoiceout.generaltax ,
                                invoiceout.Fright ,
                                invoiceout.Descount ,
                                invoiceout.net ,
                                invoiceout.invtype ,
                                invoiceout.servicetype ,
                                invoiceout.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                invoiceout.Fallowdate ,
                                invoiceout.ChekDate ,
                                invoiceout.ChekNO ,
                                invoiceout.BankName ,
                                invoiceout.TaxDes ,
                                invoiceout.TaxDoc ,
                                invoiceout.UserColletMony ,
                                invoiceout.Isal_NO ,
                                invoiceout.Defrent_Collect ,
                                invoiceout.Isal_Vale ,
                                invoiceout.Mandop_Name ,
                                'tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );
                               

 
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                byan.InvoiceNo ,
                                byan.idate ,
                                byan.SuplayDate ,
                                customers.TahseelModa ,
                                byan.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ), byan.CollectedDate) AS CollectedDay ,
                                byan.tahseldate ,
                                byan.TahseelNote ,
                                byan.Tahseel ,
                                byan.aTotal ,
                                0 AS saltax ,
                                0 AS generaltax ,
                                byan.Fright ,
                                byan.Descount ,
                                byan.Net ,
                                byan.invtype ,
                                byan.servicetype ,
                                byan.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                byan.Fallowdate ,
                                byan.ChekDate ,
                                byan.ChekNO ,
                                byan.BankName ,
                                byan.TaxDes ,
                                byan.TaxDoc ,
                                byan.UserColletMony ,
                                byan.Isal_NO ,
                                byan.Defrent_Collect ,
                                byan.Isal_Vale ,
                                byan.Mandop_Name ,
                                'Not tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN byan ON customers.Customer_id = byan.ClientID
                        WHERE   idate BETWEEN @dateFrom AND @dateto
                                AND ( @CustID = 0
                                      OR Customer_id = @CustID
                                    );
                        
            END;

END



IF @CollectedJournal > 0

BEGIN 

        IF @Tahseel = 100
            BEGIN
       
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                invoiceout.InvoiceNo ,
                                invoiceout.idate ,
                                invoiceout.SuplayDate ,
                                customers.TahseelModa ,
                                invoiceout.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ),
                                         invoiceout.CollectedDate) AS CollectedDay ,
                                invoiceout.tahseldate ,
                                invoiceout.TahseelNote ,
                                invoiceout.Tahseel ,
                                invoiceout.aTotal ,
                                invoiceout.saltax ,
                                invoiceout.generaltax ,
                                invoiceout.Fright ,
                                invoiceout.Descount ,
                                invoiceout.net ,
                                invoiceout.invtype ,
                                invoiceout.servicetype ,
                                invoiceout.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                invoiceout.Fallowdate ,
                                invoiceout.ChekDate ,
                                invoiceout.ChekNO ,
                                invoiceout.BankName ,
                                invoiceout.TaxDes ,
                                invoiceout.TaxDoc ,
                                invoiceout.UserColletMony ,
                                invoiceout.Isal_NO ,
                                invoiceout.Defrent_Collect ,
                                invoiceout.Isal_Vale ,
                                invoiceout.Mandop_Name ,
                                'tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                         WHERE  CollectedJournal =  @CollectedJournal
                               

 
                INSERT  INTO dbo.tahseelrep
                        ( customer_name ,
                          InvoiceNo ,
                          idate ,
                          SuplayDate ,
                          TahseelModa ,
                          CollectedDate ,
                          CollectedDay ,
                          tahseldate ,
                          TahseelNote ,
                          Tahseel ,
                          aTotal ,
                          saltax ,
                          generaltax ,
                          Fright ,
                          Descount ,
                          net ,
                          invtype ,
                          servicetype ,
                          Journal ,
                          custtime ,
                          custVacaiotn ,
                          paystate ,
                          waypay ,
                          Fallowdate ,
                          ChekDate ,
                          ChekNO ,
                          BankName ,
                          TaxDes ,
                          TaxDoc ,
                          UserColletMony ,
                          Isal_NO ,
                          Defrent_Collect ,
                          Isal_Vale ,
                          Mandop_Name ,
                          tax ,
                          MonyStay ,
                          Selected ,
                          CustomerID
                        )
                        SELECT  customers.customer_name ,
                                byan.InvoiceNo ,
                                byan.idate ,
                                byan.SuplayDate ,
                                customers.TahseelModa ,
                                byan.CollectedDate ,
                                DATEDIFF(DAY, GETDATE( ), byan.CollectedDate) AS CollectedDay ,
                                byan.tahseldate ,
                                byan.TahseelNote ,
                                byan.Tahseel ,
                                byan.aTotal ,
                                0 AS saltax ,
                                0 AS generaltax ,
                                byan.Fright ,
                                byan.Descount ,
                                byan.Net ,
                                byan.invtype ,
                                byan.servicetype ,
                                byan.Journal ,
                                customers.custtime ,
                                customers.custVacaiotn ,
                                customers.paystate ,
                                customers.waypay ,
                                byan.Fallowdate ,
                                byan.ChekDate ,
                                byan.ChekNO ,
                                byan.BankName ,
                                byan.TaxDes ,
                                byan.TaxDoc ,
                                byan.UserColletMony ,
                                byan.Isal_NO ,
                                byan.Defrent_Collect ,
                                byan.Isal_Vale ,
                                byan.Mandop_Name ,
                                'Not tax' AS 'tax' ,
                                0 AS 'MonyStay' ,
                                0 AS 'Selected' ,
                                Customer_id
                        FROM    customers
                                INNER JOIN byan ON customers.Customer_id = byan.ClientID
                        WHERE  CollectedJournal =  @CollectedJournal
                        
            END;

END






    END;
 
  
    UPDATE  tahseelrep
    SET     MonyStay = ( net - ISNULL(Isal_Vale, 0) );  




    UPDATE  tahseelrep
    SET     NewCollected = 0.00;


	 


    UPDATE  tahseelrep
    SET     Diffrent = MonyStay;

	 



    SELECT  *
    FROM    tahseelrep;
