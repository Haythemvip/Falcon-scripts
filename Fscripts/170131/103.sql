 

CREATE   PROCEDURE [dbo].[SP_Loan_Rep]
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              Type_of_Guarantee_ID INT ,
              Type_of_Guarantee NVARCHAR(MAX) COLLATE Arabic_CI_AS ,
              BanK_ID INT ,
              BanK_Name NVARCHAR(MAX) COLLATE Arabic_CI_AS ,
              Details_ID INT ,
              Details NVARCHAR(50) COLLATE Arabic_CI_AS ,
              Amount DECIMAL(18, 2) ,
              Ins DECIMAL(18, 2)
            );
			 
 

        CREATE TABLE #Detailstbl
            (
              Details_ID INT ,
              Details NVARCHAR(50) COLLATE Arabic_CI_AS
            );



        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 1, -- Details_ID - int
                  N'«· ”ÂÌ·« '  -- Details - nvarchar(50)
                  );


					  
        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 2, -- Details_ID - int
                  N'«·„” Œœ„'  -- Details - nvarchar(50)
                  );



					  
        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 3, -- Details_ID - int
                  N'—’Ìœ «· ”ÂÌ·« '  -- Details - nvarchar(50)
                  );




        INSERT  INTO #Result
                ( Type_of_Guarantee_ID ,
                  Type_of_Guarantee ,
                  BanK_ID ,
                  BanK_Name ,
                  Details_ID ,
                  Details ,
                  Amount,
				  Ins
			    )
                SELECT  Collateral_ID ,
                        Collateral_AR ,
                        BankAccountName.AccountID ,
                        BankAccountName.AccountName ,
                        #Detailstbl.Details_ID ,
                        #Detailstbl.Details ,
                        0,
						0
                FROM    dbo.Letter_of_Guarantee
                        INNER JOIN dbo.collateral ON collateral.ID = Letter_of_Guarantee.Collateral_ID
                        CROSS JOIN #Detailstbl
                        INNER JOIN dbo.BankAccountName ON Letter_of_Guarantee.Bank_ID = BankAccountName.AccountID
                WHERE   BankAccountName.AccountID IN (
                        SELECT  Bank_ID
                        FROM    dbo.Letter_of_Guarantee )
                ORDER BY Bank_ID; 



				 INSERT  INTO #Result
                ( Type_of_Guarantee_ID ,
                  Type_of_Guarantee ,
                  BanK_ID ,
                  BanK_Name ,
                  Details_ID ,
                  Details ,
                  Amount,
				  Ins
			    )
                SELECT  ID ,
                        Collateral_AR ,
                        0 ,
                        'ÌÃ„⁄-Totals' ,
                        #Detailstbl.Details_ID ,
                        #Detailstbl.Details ,
                        0,
						0
                FROM    dbo.collateral
                        
                        CROSS JOIN #Detailstbl
                        
               




 
        UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(Collateral_Value), 0)
                           FROM     dbo.Letter_of_Guarantee
                           WHERE    Letter_of_Guarantee.Bank_ID = #Result.BanK_ID
                                    AND Letter_of_Guarantee.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   #Result.Details_ID = 1;
  



      UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(Collateral_Value), 0)
                           FROM     dbo.Letter_of_Guarantee
                           WHERE   
                                      Letter_of_Guarantee.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   #Result.Details_ID = 1 
		AND   #Result.BanK_ID = 0








        
        UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(NewValue), 0)
                           FROM     dbo.Letter_of_Guarantee_Used
                           WHERE    Letter_of_Guarantee_Used.Bank_ID = #Result.BanK_ID
                                    AND Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   Details_ID = 2;



		   UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(NewValue), 0)
                           FROM     dbo.Letter_of_Guarantee_Used
                           WHERE    
                                     Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   Details_ID = 2
		AND   #Result.BanK_ID = 0





        UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(Collateral_Value), 0)
                           FROM     dbo.Letter_of_Guarantee
                           WHERE    Letter_of_Guarantee.Bank_ID = #Result.BanK_ID
                                    AND Letter_of_Guarantee.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
                - ( SELECT  ISNULL(SUM(NewValue), 0)
                    FROM    dbo.Letter_of_Guarantee_Used
                    WHERE   Letter_of_Guarantee_Used.Bank_ID = #Result.BanK_ID
                            AND Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                  )
        WHERE   Details_ID = 3;




		  UPDATE  #Result
        SET     Amount = ( SELECT   ISNULL(SUM(Collateral_Value), 0)
                           FROM     dbo.Letter_of_Guarantee
                           WHERE    
                                     Letter_of_Guarantee.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
                - ( SELECT  ISNULL(SUM(NewValue), 0)
                    FROM    dbo.Letter_of_Guarantee_Used
                    WHERE   
                             Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                  )
      WHERE   Details_ID = 3
		AND   #Result.BanK_ID = 0




		   UPDATE  #Result
        SET     Ins = ( SELECT   ISNULL(SUM(Collateral_Mony), 0)
                           FROM     dbo.Letter_of_Guarantee_Used
                           WHERE    Letter_of_Guarantee_Used.Bank_ID = #Result.BanK_ID
                                    AND Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   #Result.Details_ID = 2;



			   UPDATE  #Result
        SET     Ins = ( SELECT   ISNULL(SUM(Collateral_Mony), 0)
                           FROM     dbo.Letter_of_Guarantee_Used
                           WHERE     
                                      Letter_of_Guarantee_Used.Collateral_ID = #Result.Type_of_Guarantee_ID
                         )
        WHERE   #Result.Details_ID = 3 
			AND   #Result.BanK_ID = 0



	 
        SELECT  *
        FROM    #Result
        ORDER BY BanK_ID; 

	




    END;


GO


