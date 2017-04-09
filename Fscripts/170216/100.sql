
ALTER PROCEDURE [dbo].[Finde_Item_Withowut]
AS
    BEGIN

        CREATE TABLE #Result
            (
              Item_Id BIGINT ,
              Barcode NVARCHAR(50) ,
              PartNo NVARCHAR(50) ,
              Item_Name NVARCHAR(max) ,
              Item_Name_AR NVARCHAR(max) ,
              price FLOAT ,
              priceCome FLOAT ,
              aNotes NVARCHAR(250) ,
              DescountPercent FLOAT ,
              PonasPercent FLOAT ,
              groupname NVARCHAR(50) ,
              subname NVARCHAR(50) ,
              TradeType NVARCHAR(50) ,
              com_name_ar NVARCHAR(50) ,
              Item_Gro_Id INT ,
              Item_Gro_Sub_Id INT ,
              TradeTypeID INT ,
              itm_code2 NVARCHAR(50) ,
              Last_purchase NVARCHAR( 50)
            );


        INSERT  INTO #Result
                ( Item_Id ,
                  Barcode ,
                  PartNo ,
                  Item_Name ,
                  Item_Name_AR ,
                  price ,
                  priceCome ,
                  aNotes ,
                  DescountPercent ,
                  PonasPercent ,
                  groupname ,
                  subname ,
                  TradeType ,
                  com_name_ar ,
                  Item_Gro_Id ,
                  Item_Gro_Sub_Id ,
                  TradeTypeID ,
                  itm_code2 ,
                  Last_purchase
	            )
                SELECT  Item_Id ,
                        Barcode ,
                        PartNo ,
                        Item_Name ,
                        Item_Name_AR ,
                        price ,
                        priceCome ,
                        unitname AS aNotes ,
                        DescountPercent ,
                        PonasPercent ,
                        groupname ,
                        subname ,
                        TradeType ,
                        com_name_ar ,
                        Item_Gro_Id ,
                        Item_Gro_Sub_Id ,
                        TradeTypeID ,
                        itm_code2 ,
                       0-- dbo.Last_purchase_Date( Item_Id) AS Last_purchase 
                FROM    Vitems
                WHERE   ( flag = 1 )
				;



        SELECT  *
        FROM    #Result; 





    END; 


