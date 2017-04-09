
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170210  -- LastVer - int
          )