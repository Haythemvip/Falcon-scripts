
INSERT INTO dbo.AAA_Last_Update
        ( LastUpdate, LastVer, FalconV )
VALUES  ( GETDATE(), -- LastUpdate - nvarchar(50)
          170301, -- LastVer - int
          170301  -- FalconV - int
          )