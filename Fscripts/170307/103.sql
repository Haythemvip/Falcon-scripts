 

ALTER   PROCEDURE [dbo].[Select_Gard]
    @StoreID NVARCHAR(50) = '0' ,
    @GroupID NVARCHAR(50) = '0' ,
    @SupGroupID NVARCHAR(50) = '0' ,
    @Year CHAR(4) ,
    @GardID NVARCHAR(20) ,
    @Adate DATE,
	 @ListItems AS dbo.MyItemtParam READONLY 
AS
    BEGIN




        CREATE TABLE #excel
            (
              GardID INT ,
              Srial BIGINT NOT NULL
                           PRIMARY KEY
                           IDENTITY ,
              Item_Id BIGINT ,
              Item_Name NVARCHAR(150) COLLATE Arabic_CI_AS
                                      NOT NULL ,
              PartNo NVARCHAR(50) NULL ,
              unitname NVARCHAR(50) ,
              PriceCome FLOAT ,
              TotalByHande FLOAT ,
              TotalByComputer FLOAT ,
              CalcCompAndHand FLOAT
            );

		 

        DECLARE @Query NVARCHAR(MAX); 
		

        INSERT  INTO #excel
                SELECT  @GardID ,
                        Item_Id ,
                        Item_Name ,
                        PartNo ,
                        unitname ,
                        0 AS PriceCome ,
                        0 AS TotalByHande ,
                        SUM(QCome) - SUM(Qout) AS TotalByComputer ,
                        0 AS CalcCompAndHand
                FROM    Vitemrased
                WHERE   Year = @Year
                        AND ActionDate <= @Adate
                        AND ( @StoreID = 0
                              OR store_id = @StoreID
                            )
                        AND ( @GroupID = 0
                              OR Item_Gro_Id = @GroupID
                            )
                        AND ( @SupGroupID = 0
                              OR Item_Gro_Sub_Id = @SupGroupID
                            )
							AND ( ( SELECT  ISNULL(COUNT(*), 0)
                                FROM    @ListItems
                              ) = 0
                              OR Item_Id IN ( SELECT    *
                                              FROM      @ListItems )
                            )
                GROUP BY Item_Id ,
                        Item_Name ,
                        PartNo ,
                        unitname ,
                        ItemPriceCome
                ORDER BY Item_Id;  


      




        UPDATE  #excel
        SET     PriceCome = dbo.get_item_average(@Storeid, Item_Id, @Adate,@Year);  

        SELECT  * ,
                0 AS ValDeff,0 AS ValGard
        FROM    #excel;


    END;
