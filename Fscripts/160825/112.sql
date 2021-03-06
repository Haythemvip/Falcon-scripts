


ALTER PROCEDURE [dbo].[Acc_Mezanya]
    @Cur_ID INT ,
    @Year CHAR(4) ,
    @PastYear CHAR(4) ,
    @CmbMyznya_ID INT ,
    @DT1 DATE ,
    @DT2 DATE ,
    @DT3 DATE ,
    @DT4 DATE
AS
    DELETE  FROM AccMezanya 


--INSERT  INTO AccMezanya
--            SELECT  AccCode ,
--                    AccName ,
--                    ISNULL(Type_Name, '') AS Type_Name ,
--                    ISNULL(ClassificationName, '') AS ClassificationName ,
--                    ISNULL(AccountGroup_Name, '') AS AccountGroup_Name ,
--                    0.00 AS 'ThisYear' ,
--                    0.00 AS 'PastYear' ,
--                    View_tblAccTree.ClassificationId ,
--                    View_tblAccTree.ACC_Type_ID ,
--                    View_tblAccTree.AccountGroup_ID,0,0 ,0,0,0
--            FROM    View_tblAccTree
--            WHERE   MezanyaID = @CmbMyznya_ID
--                    AND View_tblAccTree.ACC_Type_ID > 0
--                    AND View_tblAccTree.ClassificationId > 0
--                    AND View_tblAccTree.AccountGroup_ID > 0
--                    AND ISmain = 0
--            ORDER BY View_tblAccTree.ClassificationId ,
--                    View_tblAccTree.ACC_Type_ID ,
--                    View_tblAccTree.AccountGroup_ID

 
 
 
    --UPDATE  AccMezanya
    --SET     [ThisYear] = ISNULL(( SELECT    SUM(Maden)
    --                              FROM      View_Mezn
    --                              WHERE     View_Mezn.AccID = AccMezanya.AccCode
    --                                        AND aDate BETWEEN @DT1 AND @DT2
    --                            ), 0)
    --        - ISNULL(( SELECT   SUM(Daen)
    --                   FROM     View_Mezn
    --                   WHERE    View_Mezn.AccID = AccMezanya.AccCode
    --                            AND aDate BETWEEN @DT1 AND @DT2
    --                 ), 0)
 

    --UPDATE  AccMezanya
    --SET     [PastYear] = ISNULL(( SELECT    SUM(Maden)
    --                              FROM      View_Mezn
    --                              WHERE     View_Mezn.AccID = AccMezanya.AccCode
    --                                        AND aDate BETWEEN @DT3 AND @DT4
    --                            ), 0)
    --        - ISNULL(( SELECT   SUM(Daen)
    --                   FROM     View_Mezn
    --                   WHERE    View_Mezn.AccID = AccMezanya.AccCode
    --                            AND aDate BETWEEN @DT3 AND @DT4
    --                 ), 0)

















	--قائمة الدخل 

	-- الايرادات
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    ClassificationName , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    ClassificationId , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.FinalBalanceTypes
            WHERE   ClassificationId = 3

    
    -- ايرادات النشاط
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    3 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 6
		  
		 --  مجموعة حساب ايرادات النشاط  
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    3 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 6

      








-- يخصم مردودات المبيعات
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    3 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 7
		  
		-- مجموعة حساب مردودات المبيعات   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    3 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 7

 



--total اجمالى ايرادات النشاط

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    3 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    10  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 6




---المصروفات



    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    ClassificationName , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    ClassificationId , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.FinalBalanceTypes
            WHERE   ClassificationId = 4
 
  
  -- تكلفة المبيعات

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    4 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 8
		  
		-- مجموعة حساب تكلفة المبيعات   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    4 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 8




		   --total  اجمالى تكلفة المبيعات

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    4 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    4 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    11  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 8

 


 --'مجمل الربح أو الخسارة'
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'مجمل الربح أو الخسارة' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              4 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              12
            )  
			-- يخصم من مجمل الربح
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    4 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 9
		  
		-- مجموعة يخصم من مجمل الربح   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    4 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 9

-- اجمالى المخصوم من مجمل الربح
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              '' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              'اجمالى المخصوم من مجمل الربح' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              4 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              13
            )  -- IsTitle - int 



-- صافى الربح والخسارة ويتم ارساله الى الميزانية

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'صافي الربح أو الخسارة' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              4 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              14
            )  -- IsTitle - int 





-- الميزانية 



