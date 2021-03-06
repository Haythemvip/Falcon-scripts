 
ALTER PROCEDURE [dbo].[Item_Stores_Add]
AS
    BEGIN TRY 

        INSERT  INTO Item_Stores
                SELECT  store_id ,
                        Item_Id ,
                        ISNULL(SN, '0') AS ExpDate ,
                        ISNULL(SUM(QCome), 0) AS QCome ,
                        ISNULL(SUM(Qout), 0) AS Qout ,
                        ISNULL(SUM(QCome) - SUM(Qout), 0) AS rased ,
                        0 ,
                        GETDATE() ,
                        1 ,
                        1 ,
                        0 ,
                        0
                FROM    Item_Card
                WHERE   SN IS NOT NULL
                        AND Item_Id > 0
                GROUP BY Item_Id ,
                        ISNULL(SN, '0') ,
                        store_id
                ORDER BY ExpDate  
	 
	 
    END TRY 

    BEGIN CATCH 


    END CATCH 


    BEGIN TRY 


        UPDATE  Item_Stores
        SET     Barcode = RTRIM(CONVERT(CHAR, Item_Id)) + '-'
                + SUBSTRING(ISNULL(ExpDate, 0), 3, 2)

    END TRY 

    BEGIN CATCH 


    END CATCH 
