 
CREATE PROCEDURE Eda3at_Sp
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              Account_Name NVARCHAR(MAX) ,
              Month_Name NVARCHAR(50) ,
              Amount FLOAT
            );

        CREATE TABLE #Accounts
            (
              AccCode BIGINT ,
              AccName NVARCHAR(MAX) ,
              Type INT
            );

        INSERT  INTO #Accounts
                ( AccCode ,
                  AccName ,
                  Type 
                )
                SELECT  AccountID ,
                        Bank_Name ,
                        1
                FROM    dbo.BankAccountName
                UNION
                SELECT  BoxID ,
                        BoxName ,
                        2
                FROM    dbo.Box; 










        INSERT  INTO #Result
                ( Account_Name ,
                  Month_Name ,
                  Amount
                )
                SELECT  Account_Name ,
                        'janu' ,
                        150
                FROM    #Accounts;














	 
        SELECT  *
        FROM    #Result; 




    END;
GO
