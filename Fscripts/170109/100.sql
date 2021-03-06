 
 
ALTER PROCEDURE [dbo].[OpningBalance]

    @Lang NVARCHAR(2) ,
    @CurID INT = 1 ,
    @FinancialYear BIGINT ,
    @AccountID BIGINT = 0 ,
    @CaseID INT ,
    @Customer INT = 0 ,
    @Vendor INT = 0 ,
    @Bank INT = 0 ,
    @Employee INT = 0 ,
    @Box INT = 0 ,
    @zero INT
AS
    BEGIN
	


        CREATE TABLE #Render
            (
              [ISmain] BIT ,
              [AccCode] [BIGINT] NULL ,
              [AccName] [NVARCHAR](MAX) COLLATE Arabic_CI_AI
                                        NULL ,
              [balanceMaden] [DECIMAL](18, 2) NOT NULL ,
              [BalanceDaen] [DECIMAL](18, 2) NOT NULL ,
              [SumMaden] [DECIMAL](38, 2) NOT NULL ,
              [SumDaen] [DECIMAL](38, 2) NOT NULL ,
              [totalMaden] [DECIMAL](38, 2) NOT NULL ,
              [totalDaen] [DECIMAL](38, 2) NOT NULL ,
              [StartMaden] [DECIMAL](38, 2) NOT NULL ,
              [StartDaen] [DECIMAL](38, 2) NOT NULL
            )
        ON  [PRIMARY];


 

