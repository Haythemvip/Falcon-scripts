 
CREATE PROCEDURE item_History
	@ItemID BIGINT,
	@Year INT  
AS
BEGIN

CREATE TABLE #Result
(

StoreName NVARCHAR(250),
ActionName NVARCHAR(250),
Notes NVARCHAR(250),
Storeid INT 

)

 INSERT INTO #Result
         ( StoreName ,
           ActionName ,
           Notes ,
           Storeid
         )
SELECT  store_name , -- StoreName - nvarchar(250)
           N'«· ﬂ·›…' , -- ActionName - nvarchar(250)
           dbo.get_item_average(store_id,@ItemID,GETDATE(),@Year) , -- Notes - nvarchar(250)
           store_id  -- Storeid - int
FROM dbo.Stores 



		  SELECT * FROM #Result 



END
GO
