
ALTER  PROCEDURE CashFlowa
    @DateFrom DATE ,
    @DateTo DATE ,
    @year CHAR(4) ,
    @CompanyID INT ,
    @ProunchID INT ,
    @CurnsID INT
AS
    BEGIN
	

        CREATE TABLE #Resust
            (
              InNote NVARCHAR(MAX) ,
              InAmount FLOAT ,
              ValIn FLOAT ,
              InDate DATE ,
              OutNote NVARCHAR(MAX) ,
              OutAmount FLOAT ,
              Valout FLOAT ,
              OutDate DATE
            )



        DELETE  FROM #Resust

        INSERT  INTO #Resust
                SELECT  Box.BoxName ,0,
                        SUM(Box_Moves.Price_Elwared)
                        - SUM(Box_Moves.Price_ElMonsaref)  ,
                        GETDATE() ,
                        NULL ,
                        0 ,0,
                        GETDATE()
                FROM    Box
                        INNER JOIN Box_Moves ON Box.BoxID = Box_Moves.BoxID
                WHERE   ( Box.flag = 1 )
                        AND ( Box_Moves.Year = @year )
                        AND ( Box.COMP_ID = @CompanyID
                              AND ( Box.ProunchID = @ProunchID )
                              AND Box_Moves.CurID = @CurnsID
                            )
                GROUP BY Box.BoxID ,
                        Box.BoxName



        INSERT  INTO #Resust
                SELECT  BankAccountName.AccountName ,0,
                        SUM(dbo.Bank_Accounts.maden)
                        - SUM(dbo.Bank_Accounts.daen)  ,
                        GETDATE() ,
                        NULL ,
                        0 ,0,
                        GETDATE()
                FROM    BankAccountName
                        INNER JOIN Bank_Accounts ON BankAccountName.AccountID = Bank_Accounts.venderid
                WHERE   ( Bank_Accounts.year = @year )
                       -- AND  Bank_Accounts.COMP_ID = @CompanyID
                              --AND ( Bank_Accounts.ProunchID = @ProunchID )
                        AND Bank_Accounts.CurID = @CurnsID
                GROUP BY BankAccountName.AccountID ,
                        AccountName




        INSERT  INTO #Resust
                SELECT  bankname ,0,
                        valchek ,
                        chekdate ,
                        NULL ,
                        0 ,0,
                        GETDATE()
                FROM    chek_book_come
                WHERE   ( chekstae = ' Õ  «· Õ’Ì·' )
                        AND ( COMP_ID = @CompanyID )
                        AND ( ProunchID = @ProunchID )
                        AND ( chekdate BETWEEN @DateFrom AND @DateTo
                              AND chek_book_come.CurID = @CurnsID
                            )
                GROUP BY bankname ,
                        valchek ,
                        chekdate
                ORDER BY chekdate




        INSERT  INTO #Resust
                SELECT  customers.customer_name ,0,
                        byan.Net ,
                        byan.CollectedDate ,
                        NULL ,
                        0 ,0,
                        GETDATE()
                FROM    byan
                        INNER JOIN customers ON byan.ClientID = customers.Customer_id
                WHERE   ( byan.Tahseel = '·„ Ì „ «· Õ’Ì·' )
                        AND ( CollectedDate BETWEEN @DateFrom AND @DateTo )
                        AND ( byan.ProunchID = @ProunchID )
                        AND ( byan.COMP_ID = @CompanyID )
                GROUP BY customers.customer_name ,
                        byan.Net ,
                        byan.CollectedDate



        INSERT  INTO #Resust
                SELECT  customers.customer_name ,0,
                        invoiceout.net ,
                        invoiceout.CollectedDate ,
                        NULL ,
                        0 ,0,
                        GETDATE()
                FROM    customers
                        INNER JOIN invoiceout ON customers.Customer_id = invoiceout.ClientID
                WHERE   ( invoiceout.Tahseel = '·„ Ì „ «· Õ’Ì·' )
                        AND ( CollectedDate BETWEEN @DateFrom AND @DateTo )
                        AND ( invoiceout.ProunchID = @ProunchID )
                        AND ( invoiceout.COMP_ID = @CompanyID )
                GROUP BY customers.customer_name ,
                        invoiceout.CollectedDate ,
                        invoiceout.net






        INSERT  INTO #Resust
                SELECT  NULL ,
                        0 ,0,
                        GETDATE() ,
                        Bank_Code.Bank_Name ,0,
                        Chek_Book.chekval ,
                        Chek_Book.datedone
                FROM    Chek_Book
                        INNER JOIN Bank_Code ON Chek_Book.BankID = Bank_Code.id_Bank
                WHERE   ( Chek_Book.chekstate = ' Õ  «· Õ’Ì·' )
                        AND ( Chek_Book.COMP_ID = @CompanyID )
                        AND ( Chek_Book.ProunchID = @ProunchID )
                        AND ( datedone BETWEEN @DateFrom AND @DateTo )
                        AND Chek_Book.CurID = @CurnsID
                GROUP BY Bank_Code.Bank_Name ,
                        Chek_Book.chekval ,
                        Chek_Book.datedone




        INSERT  INTO #Resust
                SELECT  NULL ,
                        0 ,0,
                        GETDATE() ,
                        suppliers.suppliers_name ,0,
                        invcomeNoTax.net ,
                        invcomeNoTax.CollectedDate
                FROM    suppliers
                        INNER JOIN invcomeNoTax ON suppliers.suppliers_id = invcomeNoTax.ClientID
                WHERE   ( invcomeNoTax.Tahseel = '·„ Ì „ «· Õ’Ì·' )
                        AND ( CollectedDate BETWEEN @DateFrom AND @DateTo )
                        AND ( invcomeNoTax.ProunchID = @ProunchID )
                        AND ( invcomeNoTax.COMP_ID = @CompanyID )
                GROUP BY suppliers.suppliers_name ,
                        invcomeNoTax.net ,
                        invcomeNoTax.CollectedDate




        INSERT  INTO #Resust
                SELECT  NULL ,
                        0 ,0,
                        GETDATE() ,
                        suppliers.suppliers_name ,0,
                        invcome.net ,
                        invcome.CollectedDate
                FROM    suppliers
                        INNER JOIN invcome ON suppliers.suppliers_id = invcome.ClientID
                WHERE   ( invcome.Tahseel = '·„ Ì „ «· Õ’Ì·' )
                        AND ( CollectedDate BETWEEN @DateFrom AND @DateTo )
                        AND ( invcome.ProunchID = @ProunchID )
                        AND ( invcome.COMP_ID = @CompanyID )
                GROUP BY suppliers.suppliers_name ,
                        invcome.CollectedDate ,
                        invcome.net





        INSERT  INTO #Resust
                SELECT  NULL ,
                        0 ,0,
                        GETDATE() ,
                        CustName ,0,
                        SUM(Value) AS value ,
                        InsuranceDate
                FROM    Insurance
                WHERE   ( COMP_ID = @CompanyID )
                        AND ( ProunchID = @ProunchID )
                        AND ( InsuranceDate BETWEEN @DateFrom AND @DateTo )
                GROUP BY InsuranceType ,
                        CustName ,
                        InsuranceDate






        INSERT  INTO #Resust
                SELECT  InNote ,0,
                        InAmount ,
                        InDate ,
                        OutNote ,0,
                        OutAmount ,
                        OutDate
                FROM    Cashflow 









        SELECT  *
        FROM    #Resust 



	
    END
GO
