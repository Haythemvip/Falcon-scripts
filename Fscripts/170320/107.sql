

ALTER   PROCEDURE [dbo].[Select_Gard]
    @StoreID NVARCHAR(50) = '0' ,
    @GroupID NVARCHAR(50) = '0' ,
    @SupGroupID NVARCHAR(50) = '0' ,
    @Year CHAR(4) ,
    @GardID NVARCHAR(20) ,
    @Adate DATE ,
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
              CalcCompAndHand FLOAT ,
              inability FLOAT ,
              inabilityValue FLOAT ,
              increase FLOAT ,
              increaseValue FLOAT
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
                        0 AS CalcCompAndHand ,
                        0 AS inability ,
                        0 AS inabilityValue ,
                        0 AS increase ,
                        0 AS increaseValue
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


      

	   --0 AS inability ,
    --                    0 AS inabilityValue ,
    --                    0 AS increase ,
    --                    0 AS increaseValue





   --     UPDATE  #excel
   --     SET     PriceCome = dbo.get_item_average(@StoreID, Item_Id, @Adate,
   --                                              @Year);  




   --     UPDATE  #excel
   --     SET     inability = CASE WHEN (TotalByComputer < 0) THEN (TotalByComputer * -1) ELSE (0) END 


		 --UPDATE  #excel
   --     SET     increase = CASE WHEN (TotalByComputer > 0) THEN (TotalByComputer ) ELSE (0) END 



		 -- UPDATE  #excel
   --     SET     inabilityValue = PriceCome * inability


		 --UPDATE  #excel
   --     SET     increaseValue = PriceCome * increase



        SELECT  * ,
                0 AS ValDeff ,
                0 AS ValGard
        FROM    #excel;


    END;
