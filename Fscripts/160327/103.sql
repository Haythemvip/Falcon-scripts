
 
CREATE  PROCEDURE [dbo].[Salary_Sammary]
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              KafeelID BIGINT ,
              kafelName NVARCHAR(150) ,
              DepartID INT ,
              DepartName NVARCHAR(150) ,
              EmpCount INT
            )
	 
	
        CREATE TABLE #Costs
            (
              KafeelID BIGINT ,
              CostID BIGINT ,
              CostName NVARCHAR(150) ,
              Amount INT
            )



        SELECT  #Result.KafeelID ,
                #Result.kafelName ,
                #Result.DepartName ,
                #Result.EmpCount ,
                CostName
        FROM    #Result
                INNER JOIN #Costs ON #Costs.KafeelID = #Result.KafeelID
    END

