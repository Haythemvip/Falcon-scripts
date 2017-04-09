
 
ALTER PROCEDURE SelectCars
    @shaseno NVARCHAR(50) = NULL ,
    @boardno NVARCHAR(50) = NULL ,
    @estno NVARCHAR(50) = NULL ,
    @estmissu NVARCHAR(50) = NULL ,
    @typecar NVARCHAR(50) = NULL ,
    @CarCategory NVARCHAR(50) ,
    @modno NVARCHAR(50) = NULL ,
    @carsource NVARCHAR(50) ,
    @color NVARCHAR(50) = NULL ,
    @BoughtbyID NVARCHAR(50) = NULL ,
    @lastownerid NVARCHAR(50) = NULL
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
        WHERE   ( @shaseno = N'' OR shaseno = @shaseno)
                 
                
                 AND ( @boardno = N'' OR boardno = @boardno)
                    
                  
                AND ( @estno = N''
                      OR estno = @estno
                    )
                AND ( @estmissu = N''
                      OR estmissu = @estmissu
                    )
                AND ( @typecar = N''
                      OR typecar = @typecar
                    )
                AND ( @CarCategory = '-1'
                      OR CarCategory = @CarCategory
                    )
                AND ( @modno = N''
                      OR modno = @modno
                    )
                AND ( @carsource = N''
                      OR carsource = @carsource
                    )
                AND ( @color = N''
                      OR color = @color
                    )
                AND ( @BoughtbyID = N''
                      OR BoughtbyID = @BoughtbyID
                    )
                AND ( @lastownerid = N''
                      OR lastownerid = @lastownerid
                    )


			 



    END
GO

