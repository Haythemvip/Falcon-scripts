 
CREATE PROCEDURE POS_DaylySale
    @FromDate DATE ,
    @ToDate DATE ,
    @Tafsily INT = 1
AS
    BEGIN


        IF @Tafsily = 1
            BEGIN 
                SELECT vbyan.itemid, Barcode,PriceOne, 0 AS Cost_Item , 0  AS Profit , InvoiceNo ,
                        serialitem ,
                        ITEMS_ITEM_NAME ,
                        TotalPrice ,
                        store_name ,
                        customer_name ,
                        Mandop_Name ,
                        Q ,
                        idate ,
                        InvTime ,
                        ( TotalPrice * 33 / 100 ) AS Omola
                FROM    vbyan
                WHERE   idate BETWEEN @FromDate AND @ToDate; 


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
                        Tips
                FROM    byan
                        INNER JOIN customers ON byan.ClientID = customers.Customer_id
                WHERE   idate BETWEEN @FromDate AND @ToDate; 


            END;




    END;
GO
