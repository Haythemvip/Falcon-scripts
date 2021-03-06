 
 
ALTER  PROCEDURE [dbo].[Financial_Ratios_rates_Settings] @Year INT  , @Calc INT 
AS
    BEGIN
	
        CREATE TABLE #Result
            (
              ID INT ,
              Name_Ar NVARCHAR(250) ,
              Name_En NVARCHAR(250) ,
              ItemValue FLOAT
            );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 1, -- ID - int
                  N'الأصول المتدوالة', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 2 , -- ID - int
                  N'الالتزامات المتدوالة' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
	            );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 3, -- ID - int
                  N'المخزون', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 4, -- ID - int
                  N'النقدية ومافى حكمها', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 5, -- ID - int
                  N'مجمل الربح', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 6, -- ID - int
                  N'صافى المبيعات', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 7, -- ID - int
                  N'صافى الربح', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 8, -- ID - int
                  N'اجمالى الاستثمار', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 9, -- ID - int
                  N'رأس المال العامل', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );

        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 10, -- ID - int
                  N'القروض طويلة الاجل', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 11, -- ID - int
                  N'اجمالى الاصول', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 12, -- ID - int
                  N' تكلفة المبيعات', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 13, -- ID - int
                  N' متوسط المخزون', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );






        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 14 , -- ID - int
                  N' متوسط اجمالى الاصول' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 15, -- ID - int
                  N'المبيعات الاجلة', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );





        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 16 , -- ID - int
                  N'متوسط حسابات المدينين' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );




        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 17 , -- ID - int
                  N'متوسط حسابات الدائنين' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 18, -- ID - int
                  N'المشتريات الاجلة', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 19 , -- ID - int
                  N'إجمالى حسابات الدائنين' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );




        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 20 , -- ID - int
                  N'اجمالى حقوق الملكية' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );




        INSERT  INTO #Result
                ( ID ,
                  Name_Ar ,
                  Name_En ,
                  ItemValue
                )
        VALUES  ( 21 , -- ID - int
                  N'صافى الربح قبل الفوائد والضرائب' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                );







        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 22, -- ID - int
                  N'مصروف الفوائد', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



 INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 23, -- ID - int
                  N'الاصول الثابتة', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




				   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 24, -- ID - int
                  N'اجمالى الالتزامات', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        CREATE TABLE #Table1
            (
              Aaccount_GroupID INT ,
              MethodID INT ,
              ThisYear FLOAT ,
              ThisYearAdd FLOAT ,
              ThisYearMinus FLOAT ,
              FinalMenuID INT ,
              Switch_to_positive INT
            );



IF @Calc = 1
		  BEGIN 

        BEGIN TRY
       



            INSERT  #Table1
                    ( Aaccount_GroupID ,
                      MethodID ,
                      ThisYear ,
                      ThisYearAdd ,
                      ThisYearMinus ,
                      FinalMenuID ,
                      Switch_to_positive
	                )
                    SELECT  Aaccount_GroupID , -- Aaccount_GroupID - int
                            MethodID , -- MethodID - int
                            0.00 AS 'ThisYear' ,
                            0.00 AS 'ThisYearadd' ,
                            0.00 AS 'ThisYearminus' ,
                            FinalMenuID ,
                            Switch_to_positive
                    FROM    Final_Ratio_Setting;


          
		  
		  
		 
       	   
            UPDATE  #Table1
            SET     [ThisYearAdd] = ISNULL(( SELECT SUM(Maden)
                                             FROM   dbo.VEl_Koyod_El_Yawmia
                                             WHERE   AccCode = #Table1.Aaccount_GroupID
                                                    AND year = @Year
                                           ), 0)
                    - ISNULL(( SELECT   SUM(Daen)
                               FROM   dbo.VEl_Koyod_El_Yawmia
                                             WHERE   AccCode = #Table1.Aaccount_GroupID
                                        AND year = @Year
                             ), 0)
            WHERE   #Table1.MethodID = 1;


        END TRY

        BEGIN CATCH
        END CATCH;





        BEGIN TRY
       
               
            UPDATE  #Table1
            SET     [ThisYearMinus] = ISNULL(( SELECT   SUM(Maden)
                                              FROM   dbo.VEl_Koyod_El_Yawmia
                                             WHERE   AccCode = #Table1.Aaccount_GroupID
                                                        AND year = @Year
                                             ), 0)
                    - ISNULL(( SELECT   SUM(Daen)
                              FROM   dbo.VEl_Koyod_El_Yawmia
                                             WHERE   AccCode = #Table1.Aaccount_GroupID
                                        AND year = @Year
                             ), 0)
            WHERE   #Table1.MethodID = 0;


        END TRY

        BEGIN CATCH
        END CATCH;


   

    UPDATE  #Table1
    SET     ThisYearAdd = ThisYearAdd * -1
    WHERE   Switch_to_positive = 1;


	 UPDATE  #Table1
    SET     ThisYearMinus = ThisYearMinus * -1
    WHERE   Switch_to_positive = 1;




        BEGIN TRY
       
            UPDATE  #Table1
            SET     [ThisYear] = ThisYearAdd - ThisYearMinus;  
        END TRY

        BEGIN CATCH
        END CATCH;


		 

	 
        BEGIN TRY
       
            UPDATE  #Result
            SET     ItemValue = ( SELECT    ISNULL(SUM(ThisYear), 0)
                                  FROM      #Table1
                                            WHERE  #Result.ID = #Table1.FinalMenuID
                                );

        END TRY

        BEGIN CATCH
        END CATCH;



	  end    








        SELECT  *
        FROM    #Result; 



    END;
