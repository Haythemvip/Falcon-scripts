 
 
CREATE    PROCEDURE [dbo].[Acc_Monthly_Compare]
    @Cur_ID INT ,
    @MainAcc BIGINT ,
    @fromACC BIGINT ,
    @toAcc BIGINT ,
    @Year CHAR(4)
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              MonthID INT ,
              Account_Name NVARCHAR(MAX) ,
              Month_Name NVARCHAR(50) ,
              Amount FLOAT ,
              VTypes INT ,
              AccID BIGINT
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) ,
              VTypes INT
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
			 

        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName ,
                  VTypes 
                )
                SELECT  AccCode ,
                        AccName ,
                        1
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
                        AND ISmain = 0;


        INSERT  INTO #Result
                ( MonthID ,
                  Account_Name ,
                  Month_Name ,
                  Amount ,
                  VTypes ,
                  AccID
                )
                SELECT  #Month.ID ,
                        AccName ,
                        MName ,
                        0 ,
                        VTypes ,
                        AccCode
                FROM    #Accounts
                        CROSS JOIN #Month
                ORDER BY #Month.ID;

        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) = MonthID
                         );
     




	 
        SELECT  *
        FROM    #Result; 

	




    END;
