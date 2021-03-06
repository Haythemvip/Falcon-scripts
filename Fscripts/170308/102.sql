


ALTER  FUNCTION [dbo].[get_item_average]
    (
      @Storeid BIGINT = 0 ,
      @Itemid BIGINT ,
      @ActionDate DATETIME ,
      @year INT
    )
RETURNS DECIMAL(18, 4)
    BEGIN
  
        DECLARE @Avarage DECIMAL(18, 4);
        DECLARE @Nearest_Date DATETIME;
        DECLARE @CostCase AS INTEGER;


        SELECT  @CostCase = ( SELECT TOP 1
                                        ComfirstPayFirst
                              FROM      dbo.Falcon_Sitting
                            );



        IF @CostCase = 0 -- Avarege
            BEGIN  


                IF @Storeid = 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 
                    END;
                IF @Storeid > 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND store_id = @Storeid
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 


                    END;


                SET @Avarage = 0;

                IF @Nearest_Date IS NOT NULL
                    AND CONVERT(DATE, @Nearest_Date) <> CONVERT(DATE, '01/01/1900')
                    SELECT TOP 1
                            @Avarage = Average_Price
                    FROM    Item_Balance_AvG(@Itemid, @Storeid, @Nearest_Date,
                                             NULL, NULL, @year);
								 
								 

      --------------------------------------------------------------------------------- 

                IF @Avarage = 0
                    BEGIN 
            

                        SET @Avarage = dbo.Last_purchase(@Itemid, @year);
                    END;
        
        
      
     ----------------------------------------------------------------------------------



                RETURN @Avarage; 

            END;


    




        IF @CostCase = 1 -- FirstInFirstOut
            BEGIN  

			



			IF @Storeid = 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 
                    END;
                IF @Storeid > 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND store_id = @Storeid
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 


                    END;


                SET @Avarage = 0;

                IF @Nearest_Date IS NOT NULL
                    AND CONVERT(DATE, @Nearest_Date) <> CONVERT(DATE, '01/01/1900')
                    SELECT TOP 1
                            @Avarage = Average_Price
                    FROM    Item_FirstIn_FirstOut(@Itemid, @Storeid, @Nearest_Date,
                                             NULL, NULL, @year);
								 
								 

      --------------------------------------------------------------------------------- 

                IF @Avarage = 0
                    BEGIN 
            

                        SET @Avarage = dbo.Last_purchase(@Itemid, @year);
                    END;
        
        
      
     ----------------------------------------------------------------------------------



                RETURN @Avarage; 






                RETURN @Avarage;

            END; 

 



        IF @CostCase = 2 -- ItemCardPrice
            BEGIN  

			
                SET @Avarage = ( SELECT priceCome
                                 FROM   dbo.Items
                                 WHERE  Item_Id = @Itemid
                               );




                RETURN @Avarage;

            END; 


			 


        IF @CostCase = 3 --LastPurchase
            BEGIN  

			
                SET @Avarage = dbo.Last_purchase(@Itemid, @year);
                RETURN @Avarage;

            END; 




        IF @CostCase = 4 -- Purchase_Avarge
            BEGIN  

			
                IF @Storeid = 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 
                    END;
                IF @Storeid > 0
                    BEGIN 
                        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
                        FROM    dbo.Item_Card
                        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                                AND store_id = @Storeid
                                AND Item_Id = @Itemid
                                AND dbo.Item_Card.Year = @year; 


                    END;


                SET @Avarage = 0;

                IF @Nearest_Date IS NOT NULL
                    AND CONVERT(DATE, @Nearest_Date) <> CONVERT(DATE, '01/01/1900')
                    SELECT TOP 1
                            @Avarage = Average_Price
                    FROM    Item_Balance_AvG_Purshase(@Itemid, @Storeid,
                                                      @Nearest_Date, @year);
								 
								 

      --------------------------------------------------------------------------------- 

                IF @Avarage = 0
                    BEGIN 
            

                        SET @Avarage = dbo.Last_purchase(@Itemid, @year);
                    END;
        
        
      
     ----------------------------------------------------------------------------------
                RETURN @Avarage;

            END;

        RETURN @Avarage; 

          
 


    END;






