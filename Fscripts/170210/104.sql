
ALTER  FUNCTION [dbo].[get_item_average]
    (
     
      @Storeid BIGINT = 0,
      @Itemid BIGINT ,
      @ActionDate DATETIME,
	  @year INT = 0
    )
RETURNS DECIMAL(18,4)
    BEGIN
  
        DECLARE @Avarage DECIMAL(18,4);
        DECLARE @Nearest_Date DATETIME;
 
 IF @Storeid = 0 
 BEGIN 
  SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
        FROM    dbo.Item_Card

        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                
                AND item_id = @Itemid
				AND dbo.Item_Card.Year = @year 
 END
 IF @Storeid > 0 
  BEGIN 
        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
        FROM    dbo.Item_Card

        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                AND store_id = @Storeid
                AND item_id = @Itemid
 AND dbo.Item_Card.Year = @year 


 END


        SET @Avarage = 0

        IF @Nearest_Date IS NOT NULL

            AND CONVERT(DATE, @Nearest_Date) <> CONVERT(DATE, '01/01/1900')

            SELECT top 1 @Avarage = Average_Price
            FROM    Item_Balance_AvG(@Itemid, @Storeid,
                                         @Nearest_Date, NULL,
                    
					
			                     NULL,@year)
								 
								 

      --------------------------------------------------------------------------------- 

        IF @Avarage = 0
            BEGIN 
            

                SET @Avarage =  dbo.Last_purchase( @Itemid,@year)
            END
        
        
      
     ----------------------------------------------------------------------------------



        RETURN @Avarage 

    END


