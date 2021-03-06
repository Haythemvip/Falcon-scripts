
CREATE   PROCEDURE [dbo].[Letters_of_Guarantee_Balance]

AS
    BEGIN
	 
        CREATE TABLE #Result
            (
              Type_of_Guarantee_ID INT ,
              Type_of_Guarantee NVARCHAR(MAX) COLLATE Arabic_CI_AS ,
              BanK_ID INT ,
              BanK_Name NVARCHAR(MAX) COLLATE Arabic_CI_AS ,
              Details_ID INT ,
              Details NVARCHAR(50) COLLATE Arabic_CI_AS ,
              Amount FLOAT
            );
			 
 

        CREATE TABLE #Detailstbl
            (
              Details_ID INT ,
              Details NVARCHAR(50) COLLATE Arabic_CI_AS
            );



        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 1, -- Details_ID - int
                  N'التسهيلات'  -- Details - nvarchar(50)
                  );


					  
        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 2, -- Details_ID - int
                  N'المستخدم'  -- Details - nvarchar(50)
                  );



					  
        INSERT  INTO #Detailstbl
                ( Details_ID, Details )
        VALUES  ( 3, -- Details_ID - int
                  N'رصيد التسهيلات'  -- Details - nvarchar(50)
                  );




        INSERT  INTO #Result
                ( Type_of_Guarantee_ID ,
                  Type_of_Guarantee ,
                  BanK_ID ,
                  BanK_Name ,
                  Details_ID ,
                  Details ,
                  Amount
			    )
                SELECT  Collateral_ID ,
                        Collateral_AR ,
                        Bank_Code.id_Bank ,
                        Bank_Code.Bank_Name ,
                        #Detailstbl.Details_ID ,
                        #Detailstbl.Details ,
                        0
                FROM    dbo.Letter_of_Guarantee
                        INNER JOIN dbo.collateral ON collateral.ID = Letter_of_Guarantee.Collateral_ID
                        CROSS JOIN #Detailstbl
                        CROSS JOIN dbo.Bank_Code
						WHERE Bank_Code.id_Bank IN (SELECT * FROM dbo.Letter_of_Guarantee )
                ORDER BY Bank_ID; 


 
  

        


	 
        SELECT  *
        FROM    #Result
        ORDER BY BanK_ID; 

	




    END;
