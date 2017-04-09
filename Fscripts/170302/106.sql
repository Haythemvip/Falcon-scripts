

ALTER PROCEDURE [dbo].[GitMinPrice]
    @ItemCode BIGINT ,
    @price_Case INT = 0 , --  0 burchase   1  sale   2 convert between stores all assembly    
    @pirce_listID INT = 0 -- ÞÇÆãÉ ÇáÇÓÚÇÑ   æÝì ÍÇáÉ ÕÝÑ íÊã ÌáÈ ÇáÓÚÑ ÇáÇÝÊÑÇÖì ãä ÈØÇÞÉ ÇáãÇÏÉ
AS
    BEGIN

        IF @pirce_listID > 0
            BEGIN
                SELECT  ISNULL(priceList.Percentage, 0.0000) AS MinPrice
                FROM    dbo.priceList
                WHERE   priceList.ItemCode = @ItemCode
                        AND priceList.pirce_listID = @pirce_listID; 

   

            END;
   
        IF @pirce_listID = 0
            BEGIN 

                SELECT  pricelow	  AS MinPrice
                FROM    dbo.Items 
                WHERE   Item_Id = @ItemCode;
                     


            END;
  


    END;

 