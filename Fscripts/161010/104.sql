
 
ALTER FUNCTION [dbo].[Last_purchase] ( @item_ID BIGINT )
RETURNS INT
AS
    BEGIN
	 
        DECLARE @Result AS FLOAT; 
     

	
	 
       
        SET @Result = ( SELECT TOP 1
                                       PriceOne
                                FROM     dbo.invcomeitemNoTax  WHERE    
                                        itemid = @item_ID
                                ORDER BY Id DESC
                              );
            

			  IF @Result > 0
            BEGIN

			  RETURN @Result;
			END
            


      


			  SET @Result = ( SELECT TOP 1
                                        PriceCome
                                FROM    Item_Card  WHERE    
                                        Item_Id = @item_ID
                                ORDER BY ItemCard_ID DESC
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
