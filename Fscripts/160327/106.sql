 
  

ALTER FUNCTION [dbo].[get_item_average]
    (
      @Storeid BIGINT = 0 ,
      @Itemid BIGINT ,
      @ActionDate DATETIME
    )
RETURNS DECIMAL(18, 4)
    BEGIN
  
        DECLARE @Avarage DECIMAL(18, 4);
        DECLARE @Nearest_Date DATETIME;
 

        SELECT  @Nearest_Date = MAX(CONVERT(DATE, ActionDate))
        FROM    dbo.Item_Card
        WHERE   CONVERT(DATE, ActionDate) <= CONVERT(DATE, @ActionDate)
                --AND store_id = @Storeid
                AND Item_Id = @Itemid
  
        SET @Avarage = 0

        IF @Nearest_Date IS NOT NULL
            AND CONVERT(DATE, @Nearest_Date) <> CONVERT(DATE, '01/01/1900')
            SELECT  @Avarage = Average_Price
            FROM    Item_Balance_AvG(@Itemid, @Storeid, @Nearest_Date, NULL,
                                     NULL)			


      --------------------------------------------------------------------------------- 

        IF @Avarage = 0
            BEGIN 

                SET @Avarage = ( SELECT priceCome
                                 FROM   dbo.Items
                                 WHERE  Item_Id = @Itemid
                               )
     
            END
     ----------------------------------------------------------------------------------



        RETURN @Avarage 

    END

