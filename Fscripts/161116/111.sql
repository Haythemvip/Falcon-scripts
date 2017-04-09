

CREATE   PROCEDURE [dbo].[Item_Balance_All_Costs] @Year CHAR(4) = '2016'
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              ItemCode BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              CostID BIGINT ,
              Cost_Name NVARCHAR(50) ,
              Balance FLOAT ,
            
            );

        CREATE TABLE #Items
            (
              ItemCode BIGINT ,
              Item_Name NVARCHAR(MAX)
            );


        CREATE TABLE #Costs
            (
              CostID BIGINT ,
              Cost_Name NVARCHAR(50) ,
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
      



        INSERT  INTO #Costs
                ( CostID ,
                  Cost_Name
                )
                SELECT  AccCode ,
                        AccName
                FROM    dbo.TblCostTree
                WHERE   ISmain = 0; 
    




        INSERT  INTO #Result
                ( ItemCode ,
                  Item_Name ,
                  CostID ,
                  Cost_Name ,
                  Balance
	            )
                SELECT  #Items.ItemCode ,
                        #Items.Item_Name ,
                        #Costs.CostID ,
                        #Costs.Cost_Name ,
                        0
                FROM    #Items
                        CROSS JOIN #Costs; 




        UPDATE  #Result
        SET     Balance = ( SELECT  SUM(Quantity)
                            FROM    dbo.VEznSarf
							 
                            WHERE   #Result.ItemCode = dbo.VEznSarf.itemid
                                    AND #Result.CostID = dbo.VEznSarf.CostId
									AND year = @Year 
                          );



						    UPDATE  #Result
        SET     Balance = Balance + ( SELECT  SUM(Quantity)
                            FROM    dbo.VTaswyaKhasm
							 
                            WHERE   #Result.ItemCode = dbo.VTaswyaKhasm.itemid
                                    AND #Result.CostID = dbo.VTaswyaKhasm.CostId
									AND year = @Year 
                          );




	 
        SELECT  *
        FROM    #Result; 

	




    END;

