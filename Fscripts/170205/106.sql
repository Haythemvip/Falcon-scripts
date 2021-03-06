 

ALTER PROCEDURE [dbo].[carsTable_Update]
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
	
        UPDATE  [carsTable]
        SET     [boardno] = @boardno ,
                [estno] = @estno ,
                [estmissu] = @estmissu ,
                [estmdate] = @estmdate ,
                [typecar] = @typecar ,
                [modno] = @modno ,
                [color] = @color ,
                [carcustoms] = @carcustoms ,
                [remarks] = @remarks ,
                [carsource] = @carsource ,
                [Boughtby] = @Boughtby ,
                [BuyDate] = @BuyDate ,
                [LastownerType] = @LastownerType ,
                [CarCategory] = @CarCategory ,
                [lastowner] = @lastowner ,
                [lastSaleType] = @lastSaleType ,
                [LastSalePrice] = @LastSalePrice ,
                [UserCOde] = @UserCOde ,
                [BoughtbyID] = @BoughtbyID ,
                [lastownerid] = @lastownerid,
				[shaseno] = @shaseno


        WHERE   Item_Id = @Item_Id


      
 




    END


