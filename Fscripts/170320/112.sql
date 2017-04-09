
 
CREATE  PROCEDURE [dbo].[Stor_Scan_Save]
    @Store_Scan_Item_Type Store_Scan_Item_Type READONLY ,
    @GardID INT ,
    @ScanDate DATE ,
    @StoreID INT ,
    @ProunchID INT ,
    @COMP_ID INT
AS
    BEGIN
	 
       
        DELETE  FROM Stores_Scan
        WHERE   GardID = @GardID
        DELETE  FROM dbo.Stores_Scan_items
        WHERE   GardID = @GardID

        INSERT  INTO dbo.Stores_Scan
                ( GardID ,
                  ScanDate ,
                  StoreID ,
                  ProunchID ,
                  COMP_ID
	            )
        VALUES  ( @GardID , -- GardID - bigint
                  @ScanDate , -- ScanDate - date
                  @StoreID , -- StoreID - bigint
                  @ProunchID , -- ProunchID - int
                  @COMP_ID  -- COMP_ID - int
	            )



        INSERT  INTO dbo.Stores_Scan_items
                ( GardID ,
                  Item_Id ,
                  TotalByHande ,
                  TotalByComputer ,
                  CalcCompAndHand,
				  ValDeff,PriceCome,
				  inability  ,
              inabilityValue  ,
              increase  ,
              increaseValue 

				 )
                SELECT  *
                FROM    @Store_Scan_Item_Type  
				  
				  
       

    END

GO


