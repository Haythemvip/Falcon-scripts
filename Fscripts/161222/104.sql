

ALTER PROCEDURE [dbo].[Invoice_Follow]
    @Tahseel VARCHAR(50) = '' ,
    @dateFrom DATE ,
    @dateto DATE
AS
    BEGIN 
 
        DELETE  FROM tahseelrep;

   
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
                  Selected,
				  CustomerID
                )
                SELECT  customers.customer_name ,
                        invoiceout.InvoiceNo ,
                        invoiceout.idate ,
                        invoiceout.SuplayDate ,
                        customers.TahseelModa ,
                        invoiceout.CollectedDate ,
                        DATEDIFF(DAY, GETDATE( ), invoiceout.CollectedDate) AS CollectedDay ,
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
                        0 AS 'Selected',
						Customer_id
                FROM    customers
                        INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                WHERE   idate BETWEEN @dateFrom AND @dateto
                        AND ( @Tahseel = ''
                              OR Tahseel = @Tahseel
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
                  Selected,
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
                        0 AS 'Selected',
						Customer_id 
                FROM    customers
                        INNER JOIN byan ON customers.Customer_id = byan.ClientID
                WHERE   idate BETWEEN @dateFrom AND @dateto
                        AND ( @Tahseel = ''
                              OR Tahseel = @Tahseel
                            );






    END;
 
  
    UPDATE  tahseelrep
    SET     MonyStay = ( net - ISNULL(Isal_Vale, 0) );  




    UPDATE  tahseelrep
    SET     NewCollected = 0.00;


	 


    UPDATE  tahseelrep
    SET     Diffrent = MonyStay;





    UPDATE  tahseelrep
    SET     AccountID = ( SELECT    TreeCode
                          FROM      customers
                          WHERE     Customer_id = tahseelrep.CustomerID AND TreeCode IN (SELECT AccCode FROM dbo.tblAccTree)
                        ) ,
            AccountName = ( SELECT  TreeName
                            FROM    customers
                            WHERE   Customer_id = tahseelrep.CustomerID AND TreeCode IN (SELECT AccCode FROM dbo.tblAccTree)
                          );



 UPDATE  tahseelrep
    SET     AccountID = 0 WHERE AccountID IS NULL 




    SELECT  *
    FROM    tahseelrep;
