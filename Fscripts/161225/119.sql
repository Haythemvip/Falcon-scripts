 
 

ALTER   PROCEDURE [dbo].[Item_Balance_All_Costs]
    @Year CHAR(4) = '2016' ,
    @List AS dbo.MyCostParam READONLY  
AS
    BEGIN
	 
	 
     

        CREATE TABLE #Month
            (
              ID INT ,
              Month_Name NVARCHAR(50)
            );



        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 1, '01- January' );

        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 2, '02- Febraury' );

        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 3, '03- March' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 4, '04- April' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 5, '05- May' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 6, '06- June' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 7, '07- July' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 8, '08- August' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 9, '09- September' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 10, '10 -October' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 11, '11- November' );
        INSERT  INTO #Month
                ( ID, Month_Name )
        VALUES  ( 12, '12- December' );


        CREATE TABLE #Result
            (
              ItemCode BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              CostID BIGINT ,
              Cost_Name NVARCHAR(50) ,
              Balance FLOAT ,
              MonthID INT ,
              Month_Name NVARCHAR(50)
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
                                            itemid
                                     FROM   dbo.VEznSarf
                                     WHERE  year = @Year
                                            AND CostId > 0
                                     UNION
                                     SELECT DISTINCT
                                            itemid
                                     FROM   dbo.VTaswyaKhasm
                                     WHERE  year = @Year
                                            AND CostID > 0 );
      


	 
        INSERT  INTO #Costs
                ( CostID ,
                  Cost_Name
                )
                SELECT  AccCode ,
                        AccName
                FROM    dbo.View_TblCostTree
                WHERE   ISmain = 0
                      AND   ((SELECT ISNULL(COUNT(*),0) FROM @List) = 0 OR View_TblCostTree.AccCode IN(SELECT * FROM @List) ) 
                         
                        AND AccCode IN ( SELECT DISTINCT
                                                CostId
                                         FROM   dbo.VEznSarf
                                         WHERE  year = @Year
                                         UNION
                                         SELECT DISTINCT
                                                CostID
                                         FROM   dbo.VTaswyaKhasm
                                         WHERE  year = @Year );
    




        INSERT  INTO #Result
                ( ItemCode ,
                  Item_Name ,
                  CostID ,
                  Cost_Name ,
                  Balance ,
                  MonthID ,
                  Month_Name
	            )
                SELECT  #Items.ItemCode ,
                        #Items.Item_Name ,
                        #Costs.CostID ,
                        #Costs.Cost_Name ,
                        0 ,
                        #Month.ID ,
                        #Month.Month_Name
                FROM    #Items
                        CROSS JOIN #Costs
                        CROSS JOIN #Month; 




        UPDATE  #Result
        SET     Balance = ( SELECT  ISNULL(SUM(Quantity), 0)
                            FROM    dbo.VEznSarf
                            WHERE   #Result.ItemCode = dbo.VEznSarf.itemid
                                    AND #Result.CostID = dbo.VEznSarf.CostId
                                    AND year = @Year
                                    AND DATEPART(MONTH, Sarfdate) = MonthID
                          );



        UPDATE  #Result
        SET     Balance = Balance
                + ( SELECT  ISNULL(SUM(Quantity), 0)
                    FROM    dbo.VTaswyaKhasm
                    WHERE   #Result.ItemCode = dbo.VTaswyaKhasm.itemid
                            AND #Result.CostID = dbo.VTaswyaKhasm.CostID
                            AND year = @Year
                            AND DATEPART(MONTH, Sarfdate) = MonthID
                  );




	 
        SELECT  *
        FROM    #Result; 

	




    END;

