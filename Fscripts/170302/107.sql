 
 

ALTER   PROCEDURE [dbo].[Item_Balance_All_Costs]
    @Year INT ,
    @List AS dbo.MyCostParam READONLY ,
    @ListItems AS dbo.MyItemtParam READONLY ,
    @ISValues INT = 1
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
              Item_Name NVARCHAR(MAX) ,
              CostID BIGINT ,
              Cost_Name NVARCHAR(250)
            );

 


        INSERT  INTO #Items
                ( ItemCode ,
                  Item_Name ,
                  CostID ,
                  Cost_Name
                )
                SELECT DISTINCT
                        Items.Item_Id ,
                        Items.Item_Name ,
                        VEznSarf.CostId ,
                        0
                FROM    Items
                        INNER JOIN VEznSarf ON VEznSarf.itemid = Items.Item_Id
                WHERE   Item_Id IN ( SELECT DISTINCT
                                            itemid
                                     FROM   dbo.VEznSarf
                                     WHERE  year = @Year )
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @ListItems
                              ) = 0
                              OR Item_Id IN ( SELECT    *
                                              FROM      @ListItems )
                            )
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @List
                              ) = 0
                              OR CostId IN ( SELECT *
                                             FROM   @List )
                            )
                        AND year = @Year
                UNION
                SELECT DISTINCT
                        Items.Item_Id ,
                        Items.Item_Name ,
                        CostID ,
                        0
                FROM    dbo.Items
                        INNER JOIN VTaswyaKhasm ON VTaswyaKhasm.itemid = Item_Id
                WHERE   Item_Id IN ( SELECT DISTINCT
                                            itemid
                                     FROM   dbo.VTaswyaKhasm
                                     WHERE  year = @Year )
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @ListItems
                              ) = 0
                              OR Item_Id IN ( SELECT    *
                                              FROM      @ListItems )
                            )
                        AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @List
                              ) = 0
                              OR CostID IN ( SELECT *
                                             FROM   @List )
                            )
                        AND year = @Year;
 


        UPDATE  #Items
        SET     Cost_Name = AccName
        FROM    #Items
                INNER JOIN dbo.TblCostTree ON CostID = AccCode; 
  
     
        UPDATE  #Items
        SET     Cost_Name = '1 - بدون مركز تكلفة'
        FROM    #Items
        WHERE   CostID = 0;


        INSERT  INTO #Result
                ( ItemCode ,
                  Item_Name ,
                  CostID ,
                  Cost_Name ,
                  Balance ,
                  MonthID ,
                  Month_Name
	            )
                SELECT DISTINCT
                        #Items.ItemCode ,
                        #Items.Item_Name ,
                        #Items.CostID ,
                        #Items.Cost_Name ,
                        0 ,
                        #Month.ID ,
                        #Month.Month_Name
                FROM    #Items
                        CROSS JOIN #Month; 
 

        IF @ISValues = 1
            BEGIN 
	  

                UPDATE  #Result
                SET     Balance = ( SELECT  ISNULL(SUM(total), 0)
                                    FROM    dbo.VEznSarf
                                    WHERE   #Result.ItemCode = dbo.VEznSarf.itemid
                                            AND #Result.CostID = dbo.VEznSarf.CostId
                                            AND year = @Year
                                            AND DATEPART(MONTH, Sarfdate) = MonthID
                                  );



                UPDATE  #Result
                SET     Balance = Balance
                        + ( SELECT  ISNULL(SUM(total), 0)
                            FROM    dbo.VTaswyaKhasm
                            WHERE   #Result.ItemCode = dbo.VTaswyaKhasm.itemid
                                    AND #Result.CostID = dbo.VTaswyaKhasm.CostID
                                    AND year = @Year
                                    AND DATEPART(MONTH, Sarfdate) = MonthID
                          );

            END;






		  
        IF @ISValues = 0
            BEGIN 
	  

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

            END;
          


	 
        SELECT  *
        FROM    #Result; 

	




    END;

