 
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
                  N'������ ���������', -- Name_Ar - nvarchar(250)
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
                  N'���������� ���������' , -- Name_Ar - nvarchar(250)
                  N'' , -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
	            );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 3, -- ID - int
                  N'�������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 4, -- ID - int
                  N'������� ����� �����', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 5, -- ID - int
                  N'���� �����', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 6, -- ID - int
                  N'���� ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 7, -- ID - int
                  N'���� �����', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 8, -- ID - int
                  N'������ ���������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 9, -- ID - int
                  N'��� ����� ������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );

        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 10, -- ID - int
                  N'������ ����� �����', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




        INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 11, -- ID - int
                  N'������ ������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


     INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 12, -- ID - int
                  N' ����� ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );


   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 13, -- ID - int
                  N' ����� �������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );






   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 14, -- ID - int
                  N' ����� ������ ������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 15, -- ID - int
                  N'�������� ������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );





   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 16, -- ID - int
                  N'����� ������ ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 17, -- ID - int
                  N'����� ������ ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 18, -- ID - int
                  N'��������� ������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );



   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 19, -- ID - int
                  N'������ ������ ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 20, -- ID - int
                  N'������ ���� �������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );




   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 21, -- ID - int
                  N'���� ����� ��� ������� ��������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );







   INSERT  INTO #Result
                ( ID, Name_Ar, Name_En, ItemValue )
        VALUES  ( 22, -- ID - int
                  N'����� �������', -- Name_Ar - nvarchar(250)
                  N'', -- Name_En - nvarchar(250)
                  0.0  -- ItemValue - float
                  );






        SELECT  *
        FROM    #Result; 



    END;
GO
