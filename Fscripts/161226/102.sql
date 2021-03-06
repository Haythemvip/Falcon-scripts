
CREATE   PROCEDURE [dbo].[Invoice_Come_Follow]
    @Tahseel VARCHAR(50) = '' ,
    @dateFrom DATE ,
    @dateto DATE ,
    @CustID BIGINT
AS
    BEGIN 
 
        CREATE TABLE #Resulst
            (
              InvoiceNo BIGINT ,
              idate DATE ,
              suppliers_name NVARCHAR(MAX) ,
              aTotal FLOAT ,
              saltax FLOAT ,
              generaltax FLOAT ,
              net FLOAT ,
              CollectedDate DATE ,
              invtype NVARCHAR(50) ,
              Tahseel NVARCHAR(50) ,
              MonyStay FLOAT ,
              Selected BIT ,
              SupplierID BIGINT ,
              Isal_Vale FLOAT ,
              NewCollected FLOAT ,
              Diffrent FLOAT ,
              tax NVARCHAR(50)
            );
   
        INSERT  INTO #Resulst
                ( InvoiceNo ,
                  idate ,
                  suppliers_name ,
                  aTotal ,
                  saltax ,
                  generaltax ,
                  net ,
                  CollectedDate ,
                  invtype ,
                  Tahseel ,
                  MonyStay ,
                  Selected ,
                  SupplierID ,
                  tax
                )
                SELECT  InvoiceNo ,
                        idate ,
                        suppliers.suppliers_name aTotal ,
                        aTotal ,
                        saltax , -- saltax - float
                        generaltax , -- generaltax - float
                        net , -- net - float
                        CollectedDate , -- CollectedDate - date
                        invtype , -- invtype - nvarchar(50)
                        Tahseel , -- Tahseel - nvarchar(50)
                        0.0 , -- MonyStay - float
                        0 , -- Selected - bit
                        suppliers_id ,
                        'tax' AS tax
                FROM    dbo.suppliers
                        INNER JOIN dbo.invcome ON suppliers.suppliers_id = invcome.ClientID
                WHERE   idate BETWEEN @dateFrom AND @dateto
                        AND ( @Tahseel = ''
                              OR Tahseel = @Tahseel
                            )
                        AND ( @CustID = 0
                              OR suppliers_id = @CustID
                            );


               
        
        INSERT  INTO #Resulst
                ( InvoiceNo ,
                  idate ,
                  suppliers_name ,
                  aTotal ,
                  saltax ,
                  generaltax ,
                  net ,
                  CollectedDate ,
                  invtype ,
                  Tahseel ,
                  MonyStay ,
                  Selected ,
                  SupplierID ,
                  tax
                )
                SELECT  InvoiceNo ,
                        idate ,
                        suppliers.suppliers_name aTotal ,
                        aTotal ,
                        0 , -- saltax - float
                        0 , -- generaltax - float
                        net , -- net - float
                        CollectedDate , -- CollectedDate - date
                        invtype , -- invtype - nvarchar(50)
                        Tahseel , -- Tahseel - nvarchar(50)
                        0.0 , -- MonyStay - float
                        0 , -- Selected - bit
                        suppliers_id ,
                        'Not tax' AS tax
                FROM    dbo.suppliers
                        INNER JOIN dbo.invcomeNoTax ON suppliers.suppliers_id = invcomeNoTax.ClientID
                WHERE   idate BETWEEN @dateFrom AND @dateto
                        AND ( @Tahseel = ''
                              OR Tahseel = @Tahseel
                            )
                        AND ( @CustID = 0
                              OR suppliers_id = @CustID
                            );
 
  





    END;
 
  
    UPDATE  #Resulst
    SET     MonyStay = ( net - ISNULL(Isal_Vale, 0) );  




    UPDATE  #Resulst
    SET     NewCollected = 0.00;


	 


    UPDATE  #Resulst
    SET     Diffrent = MonyStay;

	 



    SELECT  *
    FROM    #Resulst;
