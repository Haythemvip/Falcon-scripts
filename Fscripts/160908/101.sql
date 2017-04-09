 
 
 
ALTER PROCEDURE dbo.GardItems @dateTo DATE, @Year INT,

  @Storid bigint

AS


   DELETE FROM  itemstock


        SELECT  Item_Id AS itemcode,
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
          AND (@Storid = 0 OR store_id = @Storid)
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






   INSERT INTO dbo.itemstock ( itemcode
   , store1
   , store2
   , store3
   , store4
   , store5
   , store6
   , store7
   , store8
   , store9
   , store10
   , store11
   , store12
   , store13
   , store14
   , store15
   , store1V
   , store2V
   , store3V
   , store4V
   , store5V
   , store6V
   , store7V
   , store8V
   , store9V
   , store10V
   , store11V
   , store12V
   , store13V
   , store14V
   , store15V
   , UntelDate
   , UserName
   , flagtodelete)
   SELECT  Item_Id
     , 0.0 -- store1 - float
     , 0.0 -- store2 - float
     , 0.0 -- store3 - float
     , 0.0 -- store4 - float
     , 0.0 -- store5 - float
     , 0.0 -- store6 - float
     , 0.0 -- store7 - float
     , 0.0 -- store8 - float
     , 0.0 -- store9 - float
     , 0.0 -- store10 - float
     , 0.0 -- store11 - float
     , 0.0 -- store12 - float
     , 0.0 -- store13 - float
     , 0.0 -- store14 - float
     , 0.0 -- store15 - float
     , 0.0 -- store1V - float
     , 0.0 -- store2V - float
     , 0.0 -- store3V - float
     , 0.0 -- store4V - float
     , 0.0 -- store5V - float
     , 0.0 -- store6V - float
     , 0.0 -- store7V - float
     , 0.0 -- store8V - float
     , 0.0 -- store9V - float
     , 0.0 -- store10V - float
     , 0.0 -- store11V - float
     , 0.0 -- store12V - float
     , 0.0 -- store13V - float
     , 0.0 -- store14V - float
     , 0.0 -- store15V - float
     , GETDATE() -- 'YYYY-MM-DD'-- UntelDate - date
     , '' -- UserName - varchar(50)
     , 0 -- flagtodelete - int
     FROM Vitemrased  
  WHERE   actiondate <= @dateTo
                AND Year = @Year
          AND (@Storid = 0 OR store_id = @Storid)
GROUP BY Item_Id


UPDATE itemstock SET store1 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 1 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store2 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 2 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store3 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 3 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store4 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 4 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store5 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 5 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store6 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 6 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store7 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 7 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store8 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 8 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store9 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 9 AND actiondate <= @dateTo AND Item_Id = itemcode)

UPDATE itemstock SET store10 = (SELECT SUM(QCome) - SUM(Qout) FROM  Vitemrased WHERE store_id = 10 AND actiondate <= @dateTo AND Item_Id = itemcode)

  GO ;

