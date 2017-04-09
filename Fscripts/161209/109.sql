 
CREATE   PROCEDURE [dbo].[Letters_of_Guarantee]
AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              Type_of_Guarantee_ID INT ,
              Type_of_Guarantee NVARCHAR(MAX)  COLLATE Arabic_CI_AS,
              Details NVARCHAR(50) COLLATE Arabic_CI_AS,
              Amount FLOAT  
              
            );
			 
 

			INSERT INTO #Result
			        ( Type_of_Guarantee_ID ,
			          Type_of_Guarantee ,
			          Details ,
			          Amount
			        )
		SELECT    Collateral_ID,
			         Collateral_AR,
			        Opration,
			        Collateral_Value
			FROM dbo.Letter_of_Guarantee
        INNER JOIN dbo.collateral ON collateral.ID = Letter_of_Guarantee.Collateral_ID 
			 
 


 
  

        


	 
        SELECT  *
        FROM    #Result; 

	




    END;
