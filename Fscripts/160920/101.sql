 
CREATE PROCEDURE SelectCars
    @shaseno NVARCHAR(50) ,
    @boardno NVARCHAR(50) ,
    @estno NVARCHAR(50) ,
    @estmissu NVARCHAR(50) ,
    @typecar INT ,
    @CarCategory INT ,
    @modno NVARCHAR(50) ,
    @carsource NVARCHAR(50) ,
    @color NVARCHAR(50) ,
    @BoughtbyID INT ,
    @lastownerid INT
AS
    BEGIN
 
 
        SELECT  carsTable.shaseno ,
                carsTable.boardno ,
                carsTable.estno ,
                carsTable.estmissu ,
                carsTable.estmdate ,
                carsTable.typecar ,
                carsTable.modno ,
                carsTable.color ,
                carsTable.carcustoms ,
                carsTable.remarks ,
                carsTable.carsource ,
                carsTable.Boughtby ,
                carsTable.BuyDate ,
                carsTable.LastownerType ,
                CASE WHEN carsTable.CarCategory = '0' THEN '---'
                     WHEN carsTable.CarCategory = '1' THEN 'ÃœÌœ'
                     WHEN carsTable.CarCategory = '2' THEN '„” ⁄„·'
                END AS CarCategory ,
                carsTable.lastowner ,
                carsTable.lastSaleType ,
                carsTable.LastSalePrice ,
                carsTable.DEDate ,
                carsTable.UserCOde ,
                carsTable.BoughtbyID ,
                carsTable.lastownerid ,
                cartype.cname
        FROM    carsTable
                LEFT OUTER JOIN cartype ON carsTable.typecar = cartype.code
        WHERE   ( @shaseno = NULL
                  OR shaseno = @shaseno
                )
                AND ( @boardno = NULL
                      OR boardno = @boardno
                    )
                AND ( @estno = NULL
                      OR estno = @estno
                    )
                AND ( @estmissu = NULL
                      OR estmissu = @estmissu
                    )
                AND ( @typecar = NULL
                      OR typecar = @typecar
                    )
                AND ( @CarCategory = NULL
                      OR CarCategory = @CarCategory
                    )
                AND ( @modno = NULL
                      OR modno = @modno
                    )
                AND ( @carsource = NULL
                      OR carsource = @carsource
                    )
                AND ( @color = NULL
                      OR color = @color
                    )
                AND ( @BoughtbyID = NULL
                      OR BoughtbyID = @BoughtbyID
                    )
                AND ( @lastownerid = NULL
                      OR lastownerid = @lastownerid
                    )




    END
GO
