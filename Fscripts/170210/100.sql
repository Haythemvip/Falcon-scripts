
 
ALTER FUNCTION [dbo].[Last_purchase] ( @item_ID BIGINT,@year INT = 0 )
RETURNS FLOAT
 
AS
    BEGIN
	 
        DECLARE @Result AS FLOAT; 
     

	
       
        SET @Result = ( SELECT TOP 1
                                       PriceOne
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
                                        PriceCome
                                FROM    Item_Card  WHERE    
                                        Item_Id = @item_ID
                                       
                                         AND YEAR =  @year  
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
 
        
            SET @Result = ISNULL((  SELECT TOP 1
                                    CAST(price AS NVARCHAR(50)) + '--'
                                    + CAST(performa_date AS NVARCHAR(10))
                            FROM    Amr_Sheraa_Item
                                    INNER JOIN dbo.Amr_Sheraa ON Amr_Sheraa.performa_id = Amr_Sheraa_Item.performa_id
                            WHERE   ItemCode = @item_ID
                            ORDER BY Id DESC
                          ),0)
         
       
	 
             
     
             

        RETURN @Result;


    END;
