 
ALTER PROCEDURE [dbo].[carsTable_Add]
    @shaseno NVARCHAR(10) ,
    @boardno NVARCHAR(10) ,
    @estno NVARCHAR(15) ,
    @estmissu NVARCHAR(25) ,
    @estmdate NVARCHAR(10) ,
    @typecar INT ,
    @modno NVARCHAR(4) ,
    @color NVARCHAR(10) ,
    @carcustoms MONEY ,
    @remarks NVARCHAR(MAX) ,
    @carsource NVARCHAR(50) ,
    @Boughtby NVARCHAR(250) ,
    @BuyDate NVARCHAR(10) ,
    @LastownerType INT ,
    @CarCategory INT ,
    @lastowner NVARCHAR(250) ,
    @lastSaleType NVARCHAR(10) ,
    @LastSalePrice MONEY ,
    @UserCOde NVARCHAR(10) ,
    @BoughtbyID INT ,
    @lastownerid INT,
	@Item_Id BIGINT 
AS
    BEGIN
	
        INSERT  INTO [dbo].[carsTable]
                ( [shaseno] ,
                  [boardno] ,
                  [estno] ,
                  [estmissu] ,
                  [estmdate] ,
                  [typecar] ,
                  [modno] ,
                  [color] ,
                  [carcustoms] ,
                  [remarks] ,
                  [carsource] ,
                  [Boughtby] ,
                  [BuyDate] ,
                  [LastownerType] ,
                  [CarCategory] ,
                  [lastowner] ,
                  [lastSaleType] ,
                  [LastSalePrice] ,
                  [UserCOde] ,
                  [BoughtbyID] ,
                  [lastownerid],
				  [Item_Id]
                )
        VALUES  ( @shaseno ,
                  @boardno ,
                  @estno ,
                  @estmissu ,
                  @estmdate ,
                  @typecar ,
                  @modno ,
                  @color ,
                  @carcustoms ,
                  @remarks ,
                  @carsource ,
                  @Boughtby ,
                  @BuyDate ,
                  @LastownerType ,
                  @CarCategory ,
                  @lastowner ,
                  @lastSaleType ,
                  @LastSalePrice ,
                  @UserCOde ,
                  @BoughtbyID ,
                  @lastownerid,
				  @Item_Id

                )



    END


