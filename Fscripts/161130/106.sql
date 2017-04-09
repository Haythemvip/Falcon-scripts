 
CREATE PROCEDURE Financial_Ratios_rates_Settings
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
                  N'«·√’Ê· «·„ œÊ«·…', -- Name_Ar - nvarchar(250)
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
                  N'«·«· “«„«  «·„ œÊ«·…' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
	            );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 3, -- ID - int
                  N'«·„Œ“Ê‰', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 4, -- ID - int
                  N'«·‰ﬁœÌ… Ê„«›Ï Õﬂ„Â«', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 5, -- ID - int
                  N'„Ã„· «·—»Õ', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 6, -- ID - int
                  N'’«›Ï «·„»Ì⁄« ', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 7, -- ID - int
                  N'’«›Ï «·—»Õ', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 8, -- ID - int
                  N'«Ã„«·Ï «·«” À„«—', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 9, -- ID - int
                  N'—√” «·„«· «·⁄«„·', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );

        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 10, -- ID - int
                  N'«·ﬁ—Ê÷ ÿÊÌ·… «·«Ã·', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 11, -- ID - int
                  N'«Ã„«·Ï «·«’Ê·', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


     INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 12, -- ID - int
                  N'  ﬂ·›… «·„»Ì⁄« ', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 13, -- ID - int
                  N' „ Ê”ÿ «·„Œ“Ê‰', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );






   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 14, -- ID - int
                  N' „ Ê”ÿ «Ã„«·Ï «·«’Ê·', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 15, -- ID - int
                  N'«·„»Ì⁄«  «·«Ã·…', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );





   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 16, -- ID - int
                  N'„ Ê”ÿ Õ”«»«  «·„œÌ‰Ì‰', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 17, -- ID - int
                  N'„ Ê”ÿ Õ”«»«  «·œ«∆‰Ì‰', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 18, -- ID - int
                  N'«·„‘ —Ì«  «·«Ã·…', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 19, -- ID - int
                  N'≈Ã„«·Ï Õ”«»«  «·œ«∆‰Ì‰', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 20, -- ID - int
                  N'«Ã„«·Ï ÕﬁÊﬁ «·„·ﬂÌ…', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 21, -- ID - int
                  N'’«›Ï «·—»Õ ﬁ»· «·›Ê«∆œ Ê«·÷—«∆»', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );







   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 22, -- ID - int
                  N'„’—Ê› «·›Ê«∆œ', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );






        SELECT  *
        FROM    #Result; 



    END;
GO
