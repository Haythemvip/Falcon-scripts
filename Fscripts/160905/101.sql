 
CREATE FUNCTION Last_purchase
(
	@item_ID BIGINT 

)
RETURNS int
AS
BEGIN
	 
	 DECLARE @Result AS FLOAT 
     

	
	
        DECLARE @Lastinvid BIGINT; 
	
        SET @Lastinvid = ( SELECT   MAX(InvoiceNo)
                           FROM     dbo.invcomeitemNoTax WHERE itemid = @item_ID
						   
                         );

        
        SET     @Result = ( SELECT    PriceOne
                                  FROM      dbo.invcomeitemNoTax
                                  WHERE     InvoiceNo = @Lastinvid
								  AND invcomeitemNoTax.itemid = @item_ID
                                );


	 RETURN @Result


END
GO

