 
 
ALTER FUNCTION [dbo].[Last_purchase] ( @item_ID BIGINT,@year INT = 0 )
RETURNS FLOAT
 
AS
    BEGIN
	 
        DECLARE @Result AS FLOAT; 
     

	
       
        SET @Result = ( SELECT TOP 1
                                       ISNULL(PriceOne,0)	AS PriceOne
                                FROM     dbo.invcomeitemNoTax 
								INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo 
								 WHERE  itemid = @item_ID
                                       AND iyeer =  @year 
                                       
                                ORDER BY  idate DESC
                              );
            

			  IF @Result > 0

            BEGIN

			  RETURN @Result;

			END
          
               SET @Result = ( SELECT TOP 1
                                         ISNULL(PriceCome,0)	AS PriceOne
                                FROM    Item_Card  WHERE    
                                        Item_Id = @item_ID
                                        and year = @year
                                        and pricecome>0
                                ORDER BY ActionDate DESC
                                
                              );
               

                 
          	  IF @Result > 0
            BEGIN

			  RETURN @Result;
			END


			   
			     SET @Result = ( SELECT TOP 1
                                        price
                                FROM    Amr_Sheraa_Item WHERE    
                                        ItemCode = @item_ID
                                ORDER BY Id DESC
                              );
 
        				    

        RETURN @Result;


    END;

