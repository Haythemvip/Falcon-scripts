



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
              NetOut FLOAT
            )

		 
		
        DECLARE @Query NVARCHAR(MAX) 
		

        SET @Query = N'    INSERT  INTO #excel
                SELECT  ' + @GardID + ' ,
                        Item_Id ,
                        Item_Name ,
                        
                        unitname ,
                        0 as  First_Period,
                        0 as  Cash_purchases,
						0 as  Credit_purchases,
						0 as  AllCome,
						0 as  CurrentBalance,
						0 as  NetOut
                FROM    Vitemrased '
                
        
        SET @Query += '  WHERE   Year  = ''' + @Year + ''''


		--SQL 2014
        SET @Query += '  And  ActionDate  <= ''' + FORMAT(@Adate, 'yyyy-MM-dd')
            + ''''


        IF @StoreID > 0
            BEGIN 

                SET @Query += '  And store_id = ''' + @StoreID + ''''

            END
        

        IF @GroupID > 0
            BEGIN 

                SET @Query += '  And Item_Gro_Id = ''' + @GroupID + ''''

            END



        IF @SupGroupID > 0
            BEGIN 

                SET @Query += '  And Item_Gro_Sub_Id = ''' + @SupGroupID
                    + ''''

            END

        SET @Query += ' GROUP BY Item_Id,Item_Name ,PartNo ,unitname ,ItemPriceCome '

        SET @Query += ' order by Item_Id '


        EXEC(@Query)



 

        DECLARE @LastGard FLOAT 

      
	    

        SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                          FROM      Stores_Consumer
                          WHERE     StoreID = @StoreID
                        ) 


       

        IF @GroupID <> 0
            BEGIN 

                SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                                  FROM      Stores_Consumer
                                  WHERE     StoreID = @StoreID
                                            AND Item_Gro_Id = @GroupID
                                ) 


                

            END



        IF @SupGroupID <> 0
            BEGIN 

                SET @LastGard = ( SELECT    ISNULL(MAX(GardID), 0)
                                  FROM      Stores_Consumer
                                  WHERE     Stores_Consumer.StoreID = @StoreID
                                            AND Item_Gro_Sub_Id = @SupGroupID
                                ) 

              

            END

       



        UPDATE  #excel
        SET     First_Period = ISNULL(( SELECT  CurrentBalance
                                        FROM    Stores_Consumer_items
                                        WHERE   Stores_Consumer_items.Item_Id = #excel.Item_Id
                                                AND Stores_Consumer_items.GardID = @LastGard
                                      ), 0)


      


        UPDATE  #excel
        SET     Cash_purchases = ISNULL( ( SELECT   SUM(Q) AS QCome
                                   FROM     dbo.invcomeitemNoTax
                                            INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                            INNER JOIN dbo.Items ON invcomeitemNoTax.itemid = dbo.Items.Item_Id
											INNER JOIN dbo.Stores_Consumer ON @LastGard = dbo.Stores_Consumer .GardID 
                                   WHERE    @Year = DATEPART(YEAR, idate)
                                            AND invtype = 'نقدا'
                                            AND idate <= @Adate
                                            AND store_id = @StoreID
                                            AND invcomeitemNoTax.itemid = #excel.Item_Id
											AND idate > dbo.Stores_Consumer.ScanDate 
                                 ) ,0)
       

        
        

	
	 



        UPDATE  #excel
        SET     Credit_purchases = ISNULL(( SELECT SUM(Q) AS QCome
                                     FROM   dbo.invcomeitemNoTax
                                            INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                            INNER JOIN dbo.Items ON invcomeitemNoTax.itemid = dbo.Items.Item_Id
											INNER JOIN dbo.Stores_Consumer ON @LastGard = dbo.Stores_Consumer .GardID 
                                     WHERE  @Year = DATEPART(YEAR, idate)
                                            AND invtype = 'اجل'
                                            AND idate <= @Adate
                                            AND store_id = @StoreID
                                            AND invcomeitemNoTax.itemid = #excel.Item_Id
											AND idate > dbo.Stores_Consumer.ScanDate 
                                   ),0)
        

	
	 




      

        UPDATE  #excel
        SET     AllCome = First_Period + Cash_purchases + Credit_purchases


		 
        


        SELECT  *
        FROM    #excel


    END
