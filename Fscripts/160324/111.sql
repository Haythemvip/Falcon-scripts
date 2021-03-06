 
 
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
                FORMAT(SUM(QCome) - SUM(Qout), '0.00000') AS rased ,
                DescountPercent ,
                unitname
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
                itm_code2 

    END
