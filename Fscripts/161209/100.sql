
ALTER  PROCEDURE [dbo].[ACC_Cost_Summary]
    @Cur_ID INT ,
    @MainAcc BIGINT ,
    @fromACC BIGINT ,
    @toAcc BIGINT ,
    @FromDate DATE ,
    @ToDate DATE ,
    @GroupID INT
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              CostID BIGINT ,
              Cost_Name NVARCHAR(MAX) COLLATE Arabic_CI_AS,
              AccID BIGINT ,
              Account_Name NVARCHAR(MAX) COLLATE Arabic_CI_AS,
              TiteleID INT ,
              TiteleName NVARCHAR(50) COLLATE Arabic_CI_AS,
              Amount FLOAT ,
              Financial_year INT ,
              CostGroup_ID INT ,
              Cost_Group NVARCHAR(MAX) COLLATE Arabic_CI_AS
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) COLLATE Arabic_CI_AS
            );



      


        CREATE TABLE #Costs
            (
              CostID BIGINT ,
              CostName NVARCHAR(MAX) COLLATE Arabic_CI_AS,
              CostGroup_ID BIGINT ,
              Cost_Group NVARCHAR(MAX) COLLATE Arabic_CI_AS
            );



        CREATE TABLE #Title
            (
              TitleID BIGINT ,
              TitleName NVARCHAR(50) COLLATE Arabic_CI_AS
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
                  CostName ,
                  CostGroup_ID ,
                  Cost_Group
                )
                SELECT  TblCostTree.AccCode ,
                        TblCostTree.AccName ,
                        TblCostTree.ClassificationId ,
                        CostGroups.ClassificationName
                FROM    TblCostTree
                        LEFT OUTER JOIN CostGroups ON TblCostTree.ClassificationId = CostGroups.ClassificationId
                WHERE   AccCode IN ( SELECT DISTINCT
                                            costid
                                     FROM   dbo.El_Koyod_El_Yawmia )
                        AND ISmain = 0

						AND (@GroupID = 0 OR TblCostTree.ClassificationId = @GroupID )

				 


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
                                         WHERE  costid > 0 );

     

        INSERT  INTO #Result
                ( CostID ,
                  Cost_Name ,
                  AccID ,
                  Account_Name ,
                  TiteleID ,
                  TiteleName ,
                  Amount ,
                  Financial_year ,
                  CostGroup_ID ,
                  Cost_Group
	            )
                SELECT  #Costs.CostID ,
                        #Costs.CostName ,
                        #Accounts.AccCode ,
                        #Accounts.AccName ,
                        #Title.TitleID ,
                        #Title.TitleName ,
                        0 ,
                        #Financial_year.Financial_year ,
                        CostGroup_ID ,
                        Cost_Group
                FROM    #Costs
                        CROSS JOIN #Accounts
                        CROSS JOIN #Title
                        CROSS JOIN #Financial_year; 



        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID	AND aDate BETWEEN @FromDate AND @ToDate 
                         )
        WHERE   #Result.TiteleID = 1

	
     

        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID AND aDate BETWEEN @FromDate AND @ToDate 
                         )
        WHERE   #Result.TiteleID = 2;





        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = #Result.Financial_year
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID AND aDate BETWEEN @FromDate AND @ToDate 
                         )
        WHERE   #Result.TiteleID = 3;

	 
        SELECT  *
        FROM    #Result; 

	




    END;