-- العملاء 
        IF @Customer = 1
            BEGIN 
  
                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Customer_id ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.customer_name )
                                       ELSE ( Acc.Customer_Name_EN )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen
                        FROM    customers Acc
                        WHERE   ( @AccountID = 0
                                  OR Acc.Customer_id = @AccountID
                                )
                        ORDER BY Customer_id;


                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(customer_account.maden)
                                            FROM    customer_account
                                            WHERE   customer_account.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND customer_account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND customer_account.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(customer_account.daen) AS SumDaen
                                           FROM     customer_account
                                           WHERE    customer_account.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND customer_account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND customer_account.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(customer_account.maden) AS totalMaden
                                              FROM      customer_account
                                              WHERE     customer_account.CurID = @CurID
                                                        AND year = @FinancialYear
                                                        AND customer_account.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(customer_account.daen) AS totalDaen
                                             FROM   customer_account
                                             WHERE  customer_account.CurID = @CurID
                                                    AND year = @FinancialYear
                                                    AND customer_account.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(customer_account.maden) AS SumMaden
                                              FROM      customer_account
                                              WHERE     ( customer_account.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND customer_account.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(customer_account.daen) AS SumDaen
                                             FROM   customer_account
                                             WHERE  ( customer_account.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND customer_account.venderid = AccCode
                                           ), 0); 
                      
                
                  


            END;
 
 

 -- الموردين 


        IF @Vendor = 1
            BEGIN 
          
               

                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.suppliers_id ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.suppliers_name )
                                       ELSE ( Acc.Supplier_Name_EN )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen
                        FROM    suppliers Acc
                        WHERE   ( @AccountID = 0
                                  OR Acc.suppliers_id = @AccountID
                                )
                        ORDER BY suppliers_id;




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(venderaccount.maden)
                                            FROM    venderaccount
                                            WHERE   venderaccount.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND venderaccount.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND venderaccount.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(venderaccount.daen) AS SumDaen
                                           FROM     venderaccount
                                           WHERE    venderaccount.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND venderaccount.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND venderaccount.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(venderaccount.maden) AS totalMaden
                                              FROM      venderaccount
                                              WHERE     venderaccount.CurID = @CurID
                                                        AND venderaccount.CaseID = @CaseID
                                                        AND year = @FinancialYear
                                                        AND venderaccount.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(venderaccount.daen) AS totalDaen
                                             FROM   venderaccount
                                             WHERE  venderaccount.CurID = @CurID
                                                    AND venderaccount.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND venderaccount.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(venderaccount.maden) AS SumMaden
                                              FROM      venderaccount
                                              WHERE     ( venderaccount.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND venderaccount.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(venderaccount.daen) AS SumDaen
                                             FROM   venderaccount
                                             WHERE  ( venderaccount.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND venderaccount.venderid = AccCode
                                           ), 0); 


              

            END;


	 -- الموظفين 


        IF @Employee = 1
            BEGIN 


           


                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.emp_code ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.emp_name )
                                       ELSE ( Acc.SecondName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen
                        FROM    dbo.emp Acc
                        WHERE   ( @AccountID = 0
                                  OR Acc.emp_code = @AccountID
                                )
                        ORDER BY Acc.emp_code;




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(dbo.Emp_Account.maden)
                                            FROM    Emp_Account
                                            WHERE   Emp_Account.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND Emp_Account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Emp_Account.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(Emp_Account.daen) AS SumDaen
                                           FROM     Emp_Account
                                           WHERE    Emp_Account.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND Emp_Account.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Emp_Account.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(Emp_Account.maden) AS totalMaden
                                              FROM      Emp_Account
                                              WHERE     Emp_Account.CurID = @CurID
                                                        AND Emp_Account.CaseID = @CaseID
                                                        AND year = @FinancialYear
                                                        AND Emp_Account.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(Emp_Account.daen) AS totalDaen
                                             FROM   Emp_Account
                                             WHERE  Emp_Account.CurID = @CurID
                                                    AND Emp_Account.CaseID = @CaseID
                                                    AND year = @FinancialYear
                                                    AND Emp_Account.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(Emp_Account.maden) AS SumMaden
                                              FROM      Emp_Account
                                              WHERE     ( Emp_Account.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND Emp_Account.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(Emp_Account.daen) AS SumDaen
                                             FROM   Emp_Account
                                             WHERE  ( Emp_Account.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND Emp_Account.venderid = AccCode
                                           ), 0); 



 

            END;
 	   

 -- البنوك 


        IF @Bank = 1
            BEGIN 
            
              
                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.AccountID ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.AccountName )
                                       ELSE ( Acc.AccountName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen 
                        FROM    dbo.BankAccountName Acc
                        WHERE   ( @AccountID = 0
                                  OR Acc.AccountID = @AccountID
                                )
                        ORDER BY Acc.AccountID;




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(dbo.Bank_Accounts.maden)
                                            FROM    Bank_Accounts
                                            WHERE   year = @FinancialYear
                                                    AND Bank_Accounts.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Bank_Accounts.venderid = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(Bank_Accounts.daen) AS SumDaen
                                           FROM     Bank_Accounts
                                           WHERE    year = @FinancialYear
                                                    AND Bank_Accounts.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Bank_Accounts.venderid = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(Bank_Accounts.maden) AS totalMaden
                                              FROM      Bank_Accounts
                                              WHERE     Bank_Accounts.CurID = @CurID
                                                        AND year = @FinancialYear
                                                        AND Bank_Accounts.venderid = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(Bank_Accounts.daen) AS totalDaen
                                             FROM   Bank_Accounts
                                             WHERE  Bank_Accounts.CurID = @CurID
                                                    AND year = @FinancialYear
                                                    AND Bank_Accounts.venderid = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(Bank_Accounts.maden) AS SumMaden
                                              FROM      Bank_Accounts
                                              WHERE     ( Bank_Accounts.CurID = @CurID )
                                                        AND year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND Bank_Accounts.venderid = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(Bank_Accounts.daen) AS SumDaen
                                             FROM   Bank_Accounts
                                             WHERE  ( Bank_Accounts.CurID = @CurID )
                                                    AND year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND Bank_Accounts.venderid = AccCode
                                           ), 0); 
               




 

            END;




 -- الصندوق 


        IF @Box = 1
            BEGIN 
            
              
                INSERT  INTO #Render
                        SELECT  0 AS ISmain ,
                                Acc.BoxID ,
                                ( CASE WHEN ( @Lang = 'AR' )
                                       THEN ( Acc.BoxName )
                                       ELSE ( Acc.BoxName )
                                  END ) AS AccName ,
                                0.00 AS 'balanceMaden' ,
                                0.00 AS 'BalanceDaen' ,
                                0.00 AS SumMaden ,
                                0.00 AS SumDaen ,
                                0.00 AS totalMaden ,
                                0.00 AS totalDaen ,
                                0.00 AS StartMaden ,
                                0.00 AS StartDaen 
                        FROM    dbo.Box Acc
                        WHERE   ( @AccountID = 0
                                  OR Acc.BoxID = @AccountID
                                )
                        ORDER BY Acc.BoxID;




                UPDATE  #Render
                SET     SumMaden = ISNULL(( SELECT  SUM(dbo.Box_Moves.Price_Elwared)
                                            FROM    dbo.Box_Moves
                                            WHERE   Year = @FinancialYear
                                                    AND Box_Moves.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Box_Moves.BoxID = AccCode
                                          ), 0) ,
                        SumDaen = ISNULL(( SELECT   SUM(Box_Moves.Price_ElMonsaref) AS SumDaen
                                           FROM     Box_Moves
                                           WHERE    Year = @FinancialYear
                                                    AND Box_Moves.CurID = @CurID
                                                    AND IsStartedBalance = 0
                                                    AND Box_Moves.BoxID = AccCode
                                         ), 0) ,
                        totalMaden = ISNULL(( SELECT    SUM(Box_Moves.Price_Elwared) AS totalMaden
                                              FROM      Box_Moves
                                              WHERE     Box_Moves.CurID = @CurID
                                                        AND Year = @FinancialYear
                                                        AND Box_Moves.BoxID = AccCode
                                            ), 0) ,
                        totalDaen = ISNULL(( SELECT SUM(Box_Moves.Price_ElMonsaref) AS totalDaen
                                             FROM   Box_Moves
                                             WHERE  Box_Moves.CurID = @CurID
                                                    AND Year = @FinancialYear
                                                    AND Box_Moves.BoxID = AccCode
                                           ), 0) ,
                        StartMaden = ISNULL(( SELECT    SUM(Box_Moves.Price_Elwared) AS SumMaden
                                              FROM      Box_Moves
                                              WHERE     ( Box_Moves.CurID = @CurID )
                                                        AND Year = @FinancialYear
                                                        AND IsStartedBalance = 1
                                                        AND Box_Moves.BoxID = AccCode
                                            ), 0) ,
                        StartDaen = ISNULL(( SELECT SUM(Box_Moves.Price_ElMonsaref) AS SumDaen
                                             FROM   Box_Moves
                                             WHERE  ( Box_Moves.CurID = @CurID )
                                                    AND Year = @FinancialYear
                                                    AND IsStartedBalance = 1
                                                    AND Box_Moves.BoxID = AccCode
                                           ), 0); 
               




 

            END;



















        UPDATE  #Render
        SET     balanceMaden = ( CASE WHEN ( #Render.totalMaden > #Render.totalDaen )
                                      THEN ( totalMaden - totalDaen )
                                      ELSE ( 0 )
                                 END );


        UPDATE  #Render
        SET     BalanceDaen = ( CASE WHEN ( #Render.totalMaden < #Render.totalDaen )
                                     THEN ( totalDaen - totalMaden )
                                     ELSE ( 0 )
                                END );



         


		 
        IF @zero = 1
            BEGIN

            
                SELECT  *
                FROM    #Render
                ORDER BY AccCode;
            END;
	 
        IF @zero = 0
            BEGIN
         
                SELECT  *
                FROM    #Render
                WHERE   BalanceDaen + balanceMaden <> 0
                ORDER BY AccCode;

            END;

        

    END;
