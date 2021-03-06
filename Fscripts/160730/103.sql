 
ALTER PROCEDURE [dbo].[Insert_Report]
    @ID INT ,
    @DesignName NVARCHAR(50) ,
    @Printer NVARCHAR(50) ,
    @PageHeight DECIMAL(18, 2) ,
    @PageWidth DECIMAL(18, 2) ,
    @TopMarign DECIMAL(18, 2) ,
    @BottomMargin DECIMAL(18, 2) ,
    @RightMargin DECIMAL(18, 2) ,
    @LeftMargin DECIMAL(18, 2) ,
    @ReportXML XML ,
    @IsRoll BIT ,
    @TAGID BIGINT
AS
    BEGIN
	


        IF EXISTS ( SELECT  ID
                    FROM    dbo.ReportDesign
                    WHERE   ID = @ID )
            BEGIN
                UPDATE  [dbo].[ReportDesign]
                SET     [DesignName] = @DesignName ,
                        [Printer] = @Printer ,
                        [PageHeight] = @PageHeight ,
                        [PageWidth] = @PageWidth ,
                        [TopMarign] = @TopMarign ,
                        [BottomMargin] = @BottomMargin ,
                        [RightMargin] = @RightMargin ,
                        [LeftMargin] = @LeftMargin ,
                        [ReportXML] = @ReportXML ,
                        [IsRoll] = @IsRoll
                WHERE   ID = @ID
            END


        IF NOT EXISTS ( SELECT  ID
                        FROM    dbo.ReportDesign
                        WHERE   ID = @ID )
            BEGIN
                INSERT  INTO [dbo].[ReportDesign]
                        ( [ID] ,
                          [DesignName] ,
                          [Printer] ,
                          [PageHeight] ,
                          [PageWidth] ,
                          [TopMarign] ,
                          [BottomMargin] ,
                          [RightMargin] ,
                          [LeftMargin] ,
                          [ReportXML] ,
                          [IsRoll] ,
                          [TAGID]
                        )
                VALUES  ( @ID ,
                          @DesignName ,
                          @Printer ,
                          @PageHeight ,
                          @PageWidth ,
                          @TopMarign ,
                          @BottomMargin ,
                          @RightMargin ,
                          @LeftMargin ,
                          @ReportXML ,
                          @IsRoll ,
                          @TAGID
                        )
            END


    END