-- الاصول


    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    ClassificationName , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    ClassificationId , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.FinalBalanceTypes
            WHERE   ClassificationId = 1

    
    -- الاصول الثابتة
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 1
		  
		   -- مجموعة حساب الاصول طويلة الاجل
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 1


--total اجمالى الاصول طويلة الاجل

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    1  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 1



		

		-- الاصول المتادولة

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 2
		  
		   -- مجموعة حساب الاصول المتداولة
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    2 , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 2



--total اجمالى الاصول المتداولة

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    1 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    2  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 2





-- الخصوم

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    ClassificationName , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.FinalBalanceTypes
            WHERE   ClassificationId = 2

-- الخصوم المتداولة
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 3
		  
		-- مجموعة الخصوم المتداولة   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    ACC_Type_ID , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 3


--total اجمالى الخصوم المتادولة

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    3  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 3




-- راس المال العامل

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'رأس المال العامل' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              2 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              4  -- IsTitle - int
	        )
                   
       

--total اجمالى الاستثمار

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'اجمالى الاستثمار' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              2 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              5  -- IsTitle - int
	        )




--total ويتم تمويله على النحول التالي

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'ويتم تمويلة على النحو التالى:-' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              2 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              6  -- IsTitle - int
	        )





-- حقول الملكية

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 4
		  
		-- مجموعة حساب حقوق الملكية   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    4 , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 4


  

 --total =ارابح وخسائر العام قبل التوزريع قائمة الدخل

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              '' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              'ارباح أو خسائر العام قبل التوزريع' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              2 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              100  -- IsTitle - int
	        )


-- اجمالى حقوق الملكية

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' ,
                    '' , -- AccountGroup_Name - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    7  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 4





			 -- الالتزامات طويلة الاجل

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    Type_Name , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    '' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 5
		  
	-- مجموعة حساب الالتزامات طويلة الاجل	   
    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' , -- Type_Name - varchar(150)
                    '' , -- ClassificationName - varchar(150)
                    AccountGroup_Name , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    5 , -- ACC_Type_ID - int
                    AccountGroup_ID , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    0  -- IsTitle - int
            FROM    dbo.Account_Group
            WHERE   ACC_Type_ID = 5

			-- اجمالى الالتزامات طويلة الاجل

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
            SELECT  0 , -- AccCode - bigint
                    '' , -- AccName - varchar(150)
                    '' ,
                    '' , -- AccountGroup_Name - varchar(150)
                    'اجمالى (' + Type_Name + ')' , -- AccountGroup_Name - varchar(150)
                    NULL , -- ThisYear - decimal
                    NULL , -- PastYear - decimal
                    2 , -- ClassificationId - int
                    0 , -- ACC_Type_ID - int
                    0 , -- AccountGroup_ID - int
                    N'' , -- Title - nvarchar(150)
                    0 , -- DiscripNo - int
                    0.0 , -- ValueThisYear - float
                    0.0 , -- ValuePastYear - float
                    8  -- IsTitle - int
            FROM    dbo.Acc_Type_tree
            WHERE   ACC_Type_ID = 5


--total اجمالى حقوق الملكية والالتزامات

    INSERT  INTO dbo.AccMezanya
            ( AccCode ,
              AccName ,
              Type_Name ,
              ClassificationName ,
              AccountGroup_Name ,
              ThisYear ,
              PastYear ,
              ClassificationId ,
              ACC_Type_ID ,
              AccountGroup_ID ,
              Title ,
              DiscripNo ,
              ValueThisYear ,
              ValuePastYear ,
              IsTitle
	        )
    VALUES  ( 0 , -- AccCode - bigint
              '' , -- AccName - varchar(150)
              'اجمالى حقوق الملكية والالتزامات طويلةالاجل' , -- Type_Name - varchar(150)
              '' , -- ClassificationName - varchar(150)
              '' , -- AccountGroup_Name - varchar(150)
              NULL , -- ThisYear - decimal
              NULL , -- PastYear - decimal
              2 , -- ClassificationId - int
              0 , -- ACC_Type_ID - int
              0 , -- AccountGroup_ID - int
              N'' , -- Title - nvarchar(150)
              0 , -- DiscripNo - int
              0.0 , -- ValueThisYear - float
              0.0 , -- ValuePastYear - float
              9  -- IsTitle - int
	        )



    UPDATE  AccMezanya
    SET     [ThisYear] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = AccMezanya.AccountGroup_ID
                                            AND aDate BETWEEN @DT1 AND @DT2
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = AccMezanya.AccountGroup_ID
                                AND aDate BETWEEN @DT1 AND @DT2
                     ), 0)
 

    UPDATE  AccMezanya
    SET     [PastYear] = ISNULL(( SELECT    SUM(Maden)
                                  FROM      View_Mezn
                                  WHERE     View_Mezn.AccountGroup_ID = AccMezanya.AccountGroup_ID
                                            AND aDate BETWEEN @DT3 AND @DT4
                                ), 0)
            - ISNULL(( SELECT   SUM(Daen)
                       FROM     View_Mezn
                       WHERE    View_Mezn.AccountGroup_ID = AccMezanya.AccountGroup_ID
                                AND aDate BETWEEN @DT3 AND @DT4
                     ), 0)





