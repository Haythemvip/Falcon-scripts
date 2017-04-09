
CREATE PROCEDURE Purchased_Items
    @FromDate DATE ,
    @ToDate DATE ,
    @SuppID BIGINT
AS
    BEGIN

        CREATE TABLE #Resul
            (
              itemid BIGINT ,
              ITEMS_ITEM_NAME NVARCHAR(MAX) ,
              unit NVARCHAR(50) ,
              Q FLOAT ,
              TotalPrice FLOAT ,
              AvaregPrice FLOAT ,
              PercentQ FLOAT ,
              PercentPrice FLOAT
            )
        INSERT  INTO #Resul
                ( itemid ,
                  ITEMS_ITEM_NAME ,
                  unit ,
                  Q ,
                  TotalPrice ,
                  AvaregPrice ,
                  PercentQ ,
                  PercentPrice
                )
                SELECT DISTINCT
                        ( itemid ) ,
                        Item_Name ,
                        unit ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        0
                FROM    vinvoicecome
                WHERE   idate BETWEEN @FromDate AND @ToDate



        INSERT  INTO #Resul
                ( itemid ,
                  Item_Name ,
                  unit ,
                  Q ,
                  TotalPrice ,
                  AvaregPrice ,
                  PercentQ ,
                  PercentPrice
                )
                SELECT 
                        itemid  ,
                        Item_Name ,
                        unit ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        0
                FROM    dbo.VinvoiceComeNoTax
			    WHERE   idate BETWEEN @FromDate AND @ToDate
                GROUP BY itemid,Item_Name,unit
				ORDER BY itemid 
				


        UPDATE  #Resul
        SET     Q = ( SELECT    SUM(Q)
                      FROM      dbo.byan_item
                      WHERE     idate BETWEEN @FromDate AND @ToDate
                    )

    END
GO
