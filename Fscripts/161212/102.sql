 
 
ALTER PROCEDURE [dbo].[POS_DaylySale]
    @FromDate DATE ,
    @ToDate DATE ,
    @Tafsily INT = 1,
	@boxid int = 0
AS
    BEGIN


        IF @Tafsily = 1
            BEGIN 
                SELECT        vbyan.itemid, vbyan.Barcode, vbyan.PriceOne, dbo.get_item_average(vbyan.store_id, vbyan.itemid, vbyan.idate) * vbyan.Q AS Cost_Item, vbyan.TotalPrice - dbo.get_item_average(vbyan.store_id, vbyan.itemid,
                          vbyan.idate) * vbyan.Q AS Profit, vbyan.InvoiceNo, vbyan.serialitem, vbyan.ITEMS_ITEM_NAME, vbyan.TotalPrice, vbyan.store_name, vbyan.customer_name, vbyan.Mandop_Name, vbyan.Q, vbyan.idate, 
                         vbyan.InvTime, vbyan.TotalPrice * customer_emp.PercentVaue / 100 AS Omola, Box.BoxName, Groups.groupname, Groups_Sub.subname
FROM            vbyan INNER JOIN
                         Items ON vbyan.itemid = Items.Item_Id INNER JOIN
                         Groups ON Items.Item_Gro_Id = Groups.groupid INNER JOIN
                         Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid LEFT OUTER JOIN
                         customer_emp ON customer_emp.MAndopID = vbyan.MandopID LEFT OUTER JOIN
                         Box ON Box.BoxID = vbyan.BoxID
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
