

 
ALTER PROCEDURE [dbo].[Finde_Item_With_grops] @Item_Gro_Id INT
AS
    BEGIN
        SELECT  Item_Id ,
                Barcode ,
                PartNo ,
                Item_Name ,
                Item_Name_AR ,
                price ,
				priceCome,
                aNotes ,
                DescountPercent ,
                PonasPercent ,
                groupname ,
                subname ,
                TradeType ,
                com_name_ar,
				itm_code2
        FROM    Vitems
        WHERE   flag = 1
                AND Item_Gro_Id = @Item_Gro_Id 

    END


