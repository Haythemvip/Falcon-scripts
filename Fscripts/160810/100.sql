 
 


ALTER   PROCEDURE [dbo].[Select_Gard]
    @StoreID NVARCHAR(50) = '0' ,
    @GroupID NVARCHAR(50) = '0' ,
    @SupGroupID NVARCHAR(50) = '0' ,
    @Year CHAR(4),
	@GardID NVARCHAR(20) ,
	@Adate DATE
 
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
            )

		 

        DECLARE @Query NVARCHAR(MAX) 
		

        SET @Query = N'    INSERT  INTO #excel
                SELECT  '+ @GardID +' ,
                        Item_Id ,
                        Item_Name ,
                        PartNo ,
                        unitname ,
                        0 as  PriceCome,
                        SUM(QCome) - SUM(Qout) AS TotalByHande ,
                         SUM(QCome) - SUM(Qout) AS TotalByComputer ,
                        0 AS CalcCompAndHand
                FROM    Vitemrased '
                
        
         SET @Query += '  WHERE   Year  = ''' + @Year + ''''

		 SET @Query += '  And  ActionDate  <= ''' + FORMAT(@Adate, 'yyyy-MM-dd')
            + ''''

        IF @StoreID <> 0
            BEGIN 

                SET @Query += '  And store_id = ''' + @StoreID + ''''

            END
        

        IF @GroupID <> 0
            BEGIN 

                SET @Query += '  And Item_Gro_Id = ''' + @GroupID + ''''

            END



        IF @SupGroupID <> 0
            BEGIN 

                SET @Query += '  And Item_Gro_Sub_Id = ''' + @SupGroupID
                    + ''''

            END

        SET @Query += ' GROUP BY Item_Id,Item_Name ,PartNo ,unitname ,ItemPriceCome '

        SET @Query += ' order by Item_Id '


        EXEC(@Query)




		UPDATE #excel SET PriceCome =   dbo.get_item_average( @StoreID , Item_Id,
                                           @Adate )  

        SELECT  *,0 AS ValDeff
        FROM    #excel


    END
