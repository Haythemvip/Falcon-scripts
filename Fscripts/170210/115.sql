
ALTER PROCEDURE [dbo].[get_item_average_PR]
    @Storeid BIGINT = 0 ,
    @Itemid BIGINT ,
    @ActionDate DATETIME
AS
    BEGIN
	 
        SELECT  dbo.get_item_average(@Storeid, @Itemid, @ActionDate,DATEPART(YEAR ,@ActionDate))


    END


