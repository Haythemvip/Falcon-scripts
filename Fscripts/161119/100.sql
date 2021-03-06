 

CREATE   PROCEDURE [dbo].[ACC_Cost_Summary]
    @Cur_ID INT ,
    @MainAcc BIGINT ,
    @fromACC BIGINT ,
    @toAcc BIGINT 
 
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              CostID BIGINT ,
              Cost_Name NVARCHAR(MAX) ,
              AccID BIGINT ,
              Account_Name NVARCHAR(MAX) ,
              TiteleID INT ,
              TiteleName NVARCHAR(50) ,
              Amount FLOAT ,
              Financial_year INT
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX)
            );


        CREATE TABLE #Costs
            (
              CostID BIGINT ,
              CostName NVARCHAR(MAX)
            );



        CREATE TABLE #Title
            (
              TitleID BIGINT ,
              TitleName NVARCHAR(50)
            );


        CREATE TABLE #Financial_year
            (
              Financial_year BIGINT ,
               
            );



        INSERT  INTO #Financial_year
                ( Financial_year
                )
                SELECT  YearName
                FROM    dbo.FinancialYear;




			 
        INSERT  INTO #Title
                ( TitleID, TitleName )
        VALUES  ( 1, -- TitleID - bigint
                  N'Debit'  -- TitleName - nvarchar(50)
                  );



        INSERT  INTO #Title
                ( TitleID, TitleName )
        VALUES  ( 2, -- TitleID - bigint
                  N'Credit'  -- TitleName - nvarchar(50)
                  );

        INSERT  INTO #Title
                ( TitleID, TitleName )
        VALUES  ( 3, -- TitleID - bigint
                  N'Balance'  -- TitleName - nvarchar(50)
                  );

        INSERT  INTO #Costs
                ( CostID ,
                  CostName
                )
                SELECT  AccCode ,
                        AccName
                FROM    dbo.TblCostTree
                WHERE   AccCode IN ( SELECT DISTINCT
                                            costid
                                     FROM   dbo.El_Koyod_El_Yawmia
                                      )
                        AND ISmain = 0;



        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName 
                
				
                )
                SELECT  AccCode ,
                        AccName
                FROM    dbo.View_tblAccTree
                WHERE   ( @MainAcc = 0
                          OR F1 = @MainAcc
                          OR F2 = @MainAcc
                          OR F3 = @MainAcc
                          OR F4 = @MainAcc
                          OR F5 = @MainAcc
                          OR F6 = @MainAcc
                          OR F7 = @MainAcc
                          OR F8 = @MainAcc
                          OR F9 = @MainAcc
                          OR F10 = @MainAcc
                        )
                        AND ( @fromACC = 0
                              OR AccCode >= @fromACC
                            )
                        AND ( @toAcc = 0
                              OR AccCode <= @toAcc
                            )
                        AND ISmain = 0
                        AND AccCode IN ( SELECT DISTINCT
                                                AccID
                                         FROM   dbo.El_Koyod_El_Yawmia
                                         WHERE  costid > 0
                                                );

     

        INSERT  INTO #Result
                ( CostID ,
                  Cost_Name ,
                  AccID ,
                  Account_Name ,
                  TiteleID ,
                  TiteleName ,
                  Amount ,
                  Financial_year
	            )
                SELECT  #Costs.CostID ,
                        #Costs.CostName ,
                        #Accounts.AccCode ,
                        #Accounts.AccName ,
                        #Title.TitleID ,
                        #Title.TitleName ,
                        0 ,
                        #Financial_year.Financial_year
                FROM    #Costs
                        CROSS JOIN #Accounts
                        CROSS JOIN #Title
                        CROSS JOIN #Financial_year; 



        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID
                         )
        WHERE   #Result.TiteleID = 1;
     

        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID
                         )
        WHERE   #Result.TiteleID = 2;





        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                     AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID
                         )
        WHERE   #Result.TiteleID = 3;

	 
        SELECT  *
        FROM    #Result; 

	




    END;
