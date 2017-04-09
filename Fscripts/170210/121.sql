
 
ALTER PROCEDURE [dbo].[POS_DaylySale]
    @FromDate DATE ,
    @ToDate DATE ,
    @Tafsily INT = 1 ,
    @boxid INT = 0
AS
    BEGIN


        IF @Tafsily = 1
            BEGIN 
                SELECT  vbyan.itemid ,
                        vbyan.Barcode ,
                        vbyan.PriceOne ,
                        dbo.get_item_average(vbyan.store_id, vbyan.itemid,
                                             vbyan.idate,DATEPART(YEAR,@FromDate)) * vbyan.Q AS Cost_Item ,
                        vbyan.TotalPrice - dbo.get_item_average(vbyan.store_id,
                                                              vbyan.itemid,
                                                              vbyan.idate,DATEPART(YEAR,@FromDate))
                        * vbyan.Q AS Profit ,
                        vbyan.InvoiceNo ,
                        vbyan.serialitem ,
                        vbyan.ITEMS_ITEM_NAME ,
                        vbyan.TotalPrice ,
                        vbyan.store_name ,
                        vbyan.customer_name ,
                        vbyan.Mandop_Name ,
                        vbyan.Q ,
                        vbyan.idate ,
                        vbyan.InvTime ,
                        vbyan.TotalPrice * customer_emp.PercentVaue / 100 AS Omola ,
                        Box.BoxName ,
                        Groups.groupname ,
                        Groups_Sub.subname
                FROM    vbyan
                        INNER JOIN Items ON vbyan.itemid = Items.Item_Id
                        INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                        INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                        LEFT OUTER JOIN customer_emp ON customer_emp.MAndopID = vbyan.MandopID
                        LEFT OUTER JOIN Box ON Box.BoxID = vbyan.BoxID
                WHERE   idate BETWEEN @FromDate AND @ToDate
                        AND ( @boxid = 0
                              OR vbyan.BoxID = @boxid
                            )
                UNION
                SELECT  dbo.V_Mardodat_byan.itemid ,
                        V_Mardodat_byan.Barcode ,
                        V_Mardodat_byan.PriceOne ,
                        dbo.get_item_average(V_Mardodat_byan.store_id,
                                             V_Mardodat_byan.itemid,
                                             V_Mardodat_byan.idate,DATEPART(YEAR,@FromDate))
                        * V_Mardodat_byan.Q AS Cost_Item ,
                        V_Mardodat_byan.TotalPrice
                        - dbo.get_item_average(V_Mardodat_byan.store_id,
                                               V_Mardodat_byan.itemid,
                                               V_Mardodat_byan.idate,DATEPART(YEAR,@FromDate))
                        * V_Mardodat_byan.Q AS Profit ,
                        V_Mardodat_byan.InvoiceNo ,
                        V_Mardodat_byan.serialitem ,
                        V_Mardodat_byan.ITEMS_ITEM_NAME ,
                        V_Mardodat_byan.TotalPrice * -1 ,
                        V_Mardodat_byan.store_name ,
                        V_Mardodat_byan.customer_name ,
                        V_Mardodat_byan.MandopName AS Mandop_Name ,
                        V_Mardodat_byan.Q * -1 ,
                        V_Mardodat_byan.idate ,
                        '00:00' AS InvTime ,
                        V_Mardodat_byan.TotalPrice * customer_emp.PercentVaue
                        * -1 / 100 AS Omola ,
                        Box.BoxName ,
                        Groups.groupname ,
                        Groups_Sub.subname
                FROM    V_Mardodat_byan
                        INNER JOIN Items ON V_Mardodat_byan.itemid = Items.Item_Id
                        INNER JOIN Groups ON Items.Item_Gro_Id = Groups.groupid
                        INNER JOIN Groups_Sub ON Items.Item_Gro_Sub_Id = Groups_Sub.subid
                        LEFT OUTER JOIN customer_emp ON customer_emp.MAndopID = V_Mardodat_byan.MAndopID
                        LEFT OUTER JOIN Box ON Box.BoxID = V_Mardodat_byan.BoxID
                WHERE   idate BETWEEN @FromDate AND @ToDate
                        AND ( @boxid = 0
                              OR V_Mardodat_byan.BoxID = @boxid
                            );


            END;
        


        IF @Tafsily = 0
            BEGIN 
                SELECT  InvoiceNo ,
                        Net AS TotalPrice ,
                        customer_name ,
                        Mandop_Name ,
                         CASE WHEN (Net + Tips) > monycome THEN monycome ELSE (Net + Tips) end AS monycome ,
                        monystill ,
                        idate ,
                        ( Net * 33 / 100 ) AS Omola ,
                        customers.customer_name ,
                        invtype ,
                        Cash ,
                        Net + Tips - Cash AS CardValue ,
                        Tips ,
                        BoxName
                FROM    byan
                        INNER JOIN dbo.Box ON Box.BoxID = byan.BoxID
                        INNER JOIN customers ON byan.ClientID = customers.Customer_id
                WHERE   idate BETWEEN @FromDate AND @ToDate
                        AND ( @boxid = 0
                              OR byan.BoxID = @boxid
                            )
                UNION
                SELECT  InvoiceNo ,
                        Net * -1 AS TotalPrice ,
                        customer_name ,
                        Mandop_Name ,
                        monycome * -1 ,
                        monystill ,
                        idate ,
                        ( Net * 33 / 100 ) AS Omola ,
                        customers.customer_name ,
                        invtype ,
                        0 ,
                        0 ,
                        0 ,
                        BoxName
                FROM    Mardodat_Byan
                        INNER JOIN dbo.Box ON Box.BoxID = Mardodat_Byan.BoxID
                        INNER JOIN customers ON Mardodat_Byan.ClientID = customers.Customer_id
                WHERE   idate BETWEEN @FromDate AND @ToDate
                        AND ( @boxid = 0
                              OR Mardodat_Byan.BoxID = @boxid
                            );



            END;




    END;
