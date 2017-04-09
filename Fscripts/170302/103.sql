 


create PROCEDURE GitMinPrice
    @ItemCode BIGINT ,
    
    @price_Case INT = 0 , --  0 burchase   1  sale   2 convert between stores all assembly    
    @pirce_listID INT = 0 -- قائمة الاسعار   وفى حالة صفر يتم جلب السعر الافتراضى من بطاقة المادة
AS
    BEGIN

     

 SELECT  ISNULL(priceList.Percentage, 0.0000) AS MinPrice
                                FROM    dbo.priceList
                                WHERE   priceList.ItemCode = @ItemCode
                                        AND priceList.pirce_listID = @pirce_listID 

   

   end

 