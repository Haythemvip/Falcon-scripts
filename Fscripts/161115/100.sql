 
create  FUNCTION [dbo].[Last_purchase_Date] ( @item_ID BIGINT )
RETURNS NVARCHAR(50)
AS
    BEGIN
	 
        DECLARE @Result AS NVARCHAR(50); 
     
	  

        --SET @Result = ( SELECT TOP 1
        --                        ActionDate
        --                FROM    Item_Card
        --                WHERE   Item_Id =  @item_ID
        --                ORDER BY ItemCard_ID DESC
        --              );
               

                 
        --IF  @Result <> ''
        --    BEGIN

        --        RETURN @Result;
        --    END;
            
              
			   
        --SET @Result = ( SELECT TOP 1
        --                        performa_date
        --                FROM    Amr_Sheraa
        --                        INNER JOIN dbo.Amr_Sheraa_Item ON Amr_Sheraa_Item.performa_id = Amr_Sheraa.performa_id
        --                WHERE   ItemCode =   @item_ID
        --                ORDER BY Id DESC
        --              );



		 SET @Result = ( SELECT TOP 1
                                CAST(price AS NVARCHAR(50)) + '--'
                                + CAST(performa_date AS NVARCHAR(10))
                        FROM    Amr_Sheraa_Item
                                INNER JOIN dbo.Amr_Sheraa ON Amr_Sheraa.performa_id = Amr_Sheraa_Item.performa_id
                        WHERE   ItemCode = @item_ID
                        ORDER BY Id DESC
                      )
             

        RETURN @Result;


    END;

GO


