

ALTER PROCEDURE [dbo].[SelectFinalMenuSitting]
    @FainalMenuID INT ,
    @GroupId INT ,
    @Year INT
AS
    SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;



    CREATE TABLE #Result
        (
          ID INT ,
          Name_Ar NVARCHAR(250) ,
          Name_En NVARCHAR(250) ,
          SortID INT ,
          isTitle BIT ,
          GroupName NVARCHAR(50) ,
          ItemValue FLOAT
        );




    INSERT  INTO #Result
            ( ID ,
              Name_Ar ,
              Name_En ,
              SortID ,
              isTitle ,
              GroupName ,
              ItemValue
			 )
            SELECT  ID ,
                    Name_Ar ,
                    Name_En ,
                    SortID ,
                    isTitle ,
                    GroupName ,
                    0 AS ItemValue
            FROM    [dbo].[FinalMenuSittings]
            WHERE   FainalMenuID = @FainalMenuID
                    AND GroupId = @GroupId
            ORDER BY [SortID];









	
    CREATE TABLE #Table1
        (
          Aaccount_GroupID INT ,
          MethodID INT ,
          ThisYear FLOAT ,
          ThisYearAdd FLOAT ,
          ThisYearMinus FLOAT ,
          FinalMenuID INT ,
          Switch_to_positive INT
        );





    BEGIN TRY
       



        INSERT  #Table1
                ( Aaccount_GroupID ,
                  MethodID ,
                  ThisYear ,
                  ThisYearAdd ,
                  ThisYearMinus ,
                  FinalMenuID ,
                  Switch_to_positive
	            )
                SELECT  Aaccount_GroupID , -- Aaccount_GroupID - int
                        MethodID , -- MethodID - int
                        0.00 AS 'ThisYear' ,
                        0.00 AS 'ThisYearadd' ,
                        0.00 AS 'ThisYearminus' ,
                        FinalMenuID ,
                        Switch_to_positive
                FROM    FinalBalanceForms;


               
       	   
        UPDATE  #Table1
        SET     [ThisYearAdd] = ISNULL(( SELECT SUM(Maden)
                                         FROM   View_Mezn
                                         WHERE  View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                                AND year = @Year
                                       ), 0)
                - ISNULL(( SELECT   SUM(Daen)
                           FROM     View_Mezn
                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                    AND year = @Year
                         ), 0)
        WHERE   #Table1.MethodID = 1;


    END TRY

    BEGIN CATCH
    END CATCH;





    BEGIN TRY
       
               
        UPDATE  #Table1
        SET     [ThisYearMinus] = ISNULL(( SELECT   SUM(Maden)
                                           FROM     View_Mezn
                                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                                    AND year = @Year
                                         ), 0)
                - ISNULL(( SELECT   SUM(Daen)
                           FROM     View_Mezn
                           WHERE    View_Mezn.AccountGroup_ID = #Table1.Aaccount_GroupID
                                    AND year = @Year
                         ), 0)
        WHERE   #Table1.MethodID = 0;


    END TRY

    BEGIN CATCH
    END CATCH;


	 UPDATE  #Table1
    SET     ThisYearAdd = ThisYearAdd * -1
    WHERE   Switch_to_positive = 1;


	 UPDATE  #Table1
    SET     ThisYearMinus = ThisYearMinus * -1
    WHERE   Switch_to_positive = 1;


   



    BEGIN TRY
       
        UPDATE  #Table1
        SET     [ThisYear] = ThisYearAdd - ThisYearMinus;  
    END TRY

    BEGIN CATCH
    END CATCH;



		 
		

	 
    BEGIN TRY
       
        UPDATE  #Result
        SET     ItemValue = ( SELECT    ISNULL(SUM(ThisYear), 0)
                              FROM      #Table1
                              WHERE     #Result.ID = #Table1.FinalMenuID
                            );

    END TRY

    BEGIN CATCH
    END CATCH;












    SELECT  *
    FROM    #Result; 











    

