 
ALTER PROCEDURE [dbo].[Finde_Item_Withowut]
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
				Item_Gro_Id,
				Item_Gro_Sub_Id,
				TradeTypeID
        FROM    Vitems
        WHERE   ( flag = 1 )
    END


