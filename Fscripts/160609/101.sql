
CREATE  PROCEDURE [dbo].[Invoice_Omolat]
    (
      @store_id INT = 0 ,
      @dateFrom DATE ,
      @dateTo DATE ,
      @mandopID INT = 0  
    )
AS
    BEGIN

                  

        IF ( @mandopID <> 0 )
            SELECT  invoiceout.idate ,
                    invoiceout.Tahseel ,
                    invoiceout.servicetype ,
                    invoiceoutitem.itemid ,
                    customers.customer_name ,
                    invoiceoutitem.ITEMS_ITEM_NAME ,
                    invoiceoutitem.Q ,
                    invoiceoutitem.PriceOne ,
                    invoiceoutitem.TotalPrice ,
                    invoiceout.store_id ,
                    invoiceout.tahseldate ,
                    invoiceout.InvoiceNo ,
                    invoiceout.Mandop_Name
            FROM    invoiceout
                    INNER JOIN customers ON invoiceout.ClientID = customers.Customer_id
                    INNER JOIN invoiceoutitem ON invoiceout.InvoiceNo = invoiceoutitem.InvoiceNo
            WHERE   invoiceout.idate BETWEEN @dateFrom AND @dateTo
                    AND invoiceout.MAndopID = @mandopID
            UNION
            SELECT  byan.idate ,
                    byan.Tahseel ,
                    byan.servicetype ,
                    customers.customer_name ,
                    byan_item.itemid ,
                    byan_item.ITEMS_ITEM_NAME ,
                    byan_item.Q ,
                    byan_item.PriceOne ,
                    byan_item.TotalPrice ,
                    byan.store_id ,
                    byan.tahseldate ,
                    byan.InvoiceNo ,
                    byan.Mandop_Name
            FROM    byan_item
                    INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                    INNER JOIN customers ON byan.ClientID = customers.Customer_id
            WHERE   byan.idate BETWEEN @dateFrom AND @dateTo
                    AND byan.MandopID = @mandopID  
					                  

        IF ( @mandopID = 0 )
            SELECT  invoiceout.idate ,
                    invoiceout.Tahseel ,
                    invoiceout.servicetype ,
                    customers.customer_name ,
                    invoiceoutitem.itemid ,
                    invoiceoutitem.ITEMS_ITEM_NAME ,
                    invoiceoutitem.Q ,
                    invoiceoutitem.PriceOne ,
                    invoiceoutitem.TotalPrice ,
                    invoiceout.store_id ,
                    invoiceout.tahseldate ,
                    invoiceout.InvoiceNo ,
                    invoiceout.Mandop_Name
            FROM    invoiceout
                    INNER JOIN customers ON invoiceout.ClientID = customers.Customer_id
                    INNER JOIN invoiceoutitem ON invoiceout.InvoiceNo = invoiceoutitem.InvoiceNo
            WHERE   invoiceout.idate BETWEEN @dateFrom AND @dateTo
            UNION
            SELECT  byan.idate ,
                    byan.Tahseel ,
                    byan.servicetype ,
                    customers.customer_name ,
                    byan_item.itemid ,
                    byan_item.ITEMS_ITEM_NAME ,
                    byan_item.Q ,
                    byan_item.PriceOne ,
                    byan_item.TotalPrice ,
                    byan.store_id ,
                    byan.tahseldate ,
                    byan.InvoiceNo ,
                    byan.Mandop_Name
            FROM    byan_item
                    INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                    INNER JOIN customers ON byan.ClientID = customers.Customer_id
            WHERE   byan.idate BETWEEN @dateFrom AND @dateTo
                    AND byan.MandopID = @mandopID  
					  
					  
					      
                      
    END

