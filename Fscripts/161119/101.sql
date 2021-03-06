
 
CREATE     PROCEDURE [dbo].[Acc_Quarterly]
    @Cur_ID INT ,
    @MainAcc BIGINT ,
    @fromACC BIGINT ,
    @toAcc BIGINT ,
    @Year CHAR(4) ,
    @FinalAccID INT
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
                        AccountGroup_Name ,
                        ClassificationName ,
                        Type_Name
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

						AND (@FinalAccID = 0 OR MezanyaID = @FinalAccID )



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
