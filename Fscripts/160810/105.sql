 


Create PROCEDURE [dbo].[Consumer]
    @StoreID NVARCHAR(50) = '0' ,
    @GroupID NVARCHAR(50) = '0' ,
    @SupGroupID NVARCHAR(50) = '0' ,
    @Year CHAR(4) ,
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
                                      NULL ,
              unitname NVARCHAR(50) ,
              First_Period FLOAT ,
              Cash_purchases FLOAT ,
              Credit_purchases FLOAT ,
              AllCome FLOAT ,
              CurrentBalance FLOAT ,
              NetOut FLOAT
            )

		 
		
        DECLARE @Query NVARCHAR(MAX) 
		

        SET @Query = N'    INSERT  INTO #excel
                SELECT  ' + @GardID + ' ,
                        Item_Id ,
                        Item_Name ,
                        
                        unitname ,
                        0 as  First_Period,
                        0 as  Cash_purchases,
						0 as  Credit_purchases,
						0 as  AllCome,
						0 as  CurrentBalance,
						0 as  NetOut
                FROM    Vitemrased '
                
        
        SET @Query += '  WHERE   Year  = ''' + @Year + ''''


		--SQL 2014
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




		--0 as  First_Period,
  --                      0 as  Cash_purchases,
		--				0 as  Credit_purchases,
		--				0 as  AllCome,
		--				0 as  CurrentBalance,
		--				0 as  NetOut



        UPDATE  #excel
        SET     First_Period = 3


        UPDATE  #excel
        SET     Cash_purchases = 0

        UPDATE  #excel
        SET     Credit_purchases = 10

        UPDATE  #excel
        SET     AllCome = First_Period + Cash_purchases + Credit_purchases


		


     







        DECLARE @BDate DATE = '2016-02-01'

----اول المدة
--        SET @Query = ' UPDATE #excel SET Item_Name = (SELECT   
--                        SUM(QCome) - SUM(Qout) AS PartNo 
                          
--                FROM    Vitemrased '
				 
--        SET @Query += '  WHERE   Year  = ''' + @Year + ''''

--        SET @Query += '  and    Vitemrased.Item_Id  =  #excel.Item_Id  '

--		--SQL 2014
--        SET @Query += '  And  ActionDate  < ''' + FORMAT(@BDate, 'yyyy-MM-dd')
--            + ''''
            

--		--SQL 2008 R2
--	    --SET @Query += '  And  ActionDate  <= ''' + Cast(@Adate as VARCHAR(10)) + ''''

--        IF @StoreID <> 0
--            BEGIN 

--                SET @Query += '  And store_id = ''' + @StoreID + ''')'

--            END

--        IF @SupGroupID <> 0
--            BEGIN 

--                SET @Query += '  And Item_Gro_Sub_Id = ''' + @SupGroupID
--                    + ''''

--            END
			
--        EXEC(@Query)

		 
		--خلال المدة نقدى
  --      SET @Query = ' UPDATE #excel SET PartNo = (SELECT   
  --                      SUM(QCome) - SUM(Qout) AS PartNo 
                          
  --              FROM    Vitemrased '
				 
  --      SET @Query += '  WHERE   Year  = ''' + @Year + ''''

  --      SET @Query += '  and    Vitemrased.Item_Id  =  #excel.Item_Id '
  --      SET @Query += '  and    Vitemrased.invtype  = ''نقدا'''

		----SQL 2014
  --      SET @Query += '  And  ActionDate  >=''' + FORMAT(@BDate, 'yyyy-MM-dd')
  --          + ''''
  --      SET @Query += '  And  ActionDate  <=''' + FORMAT(@Adate, 'yyyy-MM-dd')
  --          + ''''

		----SQL 2008 R2
	 --   --SET @Query += '  And  ActionDate  >= ''' + Cast(@Bdate as VARCHAR(10)) + ''''
		----SET @Query += '  And  ActionDate  <= ''' + Cast(@Adate as VARCHAR(10)) + ''''


  --      IF @StoreID <> 0
  --          BEGIN 

  --              SET @Query += '  And store_id = ''' + @StoreID + ''')'

  --          END

  --      IF @SupGroupID <> 0
  --          BEGIN 

  --              SET @Query += '  And Item_Gro_Sub_Id = ''' + @SupGroupID
  --                  + ''''

  --          END
			
  --      EXEC(@Query)

		

  --      --خلال المدة اجل
  --      SET @Query = ' UPDATE #excel SET unitname = (SELECT   
  --                      SUM(QCome) - SUM(Qout) AS PartNo 
                          
  --              FROM    Vitemrased '
				 
  --      SET @Query += '  WHERE   Year  = ''' + @Year + ''''

  --      SET @Query += '  and    Vitemrased.Item_Id  =  #excel.Item_Id '
  --      SET @Query += '  and    Vitemrased.invtype  = ''اجل'''

		----SQL 2014
  --      SET @Query += '  And  ActionDate  >=''' + FORMAT(@BDate, 'yyyy-MM-dd')
  --          + ''''
  --      SET @Query += '  And  ActionDate  <=''' + FORMAT(@Adate, 'yyyy-MM-dd')
  --          + ''''

		----SQL 2008 R2
	 --   --SET @Query += '  And  ActionDate  >= ''' + Cast(@Bdate as VARCHAR(10)) + ''''
		----SET @Query += '  And  ActionDate  <= ''' + Cast(@Adate as VARCHAR(10)) + ''''

  --      IF @StoreID <> 0
  --          BEGIN 

  --              SET @Query += '  And store_id = ''' + @StoreID + ''')'

  --          END
			
  --      EXEC(@Query)

		
  --      UPDATE  #excel
  --      SET     Item_Name = CASE WHEN Item_Name IS NULL THEN ( '0' )
  --                               ELSE ( Item_Name )
  --                          END
  --      UPDATE  #excel
  --      SET     PartNo = CASE WHEN PartNo IS NULL THEN ( '0' )
  --                            ELSE ( PartNo )
  --                       END
  --      UPDATE  #excel
  --      SET     unitname = CASE WHEN unitname IS NULL THEN ( '0' )
  --                              ELSE ( unitname )
  --                         END




        SELECT  * 
        FROM    #excel


    END
