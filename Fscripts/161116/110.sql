
CREATE  PROCEDURE [dbo].[Item_Balance_All_Stores] @Year CHAR(4) = '2016'
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              ItemCode BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              StoreID BIGINT ,
              Store_Name NVARCHAR(50) ,
              Balance FLOAT ,
            
            );

        CREATE TABLE #Items
            (
              ItemCode BIGINT ,
              Item_Name NVARCHAR(MAX)
            );


        CREATE TABLE #Stores
            (
              StoreID BIGINT ,
              Store_Name NVARCHAR(50)
            );



        INSERT  INTO #Items
                ( ItemCode ,
                  Item_Name
                )
                SELECT  Item_Id ,
                        Item_Name
                FROM    dbo.Items
                WHERE   Item_Id IN ( SELECT DISTINCT
                                            Item_Id
                                     FROM   dbo.Item_Card
                                     WHERE  Year = @Year );
      



        INSERT  INTO #Stores
                ( StoreID ,
                  Store_Name
                )
                SELECT  store_id ,
                        store_name
                FROM    dbo.Stores; 
    




        INSERT  INTO #Result
                ( ItemCode ,
                  Item_Name ,
                  StoreID ,
                  Store_Name ,
                  Balance
	            )
                SELECT  #Items.ItemCode ,
                        #Items.Item_Name ,
                        #Stores.StoreID ,
                        #Stores.Store_Name,0
                FROM    #Items
                        CROSS JOIN #Stores; 




						UPDATE #Result SET Balance = (SELECT SUM(QCome) - SUM(Qout) FROM dbo.Item_Card WHERE Year = @Year AND #Result.ItemCode = dbo.Item_Card.Item_Id  AND #Result.StoreID = dbo.Item_Card.store_id )
	 
        SELECT  *
        FROM    #Result; 

	




    END;
