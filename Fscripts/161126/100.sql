 

 
ALTER PROCEDURE [dbo].[Item_EpireDate]
    @ExpDate DATE = NULL ,
    @store_id INT = 0 ,
    @ItemID BIGINT = 0 ,
    @UnitID INT = 0 ,
    @UnitName NVARCHAR(50) = 0
AS


IF @UnitID = 0

 BEGIN 

 SET @UnitID = (SELECT unitcode  FROM dbo.unit WHERE unitname = @UnitName   )


END




    CREATE TABLE #Result
        (
          store_name NVARCHAR(200) ,
          Item_Id BIGINT ,
          Item_Name NVARCHAR(MAX) ,
          ExDate NVARCHAR(MAX) ,
          rased FLOAT ,
          Item_Unit_Id INT ,
          Item_unit2 INT ,
          Item_unit3 INT ,
          EqulUnit DECIMAL(18, 2) ,
          EqulUnit2 DECIMAL(18, 2)
        );
       


 



    BEGIN TRY 

       
        INSERT  INTO #Result
                SELECT  store_name ,
                        Item_Id ,
                        Item_Name ,
                        SN ,
                        SUM(QCome - Qout) ,
                        Item_Unit_Id ,
                        Item_unit2 ,
                        Item_unit3 ,
                        EqulUnit ,
                        EqulUnit2
                FROM    dbo.V_Item_Card
                WHERE   LEN(SN) = 10
                        AND ( @store_id = 0
                              OR store_id = @store_id
                            )
                        AND ( @ItemID = 0
                              OR Item_Id = @ItemID
                            )
                        AND ( @ExpDate is NULL
                              OR SN <= @ExpDate
                            )
                GROUP BY store_name ,
                        Item_Id ,
                        Item_Name ,
                        sn ,
                        Item_Unit_Id ,
                        Item_unit2 ,
                        Item_unit3 ,
                        EqulUnit ,
                        EqulUnit2;

						
          


            

    END TRY 
                   
    BEGIN CATCH 

    END CATCH; 
  
 


    UPDATE  #Result
    SET     rased = CASE WHEN ( @UnitID = #Result.Item_Unit_Id )
                         THEN ( rased )
                         WHEN ( @UnitID = #Result.Item_unit2
                                AND ISNULL(EqulUnit, 0) > 0
                              ) THEN ( EqulUnit * rased )
                         WHEN ( @UnitID = #Result.Item_unit3
                                AND ISNULL(EqulUnit2, 0) > 0
                              ) THEN ( EqulUnit2 * rased )
                         ELSE ( rased )
                    END;
 
	   
	    
	  
    SELECT  *
    FROM    #Result
    WHERE   ISNULL(rased, 0) > 0;
 