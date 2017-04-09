
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer, FalconV )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170224, -- LastVer - int
          170224  -- FalconV - int
          )