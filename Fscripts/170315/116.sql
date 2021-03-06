
 
ALTER    PROCEDURE [dbo].[Acc_Quarterly]
    @Cur_ID INT ,
    @AccCode AS dbo.MyAccParam READONLY ,
    @Year CHAR(4) 
    
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              Classification NVARCHAR(250) ,
              Category NVARCHAR(250) ,
              Group_Name NVARCHAR(50) ,
              QuarterID INT ,
              Account_Name NVARCHAR(MAX) ,
              Quarter_Name NVARCHAR(50) ,
              Amount FLOAT ,
              AccID BIGINT
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) ,
              Group_Name NVARCHAR(MAX) ,
              Classification NVARCHAR(250) ,
              Category NVARCHAR(250),
            );


        CREATE TABLE #Quarter
            (
              ID INT ,
              QName NVARCHAR(50)
            );



        INSERT  INTO #Quarter
                ( ID, QName )
        VALUES  ( 1, '01- First quarter' );

        INSERT  INTO #Quarter
                ( ID, QName )
        VALUES  ( 2, '02- Second quarter' );

        INSERT  INTO #Quarter
                ( ID, QName )
        VALUES  ( 3, '03- Third quarter' );
        INSERT  INTO #Quarter
                ( ID, QName )
        VALUES  ( 4, '04- Fourth quarter' );
       

        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName ,
                  Group_Name ,
                  Classification ,
                  Category 
                )
                SELECT  AccCode ,
                        AccName ,
                       0 AS AccountGroup_Name ,
                      0 AS  ClassificationName ,
                      0 AS  Type_Name
                FROM    dbo.View_tblAccTree
               WHERE ( ( SELECT  ISNULL(COUNT(*), 0)
                            FROM    @AccCode
                          ) = 0
                          OR AccCode IN ( SELECT  *
                                        FROM    @AccCode )
                        )
                        AND ISmain = 0

						AND AccCode IN (SELECT AccID FROM  dbo.El_Koyod_El_Yawmia WHERE YEAR = @Year )



        INSERT  INTO #Result
                ( Classification ,
                  Category ,
                  Group_Name ,
                  QuarterID ,
                  Account_Name ,
                  Quarter_Name ,
                  Amount ,
                  AccID
                )
                SELECT  #Accounts.Classification ,
                        #Accounts.Category ,
                        #Accounts.Group_Name ,
                        #Quarter.ID ,
                        AccName ,
                        #Quarter.QName ,
                        0 ,
                        AccCode
                FROM    #Accounts
                        CROSS JOIN #Quarter
                ORDER BY #Quarter.ID;

        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) BETWEEN 1 AND 3
                         )
        WHERE   QuarterID = 1;
     
        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) BETWEEN 4 AND 6
                         )
        WHERE   QuarterID = 2;


        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) BETWEEN 7 AND 9
                         )
        WHERE   QuarterID = 3;
	 

        UPDATE  #Result
        SET     Amount = ( SELECT   SUM(Maden) - SUM(Daen)
                           FROM     dbo.El_Koyod_El_Yawmia
                           WHERE    dbo.El_Koyod_El_Yawmia.AccID = #Result.AccID
                                    AND year = @Year
                                    AND DATEPART(MONTH, aDate) BETWEEN 10 AND 12
                         )
        WHERE   QuarterID = 4;



        SELECT  *
        FROM    #Result; 

	




    END;
