
 
ALTER  PROCEDURE Eda3at_Sp
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
			  MonthID INT  ,
              Account_Name NVARCHAR(MAX) ,
              Month_Name NVARCHAR(50) ,
              Amount FLOAT,VTypes INT ,
			  AccID BIGINT 
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) ,
              VTypes INT
            );


        CREATE TABLE #Month ( ID INT , MName NVARCHAR(50) );



        INSERT  INTO #Month
                (ID, MName )
        VALUES  ( 1,'01- January' );

        INSERT  INTO #Month
                (ID, MName )
        VALUES  (2, '02- Febraury' );

        INSERT  INTO #Month
                 (ID, MName )
        VALUES  ( 3,'03- March' );
        INSERT  INTO #Month
                 (ID, MName )
        VALUES  ( 4,'04- April' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  ( 5,'05- May' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  ( 6,'06- June' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  ( 7,'07- July' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  (8, '08- August' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  ( 9,'09- September' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  (10, '10 -October' );
        INSERT  INTO #Month
              (ID, MName )
        VALUES  ( 11,'11- November' );
        INSERT  INTO #Month
                (ID, MName )
        VALUES  (12, '12- December' );
			 

        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName ,
                  VTypes 
                )
                SELECT  AccountID ,
                        AccountName ,
                        1
                FROM    dbo.BankAccountName
                UNION
                SELECT  BoxID ,
                        BoxName ,
                        2
                FROM    dbo.Box; 



        INSERT  INTO #Result
                ( MonthID,Account_Name ,
                  Month_Name ,
                  Amount,VTypes,AccID
                )
                SELECT #Month.ID, AccName ,
                        MName ,
                        0,VTypes,AccCode 
                FROM    #Accounts
				 CROSS JOIN  #Month 
				ORDER BY #Month.ID

				UPDATE #Result SET Amount = (SELECT SUM(maden) FROM dbo.Bank_Accounts WHERE venderid = #Result.AccID AND year = 2016 AND DATEPART(MONTH ,movedate) = MonthID ) WHERE VTypes = 1



				 INSERT  INTO #Result
                ( MonthID,Account_Name ,
                  Month_Name ,
                  Amount,VTypes,AccID
                )
                SELECT #Month.ID, AccName ,
                        MName ,
                        0,VTypes,AccCode 
                FROM    #Accounts
				 CROSS JOIN  #Month 
				ORDER BY #Month.ID

				UPDATE #Result SET Amount = (SELECT SUM(Price_Elwared) FROM dbo.Box_Moves WHERE BoxID = #Result.AccID AND year = 2016 AND DATEPART(MONTH ,aDate) = MonthID ) WHERE VTypes = 2



	 
        SELECT  *
        FROM    #Result ; 

	




    END;
GO

