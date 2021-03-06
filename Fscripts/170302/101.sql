
ALTER  PROCEDURE [dbo].[Finde_Item_Code]
AS
    BEGIN

        CREATE TABLE #Result
            (
              FullCode NVARCHAR(150) ,
              Item_Id BIGINT
            );


        INSERT  INTO #Result
                ( FullCode ,
                  Item_Id
	            )
                SELECT  Item_Id,Item_Id
                FROM    Items
                WHERE   ( flag = 1 );



        INSERT  INTO #Result
                ( FullCode ,
                  Item_Id
	            )
                SELECT  Barcode,Item_Id
                FROM    Items
                WHERE   flag = 1
                        AND Barcode IS NOT NULL
                        AND Barcode <> '0';



        INSERT  INTO #Result
                ( FullCode ,
                  Item_Id
	            )
                SELECT  itm_code2,Item_Id
                FROM    Items
                WHERE   ( flag = 1 )
                        AND itm_code2 IS NOT NULL
                        AND itm_code2 <> '0';



        SELECT  *
        FROM    #Result ORDER BY  Item_Id ; 





    END; 