--================اجمالى ايرادات النشاط 

    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    ACC_Type_ID = 6
                         ) - ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    ACC_Type_ID = 7
                             ) )
    WHERE   IsTitle = 10


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    ACC_Type_ID = 6
                         ) - ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    ACC_Type_ID = 7
                             ) )
    WHERE   IsTitle = 10





 
    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 8
                       )
    WHERE   IsTitle = 11


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 8
                       )
    WHERE   IsTitle = 11




    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 10
                         ) - ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 11
                             ) )
    WHERE   IsTitle = 12


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 10
                         ) - ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 11
                             ) )
    WHERE   IsTitle = 12









	 
    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 9
                       )
    WHERE   IsTitle = 13


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 9
                       )
    WHERE   IsTitle = 13










    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 12
                         ) - ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 13
                             ) )
    WHERE   IsTitle = 14


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 12
                         ) - ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 13
                             ) )
    WHERE   IsTitle = 14













    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 1
                       )
    WHERE   IsTitle = 1


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 1
                       )
    WHERE   IsTitle = 1


    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 2
                       )
    WHERE   IsTitle = 2


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 2
                       )
    WHERE   IsTitle = 2


    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 3
                       )
    WHERE   IsTitle = 3


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 3
                       )
    WHERE   IsTitle = 3




    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 2
                         ) - ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 3
                             ) )
    WHERE   IsTitle = 4


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 2
                         ) - ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 3
                             ) )
    WHERE   IsTitle = 4



    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 4
                         ) + ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 1
                             ) )
    WHERE   IsTitle = 5


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 4
                         ) + ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 1
                             ) )
    WHERE   IsTitle = 5



    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 4
                       )
    WHERE   IsTitle = 7


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 4
                       )
    WHERE   IsTitle = 7



    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( SELECT SUM(ThisYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 5
                       )
    WHERE   IsTitle = 8


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( SELECT SUM(PastYear)
                         FROM   AccMezanya
                         WHERE  ACC_Type_ID = 5
                       )
    WHERE   IsTitle = 8



    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 7
                         ) + ( SELECT   SUM(ThisYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 8
                             ) )
    WHERE   IsTitle = 9
    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 7
                         ) + ( SELECT   SUM(PastYear)
                               FROM     AccMezanya
                               WHERE    IsTitle = 8
                             ) )
    WHERE   IsTitle = 9


 
 





    UPDATE  dbo.AccMezanya
    SET     ThisYear = ( ( SELECT   SUM(ThisYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 14
                         )
                       )
    WHERE   IsTitle = 100


    UPDATE  dbo.AccMezanya
    SET     PastYear = ( ( SELECT   SUM(PastYear)
                           FROM     AccMezanya
                           WHERE    IsTitle = 14
                         )
                       )
    WHERE   IsTitle = 100






	  

    IF @CmbMyznya_ID = 1
        BEGIN 

		DELETE FROM dbo.AccMezanya  WHERE ClassificationId = 3 OR ClassificationId = 4 

            SELECT  *
            FROM    AccMezanya  
  
    --ORDER BY AccMezanya.ClassificationId ,
    --        AccMezanya.ACC_Type_ID ,
    --        AccMezanya.AccountGroup_ID

        END
       

    IF @CmbMyznya_ID = 2
        BEGIN 

			DELETE FROM dbo.AccMezanya  WHERE ClassificationId = 1 OR ClassificationId = 2

            SELECT  *
            FROM    AccMezanya
   
    --ORDER BY AccMezanya.ClassificationId ,
    --        AccMezanya.ACC_Type_ID ,
    --        AccMezanya.AccountGroup_ID

        END

 