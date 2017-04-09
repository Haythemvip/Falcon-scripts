

ALTER   PROCEDURE [dbo].[Consumer]
    @StoreID NVARCHAR(50) = '0' ,
    @GroupID NVARCHAR(50) = '0' ,
    @SupGroupID NVARCHAR(50) = '0' ,
    @Year CHAR(4) ,
    @GardID NVARCHAR(20) ,
    @Adate DATE
AS
    BEGIN

        CREATE TABLE #excel
            (
              GardID INT ,
              Srial BIGINT NOT NULL
                           PRIMARY KEY
                           IDENTITY ,
              Item_Id BIGINT ,
              Item_Name NVARCHAR(150) COLLATE Arabic_CI_AS
                                      NULL ,
              unitname NVARCHAR(50) ,
              First_Period FLOAT ,
              Cash_purchases FLOAT ,
              Credit_purchases FLOAT ,
              AllCome FLOAT ,
              CurrentBalance FLOAT ,
              NetOut FLOAT ,
              Avvrage FLOAT ,
              Total FLOAT
            );

		 
		
        DECLARE @Query NVARCHAR(MAX); 
		

        INSERT  INTO #excel
                SELECT  @GardID ,
                        Item_Id ,
                        Item_Name ,
                        unitname ,
                        0 AS First_Period ,
                        0 AS Cash_purchases ,
                        0 AS Credit_purchases ,
                        0 AS AllCome ,
                        0 AS CurrentBalance ,
                        0 AS NetOut ,
                        0 AS Avvrage ,
                        0 AS Total
                FROM    Vitemrased
                WHERE   Year = @Year
                        AND ActionDate <= @Adate
                        AND ( @StoreID = 0
                              OR store_id = @StoreID
                            )
                        AND ( @GroupID = 0
                              OR Item_Gro_Id = @GroupID
                            )
                        AND ( @SupGroupID = 0
                              OR Item_Gro_Sub_Id = @SupGroupID
                            )
                GROUP BY Item_Id ,
                        Item_Name ,
                        PartNo ,
                        unitname ,
                        ItemPriceCome
                ORDER BY Item_Id;  


         
 

        DECLARE @LastGard FLOAT; 
        DECLARE @LastGardDate DATE;
        
      --select * from Stores_Consumer
	    

        SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                          FROM      Stores_Consumer
                          WHERE     StoreID = @StoreID
                        ); 


       

        IF @GroupID <> 0
            BEGIN 

                SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                                  FROM      Stores_Consumer
                                  WHERE     StoreID = @StoreID
                                            AND Item_Gro_Id = @GroupID
                                ); 


                

            END;



        IF @SupGroupID <> 0
            BEGIN 

                SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                                  FROM      Stores_Consumer
                                  WHERE     Stores_Consumer.StoreID = @StoreID
                                            AND Item_Gro_Sub_Id = @SupGroupID
                                ); 

              

            END;

                               
--Eldgwy
----------------------------------------------------------------------
----------------------------------------------------------------------


        SET @LastGardDate = ( SELECT    ScanDate
                              FROM      Stores_Consumer
                              WHERE     GardID = @LastGard
                            )
       


        IF DATEPART(MONTH, @Adate) = 1
            BEGIN 
      
                UPDATE  #excel
                SET     First_Period = ISNULL(( SELECT  SUM(QCome)
                                                FROM    dbo.Item_Card
                                                WHERE   VenderOrCustomer = '«·—’Ìœ «·«›  «ÕÏ'
                                                        AND Item_Id = #excel.Item_Id
                                                        AND store_id = @StoreID
                                              ), 0);

 

            END

        IF DATEPART(MONTH, @Adate) <> 1
            BEGIN 



                UPDATE  #excel
                SET     First_Period = ISNULL(( SELECT  CurrentBalance
                                                FROM    Stores_Consumer_items
                                                WHERE   Stores_Consumer_items.Item_Id = #excel.Item_Id
                                                        AND Stores_Consumer_items.GardID = @LastGard
                                              ), 0);

            END

----------------------------------------------------------------------------
----------------------------------------------------------------------------

        UPDATE  #excel
        SET     Cash_purchases = ISNULL(( SELECT    SUM(Q) AS QCome
                                          FROM      dbo.invcomeitemNoTax
                                                    INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                                    INNER JOIN dbo.Items ON invcomeitemNoTax.itemid = dbo.Items.Item_Id
                                          WHERE     @Year = DATEPART(YEAR,
                                                              idate)
                                                    AND invtype = '‰ﬁœ«'
                                                    AND idate <= @Adate
                                                    AND idate > @LastGardDate
                                                    AND store_id = @StoreID
                                                    AND invcomeitemNoTax.itemid = #excel.Item_Id
                                        ), 0);
       

        
        UPDATE  #excel
        SET     Cash_purchases = Cash_purchases
                + ( SELECT  ISNULL(SUM(QCome), 0)
                    FROM    dbo.Item_Card
                    WHERE   ConvertBetwenStores > 0
                            AND store_id = @StoreID
                            AND Item_Card.Item_Id = #excel.Item_Id
                            AND Item_Card.ActionDate <= @Adate
                            AND Item_Card.ActionDate >= @LastGardDate
                  )

	
	 


        UPDATE  #excel
        SET     Cash_purchases = Cash_purchases
                + ( SELECT  ISNULL(SUM(QCome), 0)
                    FROM    dbo.Item_Card
                    WHERE   EznEdafaID > 0
                            AND store_id = @StoreID
                            AND Item_Card.Item_Id = #excel.Item_Id
                            AND Item_Card.ActionDate <= @Adate
                            AND Item_Card.ActionDate > @LastGardDate
                  )
 

        UPDATE  #excel
        SET     Cash_purchases = Cash_purchases
                + ( SELECT  ISNULL(SUM(QCome), 0)
                    FROM    dbo.Item_Card
                    WHERE   TaswyaEdafaID > 0
                            AND store_id = @StoreID
                            AND Item_Card.Item_Id = #excel.Item_Id
                            AND Item_Card.ActionDate <= @Adate
                            AND Item_Card.ActionDate > @LastGardDate
                  )







        UPDATE  #excel
        SET     Credit_purchases = ISNULL(( SELECT  SUM(Q) AS QCome
                                            FROM    dbo.invcomeitemNoTax
                                                    INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                                    INNER JOIN dbo.Items ON invcomeitemNoTax.itemid = dbo.Items.Item_Id
                                            WHERE   @Year = DATEPART(YEAR,
                                                              idate)
                                                    AND invtype = '«Ã·'
                                                    AND idate <= @Adate
                                                    --And idate > @LastGardDate
                                                    AND store_id = @StoreID
                                                    AND invcomeitemNoTax.itemid = #excel.Item_Id
                                          ), 0);
        

	
	 

        UPDATE  #excel
        SET     AllCome = ISNULL(First_Period, 0) + ISNULL(Cash_purchases, 0)
                + ISNULL(Credit_purchases, 0);




      

        UPDATE  #excel
        SET     Avvrage = dbo.get_item_average(@Storeid, Item_Id, @Adate);  


		 
        


        SELECT  *
        FROM    #excel;


    END;
