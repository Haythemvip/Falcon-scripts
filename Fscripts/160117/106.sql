
ALTER PROCEDURE [dbo].[Purchased_Items]
    @FromDate DATE ,
    @ToDate DATE ,
    @SuppID BIGINT = 0 ,
    @storeName NVARCHAR(100) = '' ,
    @StoreID INT = 0 ,
    @Tasneef NVARCHAR(50) = '' ,
    @GroupName NVARCHAR(50) = '' ,
    @GroupID INT = 0 ,
    @SubGroupName NVARCHAR(50) = '' ,
    @SupID INT = 0 ,
    @SuppName NVARCHAR(200) = ''
AS
    BEGIN


        DECLARE @totalQuantiry FLOAT ,
            @TotalValue FLOAT 


        
        DELETE  FROM dbo.berchasebetweendate 



        INSERT  INTO dbo.berchasebetweendate
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared  
			           
			    )
                SELECT  itemid ,
                        Item_Name ,
                        unit ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        @FromDate ,
                        @ToDate ,
                        @storeName ,
                        @Tasneef ,
                        @GroupName ,
                        @SubGroupName ,
                        @SuppName
                FROM    dbo.VinvoiceComeNoTax
                WHERE   idate BETWEEN @FromDate AND @ToDate
                GROUP BY itemid ,
                        Item_Name ,
                        unit
                ORDER BY itemid 



        INSERT  INTO dbo.berchasebetweendate
                ( itemid ,
                  itemname ,
                  unit ,
                  quantity ,
                  valsum ,
                  avrege ,
                  pricepercent ,
                  qpercent ,
                  fromdate ,
                  todate ,
                  store ,
                  tasnef ,
                  grouup ,
                  supgroup ,
                  moared  
			           
			    )
                SELECT  itemid ,
                        Item_Name ,
                        unit ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        0 ,
                        @FromDate ,
                        @ToDate ,
                        @storeName ,
                        @Tasneef ,
                        @GroupName ,
                        @SubGroupName ,
                        @SuppName
                FROM    dbo.vinvoicecome
                WHERE   idate BETWEEN @FromDate AND @ToDate
                GROUP BY itemid ,
                        Item_Name ,
                        unit
                ORDER BY itemid 

 			


        UPDATE  berchasebetweendate
        SET     quantity = ( SELECT SUM(Q)
                             FROM   dbo.invcomeitemNoTax
                             WHERE  berchasebetweendate.itemid = dbo.invcomeitemNoTax.itemid
                                    AND InvoiceNo IN (
                                    SELECT  InvoiceNo
                                    FROM    berchasebetweendate )
                           )
                + ( SELECT  SUM(Q)
                    FROM    dbo.invcomeitem
                    WHERE   berchasebetweendate.itemid = dbo.invcomeitem.itemid
                            AND InvoiceNo IN ( SELECT   InvoiceNo
                                               FROM     berchasebetweendate )
                  )

        


        SET @totalQuantiry = ( SELECT   SUM(quantity)
                               FROM     berchasebetweendate
                             )
                      

       




        UPDATE  berchasebetweendate
        SET     valsum = ( SELECT   SUM(TotalPrice)
                           FROM     dbo.invcomeitemNoTax
                           WHERE    berchasebetweendate.itemid = dbo.invcomeitemNoTax.itemid
                                    AND InvoiceNo IN (
                                    SELECT  InvoiceNo
                                    FROM    berchasebetweendate )
                         )
                + ( SELECT  SUM(TotalPrice)
                    FROM    dbo.invcomeitem
                    WHERE   berchasebetweendate.itemid = dbo.invcomeitem.itemid
                            AND InvoiceNo IN ( SELECT   InvoiceNo
                                               FROM     berchasebetweendate )
                  )




        SET @TotalValue = ( SELECT  SUM(valsum)
                            FROM    berchasebetweendate
                          )





        UPDATE  berchasebetweendate
        SET     avrege = valsum / quantity 

		
        UPDATE  berchasebetweendate
        SET     qpercent = ( quantity / @totalQuantiry ) * 100


        UPDATE  berchasebetweendate
        SET     pricepercent = ( valsum / @TotalValue ) * 100

		 

        SELECT  *
        FROM    berchasebetweendate 

    END
