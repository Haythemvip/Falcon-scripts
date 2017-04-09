 
 
CREATE PROCEDURE Financial_Ratios_rates
 AS


 CREATE TABLE #Result

 (
 
 ItemName NVARCHAR(MAX),
 ItemValue FLOAT,
 ItemPercent FLOAT 
 
 )
BEGIN
	


	INSERT INTO #Result
	        ( ItemName, ItemValue, ItemPercent )
	VALUES  ( N' ', -- ItemName - nvarchar(max)
	          0.0, -- ItemValue - float
	          0.0  -- ItemPercent - float
	          )
	 


	 SELECT * FROM #Result 

END
GO
