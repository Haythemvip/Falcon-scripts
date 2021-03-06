 

ALTER FUNCTION [dbo].[Item_Balance]
    (
      @ItemID BIGINT ,
      @Year INT ,
      @StoreID INT = 0
 
    )
RETURNS [FLOAT]
AS
    BEGIN
	
        DECLARE @Result [FLOAT]


        IF @StoreID = 0
            BEGIN 
                SET @Result = ( SELECT  SUM([QCome]) - SUM([Qout])
                                FROM    [Item_Card]
                                WHERE   Year = @Year
                                        AND Item_Id = @ItemID
                              )
	
            END
    
        IF @StoreID > 0
            BEGIN 
	

                SET @Result = ( SELECT  SUM([QCome]) - SUM([Qout])
                                FROM    [Item_Card]
                                WHERE   Year = @Year
                                        AND Item_Id = @ItemID AND store_id = @StoreID 
                              )

            END
        RETURN ISNULL(@Result, 0.0) 

    END
	 
	


