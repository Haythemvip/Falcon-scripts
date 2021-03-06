 
 
CREATE   PROCEDURE [dbo].[Stores_Consumer_Save]
    @Stores_Consumer_Type Stores_Consumer_Type READONLY ,
    @GardID INT ,
    @ScanDate DATE ,
    @StoreID INT ,
    @ProunchID INT ,
    @COMP_ID INT ,
    @Item_Gro_Id INT = 0 ,
    @Item_Gro_Sub_Id INT = 0
AS
    BEGIN
	 
       
        DELETE  FROM Stores_Consumer
        WHERE   GardID = @GardID
        DELETE  FROM dbo.Stores_Consumer_items
        WHERE   GardID = @GardID

        INSERT  INTO dbo.Stores_Consumer
                ( GardID ,
                  ScanDate ,
                  StoreID ,
                  ProunchID ,
                  COMP_ID ,
                  Item_Gro_Id ,
                  Item_Gro_Sub_Id
                )
        VALUES  ( @GardID , -- GardID - bigint
                  @ScanDate , -- ScanDate - date
                  @StoreID , -- StoreID - bigint
                  @ProunchID , -- ProunchID - int
                  @COMP_ID ,
                  @Item_Gro_Id ,
                  @Item_Gro_Sub_Id
				   
	            )



		 

        INSERT  INTO dbo.Stores_Consumer_items
                ( GardID ,
                  Item_Id ,
                  First_Period ,
                  Cash_purchases ,
                  Credit_purchases ,
                  AllCome ,
                  CurrentBalance ,
                  NetOut ,
                  Avvrage ,
                  Total	  
				 )
                SELECT  *
                FROM    @Stores_Consumer_Type
				  
				  
       

    END
