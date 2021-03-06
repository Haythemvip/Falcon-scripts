
 
ALTER PROCEDURE [dbo].[Item_EpireDate]
    @ExpDate DATE ,
    @store_id INT = 0
AS
    BEGIN TRY 

        CREATE TABLE #Result
            (
              store_name NVARCHAR(200) ,
              Item_Id BIGINT ,
              Item_Name NVARCHAR(MAX) ,
              ExDate NVARCHAR(max) ,
              rased FLOAT
            )
        IF @store_id > 0
            BEGIN
                INSERT  INTO #Result
                        SELECT  store_name ,
                                Item_Id ,
                                Item_Name ,
                                 ExpDate,
                                rased
                        FROM    View_ItemRased_Sotrd_Epdate
                        WHERE   rased > 0
                                AND ExpDate IS NOT  NULL
                                AND ExpDate <> '  '
                                AND ExpDate <> '0'
                                AND store_id = @store_id
                                AND ExpDate <> ''
            END

    END TRY 
                   
    BEGIN CATCH 

    END CATCH 
    BEGIN TRY 
        IF @store_id = 0
            BEGIN
                INSERT  INTO #Result
                        SELECT  store_name ,
                                Item_Id ,
                                Item_Name ,
                                 ExpDate ,
                                rased
                        FROM    View_ItemRased_Sotrd_Epdate
                        WHERE   rased > 0
                                AND ExpDate IS NOT  NULL
                                AND ExpDate <> '  '
                                AND ExpDate <> '0'
                                AND ExpDate <> ''
								 

            END

    END TRY 
                   
    BEGIN CATCH 

    END CATCH 


    SELECT  *
    FROM    #Result
 WHERE LEN(ExDate )= 10
 AND ExDate <= @ExpDate 