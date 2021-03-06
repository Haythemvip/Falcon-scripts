 
 
 
ALTER PROCEDURE [dbo].[GardItems] @dateTo DATE, @Year INT
AS
    BEGIN
	


        SELECT  Item_Id ,
                Barcode ,
                itm_code2, Item_Name ,
                store_id ,
                store_name ,
                Item_Gro_Id ,
                Item_Gro_Sub_Id ,
                TradeTypeID ,
                SUM(QCome) AS Wared ,
                SUM(Qout) AS Monsaref ,
                SUM(QCome) - SUM(Qout) AS rased ,
                DescountPercent ,
                unitname,((ISNULL(Width,0) * ISNULL(highet,0) * ISNULL(CountInBox,0)) * (SUM(ISNULL(QCome,0)) - SUM(ISNULL(Qout,0))))  AS Aria,ISNULL( Width,0) AS Width,ISNULL( highet,0) AS highet,ISNULL( CountInBox,0) AS CountInBox 

        FROM    Vitemrased
        WHERE   actiondate <= @dateTo
                AND Year = @Year
        GROUP BY Item_Id ,
                Item_Name ,
                store_id ,
                store_name ,
                Item_Gro_Id ,
                Item_Gro_Sub_Id ,
                TradeTypeID ,
                DescountPercent ,
                unitname, Barcode ,
                itm_code2 ,Width , highet ,CountInBox

    END
