

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

IF @CmbMyznya_ID = 1

BEGIN 
-- الميزانية 

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
	      FROM dbo.FinalBalanceTypes
                   
          WHERE ClassificationId = 1

    
    
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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 1
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 1


--total =============================

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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          1  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 1



		



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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 2
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 2



--total =============================

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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          2  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 2





--alhosoooom

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
	      FROM dbo.FinalBalanceTypes
                   
          WHERE ClassificationId = 2


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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 3
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 3


--total =============================

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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          3  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 3




--total =============================

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
	VALUES (    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'رأس المال العامل' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          4  -- IsTitle - int
	    )
                   
       

--total =============================

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
	VALUES (    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'اجمالى الاستثمار' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          5  -- IsTitle - int
	    )




--total =============================

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
	VALUES (    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'ويتم تمويلة على النحو التالى:-' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          6  -- IsTitle - int
	    )









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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 4
		  
		   
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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          AccountGroup_Name , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          2 , -- ClassificationId - int
	          4, -- ACC_Type_ID - int
	          AccountGroup_ID , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          0  -- IsTitle - int
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 4


--totlllllllllllllllllllll
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
	SELECT      0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '',
	         '' , -- AccountGroup_Name - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          7  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 4


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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 5
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 5



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
	SELECT      0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '',
	         '' , -- AccountGroup_Name - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          8  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 5


--total =============================

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
	VALUES (    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'اجمالى حقوق الملكية والالتزامات طويلةالاجل' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
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






 UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 1) WHERE IsTitle = 1


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 1) WHERE IsTitle = 1


  UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 2) WHERE IsTitle = 2


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 2) WHERE IsTitle = 2


 UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 3) WHERE IsTitle = 3


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 3) WHERE IsTitle = 3




 UPDATE dbo.AccMezanya SET ThisYear = ((SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 2) - (SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 3)) WHERE IsTitle = 4


 UPDATE dbo.AccMezanya SET PastYear = ((SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 2) - (SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 3)) WHERE IsTitle = 4



UPDATE dbo.AccMezanya SET ThisYear = ((SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 4) + (SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 1)) WHERE IsTitle = 5


 UPDATE dbo.AccMezanya SET PastYear = ((SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 4) + (SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 1)) WHERE IsTitle = 5



 UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 4) WHERE IsTitle = 7


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 4) WHERE IsTitle = 7



  UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 5) WHERE IsTitle = 8


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 5) WHERE IsTitle = 8



UPDATE dbo.AccMezanya SET PastYear = ((SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 7) + (SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 8)) WHERE IsTitle = 9
UPDATE dbo.AccMezanya SET PastYear = ((SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 7) + (SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 8)) WHERE IsTitle = 9


END

IF @CmbMyznya_ID = 2

BEGIN 
 --قائمة الدخل 


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
	      FROM dbo.FinalBalanceTypes
                   
          WHERE ClassificationId = 3

    
    
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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 6
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 6

END



--total =============================

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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          10  -- IsTitle - int
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 6




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
	      FROM dbo.FinalBalanceTypes
                   
          WHERE ClassificationId = 4
 
  

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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 9
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 9



		   --total =============================

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
	SELECT    0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          '' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          'اجمالى ('+ Type_Name +')' , -- AccountGroup_Name - varchar(150)
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
	     FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 9

 



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
	VALUES(   0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'مجمل الربح أو الخسارة' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          13)  -- IsTitle - int 



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
	      FROM dbo.Acc_Type_tree
                   
          WHERE ACC_Type_ID = 10
		  
		   
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
	SELECT    0 , -- AccCode - bigint
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
	       FROM dbo.Account_Group WHERE ACC_Type_ID = 10







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
	VALUES(   0 , -- AccCode - bigint
	          '' , -- AccName - varchar(150)
	          'صافي الربح أو الخسارة' , -- Type_Name - varchar(150)
	          '' , -- ClassificationName - varchar(150)
	          '' , -- AccountGroup_Name - varchar(150)
	          NULL , -- ThisYear - decimal
	          NULL , -- PastYear - decimal
	          0 , -- ClassificationId - int
	          0 , -- ACC_Type_ID - int
	          0 , -- AccountGroup_ID - int
	          N'' , -- Title - nvarchar(150)
	          0 , -- DiscripNo - int
	          0.0 , -- ValueThisYear - float
	          0.0 , -- ValuePastYear - float
	          14)  -- IsTitle - int 















			  
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






 UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 6) WHERE IsTitle = 10


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 6) WHERE IsTitle = 10



 
 UPDATE dbo.AccMezanya SET ThisYear = (SELECT SUM(ThisYear) FROM AccMezanya WHERE ACC_Type_ID = 9) WHERE IsTitle = 11


 UPDATE dbo.AccMezanya SET PastYear = (SELECT SUM(PastYear) FROM AccMezanya WHERE ACC_Type_ID = 9) WHERE IsTitle = 11




  UPDATE dbo.AccMezanya SET ThisYear = ((SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 10) - (SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 11)) WHERE IsTitle = 13


 UPDATE dbo.AccMezanya SET PastYear =  ((SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 10) - (SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 11)) WHERE IsTitle = 13



UPDATE dbo.AccMezanya SET ThisYear = ((SELECT SUM(ThisYear) FROM AccMezanya WHERE IsTitle = 14) - (SELECT SUM(ThisYear) FROM AccMezanya WHERE AccountGroup_ID BETWEEN  35 AND 37)) WHERE IsTitle = 14


UPDATE dbo.AccMezanya SET PastYear =  ((SELECT SUM(PastYear) FROM AccMezanya WHERE IsTitle = 14) - (SELECT SUM(PastYear) FROM AccMezanya WHERE AccountGroup_ID BETWEEN  35 AND 37)) WHERE IsTitle = 14









    SELECT  *
    FROM    AccMezanya
  
    --ORDER BY AccMezanya.ClassificationId ,
    --        AccMezanya.ACC_Type_ID ,
    --        AccMezanya.AccountGroup_ID
