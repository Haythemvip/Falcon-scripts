 
ALTER PROCEDURE [dbo].[ACC_Cost_Monthly]
    @Cur_ID INT ,
    @ProjectCode AS dbo.MyCostParam READONLY ,
    @AccCode AS dbo.MyAccParam READONLY ,
    @Year INT
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              MonthID INT ,
              Account_Name NVARCHAR(MAX) ,
              Month_Name NVARCHAR(50) ,
              Amount FLOAT ,
              VTypes INT ,
              AccID BIGINT ,
              Cost_Name NVARCHAR(MAX) ,
              CostID BIGINT
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) ,
              VTypes INT
            );


        CREATE TABLE #Costs
            (
              CostID BIGINT ,
              CostName NVARCHAR(MAX)
            );



        CREATE TABLE #Month
            (
              ID INT ,
              MName NVARCHAR(50)
            );



        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 1, '01- January' );

        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 2, '02- Febraury' );

        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 3, '03- March' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 4, '04- April' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 5, '05- May' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 6, '06- June' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 7, '07- July' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 8, '08- August' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 9, '09- September' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 10, '10 -October' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 11, '11- November' );
        INSERT  INTO #Month
                ( ID, MName )
        VALUES  ( 12, '12- December' );
			 



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
                                     WHERE  year = @Year )
                        AND ISmain = 0

						 AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @ProjectCode
                              ) = 0
                              OR AccCode IN ( SELECT    *
                                              FROM      @ProjectCode )
                            );



        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName ,
                  VTypes 
				
                )
                SELECT  AccCode ,
                        AccName ,
                        1
                FROM    dbo.View_tblAccTree
                WHERE   ISmain = 0
                        AND AccCode IN ( SELECT DISTINCT
                                                AccID
                                         FROM   dbo.El_Koyod_El_Yawmia
                                         WHERE  costid > 0
                                                AND year = @Year )
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @AccCode
                              ) = 0
                              OR AccCode IN ( SELECT    *
                                              FROM      @AccCode )
                            );


        INSERT  INTO #Result
                ( MonthID ,
                  Account_Name ,
                  Month_Name ,
                  Amount ,
                  VTypes ,
                  AccID ,
                  Cost_Name ,
                  CostID
                )
                SELECT  #Month.ID ,
                        AccName ,
                        MName ,
                        0 ,
                        VTypes ,
                        AccCode ,
                        #Costs.CostName ,
                        CostID
                FROM    #Accounts
                        CROSS JOIN #Month
                        CROSS JOIN #Costs
                ORDER BY #Month.ID;







        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) = MonthID
                                    AND dbo.El_Koyod_El_Yawmia.costid = #Result.CostID
                         );
     




	 
        SELECT  *
        FROM    #Result; 

	




    END;
