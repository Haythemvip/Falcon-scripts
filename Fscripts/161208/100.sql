

 
ALTER PROCEDURE [dbo].[POS_DaylySale]
    @FromDate DATE ,
    @ToDate DATE ,
    @Tafsily INT = 1,
	@boxid int = 0
AS
    BEGIN


        IF @Tafsily = 1
            BEGIN 
                SELECT  vbyan.itemid ,
                        Barcode ,
                        PriceOne ,
                        ( dbo.get_item_average(vbyan.store_id,
                                               dbo.vbyan.itemid,
                                               dbo.vbyan.idate) * Q ) AS Cost_Item ,
                        TotalPrice - ( dbo.get_item_average(vbyan.store_id,
                                                            dbo.vbyan.itemid,
                                                            dbo.vbyan.idate)
                                       * Q ) AS Profit ,
                        InvoiceNo ,
                        serialitem ,
                        ITEMS_ITEM_NAME ,
                        TotalPrice ,
                        store_name ,
                        customer_name ,
                        Mandop_Name ,
                        Q ,
                        idate ,
                        InvTime ,
                        ( TotalPrice * PercentVaue / 100 ) AS Omola,BoxName  
                FROM    vbyan
				INNER JOIN dbo.Box ON Box.BoxID = vbyan.BoxID
				INNER JOIN dbo.customer_emp ON customer_emp.MAndopID = vbyan.MandopID
                WHERE   idate BETWEEN @FromDate AND @ToDate
				AND(@boxid = 0 OR vbyan.BoxID = @boxid )


            END;
        


        IF @Tafsily = 0
            BEGIN 
                SELECT  InvoiceNo ,
                        Net AS TotalPrice ,
                        customer_name ,
                        Mandop_Name ,
                        monycome ,
                        monystill ,
                        idate ,
                        ( Net * 33 / 100 ) AS Omola ,
                        customers.customer_name ,
                        invtype ,
                        Cash ,
                        CardValue ,
                        Tips,BoxName  
                FROM    byan
				        INNER JOIN dbo.Box ON Box.BoxID = byan.BoxID
                        INNER JOIN customers ON byan.ClientID = customers.Customer_id
                WHERE   idate BETWEEN @FromDate AND @ToDate
				AND(@boxid = 0 OR byan.BoxID = @boxid )


            END;




    END;
