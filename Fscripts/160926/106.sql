 

 
 
ALTER FUNCTION [dbo].[Last_purchase]
    (
      @item_ID BIGINT  
    

    )
RETURNS INT
AS
    BEGIN
	 
        DECLARE @Result AS FLOAT 
     

	
	
        DECLARE @Lastinvid BIGINT; 
	
       
                SET @Lastinvid = ( SELECT   MAX(invcomeNoTax.InvoiceNo)
                                   FROM     dbo.invcomeitemNoTax
								   INNER JOIN dbo.invcomeNoTax ON invcomeNoTax.InvoiceNo = invcomeitemNoTax.InvoiceNo
                                   WHERE    itemid = @item_ID 
								  
                                 );

        
                SET @Result = ( SELECT TOP 1
                                        PriceOne
                                FROM    dbo.invcomeitemNoTax
                                WHERE   InvoiceNo = @Lastinvid
                                        AND invcomeitemNoTax.itemid = @item_ID
                              );


	  IF @Lastinvid = 0

	  BEGIN


	  SET @Lastinvid = ( SELECT   MAX(Amr_Sheraa_Item.performa_id)
                                   FROM     dbo.Amr_Sheraa_Item
								   INNER JOIN dbo.Amr_Sheraa ON dbo.Amr_Sheraa_Item.performa_id = Amr_Sheraa_Item.performa_id
                                   WHERE    ItemCode = @item_ID 
								 
                                 );

        
                SET @Result = ( SELECT TOP 1
                                        price
                                FROM    dbo.Amr_Sheraa_Item
                                WHERE   performa_id = @Lastinvid
                                        AND ItemCode = @item_ID
                              );


	  end

        


        RETURN @Result


    END
