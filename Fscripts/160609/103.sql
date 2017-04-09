
ALTER  PROCEDURE [dbo].[Invoice_Omolat]
    (
      @dateFrom DATE ,
      @dateTo DATE ,
      @mandopID INT = 0 ,
      @Save INT = 0 ,
      @ID INT = 0 ,
      @UserName NVARCHAR(50) = ' '
    )
AS
    BEGIN

          
        CREATE TABLE #Render
            (
              idate DATE ,
              Tahseel NVARCHAR(50) ,
              servicetype NVARCHAR(50) ,
              customer_name NVARCHAR(250) ,
              itemid BIGINT ,
              ITEMS_ITEM_NAME NVARCHAR(MAX) ,
              Q FLOAT ,
              PriceOne FLOAT ,
              TotalPrice FLOAT ,
              store_id BIGINT ,
              tahseldate DATE ,
              InvoiceNo BIGINT ,
              Mandop_Name NVARCHAR(100) ,
              ItemCost FLOAT NULL ,
              TotalCost FLOAT NULL ,
              ItemMaksab FLOAT NULL ,
              Vmaksap_Perce NVARCHAR(50) NULL ,
              InvoiceType NVARCHAR(50) ,
              InviceTaxState NVARCHAR(50) ,
              ValPonas FLOAT ,
              Chargevalue FLOAT ,
              ExactCharge FLOAT
            )
      
        

        IF ( @mandopID <> 0 )
            INSERT  INTO #Render
                    SELECT  invoiceout.idate ,
                            invoiceout.Tahseel ,
                            invoiceout.servicetype ,
                            ISNULL(invoiceoutitem.itemid, 0) ,
                            customers.customer_name ,
                            invoiceoutitem.ITEMS_ITEM_NAME ,
                            invoiceoutitem.Q ,
                            invoiceoutitem.PriceOne ,
                            invoiceoutitem.TotalPrice ,
                            ISNULL(invoiceout.store_id, 0) ,
                            invoiceout.tahseldate ,
                            invoiceout.InvoiceNo ,
                            invoiceout.Mandop_Name ,
                            ISNULL(invoiceoutitem.ItemCost, 0) AS ItemCost ,
                            0 ,
                            0 ,
                            0 ,
                            invoiceout.invtype ,
                            0 ,
                            dbo.invoiceoutitem.Bounas ,
                            invoiceout.Fright ,
                            0
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
                            ISNULL(byan_item.itemid, 0) ,
                            byan_item.ITEMS_ITEM_NAME ,
                            byan_item.Q ,
                            byan_item.PriceOne ,
                            byan_item.TotalPrice ,
                            ISNULL(byan.store_id, 0) ,
                            byan.tahseldate ,
                            byan.InvoiceNo ,
                            byan.Mandop_Name ,
                            ISNULL(byan_item.ItemCost, 0) AS ItemCost ,
                            0 ,
                            0 ,
                            0 ,
                            byan.invtype ,
                            0 ,
                            dbo.byan_item.Bounas ,
                            byan.Fright ,
                            0
                    FROM    byan_item
                            INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                            INNER JOIN customers ON byan.ClientID = customers.Customer_id
                    WHERE   byan.idate BETWEEN @dateFrom AND @dateTo
                            AND byan.MandopID = @mandopID  
					                  

        IF ( @mandopID = 0 )
            INSERT  INTO #Render
                    SELECT  invoiceout.idate ,
                            invoiceout.Tahseel ,
                            invoiceout.servicetype ,
                            customers.customer_name ,
                            ISNULL(invoiceoutitem.itemid, 0) AS itemid ,
                            invoiceoutitem.ITEMS_ITEM_NAME ,
                            ISNULL(invoiceoutitem.Q, 0) AS Q ,
                            ISNULL(invoiceoutitem.PriceOne, 0) AS PriceOne ,
                            ISNULL(invoiceoutitem.TotalPrice, 0) AS TotalPrice ,
                            ISNULL(invoiceout.store_id, 0) AS store_id ,
                            invoiceout.tahseldate ,
                            ISNULL(invoiceout.InvoiceNo, 0) AS InvoiceNo ,
                            invoiceout.Mandop_Name ,
                            ISNULL(invoiceoutitem.ItemCost, 0) AS ItemCost ,
                            0 ,
                            0 ,
                            0 ,
                            invoiceout.invtype ,
                            0 ,
                            dbo.invoiceoutitem.Bounas ,
                            invoiceout.Fright ,
                            0
                    FROM    invoiceout
                            INNER JOIN customers ON invoiceout.ClientID = customers.Customer_id
                            INNER JOIN invoiceoutitem ON invoiceout.InvoiceNo = invoiceoutitem.InvoiceNo
                    WHERE   invoiceout.idate BETWEEN @dateFrom AND @dateTo
                    UNION
                    SELECT  byan.idate ,
                            byan.Tahseel ,
                            byan.servicetype ,
                            customers.customer_name ,
                            ISNULL(byan_item.itemid, 0) AS itemid ,
                            byan_item.ITEMS_ITEM_NAME ,
                            ISNULL(byan_item.Q, 0) AS Q ,
                            ISNULL(byan_item.PriceOne, 0) ,
                            ISNULL(byan_item.TotalPrice, 0) AS TotalPrice ,
                            ISNULL(byan.store_id, 0) AS store_id ,
                            byan.tahseldate ,
                            ISNULL(byan.InvoiceNo, 0) AS InvoiceNo ,
                            byan.Mandop_Name ,
                            ISNULL(byan_item.ItemCost, 0) AS ItemCost ,
                            0 ,
                            0 ,
                            0 ,
                            byan.invtype ,
                            0 ,
                            dbo.byan_item.Bounas ,
                            byan.Fright ,
                            0
                    FROM    byan_item
                            INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                            INNER JOIN customers ON byan.ClientID = customers.Customer_id
                    WHERE   byan.idate BETWEEN @dateFrom AND @dateTo
                            AND byan.MandopID = @mandopID  
					  
					  
				
		 
        
        UPDATE  #Render
        SET     servicetype = CASE WHEN itemid = 0 THEN 'Œœ„Â'
                                   ELSE '’‰›'
                              END 
			
        UPDATE  #Render
        SET     TotalCost = ItemCost * Q

        UPDATE  #Render
        SET     ItemMaksab = TotalPrice - TotalCost


        UPDATE  #Render
        SET     Vmaksap_Perce = ( ItemMaksab ) * 100
                / ( CASE WHEN TotalCost = 0 THEN ( 1 )
                         ELSE ( TotalCost )
                    END )  



		 

				
        SELECT  *
        FROM    #Render 	      
             
			 
        IF @Save = 1
            BEGIN 
			 
                DELETE  FROM dbo.Table_OMOLAT
                WHERE   ID = @ID 

			 

                INSERT  INTO dbo.Table_OMOLAT
                       
                        SELECT  @ID ,
                                @dateFrom ,
                                @dateTo ,
                               *,@UserName ,
                                GETDATE()
                        FROM    #Render 
		 

            END
			 
			        
           
    END

