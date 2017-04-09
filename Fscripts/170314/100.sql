
 
ALTER  PROCEDURE item_History
	@ItemID BIGINT,
	@Year INT  
AS
BEGIN

CREATE TABLE #Result
(

StoreName NVARCHAR(250) COLLATE Arabic_CI_AI,
ActionName NVARCHAR(250) COLLATE Arabic_CI_AI ,
Notes NVARCHAR(250) COLLATE Arabic_CI_AI,
Q DECIMAL(18,2),
Balance DECIMAL(18,2),
Price DECIMAL(18,2),
Total DECIMAL(18,2),

)




INSERT INTO #Result
        ( StoreName ,
          ActionName ,
          Notes ,
          Q ,
          Balance ,
          Price ,
          Total
        )
SELECT  store_name , -- StoreName - nvarchar(250)
          N'ÇáÊßáÝÉ' , -- ActionName - nvarchar(250)
          N'' , -- Notes - nvarchar(250)
          0 , -- Q - decimal(18, 2)
          dbo.Item_Balance(@ItemID,@Year,store_id) , -- Balance - decimal(18, 2)
          dbo.get_item_average(store_id,@ItemID,GETDATE(),@Year)  , -- Price - decimal(18, 2)
          0  -- Total - decimal(18, 2)
  FROM dbo.Stores 


 
 DELETE FROM #Result WHERE Price = 0










 INSERT INTO #Result
        ( StoreName ,
          ActionName ,
          Notes ,
          Q ,
          Balance ,
          Price ,
          Total
        )
SELECT  Stores.store_name , -- StoreName - nvarchar(250)
          N'ãÔÊÑíÇÊ' , -- ActionName - nvarchar(250)
          VenderOrCustomer , -- Notes - nvarchar(250)
          QCome , -- Q - decimal(18, 2)
          0 , -- Balance - decimal(18, 2)
          PriceCome , -- Price - decimal(18, 2)
          0  -- Total - decimal(18, 2)
FROM dbo.Item_Card
	INNER JOIN dbo.Stores ON Stores.store_id = Item_Card.store_id

	WHERE QCome > 0
	AND Year = @Year 
	AND Item_Id = @ItemID 


	BEGIN TRY 
	 UPDATE #Result SET Total = Balance * Price

	 END TRY 

	 BEGIN CATCH 

	 END CATCH 





		  SELECT * FROM #Result 

		   



		 

END
GO

