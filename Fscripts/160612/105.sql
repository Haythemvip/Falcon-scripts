 
 
ALTER  PROCEDURE [dbo].[Invoice_Omolat_Total]
    (
      @dateFrom DATE ,
      @dateTo DATE ,
      @mandopID INT = 0 ,
      @ID INT = 0 ,
      @IndirectCost FLOAT = 0
 

    )
AS
    BEGIN

          
        CREATE TABLE #Render
            (
              idate DATE ,
              Tahseel NVARCHAR(50) ,
              servicetype NVARCHAR(50) ,
              customer_name NVARCHAR(250) ,
              TotalPrice FLOAT ,
              store_id BIGINT ,
              tahseldate DATE ,
              InvoiceNo BIGINT ,
              Mandop_Name NVARCHAR(100) ,
              TotalCost FLOAT NULL ,
              ItemMaksab FLOAT NULL ,
              InvoiceType NVARCHAR(50) ,
              ValPonas DECIMAL(18, 2) ,
              Chargevalue DECIMAL(18, 2) ,
              ExactCharge DECIMAL(18, 2) ,
              Omola DECIMAL(18, 2) ,
              Omola_Percent DECIMAL(18, 6) ,
              Net_Percent DECIMAL(18, 6) ,
              Net_Chartg DECIMAL(18, 6) ,
              Net_profit DECIMAL(18, 6) ,
              Indirect_Cost DECIMAL(18, 6) ,
              CollectCount INT ,
              Indirect_Cost_Percent DECIMAL(18, 6) ,
              NetCost DECIMAL(18, 6) ,
              MAndopID INT
            )
      
        
        CREATE TABLE #Total
            (
              MandopID INT ,
              Mandop_Name NVARCHAR(100) ,
              TotalSales DECIMAL(18, 2) ,
              Targetvalue DECIMAL(18, 2) ,
              TargetPercent DECIMAL(18, 2) ,
              OmolaValue DECIMAL(18, 2) ,
              net_Omola DECIMAL(18, 2)
            )


        IF @mandopID > 0
            BEGIN
                INSERT  INTO #Render
                        SELECT  idate ,
                                Tahseel ,
                                0 AS servicetype ,
                                customer_name ,
                                SUM(net) AS TotalPrice ,
                                store_id ,
                                tahseldate ,
                                invoiceout.InvoiceNo ,
                                Mandop_Name ,
                                SUM(ISNULL(invoiceoutitem.ItemCost, 0) * Q) AS TotalCost ,
                                0 AS ItemMaksab ,
                                invoiceout.invtype ,
                                SUM(invoiceoutitem.Bounas) AS ValPonas ,
                                invoiceout.Fright AS Chargevalue ,
                                0 AS ExactCharge ,
                                0 AS Omola ,
                                0 AS Omola_Percent ,
                                0 AS Net_Percent ,
                                0 AS Net_Chartg ,
                                0 AS Net_profit ,
                                0 AS Indirect_Cost ,
                                0 AS CollectCount ,
                                0 AS Indirect_Cost_Percent ,
                                0 AS NetCost ,
                                ISNULL(invoiceout.MandopID, 0)
                        FROM    invoiceout
                                INNER JOIN customers ON invoiceout.ClientID = customers.Customer_id
                                INNER JOIN invoiceoutitem ON invoiceout.InvoiceNo = invoiceoutitem.InvoiceNo
                        WHERE   ISNULL(invoiceout.MandopID, 0) = @mandopID
                                AND invoiceout.idate BETWEEN @dateFrom AND @dateTo
                        GROUP BY idate ,
                                Tahseel ,
                                invoiceout.saltax ,
                                customer_name ,
                                store_id ,
                                tahseldate ,
                                invoiceout.InvoiceNo ,
                                Mandop_Name ,
                                invoiceout.invtype ,
                                invoiceout.Fright ,
                                invoiceout.MandopID
                        UNION
                        SELECT  idate ,
                                Tahseel ,
                                0 AS servicetype ,
                                customer_name ,
                                SUM(Net) AS TotalPrice ,
                                store_id ,
                                tahseldate ,
                                byan.InvoiceNo ,
                                Mandop_Name ,
                                SUM(ISNULL(byan_item.ItemCost, 0) * Q) AS TotalCost ,
                                0 AS ItemMaksab ,
                                byan.invtype ,
                                SUM(byan_item.Bounas) AS ValPonas ,
                                byan.Fright AS Chargevalue ,
                                0 AS ExactCharge ,
                                0 AS Omola ,
                                0 AS Omola_Percent ,
                                0 AS Net_Percent ,
                                0 AS Net_Chartg ,
                                0 AS Net_profit ,
                                0 AS Indirect_Cost ,
                                0 AS CollectCount ,
                                0 AS Indirect_Cost_Percent ,
                                0 AS NetCost ,
                                ISNULL(byan.MandopID, 0)
                        FROM    byan_item
                                INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                                INNER JOIN customers ON byan.ClientID = customers.Customer_id
                        WHERE   ISNULL(byan.MandopID, 0) = @mandopID
                                AND dbo.byan.idate BETWEEN @dateFrom AND @dateTo
                        GROUP BY idate ,
                                Tahseel ,
                                customer_name ,
                                store_id ,
                                tahseldate ,
                                byan.InvoiceNo ,
                                Mandop_Name ,
                                byan.invtype ,
                                byan.Fright ,
                                byan.MandopID

            END




        IF @mandopID = 0
            BEGIN
                INSERT  INTO #Render
                        SELECT  idate ,
                                Tahseel ,
                                0 AS servicetype ,
                                customer_name ,
                                SUM(net) AS TotalPrice ,
                                store_id ,
                                tahseldate ,
                                invoiceout.InvoiceNo ,
                                Mandop_Name ,
                                SUM(ISNULL(invoiceoutitem.ItemCost, 0) * Q) AS TotalCost ,
                                0 AS ItemMaksab ,
                                invoiceout.invtype ,
                                SUM(invoiceoutitem.Bounas) AS ValPonas ,
                                invoiceout.Fright AS Chargevalue ,
                                0 AS ExactCharge ,
                                0 AS Omola ,
                                0 AS Omola_Percent ,
                                0 AS Net_Percent ,
                                0 AS Net_Chartg ,
                                0 AS Net_profit ,
                                0 AS Indirect_Cost ,
                                0 AS CollectCount ,
                                0 AS Indirect_Cost_Percent ,
                                0 AS NetCost ,
                                ISNULL(invoiceout.MandopID, 0)
                        FROM    invoiceout
                                INNER JOIN customers ON invoiceout.ClientID = customers.Customer_id
                                INNER JOIN invoiceoutitem ON invoiceout.InvoiceNo = invoiceoutitem.InvoiceNo
                        WHERE   invoiceout.idate BETWEEN @dateFrom AND @dateTo
                        GROUP BY idate ,
                                Tahseel ,
                                invoiceout.saltax ,
                                customer_name ,
                                store_id ,
                                tahseldate ,
                                invoiceout.InvoiceNo ,
                                Mandop_Name ,
                                invoiceout.invtype ,
                                invoiceout.Fright ,
                                invoiceout.MandopID
                        UNION
                        SELECT  idate ,
                                Tahseel ,
                                0 AS servicetype ,
                                customer_name ,
                                SUM(Net) AS TotalPrice ,
                                store_id ,
                                tahseldate ,
                                byan.InvoiceNo ,
                                Mandop_Name ,
                                SUM(ISNULL(byan_item.ItemCost, 0) * Q) AS TotalCost ,
                                0 AS ItemMaksab ,
                                byan.invtype ,
                                SUM(byan_item.Bounas) AS ValPonas ,
                                byan.Fright AS Chargevalue ,
                                0 AS ExactCharge ,
                                0 AS Omola ,
                                0 AS Omola_Percent ,
                                0 AS Net_Percent ,
                                0 AS Net_Chartg ,
                                0 AS Net_profit ,
                                0 AS Indirect_Cost ,
                                0 AS CollectCount ,
                                0 AS Indirect_Cost_Percent ,
                                0 AS NetCost ,
                                ISNULL(byan.MandopID, 0)
                        FROM    byan_item
                                INNER JOIN byan ON byan_item.InvoiceNo = byan.InvoiceNo
                                INNER JOIN customers ON byan.ClientID = customers.Customer_id
                        WHERE   dbo.byan.idate BETWEEN @dateFrom AND @dateTo
                        GROUP BY idate ,
                                Tahseel ,
                                customer_name ,
                                store_id ,
                                tahseldate ,
                                byan.InvoiceNo ,
                                Mandop_Name ,
                                byan.invtype ,
                                byan.Fright ,
                                byan.MandopID

            END



        UPDATE  #Render
        SET     CollectCount = ISNULL(DATEDIFF(DAY, idate, tahseldate), 0) + 1






        UPDATE  #Render
        SET     servicetype = CASE WHEN store_id = 0 THEN 'Œœ„Â'
                                   ELSE '’‰›'
                              END 


        UPDATE  #Render
        SET     ItemMaksab = TotalPrice - TotalCost




        DECLARE @Netprice FLOAT 
        SET @Netprice = ( SELECT    SUM(TotalPrice)
                          FROM      #Render
                        )

        UPDATE  #Render
        SET     Indirect_Cost_Percent = ( @IndirectCost / @Netprice )



        UPDATE  #Render
        SET     Indirect_Cost = CASE WHEN Indirect_Cost_Percent > 0
                                     THEN ( Indirect_Cost_Percent * TotalPrice )
                                     ELSE 0
                                END




        UPDATE  #Render
        SET     NetCost = TotalCost + Indirect_Cost


        UPDATE  #Render
        SET     Net_profit = TotalPrice - NetCost - Net_Chartg



        UPDATE  #Render
        SET     Omola_Percent = CASE WHEN store_id = 0
                                     THEN customer_emp.ServicePercent
                                     ELSE customer_emp.PercentVaue
                                END
        FROM    customer_emp
                INNER JOIN #Render ON #Render.MAndopID = customer_emp.MAndopID
	

     
 

      --Â‰« Ì› —÷ Õ”«» «·⁄„Ê·Â ⁄·Ï Õ”» «Ì«„ «· Õ’Ì· 
    

	 --UPDATE  #Render
  --      SET     Net_Percent = Omola_Percent


        UPDATE  #Render
        SET     Net_Percent = dbo.Mandop_Moda_Omola.ModaPercent
                * ( Omola_Percent / 100 )
        FROM    dbo.Mandop_Moda_Omola
                INNER JOIN #Render ON #Render.MAndopID = Mandop_Moda_Omola.MAndopID
                                      AND #Render.CollectCount <= Mandop_Moda_Omola.Modda   

		--Õ”«» «·⁄„Ê·Â ⁄·Ï Õ”» «·—»Õ «Ê «·«Ã„«·Ï
        

        UPDATE  #Render
        SET     Omola = CASE WHEN store_id = 0
                             THEN CASE WHEN srv_IsFrom_Mksab = 1
                                       THEN Net_Percent * Net_profit / 100
                                       ELSE Net_Percent * TotalPrice / 100
                                  END
                             ELSE CASE WHEN IsFrom_Mksab = 1
                                       THEN Net_Percent * Net_profit / 100
                                       ELSE Net_Percent * TotalPrice / 100
                                  END
                        END
        FROM    customer_emp
                INNER JOIN #Render ON #Render.MAndopID = customer_emp.MAndopID


     

        INSERT  INTO #Total
                ( MandopID ,
                  Mandop_Name ,
                  TotalSales ,
                  Targetvalue ,
                  TargetPercent ,
                  OmolaValue ,
                  net_Omola
	            )
                SELECT  MAndopID ,
                        Mandop_Name ,
                        SUM(TotalPrice) ,
                        0 AS Targetvalue ,
                        0 AS TargetPercent ,
                        SUM(Omola) ,
                        0 AS net_Omola
                FROM    #Render
                GROUP BY MAndopID ,
                        Mandop_Name  
                        

        




        UPDATE  #Total
        SET     Targetvalue = customer_emp.TargetValue
        FROM    dbo.customer_emp
                INNER JOIN #Total ON #Total.MandopID = customer_emp.MAndopID 



        IF @ID = 0
            BEGIN

                SELECT  *
                FROM    #Total 


                SELECT  *
                FROM    #Render 	      

            END


    
             
			  



        IF @ID > 0
            BEGIN 
			 
                DELETE  FROM MandopOmola
                WHERE   ID = @ID 

			 

                INSERT  INTO dbo.MandopOmola
                        SELECT  @ID ,
                                *
                        FROM    #Render 
		 


		  DELETE  FROM MandopOmola_Total
                WHERE   ID = @ID 

			 

                INSERT  INTO dbo.MandopOmola_Total
                        SELECT  @ID ,
                                *
                        FROM    #Total 



            END
			 
			        
           
    END

