 


ALTER PROCEDURE [dbo].[Get_ItemName]
    @gnitemcod NVARCHAR(150) ,
    @gnitemCode2 NVARCHAR(150)
AS
    BEGIN

        CREATE TABLE #temp
            (
              ItemCode BIGINT , -- كود الصنف
              ItemName NVARCHAR(100) COLLATE Arabic_CI_Ai ,-- اسم الصنف
             
            )


        DELETE  FROM #temp 

        INSERT  INTO #temp
                SELECT  Item_Id , -- ItemCode - int
                        Item_Name  -- ItemName - nvarchar(100)
                FROM    Items
                WHERE   flag = 1
                        AND Item_Id = CAST(@gnitemcod AS BIGINT )
                             
    END
                 
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  Item_Id , -- ItemCode - int
                            Item_Name
                    FROM    Items
                    WHERE   flag = 1
                            AND itm_code2 = @gnitemCode2

        END

			  
    IF NOT EXISTS ( SELECT  ItemCode
                    FROM    #temp )
        BEGIN 

            INSERT  INTO #temp
                    SELECT  Item_Id , -- ItemCode - int
                            Item_Name
                    FROM    Items
                    WHERE   flag = 1
                            AND Barcode = @gnitemCode2

        END


    SELECT  *
    FROM    #temp


 